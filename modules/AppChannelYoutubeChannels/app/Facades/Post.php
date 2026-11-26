<?php
namespace Modules\AppChannelYoutubeChannels\Facades;

use Illuminate\Support\Facades\Facade;
use Modules\AppChannels\Models\Accounts;
use Modules\AppChannelYoutubeChannels\Http\Controllers\AppChannelYoutubeChannelsController;
use Google\Service\YouTube;
use Google\Http\MediaFileUpload;
use Media;

class Post extends Facade
{
    const CHUNK_SIZE = 4 * 1024 * 1024; // 4MB

    protected static function getFacadeAccessor()
    {
        return ex_str(__NAMESPACE__);
    }

    /**
     * Resolve a media entry to a readable local file. Returns [path, isTemp].
     */
    protected static function localFile($media)
    {
        if ($path = self::localPath($media)) {
            return [$path, false];
        }

        $url = Media::url($media);
        $ext = pathinfo(parse_url($url, PHP_URL_PATH) ?? '', PATHINFO_EXTENSION) ?: 'mp4';
        $tmp = tempnam(sys_get_temp_dir(), 'yt_') . '.' . $ext;

        $in = @fopen($url, 'rb');
        if (!$in) {
            throw new \Exception(__("YouTube: Could not read the video file."));
        }
        $out = fopen($tmp, 'wb');
        stream_copy_to_stream($in, $out);
        fclose($in);
        fclose($out);

        return [$tmp, true];
    }

    /**
     * Map a media entry (relative path or a URL on this site) to a local file path, or null.
     * Avoids HTTP-fetching our own server (which deadlocks single-threaded dev servers and is slower anyway).
     */
    protected static function localPath($media)
    {
        $relative = $media;
        if (filter_var($media, FILTER_VALIDATE_URL)) {
            $base = rtrim(Media::url(''), '/') . '/';
            if (!str_starts_with($media, $base)) {
                return null;
            }
            $relative = rawurldecode(substr($media, strlen($base)));
        }

        $path = Media::path($relative);
        return is_file($path) ? $path : null;
    }

    protected static function isVideoMedia($media)
    {
        $video = ['mp4', 'mov', 'avi', 'mkv', 'webm', 'm4v', 'mpeg', 'mpg', '3gp', 'flv', 'wmv'];
        if ($path = self::localPath($media)) {
            return in_array(strtolower(pathinfo($path, PATHINFO_EXTENSION)), $video);
        }
        return Media::isVideo(Media::url($media));
    }

    protected static function validator($post)
    {
        $errors = [];
        $data = json_decode($post->data, false);
        $medias = $data->medias ?? [];

        if (empty($medias)) {
            $errors[] = __("YouTube: Please select a video.");
        } elseif (!self::isVideoMedia($medias[0])) {
            $errors[] = __("YouTube only supports video uploads.");
        }

        $title = self::title($data);
        if ($title === '') {
            $errors[] = __("YouTube: Please enter a video title or caption.");
        }

        return $errors;
    }

    /**
     * Title from the YouTube options, otherwise first line of the caption (max 100 chars, no < >).
     */
    protected static function title($data)
    {
        $title = trim($data->options->yt_title ?? '');
        if ($title === '') {
            $caption = trim(spintax($data->caption ?? ''));
            $title = trim(strtok($caption, "\n") ?: '');
        }
        $title = str_replace(['<', '>'], '', $title);
        return mb_substr($title, 0, 100);
    }

    /**
     * Returns an authorized Google client for the account, refreshing & persisting the token if expired.
     */
    protected static function authorizedClient($account)
    {
        $token = json_decode($account->token, true) ?: [];
        if (empty($token['access_token'])) {
            throw new \RuntimeException('session_expired');
        }

        $client = AppChannelYoutubeChannelsController::client();
        $client->setAccessToken($token);

        if ($client->isAccessTokenExpired()) {
            $refresh = $token['refresh_token'] ?? $client->getRefreshToken();
            if (!$refresh) {
                throw new \RuntimeException('session_expired');
            }

            $newToken = $client->fetchAccessTokenWithRefreshToken($refresh);
            if (isset($newToken['error'])) {
                throw new \RuntimeException('session_expired');
            }

            // Google does not always return the refresh token again; keep the old one.
            if (empty($newToken['refresh_token'])) {
                $newToken['refresh_token'] = $refresh;
            }

            $account->token = json_encode($newToken);
            $account->save();
            $client->setAccessToken($newToken);
        }

        return $client;
    }

    protected static function post($post)
    {
        $account = $post->account;

        $errors = self::validator($post);
        if ($errors) {
            return [
                "status"  => 0,
                "message" => implode(', ', $errors),
                "type"    => $post->type,
            ];
        }

        try {
            $client = self::authorizedClient($account);
        } catch (\Exception $e) {
            Accounts::where("id", $account->id)->update(["status" => 0]);
            return [
                "status"  => 0,
                "message" => __("YouTube session expired. Please reconnect the channel."),
                "type"    => $post->type,
            ];
        }

        $data = json_decode($post->data, false);
        $options = $data->options ?? (object)[];
        $medias = $data->medias ?? [];

        $privacy = $options->yt_privacy ?? 'public';
        if (!in_array($privacy, ['public', 'unlisted', 'private'])) {
            $privacy = 'public';
        }

        $tags = array_values(array_filter(array_map('trim', explode(',', $options->yt_tags ?? ''))));
        $category = preg_replace('/\D/', '', $options->yt_category ?? '') ?: '22'; // 22 = People & Blogs
        $madeForKids = !empty($options->yt_kids);

        $tmpFile = null;
        try {
            [$file, $isTemp] = self::localFile($medias[0]);
            if ($isTemp) $tmpFile = $file;

            $youtube = new YouTube($client);

            $snippet = new YouTube\VideoSnippet();
            $snippet->setTitle(self::title($data));
            $snippet->setDescription(mb_substr(spintax($data->caption ?? ''), 0, 5000));
            $snippet->setCategoryId($category);
            if ($tags) $snippet->setTags($tags);

            $status = new YouTube\VideoStatus();
            $status->setPrivacyStatus($privacy);
            $status->setSelfDeclaredMadeForKids($madeForKids);

            $video = new YouTube\Video();
            $video->setSnippet($snippet);
            $video->setStatus($status);

            // Resumable chunked upload
            $client->setDefer(true);
            $insertRequest = $youtube->videos->insert('snippet,status', $video);
            $upload = new MediaFileUpload($client, $insertRequest, mime_content_type($file) ?: 'video/*', null, true, self::CHUNK_SIZE);
            $upload->setFileSize(filesize($file));

            $result = false;
            $handle = fopen($file, 'rb');
            while (!$result && !feof($handle)) {
                $chunk = fread($handle, self::CHUNK_SIZE);
                $result = $upload->nextChunk($chunk);
            }
            fclose($handle);
            $client->setDefer(false);

            if (!$result || !$result->getId()) {
                return [
                    "status" => 0,
                    "message" => __("YouTube: Upload did not complete."),
                    "type" => $post->type,
                ];
            }

            return [
                "status" => 1,
                "message" => __("Successfully posted to YouTube"),
                "id" => $result->getId(),
                "url" => "https://www.youtube.com/watch?v=" . $result->getId(),
                "type" => "media",
            ];
        } catch (\Google\Service\Exception $e) {
            $err = $e->getErrors();
            return [
                "status" => 0,
                "message" => __("YouTube error: ") . ($err[0]['message'] ?? $e->getMessage()),
                "type" => $post->type,
            ];
        } catch (\Exception $e) {
            return [
                "status" => 0,
                "message" => __("YouTube error: ") . $e->getMessage(),
                "type" => $post->type,
            ];
        } finally {
            if ($tmpFile && is_file($tmpFile)) @unlink($tmpFile);
        }
    }
}

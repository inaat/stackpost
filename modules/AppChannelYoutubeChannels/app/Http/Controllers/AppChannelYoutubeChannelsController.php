<?php

namespace Modules\AppChannelYoutubeChannels\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Google\Client as GoogleClient;
use Google\Service\YouTube;

class AppChannelYoutubeChannelsController extends Controller
{
    const SESSION_KEY = 'Youtube_AccessToken';
    const DEFAULT_SCOPES = 'https://www.googleapis.com/auth/youtube.upload,https://www.googleapis.com/auth/youtube.readonly';

    /**
     * Build a Google client configured from the admin settings.
     */
    public static function client(): GoogleClient
    {
        $client = new GoogleClient();
        $client->setClientId(get_option("youtube_client_id", ""));
        $client->setClientSecret(get_option("youtube_client_secret", ""));
        $client->setRedirectUri(url_app("youtube/channel"));
        $client->setScopes(array_filter(array_map('trim', explode(',', get_option("youtube_scopes", self::DEFAULT_SCOPES)))));
        $client->setAccessType('offline');   // get a refresh_token
        $client->setPrompt('select_account consent'); // force refresh_token every time + allow picking brand account
        // Do NOT merge previously granted scopes: a shared Google project may have granted
        // e.g. drive.file, which Google refuses to combine with YouTube scopes.
        $client->setIncludeGrantedScopes(false);
        return $client;
    }

    protected function ensureConfigured(): void
    {
        \Access::check('appchannels.' . module('key'));

        if (!get_option("youtube_client_id", "") || !get_option("youtube_client_secret", "")) {
            \Access::deny(__('To use YouTube, you must first configure the Client ID and Client Secret.'));
        }
    }

    public function index(Request $request)
    {
        $this->ensureConfigured();

        $result = [];
        try {
            if ($request->error) {
                throw new \Exception(__('YouTube authorization was cancelled: ') . $request->error);
            }

            if (!session(self::SESSION_KEY)) {
                if (!$request->code) {
                    return redirect(module_url("oauth"));
                }

                $client = self::client();
                $token = $client->fetchAccessTokenWithAuthCode($request->code);

                if (isset($token['error'])) {
                    throw new \Exception($token['error_description'] ?? $token['error']);
                }

                session([self::SESSION_KEY => $token]);
                return redirect(module_url());
            }

            $token = session(self::SESSION_KEY);
            $client = self::client();
            $client->setAccessToken($token);

            $youtube = new YouTube($client);
            $response = $youtube->channels->listChannels('snippet,statistics', ['mine' => true]);

            foreach ($response->getItems() as $item) {
                $snippet = $item->getSnippet();
                $thumbs = $snippet->getThumbnails();
                $avatar = $thumbs && $thumbs->getHigh() ? $thumbs->getHigh()->getUrl()
                    : ($thumbs && $thumbs->getDefault() ? $thumbs->getDefault()->getUrl() : '');

                $result[] = [
                    'id' => $item->getId(),
                    'name' => $snippet->getTitle(),
                    'username' => $snippet->getCustomUrl() ?: $snippet->getTitle(),
                    'avatar' => $avatar,
                    'desc' => __("Channel"),
                    'link' => $snippet->getCustomUrl()
                        ? "https://www.youtube.com/" . $snippet->getCustomUrl()
                        : "https://www.youtube.com/channel/" . $item->getId(),
                    'oauth' => $token,
                    'module' => $request->module['module_name'],
                    'reconnect_url' => $request->module['uri'] . "/oauth",
                    'social_network' => 'youtube',
                    'category' => 'channel',
                    'login_type' => 1,
                    'can_post' => 1,
                    'data' => "",
                    'proxy' => 0,
                ];
            }

            $channels = $result
                ? ['status' => 1, 'message' => __('Succeeded')]
                : ['status' => 0, 'message' => __('No YouTube channel found on this Google account. Create a channel first.')];
        } catch (\Google\Service\Exception $e) {
            $errors = $e->getErrors();
            $channels = [
                'status' => 0,
                'message' => $errors[0]['message'] ?? $e->getMessage(),
            ];
        } catch (\Exception $e) {
            $channels = [
                'status' => 0,
                'message' => $e->getMessage(),
            ];
        }

        $channels = array_merge($channels, [
            'channels' => $result,
            'module' => $request->module,
            'save_url' => url_app('channels/save'),
            'reconnect_url' => module_url('oauth'),
            'oauth' => session(self::SESSION_KEY),
        ]);

        session(['channels' => $channels]);
        return redirect(url_app("channels/add"));
    }

    public function oauth(Request $request)
    {
        $this->ensureConfigured();

        $request->session()->forget(self::SESSION_KEY);
        return redirect(self::client()->createAuthUrl());
    }

    public function settings()
    {
        return view('appchannelyoutubechannels::settings');
    }
}

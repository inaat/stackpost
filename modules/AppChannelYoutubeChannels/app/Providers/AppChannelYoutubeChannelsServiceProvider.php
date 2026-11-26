<?php

namespace Modules\AppChannelYoutubeChannels\Providers;

use Illuminate\Support\ServiceProvider;
use Core;

class AppChannelYoutubeChannelsServiceProvider extends ServiceProvider
{
    protected string $name = 'AppChannelYoutubeChannels';

    protected string $nameLower = 'appchannelyoutubechannels';

    public function boot(): void
    {
        $this->btnChannels();
        $this->registerSubMenu();
        $this->registerTranslations();
        $this->mergeConfigFrom(module_path($this->name, 'config/config.php'), $this->nameLower);
        $this->loadViewsFrom(module_path($this->name, 'resources/views'), $this->nameLower);
    }

    public function btnChannels(): void
    {
        if (get_option("youtube_status", 0) || request()->segment(1) == "admin") {
            \Channels::addChannel($this->name, [
                "name" => __("Youtube"),
                "social_network" => "youtube",
                "category" => "channel",
                "position" => 90
            ]);
        }
    }

    public function registerSubMenu(): void
    {
        Core::addSubMenu("AdminAPIIntegration", [
            [
                "uri" => "admin/api-integration/youtube",
                "name" => "Youtube",
                "position" => 540000,
                "icon" => "fa-light fa-puzzle",
                "color" => "#5156ff"
            ],
        ]);
    }

    public function register(): void
    {
        $this->app->register(RouteServiceProvider::class);
    }

    public function registerTranslations(): void
    {
        $langPath = module_path($this->name, 'resources/lang');
        if (is_dir($langPath)) {
            $this->loadJsonTranslationsFrom($langPath);
        }
    }

    public function provides(): array
    {
        return [];
    }
}

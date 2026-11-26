<?php

use Illuminate\Support\Facades\Route;
use Modules\AppChannelYoutubeChannels\Http\Controllers\AppChannelYoutubeChannelsController;

Route::middleware(['web', 'auth'])->group(function () {
    Route::group(["prefix" => "app"], function () {
        Route::group(["prefix" => "youtube"], function () {
            Route::group(["prefix" => "channel"], function () {
                Route::get('/', [AppChannelYoutubeChannelsController::class, 'index'])->name('app.channelyoutubechannels.index');
                Route::get('oauth', [AppChannelYoutubeChannelsController::class, 'oauth'])->name('app.channelyoutubechannels.oauth');
            });
        });
    });

    Route::group(["prefix" => "admin/api-integration"], function () {
        Route::get('youtube', [AppChannelYoutubeChannelsController::class, 'settings'])->name('app.channelyoutubechannels.settings');
    });
});

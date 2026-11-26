@extends('layouts.app')

@section('sub_header')
    <x-sub-header
        title="{{ __('YouTube API') }}"
        description="{{ __('Easy Configuration Steps for YouTube API') }}"
    >
    </x-sub-header>
@endsection

@section('content')
<div class="container max-w-800 pb-5">
    <form class="actionForm" action="{{ url_admin("settings/save") }}">
        <div class="card shadow-none border-gray-300 mb-4">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mb-4">
                            <label class="form-label">{{ __('Status') }}</label>
                            <div class="d-flex gap-8 flex-column flex-lg-row flex-md-column">
                                <div class="form-check me-3">
                                    <input class="form-check-input" type="radio" name="youtube_status" value="1" id="youtube_status_1" {{ get_option("youtube_status", 0)==1?"checked":"" }}>
                                    <label class="form-check-label mt-1" for="youtube_status_1">{{ __('Enable') }}</label>
                                </div>
                                <div class="form-check me-3">
                                    <input class="form-check-input" type="radio" name="youtube_status" value="0" id="youtube_status_0" {{ get_option("youtube_status", 0)==0?"checked":"" }}>
                                    <label class="form-check-label mt-1" for="youtube_status_0">{{ __('Disable') }}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="mb-4">
                            <label for="youtube_client_id" class="form-label">{{ __('Client ID') }}</label>
                            <input class="form-control" name="youtube_client_id" id="youtube_client_id" type="text" value="{{ get_option("youtube_client_id", "") }}">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="mb-4">
                            <label for="youtube_client_secret" class="form-label">{{ __('Client Secret') }}</label>
                            <input class="form-control" name="youtube_client_secret" id="youtube_client_secret" type="text" value="{{ get_option("youtube_client_secret", "") }}">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="mb-4">
                            <label for="youtube_scopes" class="form-label">{{ __('Scopes') }}</label>
                            <input class="form-control" name="youtube_scopes" id="youtube_scopes" type="text" value="{{ get_option("youtube_scopes", "https://www.googleapis.com/auth/youtube.upload,https://www.googleapis.com/auth/youtube.readonly") }}">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="alert alert-primary fs-14 mb-3">
                            {{ __("Authorized redirect URI: ") }}
                            <a href="{{ url_app("youtube/channel") }}" target="_blank">{{ url_app("youtube/channel") }}</a>
                        </div>
                        <div class="alert alert-light border fs-13 mb-0">
                            <div class="fw-6 mb-2">{{ __('How to get the credentials') }}</div>
                            <ol class="mb-0 ps-3">
                                <li>{{ __('Go to console.cloud.google.com and create a project.') }}</li>
                                <li>{{ __('APIs & Services → Library → enable "YouTube Data API v3".') }}</li>
                                <li>{{ __('OAuth consent screen → External, add your Google account as a test user.') }}</li>
                                <li>{{ __('Credentials → Create OAuth client ID → Web application, add the redirect URI above.') }}</li>
                                <li>{{ __('Copy the Client ID and Client Secret here, enable and save.') }}</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-4">
            <button type="submit" class="btn btn-dark b-r-10 w-100">{{ __('Save changes') }}</button>
        </div>
    </form>
</div>
@endsection

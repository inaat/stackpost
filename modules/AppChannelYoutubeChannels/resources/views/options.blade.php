<div class="mb-3">
    <div class="card shadow-none b-r-6">
        <div class="card-header px-3">
            <div class="fs-12 fw-6 text-gray-700">
                <i class="fa-brands fa-youtube" style="color:#FF0000"></i> {{ __("YouTube") }}
            </div>
        </div>
        <div class="card-body px-3">
            <div class="mb-3">
                <label class="form-label" for="yt_title">{{ __('Video title') }}</label>
                <input class="form-control" type="text" name="options[yt_title]" id="yt_title" maxlength="100" placeholder="{{ __('Leave empty to use the first line of the caption') }}">
            </div>
            <div class="mb-3">
                <label class="form-label">{{ __('Visibility') }}</label>
                <div class="d-flex gap-8 flex-column flex-lg-row flex-md-column">
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="options[yt_privacy]" value="public" id="yt_privacy_public" checked>
                        <label class="form-check-label mt-1" for="yt_privacy_public">{{ __('Public') }}</label>
                    </div>
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="options[yt_privacy]" value="unlisted" id="yt_privacy_unlisted">
                        <label class="form-check-label mt-1" for="yt_privacy_unlisted">{{ __('Unlisted') }}</label>
                    </div>
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="options[yt_privacy]" value="private" id="yt_privacy_private">
                        <label class="form-check-label mt-1" for="yt_privacy_private">{{ __('Private') }}</label>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label" for="yt_tags">{{ __('Tags') }}</label>
                <input class="form-control" type="text" name="options[yt_tags]" id="yt_tags" placeholder="{{ __('tag1, tag2, tag3') }}">
            </div>
            <div class="mb-3">
                <label class="form-label" for="yt_category">{{ __('Category') }}</label>
                <select class="form-select" name="options[yt_category]" id="yt_category">
                    @foreach([
                        '22' => 'People & Blogs', '1' => 'Film & Animation', '2' => 'Autos & Vehicles', '10' => 'Music',
                        '15' => 'Pets & Animals', '17' => 'Sports', '19' => 'Travel & Events', '20' => 'Gaming',
                        '23' => 'Comedy', '24' => 'Entertainment', '25' => 'News & Politics', '26' => 'Howto & Style',
                        '27' => 'Education', '28' => 'Science & Technology', '29' => 'Nonprofits & Activism'
                    ] as $id => $label)
                        <option value="{{ $id }}">{{ __($label) }}</option>
                    @endforeach
                </select>
            </div>
            <div class="mb-0">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="options[yt_kids]" value="1" id="yt_kids">
                    <label class="form-check-label mt-1" for="yt_kids">{{ __('Made for kids') }}</label>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="border border-gray-400 rounded bg-white overflow-hidden">
    <div class="cpv-media bg-dark">
        <div class="cpv-img w-100 cpv-yt-img d-none"></div>
        <div class="cpv-yt-view w-100 d-flex align-items-center justify-content-center" style="aspect-ratio:16/9;">
            <i class="fa-brands fa-youtube fs-40" style="color:#FF0000"></i>
        </div>
    </div>
    <div class="d-flex gap-8 p-3">
        <div class="size-36 size-child flex-shrink-0">
            <img src="{{ theme_public_asset("img/default.png") }}" class="rounded-circle border cpv-avatar" alt="">
        </div>
        <div class="flex-grow-1 overflow-hidden">
            <div class="fw-6 fs-14 text-gray-900 text-truncate-2 cpv-yt-title">{{ __("Video title") }}</div>
            <div class="fs-12 text-gray-600"><span class="cpv-name">{{ __("Your channel") }}</span> · {{ __("0 views") }} · {{ __("just now") }}</div>
            <div class="cpv-text fs-12 text-gray-700 mt-2 text-truncate-3"></div>
        </div>
    </div>
</div>

<script>
(function () {
    var src = document.querySelector('.cpv-yt-img');
    var view = document.querySelector('.cpv-yt-view');
    function ytRender() {
        if (!src || !view) return;
        var el = src.querySelector('video, img, div');
        if (el) {
            var clone = el.cloneNode(true);
            clone.style.width = '100%';
            clone.style.height = '100%';
            clone.style.objectFit = 'cover';
            view.innerHTML = '';
            view.appendChild(clone);
        }
    }
    if (src) {
        new MutationObserver(ytRender).observe(src, { childList: true, subtree: true, attributes: true, attributeFilter: ['src'] });
        ytRender();
    }

    var titleInput = document.getElementById('yt_title');
    var titleView = document.querySelector('.cpv-yt-title');
    var captionView = document.querySelector('.cpv-yt-title') ? document.querySelector('[data-social-network="youtube"] .cpv-text') : null;
    function ytTitle() {
        if (!titleView) return;
        var t = titleInput && titleInput.value.trim();
        if (!t && captionView) t = (captionView.innerText || '').split('\n')[0].trim();
        titleView.textContent = (t || '{{ __("Video title") }}').substring(0, 100);
    }
    if (titleInput) titleInput.addEventListener('input', ytTitle);
    if (captionView) new MutationObserver(ytTitle).observe(captionView, { childList: true, subtree: true, characterData: true });
})();
</script>

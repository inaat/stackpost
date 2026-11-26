<?php
// Local dev router for PHP's built-in server (mirrors the root .htaccess).
// Usage: php -S 127.0.0.1:8000 -t . server-dev.php

$uri = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));

// Block sensitive files/dirs like .htaccess does
if (preg_match('#(^|/)\.|^/(vendor|node_modules)/|^/(composer\.(json|lock)|package(-lock)?\.json|yarn\.lock|stackpost\.sql)$#i', $uri)) {
    http_response_code(403);
    exit('Forbidden');
}

if (preg_match('#^/installer(/|$)#', $uri)) {
    require __DIR__ . '/installer/index.php';
    return;
}

// Serve real static files from project root, then public/
if ($uri !== '/' && is_file(__DIR__ . $uri) && !str_ends_with($uri, '.php')) {
    return false;
}
if ($uri !== '/' && is_file(__DIR__ . '/public' . $uri)) {
    $_SERVER['SCRIPT_NAME'] = '/index.php';
    $file = __DIR__ . '/public' . $uri;
    $types = ['css' => 'text/css', 'js' => 'application/javascript', 'svg' => 'image/svg+xml', 'png' => 'image/png', 'jpg' => 'image/jpeg', 'ico' => 'image/x-icon', 'webp' => 'image/webp', 'woff2' => 'font/woff2', 'woff' => 'font/woff', 'txt' => 'text/plain'];
    $ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));
    if (isset($types[$ext])) header('Content-Type: ' . $types[$ext]);
    readfile($file);
    return;
}

$_SERVER['SCRIPT_NAME'] = '/index.php';
$_SERVER['SCRIPT_FILENAME'] = __DIR__ . '/index.php';
require __DIR__ . '/public/index.php';

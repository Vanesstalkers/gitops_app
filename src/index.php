<?php
require_once __DIR__ . '/details.php';

$host = gethostname();
$time = date('c');
$appEnv = getenv('APP_ENV') ?: 'undefined';
$appMessage = getenv('APP_MESSAGE') ?: 'undefined';

error_log(sprintf(
    'php-hello request host=%s app_env=%s app_message=%s time=%s',
    $host,
    $appEnv,
    $appMessage,
    $time
));

echo "<h1>!!! Hello from PHP in k3s !!!</h1>";
echo "<p>Host: {$host}</p>";
echo "<p>Time: {$time}</p>";
echo "<p>APP_ENV: {$appEnv}</p>";
echo "<p>APP_MESSAGE: {$appMessage}</p>";
echo renderDetailsBlock();

<?php
$host = gethostname();
$time = date('c');
$appEnv = getenv('APP_ENV') ?: 'undefined';
$appMessage = getenv('APP_MESSAGE') ?: 'undefined';

echo "<h1>Hello from PHP in k3s</h1>";
echo "<p>Host: {$host}</p>";
echo "<p>Time: {$time}</p>";
echo "<p>APP_ENV: {$appEnv}</p>";
echo "<p>APP_MESSAGE: {$appMessage}</p>";

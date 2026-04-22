<?php

function renderDetailsBlock(): string
{
    $version = 'v2';
    $buildTime = date('c');

    return "<p>Details file loaded: {$version}</p><p>Details timestamp: {$buildTime}</p>";
}

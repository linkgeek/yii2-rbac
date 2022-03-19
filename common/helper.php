<?php

function p() {
    $args = func_get_args();
    foreach ($args as $arg) {
        echo "<pre>";
        print_r($arg);
    }
    exit;
}
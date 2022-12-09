<?php

function hpc_get_post_type_label($type)
{
    return match ($type){
        'article'=>'Article',
        'event'=>'Evenement',
    };
}
function hpc_get_post_type_color($type)
{
    return match ($type){
        'article'=>'warning',
        'event'=>'primary',
    };
}
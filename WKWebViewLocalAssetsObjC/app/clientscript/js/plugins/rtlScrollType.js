  /*MIT License */
/*global jQuery */
(function ($) {
    'use strict';
    
    var definer = $('<div dir="rtl" style="visibility: hidden;">ABCD</div>').appendTo('body')[0],type = 'reverse';
/*
var definer = $('<div dir="rtl" style="font-size: 14px; width: 4px; height: 1px; position: absolute; top: -1000px; overflow: scroll">ABCD</div>').appendTo('body')[0],
        type = 'reverse';*/
    if (definer.scrollLeft > 0) {
        type = 'default';
    } else {
        definer.scrollLeft = 1;
        if (definer.scrollLeft === 0) {
            type = 'negative';
        }
    }
    
    //alert(type);
    $(definer).remove();
    $.support.rtlScrollType = type;
}(jQuery));

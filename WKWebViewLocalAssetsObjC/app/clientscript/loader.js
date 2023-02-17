

var variable = '' + 
'	<link rel="icon" type="image/png" href="'+rootpath+'clientscript/images/generic/noon.png">' + 
'	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">' + 
'	<meta http-equiv="Pragma" content="no-cache">' + 
'	<meta http-equiv="Expires" content="0">' + 
'	<meta name="theme-color" content="black">' + 
'	<meta name="msapplication-navbutton-color" content="black">' + 
'	<meta name="apple-mobile-web-app-status-bar-style" content="black">' + 
'';


if(disable_all_loading == false){





document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/jquery_lib/jquery-1.12.4.min.js'  + time +  '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/jquery_lib/jquery-migrate-1.4.1.min.js'  + time +  '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/generic.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/plugins/scroll_plugin.js' + time + '\'><\/script>');  
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/plugins/scrollCenter.js' + time + '\'><\/script>'); 

document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/common.css' + time + '\'/>');


}




if(window.location == window.parent.location) {

document.write('<div id="loading"></div>');

}


document.head.innerHTML = document.head.innerHTML + variable;


function header(url) {



  /*  
    document.write('<link rel=\"icon\" type=\"image/png\" href="'+rootpath+'clientscript/images/generic/noon.png">');
    document.write('<meta name="theme-color" content="black">');
    document.write('<meta name="msapplication-navbutton-color" content="black">');
    document.write('<meta name="apple-mobile-web-app-status-bar-style" content="black">');

document.write('<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />');
document.write('<meta http-equiv="Pragma" content="no-cache" />');
document.write('<meta http-equiv="Expires" content="0" />');
*/





}




function createScript(url) {
if(disable_all_loading){

return false;
}



document.write('  <!--[if lt IE 8]> <link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/archive_IE.css' + time + '\'/><![endif]-->');
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/archive.css' + time + '\'/>');
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/fonts.css' + time + '\'/>');
if(read_Setting('NDmode', "day", 'all')== "night"){
document.write('<link id="night" type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/night.css' + time + '\'/>');
}










if(read_Setting("lang", "ar", "all")=="ar"){
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/langs/ar.js' + time + '\'><\/script>');
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/rtl.css' + time + '\'/>');
}
else if(read_Setting("lang", "ar", "all")=="en"){

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/langs/en.js' + time + '\'><\/script>');
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/ltr.css' + time + '\'/>');
}






document.write('<link type=\"text/css\" media=\"print\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/archive_print.css' + time + '\'/>');


if(_isMobile() == mobiletrue){

document.write('<link  type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/mobile.css' + time + '\'/>');

}






document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/stop_words/stop.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/xregexp/xregexp-all-5.1.0-min.js' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/pollyfills/pollyfills.js' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/json2.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/plugins/jquery_postmessage/jquery.ba-postmessage.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/findAndReplaceDOMText/findAndReplaceDOMText-0.4.6.js' + time + '\'><\/script>');  
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/findAndReplaceDOMText/highlighter.js' + time + '\'><\/script>');              



        
 
          
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/constants.js' + time + '\'><\/script>');

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/utils.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/mhutils.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/mhlang.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/mhver.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/settings.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/XmlJsReader.js' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/loadscreen.js' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/loadcsh.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/loadparentdata.js' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/loadprojdata.js' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/showhidecontrols.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/pageloader.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/mhtopic.js' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/searchfield.js' + time + '\'><\/script>');

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/ehlpdhtm.js' + time + '\'><\/script>');  
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/fullscreen.js' + time + '\'><\/script>'); 


}






function loadRHscript(url) {
if(disable_all_loading){

return false;
}


}




function footer(url) {
if(disable_all_loading){

return false;
}

    rootpath = url.substring(0, url.indexOf(v));

    target = url.replace(/\/$/, '');
    if (target == "") {
        target = ".";
    }

    gRootRelPath = target;
    gCommonRootRelPath = target;
    gTopicId = "";

    if (disable_all_loading == false) {



            document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/printThis.js' + time + '\'><\/script>');
            document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/copy2clipboard.js' + time + '\'><\/script>');
            document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/jquery.inview.js' + time + '\'><\/script>');
            document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/plugins/rtlScrollType.js' + time + '\'><\/script>');
            document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/hash_quts.js' + time + '\'><\/script>');
            document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/archive.js' + time + '\'><\/script>');

       

    }
    
    setTimeout(function() {

       // document.getElementById("loading").style.display = "none";
    }, 0);


}






function load_main_script_header(){
if(disable_all_loading){

return false;
}
/*
 document.write('<link rel=\"icon\" type=\"image/png\" href="'+rootpath+'clientscript/images/generic/noon.png">');
    
document.write('<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />');
document.write('<meta http-equiv="Pragma" content="no-cache" />');
document.write('<meta http-equiv="Expires" content="0" />');

document.write('<meta name="theme-color" content="black">');
    document.write('<meta name="msapplication-navbutton-color" content="black">');
    document.write('<meta name="apple-mobile-web-app-status-bar-style" content="black">');

*/


document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/main.css' + time + '\'/>');

if(typeof window.webkit != 'undefined') {
if(read_Setting('mode_type', "native", 'all')== "native"){
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/mobile_ios.css' + time + '\'/>');
}
}



document.write('<!--[if lt IE 8]>');
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/main_less_ie8.css' + time + '\'/>');
document.write('<![endif]-->');

document.write('<!--[if lt IE 7]>');
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/main_less_ie7.css' + time + '\'/>');
document.write('<![endif]-->');

style_type = read_Setting("style_type", "jq", "all");


if(read_Setting("lang", "ar", "all")=="ar"){
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/langs/ar.js' + time + '\'><\/script>');
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/rtl.css' + time + '\'/>');
}
else if(read_Setting("lang", "ar", "all")=="en"){

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/langs/en.js' + time + '\'><\/script>');
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/ltr.css' + time + '\'/>');
}



if(style_type == "jq"){
if(read_Setting("lang", "ar", "all")=="en"){

document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/js/jquery_lib/jquery.mobile-1.4.5-ltr/jquery.mobile-1.4.5.min.css' + time + '\'/>');
}
else if(read_Setting("lang", "ar", "all")=="ar"){
document.write('<link type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/js/jquery_lib/jquery.mobile-1.4.0-rtl/themes/default/rtl.jquery.mobile-1.4.0.css' + time + '\'/>');
}
if(read_Setting("lang", "ar", "all")=="en"){
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/jquery_lib/jquery.mobile-1.4.5-ltr/jquery.mobile-1.4.5.min.js'  + time +  '\'><\/script>');
}
else if(read_Setting("lang", "ar", "all")=="ar"){
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/jquery_lib/jquery.mobile-1.4.0-rtl/rtl.jquery.mobile-1.4.0.js'  + time +  '\'><\/script>');
}

}











if(read_Setting('NDmode', "day", 'all')== "night"){
document.write('<link id="night" type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/night.css' + time + '\'/>');
}


if(_isMobile() == mobiletrue){

document.write('<link  type=\"text/css\" rel=stylesheet href=\'' + rootpath + 'clientscript/css/mobile.css' + time + '\'/>');

}




document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/xregexp/xregexp-all-5.1.0-min.js' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/pollyfills/pollyfills.js' + time + '\'><\/script>');

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/stop_words/stop.js' + time + '\'><\/script>');

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/function.js' + time + '\'><\/script>');




//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/localStorage/localStorage.js?swfURL=localStorage.swf' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/localStorage/localStorage-debug.js?swfURL=localStorage.swf' + time + '\'><\/script>');
//document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/json2.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/history/history.ielte7.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/plugins/jquery_postmessage/jquery.ba-postmessage.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/findAndReplaceDOMText/findAndReplaceDOMText-0.4.6.js' + time + '\'><\/script>');  
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/findAndReplaceDOMText/highlighter.js' + time + '\'><\/script>');  
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/plugins/placeholders.js' + time + '\'><\/script>');
 document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/copy2clipboard.js' + time + '\'><\/script>');

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/constants.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/utils.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/mhutils.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/mhlang.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/mhver.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/settings.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/XmlJsReader.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/loadscreen.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/loadcsh.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/loadparentdata.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/loadprojdata.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/showhidecontrols.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/pageloader.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/mhfhost.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/search.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/searchfield.js' + time + '\'><\/script>');

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/virtual-scroll/vscroll_functions.js' + time + '\'><\/script>'); 
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/virtual-scroll/vscroll.js' + time + '\'><\/script>'); 
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/snipper.js' + time + '\'><\/script>'); 
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/fullscreen.js' + time + '\'><\/script>'); 




}




function load_main_script_body(){
if(disable_all_loading){

return false;
}

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/adobe/ehlpdhtm.js' + time + '\'><\/script>');


}


function load_main_script_footer(){
if(disable_all_loading){

return false;
}

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/plugins/rtlScrollType.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/hash_quts.js' + time + '\'><\/script>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/main.js' + time + '\'><\/script>');

if(typeof window.webkit != 'undefined') {   
          var obj = {event: "button_state", arg: "enabled"};
          window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
}
  
  
    
    


}




function load_index_page_script_header(){
if(disable_all_loading){

return false;
}

/*
 document.write('<link rel=\"icon\" type=\"image/png\" href="'+rootpath+'clientscript/images/generic/noon.png">');
    document.write('<meta name="theme-color" content="black">');
    document.write('<meta name="msapplication-navbutton-color" content="black">');
    document.write('<meta name="apple-mobile-web-app-status-bar-style" content="black">');
document.write('<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />');
document.write('<meta http-equiv="Pragma" content="no-cache" />');
document.write('<meta http-equiv="Expires" content="0" />');*/




document.write('<link rel=\"icon\" type=\"image/png\" href="'+rootpath+'clientscript/images/generic/noon.png">');
//document.write('<div id="loading"></div>');
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/plugins/rtlScrollType.js' + time + '\'><\/script>');






if(read_Setting("lang", "null", "all")=="ar"){
document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/langs/ar.js' + time + '\'><\/script>');

}
else if(read_Setting("lang", "null", "all")=="en"){

document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/langs/en.js' + time + '\'><\/script>');

}

}




function load_index_page_script_footer(){

		document.write('<script type=\"text/javascript\" src=\'' + rootpath + 'clientscript/js/plugins/rtlScrollType.js' + time + '\'><\/script>');


 setTimeout(function() {

        document.getElementById("loading").style.display = "none";
		
if(typeof window.webkit != 'undefined') {   
          var obj = {event: "button_state", arg: "disabled"};
          window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
}	
	

if(typeof window.webkit != 'undefined') {   
          var obj = {event: "show_webkit_info", arg: "true"};
          window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
}
     
     if(typeof window.webkit != 'undefined') {

     if(read_Setting('full_screen', "off", 'web')== "on"){
     var obj = {event: "cell_tag_2", arg: "hide_state_bar"};
      window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj));
      
      //fullscreen_img ='' + rootpath + 'clientscript/images/tools/fullSoff.png';
     }

     }
	

	
		
    }, 0);
	 

}











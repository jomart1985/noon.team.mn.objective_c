function search_run(event, searchBox,value) {
	
	
    
	



	  if(event== null){
            $("#searchBox").blur(); 
           searchHelp(event, 'searchBox',null,value);
	    hide_snpit();
           
           
          }else{
          
           var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
            $("#searchBox").blur(); 
           searchHelp(event, 'searchBox');
	    hide_snpit();
    }
          }

   
    
    
  
	
	

	
}

function resize_pop(){


setTimeout(function () {
	
$(window).trigger('resize');

var smallindent;

if(style_type == "jq"){
smallindent =40;
}else{
smallindent =50;
}


if($("#ifra").outerHeight()+smallindent <= $("#pop").outerHeight()){
$("#pop").css("height",($("#ifra").outerHeight()+smallindent)+"px");
}
else{
$("#pop").css("height","auto");

}

	
$("body , html").css("overflow","hidden");



$(".pop").toggle().hide().show(0);

	        },100);




}



function fav_run(event, favBox) {}

function go_main() {
$("#loading").show();
stop_load_ifram = false;
	hide_all_views(false ,"#t=" + get_iframe_current_relative_url("index.php.htm"));
}

function change_style() {
	document.getElementById('loading').style.display = 'block';
	
$("*").css("overflow","visible");


		setTimeout(function () {
		
		    var url_string =  window.location.toString()
		
		
	       var before_hash = "";
	       var hash ="";
	       var all =""; 
	     
	      if(url_string.indexOf('%23') !== -1){
	          before_hash = url_string.substring(0, url_string.indexOf('%23'));
	          hash ="%23" +url_string.split("%23")[1];
	          before_hash =  before_hash.replace("main.html", "index.html");
	          //if(url_string.indexOf('&') !== -1){
	          time = time.replace(/\?/, '&');
	          //}
	          
	          all = before_hash+ time + hash;
	      }
	      else{
	      
	          //if(url_string.indexOf('&') !== -1){

	          time = time.replace(/\?/, '&');
//}
	          
	           url_string =  url_string.replace("main.html", "index.html");
	      	  all = url_string+ time;
	      }
	     
		
				window.location = all;
	        }, 100);
		

}


function hide_style(){


document.getElementById('loading').style.display = 'block';
$("*").css("overflow","visible");
	setTimeout(function() {
		var current_hash = window.location.hash;
		var hash="";
		
		
		
		
		
		current_hash = decodeURIComponent(current_hash);
		current_hash = current_hash.replace(/#t=/, '');
		
		
	       
	       
	       
	        if(current_hash.indexOf('#') != -1){
		
		hash ="#"+current_hash.split("#")[1];
		current_hash = current_hash.split("#")[0];
		}
		else{
		current_hash = current_hash.split("#")[0];
		}
		
	
		
	        if(current_hash.indexOf('&') !== -1){
		
		current_hash = current_hash.replace(/&/, '?');
		
		window.location = current_hash+time.replace(/\?/, '&')+hash;
		
		}
		else{
		
		window.location = current_hash+time+hash;
		}
	
	

		
		
		
		
	}, 100);


}




function saveBookmark(elem,value) {
	
	
	if(elem){
		elem.preventDefault();
	}
	if(is_grabbing == true) return false;
	var fav_link_found = false;
	if(!validateForm(value)) {
		return false;
	}
	fav_title = document.getElementById('favBox').value;
	
		if(value){
			      
			fav_title = value;
		}
     
	
	
	
	var bookmark = {
		name: fav_title,
		url: fav_url
	}
	if(read_Setting('bookmarks', null, 'all') == null) {
		var bookmarks = [];
		bookmarks.push(bookmark);
		save_Setting('bookmarks', JSON.stringify(bookmarks), 'all');
	} else {
		var bookmarks = JSON.parse(read_Setting('bookmarks', null, 'all'));
		for(var i = 0; i < bookmarks.length; i++) {
			if(bookmarks[i].url == fav_url) {
				// remove from array
				alert(Cannot_save_link_already_in_favourites);
				fav_link_found = true;
				break;
			}
		}
		if(fav_link_found == false) {
			bookmarks.push(bookmark);
			save_Setting('bookmarks', JSON.stringify(bookmarks), 'all');
		}
	}
	fetchBookmarks();
}

function deleteBookmark(elem, url) {
	if(is_grabbing == true) return false;
	var bookmarks = JSON.parse(read_Setting('bookmarks', null, 'all'));
	for(var i = 0; i < bookmarks.length; i++) {
		if(bookmarks[i].url == url) {
			bookmarks.splice(i, 1);
		}
	}
	save_Setting('bookmarks', JSON.stringify(bookmarks), 'all');
	fetchBookmarks();
}

function fetchBookmarks() {
	document.getElementById("favBox").value = fav_title;
	if(typeof window.webkit != 'undefined') {   
	var obj = {event: "favBox", arg: fav_title};
      window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
      
	}
	
	
	document.getElementById("websiteUrl").value = fav_url;
	var bookmarks = read_Setting('bookmarks', 'null', 'all');
	var bookmarksResults = document.getElementById('bookmarksResults');
	bookmarksResults.innerHTML = '';
	
	
	if(bookmarks != 'null') {
	
	bookmarks = JSON.parse(bookmarks);
		for(var i = 0; i < bookmarks.length; i++) {
			var name = bookmarks[i].name;
			var url = bookmarks[i].url;
			if(url == fav_url) {
				$("#fav_image").attr('src', 'clientscript/images/tools/booked.png');
				
				 $("#fav_td a").removeClass('ui-icon-star').addClass("star_yellow");
				bookmarksResults.innerHTML += '<div class = "bookmark curr">' + '<span  class= "title" style = ""><img src=\"clientscript/images/tools/booked.png\"> ' + name + "</span><br>" + '<span  style = "display:none;" class= "url" style = "word-break: break-all;">' + url + '</span>' + ' <a style= "text-decoration: none!important;" onclick="go_iframe(event,this,\'fav_links\')" class="link ui-link btn btn-info" href="' + url + '">'+Go_to_the_link+'</a>' + ' <a style= "text-decoration: none!important;"  onclick="deleteBookmark(event,\'' + url + '\')" class="btn btn-danger" href="javascript:void(0);">'+Removal_books+'</a>' + '' + '</div><hr>';
			 if(typeof window.webkit != 'undefined') {
                    var obj = {event: "set_image_booked", arg: "on"};
                   window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj));
		     }	
		
			
			} else {
				bookmarksResults.innerHTML += '<div class = "bookmark">' + '<span  class= "title" style = "">' + name + "</span>" + '<span  style = "display:none;" class= "url" style = "word-break: break-all;">' + url + '</span><br>' + '<a style= "text-decoration: none!important;"  onclick="go_iframe(event,this,\'fav_links\')" class="link ui-link btn btn-info" href="' + url + '">'+Go_to_the_link+'</a>' + ' <a style= "text-decoration: none!important;" onclick="deleteBookmark(event,\'' + url + '\')" class="btn btn-danger" href="javascript:void(0);">'+Removal_books+'</a>' + '' + '</div><hr>';
			
				
			
			
			}
		}
		setTimeout(function() {
			if($('.curr').get(0)) {
				


                         seamless.polyfill();
seamless.elementScrollIntoView($('.curr').get(0), {
       block: 'start',
       inline:'start'
    });



			} else {
				$("#fav_image").attr('src', 'clientscript/images/tools/fav.png');
				 $("#fav_td a").addClass('ui-icon-star').removeClass("star_yellow");
				 
				  if(typeof window.webkit != 'undefined') {
                    var obj = {event: "set_image_booked", arg: "off"};
                   window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj));
		     }
				 
			}
		







}, 100);
	}







}

// Validate Form
function validateForm(value) {
	var websiteName = document.getElementById('favBox').value;
	var websiteUrl = document.getElementById('websiteUrl').value;
	if(typeof window.webkit != 'undefined') {
		
		if(read_Setting('mode_type', "native", 'web')== "nativ"){
		if(!websiteUrl  || (!websiteName || !value)) {
		alert(Please_fill_required_fields);
		return false;
		}
		else{
		if(!websiteUrl  || (!websiteName)) {
		alert(Please_fill_required_fields);
		return false;
		}	
		}
		}
		
		
	}
	else{
		if(!websiteUrl  || !websiteName) {
		alert(Please_fill_required_fields);
		return false;
		}
	}
	
	
	var expression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;
	var regex = new RegExp(expression);
	if(!websiteUrl.match(regex)) {
		alert(Please_enter_valid_link);
		return false;
	}
	return true;
}







function next_prev(dir){


$.postMessage('{"eventname":"next_prev", "dir":"'+dir+'"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);



}












function go_hit(elem) {}

function doneResizing() {
	if(!$("#search_view").hasClass("is-hidden")) {
		$("#loading").show();
		
setTimeout(function() {
				refresh_vl();
			}, 0);
	} else {
		resizeDone = true;
	}
}

function scroll_vl() {
	if(window.myScroll) {
		$("#loading").show();
		if(current_select) {
			var myRegexp = new RegExp("hit_(.*)", "g");
			var match = myRegexp.exec(current_select);
			setTimeout(function() {
				window.myScroll.scrollto(match[1] - 1);
			}, 0);
		} else {
			setTimeout(function() {
				window.myScroll.scrollto(curr_index);
			}, 0);
		}
	}
	if(window.myScroll2) {
		$("#loading").show();
		if(current_select) {
			var myRegexp = new RegExp("hit_(.*)", "g");
			var match = myRegexp.exec(current_select);
			setTimeout(function() {
				window.myScroll2.scrollto(match[1] - 1);
			}, 0);
		} else {
			setTimeout(function() {
				window.myScroll2.scrollto(curr_index);
			}, 0);
		}
	}
}

function refresh_vl() {
	if(document.getElementById("sample").style.display == "none") {
		if(window.myScroll) {
			window.myScroll.destroy();
			lunch_vlist2(_a_QueryResult, _strParams, "searchResList", "contentholder", _i, _g_nMaxResult, _g_CurPage, _bShowAll, false);
		}
	} else {
		if(window.myScroll2) {
			window.myScroll2.destroy();
			lunch_vlist3(_a_QueryResult, "snptviewcon", "snptview",false);
		}
	}
	scroll_vl();
	resizeDone = false;
}

function update_vl() {
	if(resizeDone) {
		refresh_vl();
	} else {
		scroll_vl();
	}
}

function get_iframe_current_relative_url(url) {
	var uri = window.location.href;
	if(url.indexOf('#') != -1) {
		url = url.split('#')[0];
	}
	
	if(url.indexOf('?') != -1) {
		url = decodeURIComponent(url.substring(0, url.indexOf('?')));

	}
	url = url.replace(full_root_path(uri), "");
	return url;
}

function go_iframe(e, el, view) {
	
if(typeof window.webkit != 'undefined') {   
          var obj = {event: "go_iframe", arg: null};
          window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
}	
	
	
e.preventDefault();
if(is_grabbing == true) return false;
if(is_input_foces == true) return false;
	$("#loading").show();

setTimeout(function(){  
	if(view == "search_links_no_snipit") {
		if(need_refresh(el.href) == true) {
			stop_load_ifram = false;
		} else {
			stop_load_ifram = true;
			$.postMessage('{"eventname":"apply_hit", "hit":"' + getParameterByName("hit", el.href) + '"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
		}
		$(".mark").removeClass("mark");
		//history.pushState(null, null, "#t=" + set_hash_url(el.href));
		$(el.parentNode).addClass("mark");
		current_select = el.parentNode.id;
	}
	if(view == "fav_links") {
		stop_load_ifram = false;
		//history.pushState(null, null, "#t=" + set_hash_url(el.href));
	}
	if(view == "search_links_snipit") {
		if(need_refresh(el.href) == true) {
			stop_load_ifram = false;
		} else {
			stop_load_ifram = true;
			$.postMessage('{"eventname":"apply_hit", "hit":"' + getParameterByName("hit", el.href) + '"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
		}
		$(".mark").removeClass("mark");
		$(el.parentNode).addClass("mark");
		current_select = el.parentNode.id;
		//history.pushState(null, null, "#t=" + set_hash_url(el.href));
	}
	if(view == "partial_snipit") {
	
		if(need_refresh(el.href) == true) {
			stop_load_ifram = false;
		} else {
			stop_load_ifram = true;
			
			$.postMessage('{"eventname":"apply_hit", "hit":"' + getParameterByName("hit", el.href) + '"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
		}
		$(".mark").removeClass("mark");
		$(el).addClass("mark");
		current_select = el.id;
		//history.pushState(null, null, "#t=" + set_hash_url(el.href));
	}
	if(view == "all_snipit") {
		if(need_refresh(el.href) == true) {
			stop_load_ifram = false;
		} else {
			stop_load_ifram = true;
			$.postMessage('{"eventname":"apply_hit", "hit":"' + getParameterByName("hit", el.href) + '"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
		}
		$(".mark").removeClass("mark");
		$(el).addClass("mark");
		current_select = "hit_" + el.parentNode.id;
		current_mark = el.id;
		//history.pushState(null, null, "#t=" + set_hash_url(el.href));
	}
	hide_all_views(false,"#t=" + set_hash_url(el.href));
	}, 100);
}

function full_root_path() {
	var current_Location = window.location.href;
	return current_Location.toString().substring(0, current_Location.toString().lastIndexOf('/'));
}

function need_refresh(url_iframe,ignore_para) {
	url_iframe = decodeURIComponent(url_iframe);
	url_iframe = url_iframe.replace(full_root_path(), "");
	//url_iframe = url_iframe.substr(0);
	url_iframe = url_iframe.replace(/^\//g, '');
	var clean_url_iframe = url_iframe.split('?')[0];
	clean_url_iframe = clean_url_iframe.split('#')[0];
	var iframe_rhhlterm = getParameterByName("rhhlterm", url_iframe);
	var current_hash = decodeURIComponent(window.location.hash);
	current_hash = current_hash.substr(3);
	var clean_current_hash = current_hash.split('&')[0];
	clean_current_hash = clean_current_hash.split('#')[0];
	var current_hash_rhhlterm = getParameterByName("rhhlterm", current_hash);
	
	
	if(clean_current_hash == clean_url_iframe) {
		if(!ignore_para) {
		if(iframe_rhhlterm == current_hash_rhhlterm) {
		
			return false;
		} else {
		
			return true;
		}
		
		}
		else{

					return false;
		}
		
		
	} else {
		return true;
	}
}

function set_hash_url(url, clean) {
	
	
	var clean_ifram_url = encodeURIComponent(get_iframe_current_relative_url(url).substring(1));
        var final  = clean_ifram_url ;

	if(!clean) {
		var parent_paramters = "";
		var iframe_paramters = "";
		var topic_hash = "";

	
			parent_paramters = decodeURIComponent(window.location.href);
			
			
			//parent_paramters = parent_paramters.split('#t=')[1];
			
			if(parent_paramters.indexOf('&') !== -1){
			parent_paramters = parent_paramters.substring(parent_paramters.indexOf('&'));
			
			parent_paramters = removeParam("random", parent_paramters);
			parent_paramters = removeParam("ux", parent_paramters);
			parent_paramters = removeParam("rhsyns", parent_paramters);
			parent_paramters = removeParam("rhhlterm", parent_paramters);
			parent_paramters = removeParam("hit", parent_paramters);
			parent_paramters = removeParam("time", parent_paramters);
                       //parent_paramters = removeParam("ux", parent_paramters);
			
			}
			else{
			parent_paramters = "";
			}
			
		
			if(parent_paramters.indexOf('#') !== -1){
			parent_paramters = parent_paramters.split('#')[0];
			
			//alert(parent_paramters);
			}
			
			
			

			iframe_paramters =   decodeURIComponent(url);
			
			if(url.indexOf('?') !== -1){
			
			iframe_paramters = removeParam("ux", iframe_paramters);
			iframe_paramters = removeParam("random", iframe_paramters);
			iframe_paramters = removeParam("time", iframe_paramters);
			//iframe_paramters = removeParam("ux", iframe_paramters);
			iframe_paramters =  iframe_paramters.split('?')[1]||"";
		
			if(iframe_paramters){
			
			iframe_paramters = "&"+iframe_paramters;
			}
			}
			
			if(iframe_paramters.indexOf('#') !== -1){
	
			   topic_hash = "%23"+iframe_paramters.split('#')[1];
			   iframe_paramters = iframe_paramters.split('#')[0];
			}
			
			
			if(iframe_paramters.indexOf('#') == -1   && iframe_paramters.indexOf('&') == -1 ){
	
			  iframe_paramters = "";
			 
			}
			
	
			
			 final = clean_ifram_url+iframe_paramters+parent_paramters+topic_hash;
			
	
			
			
	}
	return final;
}




function fireEvents(state,stop,first) {

	
	
	var currenthash = location.hash;
	currenthash = decodeURIComponent(currenthash);
	var myParam = currenthash.substr(3);
	if(myParam.toString().indexOf('&') != -1) {
		myParam = myParam.replace(/&/, '?');
	}
	
                         save_Setting("currPATH", window.location.toString().split('app/').pop(), "all");        
    
						
							if(myParam.indexOf('#post') != -1) {

								if(!break_fun){
									
									$("#loading").show();
									$.postMessage('{"eventname":"go_hash", "hash":"' + myParam.split('#')[1]+ '"}', // The message to send (string)
									 "*", // The host of the target window (i.e. http://www.vistaprint.com)
									 window.frames["iframe_name"] // A reference to the target window
					 
								 );
									
								}  
								
						
						
									
							if(first){
									
									stop_load_ifram = false;
							}
								
						  
							}





						
            
  
 
	if(myParam.indexOf('ux=search') != -1) {
	
	show_search_view();
	
	if(!$("#search_view").hasClass("is-hidden") && $("#snptviewcon").hasClass("is-hidden")) {
	if(GetSearchTextFromURL()){
	$("#searchBox").val(GetSearchTextFromURL());
	show_clear($("#searchBox"),"#clear_search");
	$(".td_search_input .ui-input-clear").removeClass("ui-input-clear-hidden");
	}
	}
	
	                 
	//stop_load_ifram = true;
	
	}
	else if(myParam.indexOf('ux=bookmark') != -1) {
	
	show_bookmark_view();
	//stop_load_ifram = true;
	
	}
	else{

	hide_all_views(true,null);
	
	}
	


	var hash2 = myParam.split('#')[1];
	
	if(hash2){
	  hash2 = "#"+hash2;
	}
	else{
	
	  hash2 = "";
	}
	var time2 = time;
	time2 = time2.replace(/\?/, '');
	myParam = myParam.split('#')[0];
	
	 //myParam = myParam.replace("?&", '?');
	
	myParam = removeParam("rhsearch", myParam);
        myParam = removeParam("ux", myParam);
	if(myParam){
	myParam = addParameterToURL(myParam,time2);
	
	if(stop_load_ifram == false) {

	

		setIFrameSrc("iframe_id", myParam+hash2);
		
       

		
	}
	}

	 //stop_load_ifram = false;
	
}

function iframe_focus_detect() {
	$("#pop").css("display", "none");
}


 
function toggle_view_wkwebview(value,view_name){
	
	
	break_fun = true;
	var current_hash = window.location.hash;
	current_hash = current_hash.replace(/^#+/, '');
	var hash2 = current_hash.split('%23')[1];
	
	if(hash2){
	  hash2 = "%23"+hash2;
	}
	else{
	
	  hash2 = "";
	}
	current_hash = removeParam("ux", current_hash);

	current_hash = current_hash.split('%23')[0];
	if(view_name === 'search_view') {
		
		

		
		if(value =="show") {
			
$("#loading").show();
stop_load_ifram = true;
				      history.replaceState(null, null, "#" + current_hash + "&ux=search"+hash2,null);
				       //show_search_view();


		
		} else {
		stop_load_ifram = true;
			              history.replaceState(undefined, undefined, "#" + current_hash+hash2,null);
			             // hide_all_views(true,null);

		}
		
		
		
	}
	if(view_name === 'fav_view') {
		
		
		
		
		if(value =="show") {

			$("#loading").show();
			
		stop_load_ifram = true;
		history.replaceState(undefined, undefined, "#" + current_hash + "&ux=bookmark"+hash2,null);
		//show_bookmark_view()


			
		} else {
		stop_load_ifram = true;
	         history.replaceState(undefined, undefined, "#" + current_hash+hash2,null);
	         //hide_all_views(true,null);

		}
		
	}
	
	
	
}





function show_view(elem, view_name, display_state) {
	break_fun = true;
	var current_hash = window.location.hash;
	current_hash = current_hash.replace(/^#+/, '');
	var hash2 = current_hash.split('%23')[1];
	
	if(hash2){
	  hash2 = "%23"+hash2;
	}
	else{
	
	  hash2 = "";
	}
	current_hash = removeParam("ux", current_hash);

	current_hash = current_hash.split('%23')[0];
	if(view_name === 'search_view') {
		
		

		
		if($("#search_view").hasClass("is-hidden")) {
			
$("#loading").show();
stop_load_ifram = true;
				      history.replaceState(null, null, "#" + current_hash + "&ux=search"+hash2,null);
				       //show_search_view();


		
		} else {
		stop_load_ifram = true;
			              history.replaceState(undefined, undefined, "#" + current_hash+hash2,null);
			             // hide_all_views(true,null);

		}
		
		
		
	}
	if(view_name === 'fav_view') {
		
		
		
		
		if($("#fav_view").hasClass("is-hidden")) {

			$("#loading").show();
			
		stop_load_ifram = true;
		history.replaceState(undefined, undefined, "#" + current_hash + "&ux=bookmark"+hash2,null);
		//show_bookmark_view()


			
		} else {
		stop_load_ifram = true;
	         history.replaceState(undefined, undefined, "#" + current_hash+hash2,null);
	         //hide_all_views(true,null);

		}
		
	}
}

function show_search_view(){
   
setTimeout(function(){


setTimeout(function(){ $("#head table").css("border-collapse","collapse");  }, 0);  
                
  $("#ifra").addClass("is-hidden");              
		if(document.getElementById("sample").style.display == "block") {
			
			$("#snpt,#snptviewcon").removeClass("is-hidden");
		
$("#clear_search,.clear_search").hide();
$(".td_search_butt,.td_search_input").hide();
$("#plus_td,  #next_td, #prev_td,.td_fav_input,.clear_fav,#clear_fav,.td_save_fav_butt").hide();
$("#home_td").show();
$("#home_td").css("width","");


$(".tr_header").css("border","1px solid transparent");     

$(".adobe .tr_header").removeClass("add_white_tr_back");
$("#close_td").show();
		
if(typeof window.webkit != 'undefined') {
 var obj = {event: "show_snipt_section", arg: "on"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj));
}		

	
		
		} else {
		
		
			if($("#searchBox").val()){
$("#clear_search").show();
$(".td_search_input .ui-input-clear").removeClass("ui-input-clear-hidden");
}		
			
		
			$("#snpt,#snptviewcon").addClass("is-hidden");
			

			


$(".td_search_butt,.td_search_input,.clear_search").show();
$("#plus_td,  #next_td, #prev_td,.td_fav_input,.clear_fav,#clear_fav,.td_save_fav_butt").hide();

$("#home_td").show();
$("#home_td").css("width","3em");
if(read_Setting('NDmode', "day", 'all')== "night"){


$(".tr_header").css("border","1px solid white");        
}   			


$(".adobe .tr_header").addClass("add_white_tr_back");
			
			
		}

		$("#fav_td a").removeClass("is-active");
	
			$(".view").addClass("is-hidden");
			
			$("#search_view").removeClass("is-hidden");
			
			$(".window").hide();
			


			update_vl();
			if($('.wSearchPageNumberSelected').length) {
				$(".m_con").scrollCenter(".wSearchPageNumberSelected", 0);
			}
			if($('.mark').get(0)) {
				

                           seamless.polyfill();
seamless.elementScrollIntoView($('.mark').get(0), {
       block: 'start',
       inline:'start'
    });
	


			}

if(stop_load_ifram ==true){

$("#loading").hide();
break_fun = false;

}
	


 }, 100);  



    

	
			setTimeout(function() {
				$("#search_td a").addClass("is-active");
		       }, 0);
	


}



function show_bookmark_view(){

setTimeout(function(){ 




$("#ifra").addClass("is-hidden");
$("#close_td").hide();
if(read_Setting('NDmode', "day", 'all')== "night"){
$(".tr_header").css("border","1px solid white"); 
}

$(".adobe .tr_header").addClass("add_white_tr_back");


$(".td_search_butt,.td_search_input , #plus_td , #next_td, #prev_td,#home_td ,.clear_search,#clear_search").hide();
 $(".td_fav_input,.clear_fav ,#clear_fav,.td_save_fav_butt").show();
 
 $("#home_td").css("width","3em").show();

$("#snpt").addClass("is-hidden");
$("#search_td a").removeClass("is-active");
		if($("#fav_view").hasClass("is-hidden")) {
			$(".view").addClass("is-hidden");
			$(".window").hide();
			$("#fav_view").removeClass("is-hidden");

			fetchBookmarks(fav_title, fav_url);
			
			setTimeout(function() {

				$("#fav_td a").addClass("is-active");
		       }, 0);
	
		} 



show_clear($("#favBox"),"#clear_fav");
$(".td_fav_input .ui-input-clear").removeClass("ui-input-clear-hidden");



if(stop_load_ifram ==true){

$("#loading").hide();
break_fun = false;

}

 }, 100);  



}


function hide_all_views(disable_push,pushvalue) {
	break_fun = false;

//setTimeout(function(){ $("#head table").css("border-collapse","collapse");  }, 0);
$("#ifra").removeClass("is-hidden");
$("#close_td").hide();
$(".tr_header").css("border","1px solid transparent"); 

$(".adobe .tr_header").removeClass("add_white_tr_back");

	 $(".td_search_butt, .td_search_input,.td_clear,.td_fav_input,.td_save_fav_butt").hide();
         $("#plus_td,  #next_td, #prev_td, #up_td , #down_td").show();
         $("#home_td").css("width","").show();

	var current_hash = window.location.hash;
	current_hash = current_hash.replace(/^#+/, '');
	current_hash = removeParam("ux", current_hash.toString());
	$(".view").addClass("is-hidden");
	$("#fav_td a").removeClass("is-active");
	$("#search_td a").removeClass("is-active");
	$("#snpt,#snptviewcon").addClass("is-hidden");
	$(".window").show();
	if(disable_push == false){
	
	if(!pushvalue){
	
	pushvalue  = "#" + current_hash;
	}
	
	history.pushState(undefined, undefined, pushvalue);
	}
	
	
	
}


function show_search_elemnts(){






}


function toggleCheckbox(elem, name) {
	if(name == "checkbox_id1") {
		save_Setting("search_type", "exact", "all");
		document.getElementById("checkbox_id4").disabled = true;
		
		if(style_type == "jq")
		$('#checkbox_id4').checkboxradio('disable');
	} else if(name == "checkbox_id0") {
		save_Setting("search_type", "all", "all");
		document.getElementById("checkbox_id4").disabled = false;
		
		if(style_type == "jq")
		$('#checkbox_id4').checkboxradio('enable');
	} else if(name == "checkbox_id2") {
		save_Setting("search_type", "any", "all");
		document.getElementById("checkbox_id4").disabled = false;
		
		if(style_type == "jq")
		$('#checkbox_id4').checkboxradio('enable');
	}
}

function toggle_ignored_words(elem, name) {
	if(elem.checked) {
		save_Setting("is_ignord", "false", "all");
	} else {
		save_Setting("is_ignord", "true", "all");
	}
}

function toggleSnipit(elem, name) {
	if(elem.checked) {
		
		save_Setting(RHSEARCHCOUNT, "5", "all");
		save_Setting("snpt_true", "true", "all");
		document.getElementById("searchResCount").value = 5;
		
		
		 
		document.getElementById("searchResCount").disabled = true;
		
		if(style_type == "jq"){
		$('#searchResCount').val(5).selectmenu("refresh", true);
		$('#searchResCount').selectmenu().selectmenu("disable");
		}
		
	} else {
		is_snipit_enabled = false;
		save_Setting("snpt_true", "false", "all");
		document.getElementById("searchResCount").disabled = false;
		
		if(style_type == "jq")
		$('#searchResCount').selectmenu().selectmenu("enable");
	}
}

function toggle_highlight(elem, name) {
	if(name == "checkbox_id3") {
		if(elem.checked) {
			save_Setting("hit_true", "true", "all");
		} else {
			save_Setting("hit_true", "false", "all");
		}
	}
	if(name == "checkbox_id6") {
		if(elem.checked) {
			save_Setting("hit2_true", "true", "all");
		} else {
			save_Setting("hit2_true", "false", "all");
		}
	}
}

function toggle_settings(state) {
	if(state) {
		if(state == "show") {
			$("#andholder").show();
			$("#toggle_options img").attr("src", "clientscript/images/tools/search_advanced_open.png");
			//return false;
		}
		if(state == "hide") {
			$("#andholder").hide();
			$("#toggle_options img").attr("src", "clientscript/images/tools/search_advanced_closed.png");
			//return false;
		}
	} else {
		if($("#andholder").css("display") == "none") {
			$("#andholder").show();
			$("#toggle_options img").attr("src", "clientscript/images/tools/search_advanced_open.png");
		} else {
			$("#andholder").hide();
			$("#toggle_options img").attr("src", "clientscript/images/tools/search_advanced_closed.png");
		}
	}
}





function print_all(){
//if(is_grabbing == true) return false;


$.postMessage('{"eventname":"print", "type":"all"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);


$("#pop").css("display", "none");

}

function full_screen(){

//if(is_grabbing == true) return false;
toggle_full_screen($("html").get(0));

$("#pop").css("display", "none");

}


function toggleNDmode(elem){
//if(is_grabbing == true) return false;
$("#loading").show();

$("#pop").css("display", "none");


if(read_Setting('NDmode', "day", 'all')== "day"){

save_Setting('NDmode', "night", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_1", arg: "on"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


}else{
save_Setting('NDmode', "day", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_1", arg: "off"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


}

setTimeout(function(){


location.reload(); 

}, 100);

}


function Remove_diacritics(){
//if(is_grabbing == true) return false;
$("#loading").show();

$("#pop").css("display", "none");

if(read_Setting('Strip_tashkeel', "off", 'all')== "off"){


document.getElementById('tashkeel').innerHTML = "<span class =\"number\">&nbsp;10-&nbsp;</span>"+Add_diacritics_to_text;


save_Setting('Strip_tashkeel', "on", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_10", arg: "on"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


}else{

document.getElementById('tashkeel').innerHTML = "<span class =\"number\">&nbsp;10-&nbsp;</span>"+Remove_diacritics_from_text;


save_Setting('Strip_tashkeel', "off", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_10", arg: "off"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}

}

$.postMessage('{"eventname":"reload"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);



}



function zoomer_text(type){
//if(is_grabbing == true) return false;

$.postMessage('{"eventname":"zoomer_text", "state":"'+type+'"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);


}


function remove_format(){
//if(is_grabbing == true) return false;


$("#loading").show();

$("#pop").css("display", "none");


if(read_Setting('format', "add", 'all')== "add"){

save_Setting('format', "removed", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_9", arg: "on"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


     document.getElementById('format').innerHTML = "<span class =\"number\">&nbsp;7-&nbsp;</span>"+add_formatting;

}else{
save_Setting('format', "add", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_9", arg: "off"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}

    document.getElementById('format').innerHTML = "<span class =\"number\">&nbsp;7-&nbsp;</span>"+remove_formatting;

}


$.postMessage('{"eventname":"reload"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);


}



function Re_highlighting(){
//if(is_grabbing == true) return false;
$("#loading").show();

$("#pop").css("display", "none");



$.postMessage('{"eventname":"highlight", "state":"true"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);


}


function Remove_highlighting(){
//if(is_grabbing == true) return false;
$("#loading").show();

$("#pop").css("display", "none");



$.postMessage('{"eventname":"highlight", "state":"false"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);

}



function Show_or_Hide_random_signature(){
//if(is_grabbing == true) return false;
$("#loading").show();

$("#pop").css("display", "none");





if(read_Setting('Random_signature', "hidden", 'all')== "hidden"){



save_Setting('Random_signature', "showen", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_11", arg: "on"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


document.getElementById('signature').innerHTML = "<span class =\"number\">&nbsp;12-&nbsp;</span>"+hide_random_signature;


$.postMessage('{"eventname":"random_signature", "state":"show"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);



}else{

save_Setting('Random_signature', "hidden", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_11", arg: "off"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


document.getElementById('signature').innerHTML = "<span class =\"number\">&nbsp;12-&nbsp;</span>"+show_random_signature;


$.postMessage('{"eventname":"random_signature", "state":"hide"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);

}


}

function remove_vid_source_link(){

//if(is_grabbing == true) return false;



$("#loading").show();

$("#pop").css("display", "none");


if(read_Setting('vid_source_link', "showen", 'all')== "showen"){


save_Setting('vid_source_link', "hidden", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_5", arg: "on"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


document.getElementById('vid_source').innerHTML = "<span class =\"number\">&nbsp;6-&nbsp;</span>"+Add_vid_source_link;
$.postMessage('{"eventname":"vid_source_link", "state":"hide"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);



}else{

save_Setting('vid_source_link', "showen", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_5", arg: "off"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


document.getElementById('vid_source').innerHTML = "<span class =\"number\">&nbsp;6-&nbsp;</span>"+Remove_vid_source_link;
$.postMessage('{"eventname":"vid_source_link", "state":"show"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);

}

}





function remove_thread_source_link(){

//if(is_grabbing == true) return false;



$("#loading").show();

$("#pop").css("display", "none");


if(read_Setting('thread_source_link', "showen", 'all')== "showen"){


save_Setting('thread_source_link', "hidden", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_6", arg: "on"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


document.getElementById('thread_source').innerHTML = "<span class =\"number\">&nbsp;7-&nbsp;</span>"+Add_thread_source_link;

$.postMessage('{"eventname":"thread_source_link", "state":"hide"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);



}else{

save_Setting('thread_source_link', "showen", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_6", arg: "off"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}

document.getElementById('thread_source').innerHTML = "<span class =\"number\">&nbsp;7-&nbsp;</span>"+Remove_thread_source_link;




$.postMessage('{"eventname":"thread_source_link", "state":"show"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);

}

}





function remove_links_to_the_source_of_the_statement(){

//if(is_grabbing == true) return false;



$("#loading").show();

$("#pop").css("display", "none");


if(read_Setting('source_of_the_statement', "showen", 'all')== "showen"){


save_Setting('source_of_the_statement', "hidden", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_7", arg: "on"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}

document.getElementById('links_source').innerHTML = "<span class =\"number\">&nbsp;8-&nbsp;</span>"+Add_links_to_the_source_of_the_statement;

$.postMessage('{"eventname":"source_of_the_statement", "state":"hide"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);



}else{

save_Setting('source_of_the_statement', "showen", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_7", arg: "off"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}

document.getElementById('links_source').innerHTML = "<span class =\"number\">&nbsp;8-&nbsp;</span>"+Remove_links_to_the_source_of_the_statement;




$.postMessage('{"eventname":"source_of_the_statement", "state":"show"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);

}

}





function remove_links_translations(){

//if(is_grabbing == true) return false;



$("#loading").show();

$("#pop").css("display", "none");


if(read_Setting('links_translations', "showen", 'all')== "showen"){



save_Setting('links_translations', "hidden", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_8", arg: "on"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}


document.getElementById('links_translations').innerHTML = "<span class =\"number\">&nbsp;9-&nbsp;</span>"+Add_links_translations;

$.postMessage('{"eventname":"links_translations", "state":"hide"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);



}else{

save_Setting('links_translations', "showen", 'all');

if(typeof window.webkit != 'undefined') {  

 var obj = {event: "cell_tag_8", arg: "off"};
 window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj))
       
}

document.getElementById('links_translations').innerHTML = "<span class =\"number\">&nbsp;9-&nbsp;</span>"+Remove_links_translations




$.postMessage('{"eventname":"links_translations", "state":"show"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);

}

}





function up_down(dir){

         $("#loading").show();
     setTimeout(function () {
	if(!$("#search_view").hasClass("is-hidden") && !$("#snptviewcon").hasClass("is-hidden")) {
	
	if(dir== "down"){
	
      
	
$('#snptview').scrollTop($("#snptview")[0].scrollHeight);

					
						

  setTimeout(function(){ 


$('#snptview').scrollTop($("#snptview")[0].scrollHeight+1000);
$("#loading").hide();

}, 100);

	
	
	
	}
	else{
	
	
	                  $('#snptview').scrollTop(0);

				
						$("#loading").hide();
					
	
	}
	  
	}
	else if(!$("#search_view").hasClass("is-hidden")) {
	
	
	
	    if(dir== "down"){
	
      
	
	
					$('#contentholder').scrollTop($("#contentholder")[0].scrollHeight);


				


  setTimeout(function(){ 


$('#snptview').scrollTop($("#contentholder")[0].scrollHeight+1000);
$("#loading").hide();

}, 100);
				
	
	
	
	}
	else{
	
	
	                  $('#contentholder').scrollTop(0);

					
						$("#loading").hide();
					
	
	}
	
	
	
	
	}
        else if(!$("#fav_view").hasClass("is-hidden")) {
	 
	 
	 
	     if(dir== "down"){
	
      
	
	
					$('#fav_view').scrollTop($("#fav_view")[0].scrollHeight);


					
						$("#loading").hide();
					
	
	
	
	}
	else{
	
	
	                  $('#fav_view').scrollTop(0);

					
						$("#loading").hide();
				
	
	}
	 
	 
	
				
					
	 
	}
	else{
	
	
	
	
	
		if(dir== "down"){
		
		
		
		
		$.postMessage('{"eventname":"do_scroll", "dir":"down"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
		
		}
		else{
		
		$.postMessage('{"eventname":"do_scroll", "dir":"up"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
			
		}
	
	
	
	
	
	}


}, 100);
}

function afterPrint() {


	$.postMessage('{"eventname":"afterPrint"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);


}



function saveFile(url) {



    var filename = url.substring(url.lastIndexOf('/') + 1).split('?')[0],
        xhr = new XMLHttpRequest();

    xhr.responseType = 'blob';
    xhr.onload = function(e) {
        if (this.status !== 4) {
            // return;
        }

        if (this.status === 200) {

            console.log(this.response);
            var reader = new FileReader();
            reader.onload = function(e) {


                var link = document.createElement('a');
                link.href = e.target.result;

                link.download = "image_" + '_' + getFormattedTime();

                link.click();

            };
            reader.readAsDataURL(this.response);
        } else {

            /*var myImage = document.createElement('img');
            myImage.onerror = (...args) => {console.log(url, 'other type of error', args);}
            myImage.onload = () => {console.log(url, 'image exists but cors blocked');}
            myImage.src = url;*/
            console.log(url, 'Image not found');


        }
    };

    xhr.open('GET', url);

    try {
        xhr.send();
    } catch (err) {
        if (e.toString().startsWith("NetworkError")) {
            //pasre the string to check error code
            //and take appropriate actions
        }
    }




}





function down() {
  

    var src = document.getElementById("img01").src;

    
    
   if (typeof Androidd!== 'undefined') {


        $('#loading').show();

         
        setTimeout(function(){ Androidd.DownloadImageURL(src); }, 100);

        
                
              
    }
    else if(typeof window.webkit != 'undefined') {  
//alert(src);
	      var obj = {event: "download", arg: src};
	      window.webkit.messageHandlers.observer.postMessage(JSON.stringify(obj));
	}
    else{
    
    if (src.indexOf("mahdialumma.com") !== -1) {

        alert(It_is_not_available_for_download);
    } else {

        saveFile(src);

    }
    
    }


}








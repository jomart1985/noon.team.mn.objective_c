var str = "false";
var issett_on = false;

var is_window_visible = false;
var is_hashtag_window_visible = false;
var whol_text_selected = false;
var html_sel = "";
var text_sel = "";
var sel_dom = "";
var containerElement = "";
var random_code;
var antiquewhite;
var border_butt;
var border_butt_hide;

var notes_code  ="<div style = 'display:none;' class ='notes_code'>"+ notes+"<br>"+Please_delete_the_stars+"<br><br></div>";

var tags = '#ناصر_محمد_اليماني<br>#منتديات_البشرى_الاسلامية<br>#الامام_المهدي_ناصر_محمد_اليماني<br>#المهدي_المنتظر_ناصر_محمد_اليماني<br>#منتديات_البشرى_الاسلامية_والنبأ_العظيم';
if(read_Setting('NDmode', "day", 'all')== "night"){   

antiquewhite = "black;";
border_butt = "3px #FFB100 solid;";
border_butt_hide = "3px white solid;";
} 
else{

antiquewhite = "#FAEBD7;";
border_butt = "3px black solid;";
border_butt_hide = ";";
}


var quots_icon;
var hash_icon;
if(read_Setting('NDmode', "day", 'all')== "night"){
quots_icon = "'" + rootpath + "clientscript/images/tools/quote_N.png'";
hash_icon = "'" + rootpath + "clientscript/images/tools/hash_tag_N.png'";
}
else{

 quots_icon = "'" + rootpath + "clientscript/images/tools/quote.png'";
  hash_icon = "'" + rootpath + "clientscript/images/tools/hash_tag.png'";
}



var read_icon;
var hand_icon;
var hand2_icon;

if(read_Setting('NDmode', "day", 'all')== "night"){
read_icon =  rootpath + "clientscript/images/tools/read_N.png";
hand_icon =  rootpath + "clientscript/images/tools/hand_N.png";
hand2_icon =  rootpath + "clientscript/images/tools/hand2_N.png";


}
else{
read_icon =  rootpath + "clientscript/images/tools/read.png";
hand_icon =  rootpath + "clientscript/images/tools/hand.png";
hand2_icon =  rootpath + "clientscript/images/tools/hand2.png";
}






var current_hashtag = read_Setting("hashtags", "null", "all");   





$(document).ready(function() {




$(document).on("click", ".window ,.window-controls", function(event) {

		event.preventDefault();

$("#text_con").attr("contenteditable","false");

return false;
	});
	


	$(document).on("click", ".minimize", function(event) {
event.preventDefault();

		$('html').addClass('minimized');




if(style_type == "jq"){
 
 $('#quots_con').css('bottom','50px');


}
else{
  $('#quots_con').css('bottom','54px');
}


if(typeof window.webkit != 'undefined') {
if(read_Setting('mode_type', "native", 'all')== "native"){
		       
		$('#quots_con').css('bottom','0px');

}
	
}




$('#quots_con').css('z-index','');
$('#text_con').css('display','none');

$('.window').css('position','absolute');

		if(_isMobile() != mobiletrue) {
		
			if($("#hand img").attr("src") == hand2_icon) {



				$("img,a,html").bind('dragstart selectstart', function(e) {
					e.preventDefault();
					return false;
				});




			}


		}

          


	});
	
	
	

	$(document).on("click", ".maximize", function(event) {
               event.preventDefault();
	 $('#quots_con').css('bottom','0px');
	 $('#quots_con').css('z-index','101');
		$('html').removeClass('minimized');
		
	$('.window').css('position','fixed');
	
	setTimeout(function () {


$('#text_con').css('display','');


	}, 1000);


		if(_isMobile() != mobiletrue) {
			if($("#hand img").attr("src") == hand2_icon) {

				$("img,a,html").unbind("dragstart selectstart");

			}
		}

return false;

	});

	$(document).on("click", ".close2", function(event) {

		event.preventDefault();
		event.stopPropagation();
               
               $('#quots_con').css('z-index','');
		$('#quots_con').css('bottom','0px');  
		$('#text_con').css('display','');           

		
		$('.window').remove();
		$('html').removeClass('minimized');
		setTimeout(function() {



			is_window_visible = false;
			whol_text_selected = false;
                       if (window.frames["iframe_name"]) {
             
                      
                       $.postMessage('{"eventname":"is_window_visible_respond", "visible":"no"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
			}


			if(_isMobile() != mobiletrue) {
				if($("#hand img").attr("src") == hand2_icon) {



					$("img,a,html").bind('dragstart selectstart', function(e) {
						e.preventDefault();
						return false;
					});




				}


			}




		}, 100);




	});

 $(document).on("click", "#copy_code", function(event) {


           if(document.getElementById('text_con')){
                select_all_and_copy(document.getElementById('text_con'));
           }
           
           
               if(document.getElementById('hash_con')){
                select_all_and_copy(document.getElementById('hash_con'));
           }           
                          

                        });

$(document).on("click", "#post_code", function(event) {
if($(".post_code").css('display') == 'block'){


$(".post_code").css('display', 'none');

save_Setting("post_code_showen", "false", "all");

$(this).css('background', '').css('border', border_butt_hide.replace(";",""));

}
else{

$(".post_code").css('display', 'block');

save_Setting("post_code_showen", "true", "all");

$(this).css('background', antiquewhite.replace(";","")).css('border', border_butt.replace(";",""));




}

});





$(document).on("click", "#thread_code", function(event) {
if($(".thread_link").css('display') == 'block'){


$(".thread_link").css('display', 'none');

save_Setting("thread_link_showen", "false", "all");

$(this).css('background', '').css('border', border_butt_hide.replace(";",""));

}
else{

$(".thread_link").css('display', 'block');

save_Setting("thread_link_showen", "true", "all");

$(this).css('background', antiquewhite.replace(";","")).css('border', border_butt.replace(";",""));
}

show_hide_star_note();

});



$(document).on("click", "#link_code", function(event) {




if($(".src_link").css('display') == 'block'){


$(".src_link").css('display', 'none');

save_Setting("link_code_showen", "false", "all");

$(this).css('background', '').css('border', border_butt_hide.replace(";",""));

}
else{

$(".src_link").css('display', 'block');

save_Setting("link_code_showen", "true", "all");

$(this).css('background', antiquewhite.replace(";","")).css('border', border_butt.replace(";",""));

}


show_hide_star_note();


});


$(document).on("click", "#random_code", function(event) {
if($(".random_number").css('display') == 'block'){


$(".random_number").css('display', 'none');

save_Setting("random_number_showen", "false", "all");

$(this).css('background', '').css('border', border_butt_hide.replace(";",""));

}
else{

$(".random_number").css('display', 'block');

save_Setting("random_number_showen", "true", "all");

$(this).css('background', antiquewhite.replace(";","")).css('border', border_butt.replace(";",""));

}

});



$(document).on("click", "#date_code", function(event) {
if($(".date_time").css('display') == 'block'){


$(".date_time").css('display', 'none');

save_Setting("date_time_showen", "false", "all");

$(this).css('background', '').css('border', border_butt_hide.replace(";",""));

}
else{

$(".date_time").css('display', 'block');

save_Setting("date_time_showen", "true", "all");

$(this).css('background', antiquewhite.replace(";","")).css('border', border_butt.replace(";",""));

}

});


$(document).on("click", "#tit_code", function(event) {
if($(".posttitle").css('display') == 'block'){


$(".posttitle").css('display', 'none');





                 if (window.frames["iframe_name"]) {
   $.postMessage('{"eventname":"save_Setting", "action":"post_title_showen","state":"false"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
 }
 else{
       save_Setting("post_title_showen", "false", "all");
 }



$(this).css('background', '').css('border', border_butt_hide.replace(";",""));
}
else{

$(".posttitle").css('display', 'block');




                if (window.frames["iframe_name"]) {
   $.postMessage('{"eventname":"save_Setting", "action":"post_title_showen","state":"true"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
 }
 else{
       save_Setting("post_title_showen", "true", "all");
 }

$(this).css('background', antiquewhite.replace(";","")).css('border', border_butt.replace(";",""));

}

});





$(document).on("click", "#add_defulat_hash", function(event) {

 $('#hash_con').html(tags);
$('.hash_tag').html(tags);



             if (window.frames["iframe_name"]) {
   $.postMessage('{"eventname":"save_Setting", "action":"hashtags","state":"'+utf8_to_b64(tags)+'"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
			
			
   $.postMessage('{"eventname":"modify_element", "element":".hash_tag", "value":"'+utf8_to_b64(tags)+'"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);

 }
 else{
      save_Setting("hashtags", tags, "all");
 }













});




$(document).on("click", "#remove_hash", function(event) {

 $('#hash_con').html("");



$('.hash_tag').html("");

if (window.frames["iframe_name"]) {
   $.postMessage('{"eventname":"save_Setting", "action":"hashtags","state":"'+utf8_to_b64("")+'"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
			
			

   $.postMessage('{"eventname":"modify_element", "element":".hash_tag", "value":""}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
}
else{
      save_Setting("hashtags", "null", "all");
}

});

$(document).on('click', '#save_hash', function() {

        save_hash();
       
          if (read_Setting("hashtags", "null", "all")!= "null") {
                      $(".hash_tag").html('ـــــــــــــــــــــــــــ<br>'+read_Setting("hashtags", "", "all"));
                     
                      
                      
                       if (window.frames["iframe_name"]) {
   $.postMessage('{"eventname":"modify_element", "element":".hash_tag", "value":"'+utf8_to_b64('ـــــــــــــــــــــــــــ<br>'+read_Setting("hashtags", "", "all"))+'"}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
 }
                      
                      
                      

          } 
          else{
          
                      $(".hash_tag").html('');

                      
                      
                      
                      
                        if (window.frames["iframe_name"]) {
   $.postMessage('{"eventname":"modify_element", "element":".hash_tag", "value":""}', // The message to send (string)
				"*", // The host of the target window (i.e. http://www.vistaprint.com)
				window.frames["iframe_name"] // A reference to the target window
			);
 }
          
          } 

});




$(document).on("click", "#hashtag_code", function(event) {
if($(".hashtags").css('display') == 'block'){


$(".hashtags").css('display', 'none');

save_Setting("hashtags_showen", "false", "all");

$(this).css('background', '').css('border', border_butt_hide.replace(";",""));

}
else{

$(".hashtags").css('display', 'block');

save_Setting("hashtags_showen", "true", "all");

$(this).css('background', antiquewhite.replace(";","")).css('border', border_butt.replace(";",""));

}

});


$(document).on("click", "#tranz_code", function(event) {
if($(".tranz_code").css('display') == 'block'){


$(".tranz_code").css('display', 'none');

save_Setting("tranz_code_showen", "false", "all");

$(this).css('background', '').css('border', border_butt_hide.replace(";",""));

}
else{

$(".tranz_code").css('display', 'block');

save_Setting("tranz_code_showen", "true", "all");

$(this).css('background', antiquewhite.replace(";","")).css('border', border_butt.replace(";",""));

}

show_hide_star_note();


});



$(document).on('keydown', 'div[contenteditable="true"]', function(event) {

 // trap the return key being pressed
    if (event.keyCode === 13) {
        // insert 2 br tags (if only one br tag is inserted the cursor won't go to the next line)
        document.execCommand('insertLineBreak');
        // prevent the default behaviour of return key pressed
        return false;
    }
  
  
  

});


$(document).on("click", function (e) {
		 $("#text_con").attr("contenteditable","false");
  });
$(document).on("click", "#text_con", function(event) {
event.stopPropagation();
        $(this).attr("contenteditable","true");
    });


$(document).on('focus', '#hash_con ', function() {
    var $this = $(this);
    $this.data('before', $this.html());
}).on('blur keyup input', '[contenteditable]', function() {
    var $this = $(this);
    if ($this.data('before') !== $this.html()) {
        $this.data('before', $this.html());
       setTimeout(function(){ 
        if ($('#hash_con').text().replace(" ", "").length==0) {

            $('#hash_con').html("");
            
            //$('#hash_con').blur();
        } 
        
        }, 0); 
    }
});







$(document).on('copy', '#hash_con, #text_con ,.posttext' ,function(e) {
e.preventDefault();
var selectedText =getSelectionTextAndContainerElement().html;
//var  text_only =getSelectionTextAndContainerElement().text;
var clipboardDatad = '';


  var el = $('<div></div>');
   el.html(selectedText);


  $(el).find('div[style="display:none;"],.random_hidden,.move.mup,.postnumber,.page_nav,.posttop,#navbar,.thread_title,.disableselect,#up_page').remove();
  
  // alert($(el).html().replace(/(&nbsp;)*/g,""));
  //setTimeout(function() {

     var html_txt = $(el).html().replace(/(&nbsp;)*/g,"").replace(/^\s+|\s+$/g, '');

    if (e.clipboardData || e.originalEvent.clipboardData) {
    
      clipboardDatad = (e.originalEvent || e).clipboardData.setData('text/html',html_txt);
    } else if (window.clipboardData) {
      clipboardDatad = window.clipboardData.setData('Text', html_txt);
    }

		//}, 100);
  var regex = /<br\s*[\/]?>/gi;
  var regex2 = /\n/gi;
  var text_only =   $(el).html().replace(regex2, "").replace(regex, "\n")
  
  

var el_txt = $('<div></div>');
   
el_txt.html(text_only);
  
  
//text_only =strip_tags($(el_txt).html().replace(/<(?:\/a)>/g, "\n"));

text_only =getSelectionTextAndContainerElement().text;

text_only = text_only.split('\n');

for (var i = 0; i < text_only.length; i++) {
    if(!isNullOrWhitespace(text_only[i])){
     text_only[i] = text_only[i].trim();
    }
    
    
 }
 
 text_only = text_only.join('\n');
 

 var clipdata = (e.originalEvent || e).clipboardData || window.clipboardData;  
 clipdata.setData('text/plain', text_only);

         
              
              
              
              
              
});
  
  //*************works betweenn deffrent browsers ************* 
 /*document.addEventListener('copy', function(e) {
 
 
 
  e.preventDefault();
  
  
});
  */
   
  function removeSpaces(string) {
        // Remove line breaks
        var str = string.replace(/\n/g,"");     
        return str.split(' ').join('');   
}  
    
      
$(document).on('paste', '#text_con ,#hash_con' ,function(e) {


    e.preventDefault();
   var text = (e.originalEvent || e).clipboardData.getData('text/plain');
    window.document.execCommand('insertText', false, text);
   /* e.preventDefault();
    var text = '';
    if (e.clipboardData || e.originalEvent.clipboardData) {
      text = (e.originalEvent || e).clipboardData.getData('text/html');
    } else if (window.clipboardData) {
      text = window.clipboardData.getData('Text');
    }
    
     
  
    var el = $('<div></div>');
     el.html(text);
     
      console.log($(el)[0].innerText);
     
    
    if (document.queryCommandSupported('insertText')) {
      document.execCommand('insertText', false, $(el).html());
    } else {
      document.execCommand('paste', false, $(el).html());
    } */
    

});







/*
$(document).on('paste', '#text_con ,#hash_con , #searchBox,#favBox', function (e) {
       e.preventDefault();
    var text = '';
    if (e.clipboardData || e.originalEvent.clipboardData) {
      text = (e.originalEvent || e).clipboardData.getData('text/plain');
    } else if (window.clipboardData) {
      text = window.clipboardData.getData('Text');
    }
    
    alert(text);
    if (document.queryCommandSupported('insertText')) {
      document.execCommand('insertText', false, text);
    } else {
      document.execCommand('paste', false, text);
    }
});*/







});




function run_select_text(){


 var selectionEndTimeout = null;

    document.onselectionchange = userSelectionChanged;

    function userSelectionChanged() {
    
        if (selectionEndTimeout) {
            clearTimeout(selectionEndTimeout);
          
        }
        selectionEndTimeout = setTimeout(function(e) {
            
           if(is_window_visible == false) {
           if($('.posttext').length!=0){
           
            $(document.body).trigger('selectionEnd');
            
            }
            
            }
          
        }, 150);
    }




$(document.body).bind('selectionEnd', function(e) {

 sel_dom = getSelectionTextAndContainerElement();
 html_sel =  sel_dom.html;
 
 text_sel_clean = $('<div></div>'); 
 text_sel_clean.html(html_sel);
 text_sel_clean.find('.post_title,.move,.language,.move_pic,.star_post,.star_post2,.new_quts,.showpost,.hash_tag,.randomnumber,.postnumber').remove();

text_sel = $(text_sel_clean).each(function(index, elem) {
  
                     getDef(elem,"+");
                     getDef(elem,"-");

       
                }).html(); 
 text_sel = stripScripts(text_sel);




text_sel =  strip_tags(text_sel, "<br> <p> <div>");
text_sel = text_sel.replace(/(&nbsp;)*/g,"").replace(/\s+/g, ' ').replace(/^\s+|\s+$/g, '').replace(/(?:\r\n|\r|\n)/g, ' ').replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');


				if(!isEmptyOrSpaces(text_sel)) {
					if($("#share").length == 0) {


      

                 /* if(window.location != window.parent.location) {
		
	
var share_view = "<div id='share'><a class='socialIcons' onclick='go_select();return false;'><img style = '' width ='30px' id ='quote' src='clientscript/images/tools/quote_N.png'/></a></div>";
		
$.postMessage(
			'{"eventname":"share_view", "html":"' +  utf8_to_b64(share_view) + '"}', // The message to send (string)
			"*", // The host of the target window (i.e. http://www.vistaprint.com)
			parent // A reference to the target window
		);
					 
				  }
				  else{
  
				  }*/

					$("html").append("<div id='share'><a class='socialIcons' onclick='go_select();return false;'><img style = '' width ='30px' id ='quote' src="+quots_icon+"/></a></div>");




					}
				} else {
					if($("#share").length >= 0) {
						$("#share").remove();
						whol_text_selected = false;
					
						
					}
				}






});








}



function go_select() {


$("#share").remove();


if(is_window_visible == false) {

containerElement = sel_dom.containerElement;
  var post_code ="";
  var post_code_showen="";
  var post_code_style ="";
  var link_style ="";
  var thread_style ="";
  var random_style = "";
  var date_style ="";
  var tit_style ="";
  var tranz_style="";
  var hashtag_style ="";
  var all_text ="";
  var thread_link="";
  var post_title="";
  var post_content="";
  var post_link="";
  var post_lang="";
  var hash_tags ="";
  var random_number="";

                 
   var all_html = $(containerElement).parent().find(".posttext");
if(read_Setting('NDmode', "day", 'all')== "night"){   

   thread_style = "background:"+antiquewhite+" display:none;"
tit_style = "background:"+antiquewhite+" display:none;"
date_style ="background:"+antiquewhite+" display:none;";
post_code_style ="background:"+antiquewhite+" display:none;";  
tranz_style =  "background:"+antiquewhite+" display:none;"; 
hashtag_style=  "background:"+antiquewhite+" display:none;"; 
random_style=  "background:"+antiquewhite+" display:none;"; 

link_style =  "background:"+antiquewhite+" display:none;";
} 
else{

   thread_style = "background:"+antiquewhite+"; display:none;"
tit_style = "background:"+antiquewhite+" display:none;"
date_style ="background:"+antiquewhite+"; display:none;";
post_code_style ="background:"+antiquewhite+" display:none;";  
tranz_style =  "background:"+antiquewhite+" display:none;"; 
hashtag_style=  "background:"+antiquewhite+"display:none;"; 
random_style=  "background:"+antiquewhite+" display:none;"; 

link_style =  "background:"+antiquewhite+" display:none;";






}






    



if(whol_text_selected){

if($('#wrapper').find('.thread_src').length!=0){


   thread_link  =  $('#wrapper').find(".move")[0].outerHTML;
    
}else{

thread_link ="";
}
          thread_link = strip_tags(thread_link,"<br> <p> <div>").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');

  
                    
                    
                     if(!isEmptyOrSpaces(thread_link)){ 
                    if(read_Setting("thread_link_showen", "false", "all") == "true"){
                               thread_link = "<div class ='thread_link'>"+thread_link+"<br><br></div>";
                                thread_style =  'background:'+antiquewhite+" border:"+ border_butt;
                    }
                    else{
                
                          thread_link = "<div style = 'display:none;' class ='thread_link'>"+thread_link+"<br><br></div>";
                      thread_style =  '';
                    
                    }
                    
                    }
                    


  all_html.each(function(index) {
             
               
               
            if($(this).find(".content")[0]){
                post_content = strip_tags(($(this).find(".content")[0].outerHTML) ,"").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
               
                
                if(!isEmptyOrSpaces(post_content)){ 
                post_content  =  $(this).find(".content")[0].outerHTML;
                
               
                
                post_content = $(post_content).each(function(index, elem) {
  
                     getDef(elem,"+");
                     getDef(elem,"-");

       
                }).html(); 
                
                
               post_content= strip_tags(post_content, "<br> <p> <div>").replace(/(&nbsp;)*/g,"").replace(/\s+/g, ' ').replace(/^\s+|\s+$/g, '').replace(/(?:\r\n|\r|\n)/g, ' ').replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
             }
            
         }
         else{
         
          post_content = $(this).parent().find(".posttext").html();
          
          
               var post_content_remove_elements = $('<div></div>'); 
      
              post_content_remove_elements.html(post_content);
          
          
         
          post_content_remove_elements.find(".hash_tag").eq(0).remove();
          post_content_remove_elements.find(".randomnumber").eq(0).remove();
          post_content_remove_elements.find(".move").eq(0).remove();
          post_content_remove_elements.find(".postnumber").eq(0).remove();
          
          post_content = $(post_content_remove_elements).each(function(index, elem) {
  
                     getDef(elem,"+");
                     getDef(elem,"-");

       
                }).html(); 
           post_content= strip_tags(post_content, "<br> <p> <div>").replace(/(&nbsp;)*/g,"").replace(/\s+/g, ' ').replace(/^\s+|\s+$/g, '').replace(/(?:\r\n|\r|\n)/g, ' ').replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
         }
          
          
          

           
           
           
           

           
           
           
                   hash_tags = strip_tags($(this).find(".hash_tag")[0].outerHTML,"<br>").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
            if(!isEmptyOrSpaces(hash_tags)){ 
   
                   hash_tags  =  $(this).find(".hash_tag")[0].outerHTML;
            }
           
 
	               if($(this).find(".post_title")[0]){
                    post_title = strip_tags($(this).find(".post_title")[0].outerHTML,"<br> <p> <div>").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
                    if(!isEmptyOrSpaces(post_title)){ 
                    if(read_Setting("post_title_showen", "true", "all") == "true"){
                                post_title = "<div class ='posttitle'>"+post_title+"</div>";
                                tit_style =  'background:'+antiquewhite+" border:"+ border_butt;
                    }
                    else{
                
                      post_title = "<div style = 'display:none;' class ='posttitle'>"+post_title+"</div>";
                      tit_style =  '';
                    
                    }
                    
                    }
                    }
                    
                    
                    
                    
                       if($(this).find(".move")[0]){
                     post_link = strip_tags($(this).find(".move")[0].outerHTML,"<br>").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
                     if(!isEmptyOrSpaces(post_link)){ 
                    if(read_Setting("link_code_showen", "true", "all") == "true"){
                                post_link = "<div class ='src_link'>"+post_link+"<br></div>";
                                link_style =  'background:'+antiquewhite+" border:"+ border_butt;
                    }
                    else{
                
                      post_link = "<div style = 'display:none;' class ='src_link'>"+post_link+"<br></div>";
                      link_style =  '';
                    
                    }
                    }
                    }
                    
                  if($(this).find(".language")[0]){
                     post_lang = strip_tags($(this).find(".language")[0].outerHTML,"<br>").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
                     if(!isEmptyOrSpaces(post_lang)){  
                     if(read_Setting("tranz_code_showen", "false", "all") == "true"){
                              
                              
                                  post_lang = "<div class ='tranz_code' style='text-align:center;'>"+post_lang+"<br><br></div>";
                                  tranz_style =  'background:'+antiquewhite+" border:"+ border_butt;
                                 
                                  
                                
                    }
                    else{
                
                      post_lang = "<div style = 'display:none; text-align:center;' class ='tranz_code'>"+post_lang+"<br><br></div>";
                      tranz_style =  '';
                    
                    }
                    }
                    
                    }
         
         
         
        
                   hash_tags = strip_tags(hash_tags,"<br>").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
         
                   if(!isEmptyOrSpaces(hash_tags)){  
                    if(read_Setting("hashtags_showen", "true", "all") == "true"){
                            
                             
                           
                               hash_tags = "<div class ='hashtags'>"+hash_tags+"<br><br></div>";
                               hashtag_style = 'background:'+antiquewhite+" border:"+ border_butt;
                             
                             
                         
                    }
                    else{
                
                      hash_tags = "<div style = 'display:none;' class ='hashtags'>"+hash_tags+"<br><br></div>";
                      hashtag_style =  '';
                    
                    }
                    }
                  
                   
                   random_number = $(this).find(".randomnumber")[0].outerHTML;
                   random_number = $(random_number).removeClass('random_hidden')[0].outerHTML;
                   random_number = strip_tags(random_number,"<br>").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
                     if(!isEmptyOrSpaces(random_number)){ 
                    if(read_Setting("random_number_showen", "false", "all") == "true"){
                   
                    
                                random_number = "<div class ='random_number'>"+random_number+"</div>";
                                random_style = 'background:'+antiquewhite+" border:"+ border_butt;
                    }
                    else{
                
                      random_number = "<div style = 'display:none;' class ='random_number'>"+random_number+"</div>";
                      random_style =  '';
                    
                    }
                    }
         
         
         

 
	
	if(index == all_html.length-1){
	
	all_text+= post_title+post_content+"<br><br>"+post_link+post_lang+hash_tags+random_number+"<div style = 'text-align:center;'></div>";
	
	}
	else{
	
	all_text+= post_title+post_content+"<br><br>"+post_link+post_lang+hash_tags+random_number+"<div style = 'text-align:center;'><br>===========================<br><br></div>";
	}
	
	

	
   
   });



all_text = "<div style = 'text-align:center;'>"+notes_code+thread_link+all_text+"</div>";
 

}
else{


if($('#wrapper').find('.thread_src').length!=0){


   thread_link  =  $('#wrapper').find('.thread_src').parent().attr('id');
    
}else{

   thread_link ="";
}

     var  source = $(containerElement).closest('.showpost,.posttext').html();
      var selected_html = html_sel;
      
     // var selected_html_clean = $('<div></div>'); 
     var  source_clean_html = $('<div></div>'); 
      
      source_clean_html.html(source);
    //  selected_html_clean.html(selected_html); 
      

  
  
  var showpost = $(containerElement).closest('.showpost');
  post_title = showpost.prev().find('a').eq(1).text();
  postnumber = showpost.prev().find('a').eq(0).text();
  
    if($(containerElement).closest('.post').find('.hash_tag').length!=0){
      hash_tags = strip_tags($(containerElement).closest('.post').find('.hash_tag').html() ,"<br>").replace(/ـــــــــــــــــــــــــــ/g,"").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
    }
   
  
 if($(containerElement).closest('.post').find('.randomnumber').length!=0){
  random_number = strip_tags($(containerElement).closest('.post').find('.randomnumber').html() ,"<br>").replace(/ـــــــــــــــــــــــــــ/g,"").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '');
   }
  

  if(post_title){
  
  }
  else{
  
  post_title = $(containerElement).closest('.post').find('.post_title').text();


  
  if($(containerElement).closest('.post').find(".language").length!=0){
    post_lang = $(containerElement).closest('.post').find(".language")[0].outerHTML;
   
  post_lang = strip_tags(post_lang ,"<br>")
  post_lang = post_lang.replace(/ـــــــــــــــــــــــــــ/g,"").replace(/^(\s*<br( \/)?>)*|(<br( \/)?>\s*)*$/g, '')
  }
 

  
 
  postnumber = source_clean_html.find('.postnumber').text();
  }


    
     
     
      source_clean_html.find('.post_title,.move,.language,.move_pic,.star_post,.star_post2,a,.new_quts,.showpost,.hash_tag,.randomnumber,.postnumber').remove();
      //selected_html_clean.find('.post_title,.move,.language,.move_pic,.star_post,.star_post2,a,.new_quts,.showpost,.hash_tag,.randomnumber,.postnumber').remove();
       
      source_clean_html = strip_tags(source_clean_html.html());
      //selected_html_clean = strip_tags(selected_html_clean.html());
  
  
 
  
      var source_html = source_clean_html.replace(/\&nbsp;/g, '').replace(/(?:\r\n|\r|\n)/g, ' ').replace(/^\s+|\s+$/g, '').replace(/^(\ ?<br( \/)?>\ ?)+|(\ ?<br( \/)?>\ ?)+$/, '').replace(/\[(.*?)لمتابعة رابط المش(.*?)ارك(.*?)ة الأصل(.*?)ة للبي(.*?)ان(.*?)\]/, "");
/*        
clean_html =clean_html.match(/([\s\S]*?)(_____|ــــــــــــ)/);
        if (clean_html) {

            clean_html =clean_html[1];
            }*/

 var regex_hjri = /([\d ]{1,4})(–|-)([\W\d ]{0,20})(–|-)([\d ]{0,8}) هـ/;
 var regex_meladi = /(([\d ]{0,4})(–|-)([\d ]{0,4})(–|-)([\d ]{0,8}) (مـ|م))/;
 var regex_time = /(([\d ]{0,4}):([\d ]{0,4})(\s|)(((.{0,10})(\( .{0,30} \)))|([ ][^ ]{0,20})))/;
 
 
  var found_hjri = source_html.match(regex_hjri);
  var found_meladi = source_html.match(regex_meladi);
  var found_time = source_html.match(regex_time);

  if(!found_hjri){
  found_hjri="";
  }
  else{
  found_hjri=found_hjri[0];
  }
  
  
  if(!found_meladi){
  found_meladi="";
  }
  else{
  found_meladi=found_meladi[0];
  }


  if (found_time) {

             if (found_time[6]) {
            
                found_time = found_time[2] + ":" + found_time[3] + "" + found_time[7] + "<br>" + found_time[8];
            } else {

                if (/\d/.test(found_time)) {

                    found_time = found_time[0];


                } else {

                    found_time = "";

                }




            }

        } else {

            found_time = "";
        }






  






                 
               





var data_and_time = found_hjri+"<br>"+found_meladi+"<br>"+found_time;

var check_data_and_time = strip_tags(data_and_time).replace(/<br\s?\/?>/, '').replace(/\s+/g,' ').replace(/^\s+|\s+$/g, '');
var check_text_sel = strip_tags(text_sel).replace(/<br\s?\/?>/, '').replace(/\s+/g,' ').replace(/^\s+|\s+$/g, '');



if (check_text_sel.indexOf(check_data_and_time) !== -1) {
data_and_time  = "<div id = 'date_time' class ='date_time' style = 'display:none;'>"+Release_date_of_the_statement+"<br>الإمام المهديّ ناصر محمد اليماني<br>"+found_hjri+"<br>"+found_meladi+"<br>"+found_time+"<br><br></div>";

}
else{

if(data_and_time){



 
 
 if(read_Setting("date_time_showen", "true", "all")=="true"){
  data_and_time  = "<div id = 'date_time'  class ='date_time'>"+Release_date_of_the_statement+"<br>"+Imam_Mahdi_Nasser_Mohammad_Al_Yemeni+"<br>"+found_hjri+"<br>"+found_meladi+"<br>"+found_time+"<br><br></div>";
  date_style= 'background:'+antiquewhite+" border:"+ border_butt;
  
 }
 else{
   data_and_time  = "<div id = 'date_time'  style = 'display:none;' class ='date_time'>"+Release_date_of_the_statement+"<br>"+Imam_Mahdi_Nasser_Mohammad_Al_Yemeni+"<br>"+found_hjri+"<br>"+found_meladi+"<br>"+found_time+"<br><br></div>";
   date_style= '';

 }
 
 
}
else{

 data_and_time  = "<div id = 'date_time'  class ='date_time' style = 'display:none;'>"+Release_date_of_the_statement+"<br>"+Imam_Mahdi_Nasser_Mohammad_Al_Yemeni+"<br>"+found_hjri+"<br>"+found_meladi+"<br>"+found_time+"<br><br></div>";
}

}


if (postnumber) {

post_code_showen =  read_Setting("post_code_showen", "false", "all");


if(post_code_showen == "true"){
  post_code = "<div class = 'post_code'>"+the_statement+"<br>[SHOWPOST]"+postnumber+"[/SHOWPOST]</div>";
  post_code_style= 'background:'+antiquewhite+" border:"+ border_butt;


}
else{""
 post_code = "<div class = 'post_code' style ='display:none;'>"+the_statement+"<br>[SHOWPOST]"+postnumber+"[/SHOWPOST]</div>";
 post_code_style= '';

}


src_link = The_source_of_the_statement+"<br>"+domian +"/showthread.php?p="+ postnumber;





if(read_Setting("link_code_showen", "true", "all")=="true"){

src_link = "<div class ='src_link'>"+src_link+"<br><br></div>";
link_style = 'background:'+antiquewhite+" border:"+ border_butt;
}
else{
src_link = "<div style ='display:none;' class ='src_link'>"+src_link+"<br><br></div>";
link_style = '';
}


}
else{

src_link = "";
}



                  


                    
                    
                    if(!isEmptyOrSpaces(thread_link)){ 
                   if(read_Setting("thread_link_showen", "false", "all")=="true"){
                  
                   
             


thread_link ="<div style = '' class ='thread_link'>"+ Topic_source_link+"<br>"+domian +"/showthread.php?t="+ thread_link+"<br><br></div>";


                                
                                
                                
                                
                                thread_style =  'background:'+antiquewhite+" border:"+ border_butt;
                        

                    }
                    else{
                     
                     


thread_link ="<div style = 'display:none;' class ='thread_link'>"+ Topic_source_link+"<br>"+domian +"/showthread.php?t="+ thread_link+"<br><br></div>";


                     
                     
                     
                     
                      thread_style =  '';
                    }
                    }
                    else{
                      thread_link ='';
                    }
                    


                   if(!isEmptyOrSpaces(post_title)){ 
                   if(read_Setting("post_title_showen", "true", "all")=="true"){
                  
                   
                      
                    
                                post_title = "<div style = '' class ='posttitle'>"+Statement_title+"<br>"+post_title+"<br><br></div>";
                                tit_style =  'background:'+antiquewhite+" border:"+ border_butt;
                        

                    }
                    else{
                      post_title = "<div style = 'display:none;' class ='posttitle'>"+Statement_title+"<br>"+post_title+"<br><br></div>";
                      tit_style =  '';
                    }
                    }
                    else{
                      post_title ='';
                    }
                    
                     var post_lang_con = $('<div></div>');
                     post_lang_con.html(post_lang);
                    

                    
                      if(!isEmptyOrSpaces($(post_lang_con).text())){  
                    
                    if(read_Setting("tranz_code_showen", "false", "all") == "true"){
                              
                              
                                  post_lang = "<div class ='tranz_code' style=''>"+Translation_links+"<br>"+post_lang+"<br><br></div>";
                                  tranz_style =  'background:'+antiquewhite+" border:"+ border_butt;
                     }
                    else{
      
                
                       
                           post_lang = "<div style = 'display:none;' class ='tranz_code'>"+Translation_links+"<br>"+post_lang+"<br><br></div>";
                           tranz_style =  '';
                      
                    }
                    }
                    else{
                    post_lang ="";
                    }
                    
                    
                    
                    
                    
                     if(!isEmptyOrSpaces(hash_tags)){ 
                     if(read_Setting("hashtags_showen", "true", "all")=="true"){
                  
                   
                      
                    
                                hash_tags = "<div style = '' class ='hashtags'>"+hashtags_var+"<br>"+hash_tags+"<br><br></div>";
                                hashtag_style =  'background:'+antiquewhite+" border:"+ border_butt;

                    }
                    else{
                      hash_tags = "<div style = 'display:none;' class ='hashtags'>"+hashtags_var+"<br>"+hash_tags+"<br><br></div>";
                      hashtag_style =  '';
                    }
                    }
                    else{
                    hash_tags ='';
                    }
                    
                    
                    
                     if(!isEmptyOrSpaces(random_number)){ 
                    if(read_Setting("random_number_showen", "false", "all")=="true"){
                  
                      
                      
                    
                                random_number = "<div style = '' class ='random_number'>"+random_number+"<br><br></div>";
                                random_style = 'background:'+antiquewhite+" border:"+ border_butt;
                        

                    }
                    else{
                      random_number = "<div style = 'display:none;' class ='random_number'>"+random_number+"<br><br></div>";
                      random_style =  '';
                    }
                    }
                    else{
                    random_number ='';
                    }






//var pattern = XRegExp("(" + createAccentRegexp("صباحا").split(' ').join('(<[^>]+>|[\\n\\r\\s\\p{P}\\p{S}\\p{Mn}\\u0640\u200F㇣])*') + ")", "gi");
//data_and_time = data_and_time.replace(pattern,A_m_time);





all_text ="<div style = 'text-align:center;'><div>"+Quotation_from_Imam_Nasir_Muhammad_Al_Yamani+"<br><br>"+text_sel+"<br><br></div>"+post_title+data_and_time+notes_code+thread_link+src_link+post_lang+hash_tags+random_number+post_code+"</div>";




}




  var root_url;
   if(window.location != window.parent.location) {
      root_url ="";
   }
   else{
      root_url = rootpath;
   }






	var quots_view = '<div class="window" style="font-family: sans-serif;font-size:19px">' +
		'<nav class="window-controls">' +
		'<div class="maximize"><div class="close2"></div><img class="max" id ="image" width="30px" src='+quots_icon+'/></div>' +
		'<div class="close2"></div>' +
		'<div class="minimize"></div>' +
	        '<div class="quots_commands">'+
	      '<div class="quts_menu">'+
                '<button>'+Options_butt+'</button>'+
                '<div class="quts-content">'+Insert_or_remove+'<hr>'+
               
                '<button style="'+tit_style+'" id="tit_code" title =  "'+Inserting_or_removing_the_title_of_the_statement+'" class="the_quots">'+the_title_of_the_statement+'<br></button>'+
                '<button style="'+date_style+'" id="date_code" title =  "'+Insert_or_remove_the_date_of_the_statement+'" class="the_quots"> '+Date_of_the_statement+'  <br></button>'+
	         '<button style="'+thread_style+'" id="thread_code" title =  "'+Insert_or_remove_topic_link+'" class="the_quots"> '+topic_link+'<br></button>'+
	        '<button style="'+link_style+'" id="link_code" title =  "'+Insert_or_remove_the_source_of_the_statement_link+'" class="the_quots">  '+Statement_source_link+' <br></button>'+
	        '<button style="'+tranz_style+'" id="tranz_code" title =  "'+Insert_or_remove_links_to_translations+'" class="the_quots"> '+Links_to_translations_for_the_statement+'  <br></button>'+
	        '<button style="'+hashtag_style+'" id="hashtag_code" title = "'+Insert_or_remove_hashtags+'" class="the_quots">'+hashtags_butt+'</button>'+
	        '<button style="'+random_style+'" id="random_code" title =  "'+Insert_or_remove_random_signature+'" class="the_quots">'+random_signature_butt+' <br></button>'+


	        '<button style="'+post_code_style+'" id="post_code" title =  "'+Insert_or_remove_the_post_number_code+'" class="the_quots">'+quot_code_for_post_number+'</button>  '+
                '</div>'+
                '</div>'+
	        
	        '<button id="copy_code" title =  "'+quote_copy_tit+'" class="the_quots">'+copy_statment+'</button>'+
	     
	       
	        '</div>' +
		'</nav>' +
		' <aside class="window-sidebar"><hr>' +
		' <div id= "text_con">' +
		  all_text +
		'</div>' +
		'</aside>' +
		'</div>';





is_window_visible = true;

  if(window.location == window.parent.location) {
   $(quots_view).appendTo("body");
   
   
   show_hide_star_note();
   
   if(_isMobile() != mobiletrue) {
		if($("#hand img").attr("src") == hand2_icon) {

			$("img,a,html").unbind("dragstart selectstart");

                }
   
   }
   
  }
  else{
  
  

       
        $.postMessage(
			'{"eventname":"quots_view", "html":"' + utf8_to_b64(quots_view) + '"}', // The message to send (string)
			"*", // The host of the target window (i.e. http://www.vistaprint.com)
			parent // A reference to the target window
		);
		
	
  
  
  
  }







}

}






function show_hashtag(e){

whol_text_selected = false;
$("#share").remove();

if(is_window_visible == false) {
if($(".window").length == 0) {



is_window_visible = true;
   var root_url;
   if(window.location != window.parent.location) {
      root_url ="";
   }
   else{
      root_url = rootpath;
   }
  

 var hashtag_view =  '<div class="window hash_window"  style="font-family: sans-serif;font-size:19px">' +
		'<nav class="window-controls">' +
		'<div class="maximize"><div class="close2"></div><img class="max" id ="image" width="30px" src='+hash_icon+'/></div>' +
		'<div class="close2"></div>' +
		'<div class="minimize"></div>' +
	        '<div class="quots_commands">'+
	        '<div class="quts_menu">'+
                '<button>'+Options_butt+'</button>'+
                '<div class="quts-content">'+
                '<button  id="add_defulat_hash" title =  "'+Include_the_default_hashtag+'" class="the_quots">'+Include_the_default_hashtag+'<br></button>'+
	        '<button  id="remove_hash" title =  "'+delete_all_hashtags+'" class="the_quots">'+delete_all_hashtags+'<br></button>'+
	      
                '</div>'+
                '</div>'+
	        
	        '<button id="copy_code" title =  "'+copy_statment+'" class="the_quots">'+copy_statment+'</button>'+
	     
	        '<button id="save_hash" title =  "'+save_butt+'" class="the_quots">'+save_butt+'</button>'+
	        '</div>' +
		'</nav>' +
		' <aside class="window-sidebar"><hr>' +
		' <div id= "hash_con" placeholder="'+hashtag_note+'" contenteditable="true">' +
		  get_hashtags() +
		'</div>' +
		'</aside>' +
		'</div>';

               
               if(window.location != window.parent.location) {
               
             
               $.postMessage(
			'{"eventname":"hashtag_view", "html":"' +  utf8_to_b64(hashtag_view) + '"}', // The message to send (string)
			"*", // The host of the target window (i.e. http://www.vistaprint.com)
			parent // A reference to the target window
		);
		}
		else{
		
		
		if(_isMobile() != mobiletrue) {
		if($("#hand img").attr("src") == hand2_icon) {

			$("img,a,html").unbind("dragstart selectstart");

		}
	        }
		
		
		
		
		 $(hashtag_view).appendTo("body");
		}


                       

	



}

}
}


function save_hash(){
var elem = $('#hash_con');

 $('#hash_con').each(function(index, elem) {
  
                     getDef(elem,"+");
                     getDef(elem,"-");

       
            }) 

save_Setting("hashtags", elem.html(), "all");

}

function get_hashtags(){

var hashtags = read_Setting("hashtags", "null", "all");


if(hashtags !='null'){

   return hashtags;
}
else{
 return  "";
}


}




function show_hide_star_note(note){

if (read_Setting("domaintype", "1", "all") == 0) {


   var note = "ـــــــــــــــــــــــــــ<br>" + note_star_link + "<br><br>"


if (read_Setting('source_of_the_statement', "showen", 'all') == "showen" || (read_Setting('links_translations', "showen", 'all') == "showen")) {



		$(".star_post").html(note);
	

}


if (read_Setting('source_of_the_statement', "showen", 'all') == "hidden" && (read_Setting('links_translations', "showen", 'all') == "hidden")) {



		$(".star_post").html("");
	

}



if (read_Setting('thread_source_link', "showen", 'all') == "hidden") {
				$(".star_thread").html("");
}
else{

$(".star_thread").html(note);

}


  


if (read_Setting('link_code_showen', "true", 'all') == "true" || read_Setting('thread_link_showen', "false", 'all') == "true"||read_Setting("tranz_code_showen", "false", "all") == "true") {

$(".notes_code").css('display', 'block');


}
else{

$(".notes_code").css('display', 'none');
}


















}			

}




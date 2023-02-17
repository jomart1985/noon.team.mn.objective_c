function copy_all(event) {
hide_elements();
 whol_text_selected  = true;
 event.preventDefault();
 event.stopPropagation();
    //select_all_and_copy(document.getElementsByTagName("BODY")[0]);
 if($('.posttext').length!=0){
    select_all_and_copy(document.getElementById("wrapper"));

 }

}

function tooltip(el, message) {

    var element = document.getElementById('copy_tooltip');
    var tooltip;

    if (el == null) {

        var scrollLeft = document.body.scrollLeft || document.documentElement.scrollLeft;
        var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
        //var x = parseInt(el.getBoundingClientRect().left) + scrollLeft + 400;
        //var y = parseInt(el.getBoundingClientRect().top) + scrollTop + 100;



        //alert(element);
        if (typeof(element) == 'undefined' || element == null)
        //if (!document.getElementById("copy_tooltip"))
        {

            tooltip = document.createElement('div');
            tooltip.id = "copy_tooltip";
            tooltip.style.display = "block";
            //tooltip.style.position = "fixed";
            //tooltip.style.position = "absolute"; 
            //tooltip.style.border = "1px solid black";
            //tooltip.style.background = "#dbdb00";
            //tooltip.style.opacity = 1;
            //tooltip.style.width = "100px";
            //tooltip.style.height = "auto";
            //tooltip.style.marginLeft = "-50px";
            //tooltip.style.marginTop = "-50px";
            //tooltip.style.textAlign= "center";
            //tooltip.style.padding= "4px";
            //tooltip.style.zIndex = "9"; 




            document.body.appendChild(tooltip);


        }
        /**else{
        	 tooltip = element;
        }*/



        /*if (/(MSIE\ [0-7]\.\d+)/.test(navigator.userAgent)) {

	tooltip.style.marginRight = "50px";

    }else{	

	tooltip.style.marginLeft = "-50px";
		
	}*/
        tooltip.innerHTML = message;
    } else {

        if (document.getElementById('copy_tooltip')) {
            document.getElementById('copy_tooltip').outerHTML = "";
            delete document.getElementById('copy_tooltip');
            printin_prosses = false;

        }

    }

}



function select_all_and_copy(el) {

 
  
  if (_isMobile() != mobiletrue){
    if($("#hand img").attr("src") == rootpath + 'clientscript/images/tools/hand2.png'){
 
        $("img,a,html").unbind( "dragstart selectstart" );

    }
    }
  
  
        $('em').contents().unwrap();
  

    if (printin_prosses == false) {
        printin_prosses = true;


        node = el;
        var range;
        if (document.body.createTextRange) {
            range = document.body.createTextRange();
            range.moveToElementText(node);
            range.select();
        } else if (window.getSelection) {
            var selection = window.getSelection();
            range = document.createRange();
            range.selectNodeContents(node);
            selection.removeAllRanges();
            selection.addRange(range);
        } else {
            //console.warn("Could not select text in node: Unsupported browser.");
        }

      

      
      setTimeout(function () {
                
            
  if (_isMobile() != mobiletrue){      
                 if($("#hand img").attr("src") == rootpath + 'clientscript/images/tools/hand2.png'){
          $("img,a,html").bind('dragstart selectstart', function(e) {
		e.preventDefault();
		return false;
	}); 


    }
   
   
   }
   
   
   
             
 }, 150);
      
      
        show_tooltip(el);




    }

} // end function select_all_and_copy(el) 




function show_tooltip(el) {

selected_dom = getSelectionTextAndContainerElement();


    if (document.queryCommandSupported("copy")) {
        var successful = document.execCommand('copy');
        if (successful) {


            if (el.className == "selected enableselect" || el.className == "selected moveoff enableselect" || el.className == "selected") {
                tooltip(null, Link_copied);
                setTimeout(function() {
                    tooltip("cool", null);
                }, 3000);
            } else {

                //alert(el.id);
                if (el.id == "text_con") {
                    tooltip(null, The_quote_text_has_been_copied);
                } 
                else if (el.id == "hash_con") {
                  tooltip(null, The_hashtag_text_has_been_copied);
                }
                
                else if (el.id == "wrapper") {


                    tooltip(null, Page_text_copied);

                } else {

                    tooltip(null, The_text_of_the_requested_statement_has_been_copied);

                }

                setTimeout(function() {
                    tooltip("cool", null);
                }, 3000);
            }
        } else {



            if (typeof Androidd !== 'undefined') {
                setTimeout(function() {

                    Androidd.copy_text(selected_dom.text,selected_dom.html);
                    printin_prosses = false;
                }, 300);
            } else {

                tooltip(null, Your_browser_does_not_support_the_copy_function);

                setTimeout(function() {
                    tooltip("cool", null);
                }, 3000);
            }



        }
    } else {
        if (typeof Androidd !== 'undefined') {
            setTimeout(function() {

                Androidd.copy_text(selected_dom.text,selected_dom.html);
                printin_prosses = false;
            }, 300);
        } else {

           tooltip(null, Your_browser_does_not_support_the_copy_function);

            setTimeout(function() {
                tooltip("cool", null);
            }, 3000);
        }
    }
}




/* Note: document.queryCommandSupported("copy") should return "true" on browsers that support copy
	but there was a bug in Chrome versions 42 to 47 that makes it return "false".  So in those
	versions of Chrome feature detection does not work!
	See https://code.google.com/p/chromium/issues/detail?id=476508
*/

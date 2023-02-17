  function apply_highlight(element,pattern,view_all,url){
  
 
  var ii = 1;


    findAndReplaceDOMText(element, {
        find: pattern,

        filterElements: function(el) {
                //console.log(el.id);

                
                
        
                
             
                
                if (el.id) {

                    if (el.id.indexOf("navbar") !== -1) {
                        return false;
                    }

                }



                if (el.className) {


                    if (el.className=="name_of_quote") {
                        

						return false;
                    }




else if (el.className.indexOf("thread_title") !== -1) {

                        return false;
                    }
                    
				    else if (el.className.indexOf("star_thread") !== -1) {

                        return false;
                    }
                    else if (el.className == "selecth1FontFamily disableselect") {


                        return false;
                    } else if (el.className.indexOf("select_all") !== -1) {
                        return false;
                    } else if (el.className.indexOf("posttop") !== -1) {
                        return false;
                    }

                    /*else if (el.id.indexOf("thread_title") !== -1) {
                        return false;
                    }*/
					
					
					
                    else if (el.className.indexOf("gts") !== -1) {

                        return false;
                    } else if (el.className.indexOf("hash_tag") !== -1) {

                        return false;
                    } else if (el.className.indexOf("star_post") !== -1) {

                        return false;
                    } else if (el.className.indexOf("star_post2") !== -1) {

                        return false;
                    } else if (el.className.indexOf("thread_src") !== -1) {

                        return false;
                    } else if (el.className.indexOf("post_src") !== -1) {
                        return false;
                    } else if (el.className.indexOf("randomnumber") !== -1) {

                        return false;
                    } else if (el.className == "selected enableselect") {
                        return false;
                    } else {
                        return true;
                    }
                } else {
                    return true;
                }
                //alert(el.className);
                //el.nodeName
                //return  true;
            }

            ,


        replace: function(portion, match) {
            called = true;



    if(view_all == null){
    
    
                 	var el = document.createElement('em');
                                       el.classList.add("mark");
					
					var gg= XRegExp("([\\s\\p{P}\\p{S}\u06DA\u200F\u200B]+)", "");
                                       //var ggg= XRegExp("([\s|\u00A0]+)", "g")
					
					if(portion.text.replace(gg,"") != ""){

					el.setAttribute('id','hit_'+ii);
					
					ii++;
					 el.innerHTML = portion.text;
					}
	                             //console.log(portion.text.match(ggg)); 

                                 



                                         //if(!portion.text.match(ggg))
                                            
    return el;
    }
    else{
    
         var el = document.createElement('a');
            el.classList.add("hit");

            var gg = XRegExp("([\\s\\p{P}\\p{S}\u06DA\u200F\u200B]+)", "")

            if (portion.text.replace(gg, "") != "") {

                el.setAttribute('id', 'mark_' + ii);
                el.setAttribute('href', url + "&hit=" + ii);
                
                if (view_all == false) {
                el.setAttribute('onclick', "go_iframe(event,this,'partial_snipit')");
                
                }
                else{
                el.setAttribute('onclick', "go_iframe(event,this,'all_snipit')");
                }


                ii++;

            }

            el.innerHTML = portion.text;
    return el;
    
    }







       

            
        }
    });
    
    }

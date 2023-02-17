var disable_all_loading = false;

var currsize = 1;

var gRootRelPath = "";
var gCommonRootRelPath = "";
var gTopicId = "";
var time = "?time=" + (new Date().getTime());

var url="";
var v = '87px.png';
var is_grabbing = false;
var is_input_foces = false;
var rootpath= "";
var search_type ="";
var is_snipit_enabled = "";
var _frag = document.createDocumentFragment(); // Reusable documentFragment
var striped_Normlized = "";
var iframe = null;
var search_view_hight = "";
var resizeId;
var resizeDone = false;
var current_select = "";
var current_mark =null;
var curr_index ="";
var git = true;
var part_hit = false;
var fav_title = "";
var fav_url = "";
var stop_load_ifram = false;
var previous_hash =  null;
var next_hash =  null;
/*higlhight*/
var highlight ;
var part_hit ;
var part_match =null;
var pattern;
var remove_repeated;
var words_array = new Array();
var hit_id;
var apply_mark  =true;

var printin_prosses = false;

var style_type = "kk";

if (typeof vburl !== 'undefined') {

rootpath = vburl.substring(0, vburl.indexOf(v));
}








document.write('<script data-cfasync="false"  type=\"text/javascript\" src=\'' + rootpath + 'clientscript/loader.js' + time + '\'><\/script>'); 

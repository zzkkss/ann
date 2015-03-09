

var position = 0;
var iOS = false;

function scroll() {

    if( position >= $("section").height()*6-20 ) {
    	$(".iphone").css({'opacity':'0'})
    	$(".iphoneMockup").css({'z-index':'-1'})
    }
    else {
    	$(".iphone").css({'opacity':'1'})
    	$(".iphoneMockup").css({'z-index':'999'})
    }
    if( position <= $("section").height()*1-20 ) {
    	$(".iphoneMockup .enter").css("display","block");
    }
    else {
    	$(".iphoneMockup .enter").css("display","none");
    }
    if( position <= $("section").height()*0 ) {

        if( $(window).width() <= 845 ){
            /*$(".iphoneMockup").css({'top':'50%'})*/
//            $(".iphoneMockup").css({'top':'80%'})
            $(".iphoneMockup").css({'bottom':'0%'});
        }
        else {
//            $(".iphoneMockup").css({'top':'60%'})
            $(".iphoneMockup").css({'bottom':'0%'});
        }

        console.log("Down");
    }
    else {

//    	$(".iphoneMockup").css({'top':'0%'})
    	$(".iphoneMockup").css({'bottom':'0%'});
        console.log("Up");
    }

    if (iOS === false) {
      console.log(position);
      console.log($("section").height()*1);
     
       if( position >= $ ("section").height()*1 && position < $("section").height()*2 ) {
//            document.getElementById("video1").play()
//            document.getElementById("video2").pause()
//            document.getElementById("video3").pause()
//            console.log("play");
        }
        else if ( position >= $("section").height()*2 && position < $("section").height()*3 ){
//            document.getElementById("video1").pause()
//            document.getElementById("video2").play()
//            document.getElementById("video3").pause()
        }
        else if ( position >= $("section").height()*3 && position < $("section").height()*4 ){
//            document.getElementById("video1").pause()
//            document.getElementById("video2").pause()
//            document.getElementById("video3").play()
            console.log("3");
        }
        else {
//            document.getElementById("video1").pause()
//            document.getElementById("video2").pause()
//            document.getElementById("video3").pause()
        }
    }

}
	if($('html').hasClass('ie6')|$('html').hasClass('ie7')|$('html').hasClass('ie8')){
		window.attachEvent("resize",size);
	}else{

		window.addEventListener('resize', size, false);
	}
$(document).ready(function(){
        size();

        p = navigator.platform;
        if( navigator.platform === 'iPhone' || navigator.platform === 'iPod' || navigator.platform === 'iPhone Simulator' ) {
          iOS = true;
        }
        if (iOS === true) {
               $( ".page2 .screenshot video" ).replaceWith("<img src='img/screenshot1.png' alt='screenshot 1'>");
               $( ".page3 .screenshot video" ).replaceWith("<img src='img/screenshot2.png' alt='screenshot 2'>");
               $( ".page4 .screenshot video" ).replaceWith("<img src='img/screenshot3.png' alt='screenshot 3'>");
        }
        
});

  function size() {
    if( $(window).width() <= 845 && position <= $("section").height()*0) {
        $(".iphoneMockup").css({'bottom':'0%'})
    }
    else if( position <= $("section").height()*0){
            $(".iphoneMockup").css({'bottom':'0%'})
    } 
    else {
        $(".iphoneMockup").css({'bottom':'0%'})
    }
  }
 
//  window.twttr=(function(d,s,id){var t,js,fjs=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return}js=d.createElement(s);js.id=id;js.src="widgets.js";fjs.parentNode.insertBefore(js,fjs);return window.twttr||(t={_e:[],ready:function(f){t._e.push(f)}})}(document,"script","twitter-wjs"));
//
//(function(d, s, id) {
//  var js, fjs = d.getElementsByTagName(s)[0];
//  if (d.getElementById(id)) return;
//  js = d.createElement(s); js.id = id;
//  js.src = "//connect.facebook.net/cs_CZ/sdk.js#xfbml=1&version=v2.0";
//  fjs.parentNode.insertBefore(js, fjs);
//}
//(document, 'script', 'facebook-jssdk'));


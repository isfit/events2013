// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .



// TODO: fix it smoother

// $(function(){
//   $(window).on('scroll', function(ev){
//     var scrollTop = $(window).scrollTop();

//     if(scrollTop<=60) {
//       $('.active').removeClass('active');
//       return;
//     }

//     $('.datewrapper').each(function(){
//       if(scrollTop+20 >= $(this).offset().top) {
//         $(this).children().first().addClass('active');
//       }
//       else {
//         $(this).children().first().removeClass('active');
//         return;
//       }
//     });

//     var db = $('.dateblock.active').last();
//     var evnt = db.parent();
//     if(!((evnt.position().top + evnt.height()) > (scrollTop + db.height()+20))) {
//       db.addClass('stationary').removeClass('active');
      
//       $('.active').removeClass('active')
//       $('.stationary').last().addClass('active');
//     }
//     else {
//       db.removeClass('stationary');
//     }
//   });
// });
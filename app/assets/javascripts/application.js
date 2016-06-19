//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.timeago
//= require semantic-2-1-8
//= require jquery.timeago.zh-CN
//= require headroom
//= require typed
//= require jQuery.headroom
//= require highlight.pack

document.addEventListener("turbolinks:load", function() {
  $("time.timeago").timeago();
  $('.ui.sidebar').sidebar('attach events', '.toc.item');
  $('.typed-cursor').remove();
  $('.person-description').typed({
    strings: ['致力于 Web 全栈开发'],
    loop: true,
    showCursor: true,
    startDelay: 500,
    backSpeed: 10,
    backDelay: 1500,
    typeSpeed: 80,
    contentType: 'html'
  });
  if ($(this).scrollTop() == 0){
    $("#header").css({
      'background':'none',
      'border-bottom':'none'
    });
    $("#header").find("a").css({
      color:"#fff"
    });
  }
  $(document).scroll(function(){
    if ($(this).scrollTop() == 0){
      $("#header").css({
        'background':'none',
        'border-bottom':'none'
      });
      $("#header").find("a").css({
        color:"#fff"
      });
    }else if( $(this).scrollTop() !=0 ){
      $("#header").css({
        'background':'#fff',
        'border-bottom':'1px solid #DDD',
      });
      $("#header").find("a").css({
        color: '#66676e'
      });
    }
  });
  $("#header").headroom();
});

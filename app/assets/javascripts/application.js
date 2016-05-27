//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.timeago
//= require semantic
//= require jquery.timeago.zh-CN
//= require headroom
//= require typed
//= require jQuery.headroom
//= require highlight.pack
document.addEventListener("turbolinks:load", function() {
  $("#header").headroom();
  $("time.timeago").timeago();
  $('.ui.sidebar').sidebar('attach events', '.toc.item');
  $('.typed-cursor').remove();
  $('.person-description').typed({
    strings: ['专注于 Web 全栈开发'],
    loop: true,
    showCursor: true,
    startDelay: 500,
    backSpeed: 10,
    backDelay: 1500,
    typeSpeed: 80,
    contentType: 'html'
  });
});

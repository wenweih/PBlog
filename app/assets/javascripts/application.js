//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.timeago
//= require semantic-2-1-8
//= require jquery.timeago.zh-CN
//= require headroom
//= require jQuery.headroom

document.addEventListener("turbolinks:load", function() {
  $("time.timeago").timeago();
  $('.typed-cursor').remove();
  $('.ui.sidebar').sidebar('attach events', '.toc.item');
  $("#header").headroom();
});

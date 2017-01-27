//= require jquery
//= require jquery_ujs
//= require selectize
//= require moment
//= require datetime_picker
//= require select2

$("#blog_post_tag_list").select2({
  tags: true,
  tokenSeparators: [',', ' ']
});

$("#blog_post_category").select2();

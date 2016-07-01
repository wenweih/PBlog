//= require typed
document.addEventListener("turbolinks:load", function() {
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
  $(window).scroll(function(){
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
  $("body").delegate(".scroll","click",function(e){
    $("html,body").animate({ scrollTop: $(window).height()}, 800);
  });
  $("body").delegate(".contact_btn_masthead", "click",function(e){
    $("html,body").animate({ scrollTop: $(window).height()*2}, 800);
  });
  if ($(window).scrollTop() == 0){
    $("#header").css({
      'background':'none',
      'border-bottom':'none'
    });
    $("#header").find("a").css({
      color:"#fff"
    });
  }
  var messageForm = $('.contact_form');
  messageForm.form({
    on: 'blur',
    inline : true,
    fields: {
      name: {
        identifier  : "contact[name]",
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter your name'
          }
        ]
      },
      email:{
        identifier  : "contact[email]",
        rules:  [
          {
            type   : 'empty',
            prompt: 'Please enter your email'
          },
          {
            type   : 'email',
            optional   : true,
            prompt: "Please enter a valid e-mail"
          }
        ]
      },
      msg:{
        identifier  :'contact[message]',
        rules: [
          {
            type: 'empty',
            prompt: "Please enter message"
          },
          {
            type: 'maxLength[500]',
            prompt: "Please enter at most 500 characters"
          }
        ]
      }
    }
  })
  $('.contact_btn').on("click",function(){
    if(messageForm.form('is valid')){
      $('.contact_form').submit(function(e){
        $('.contact_btn').text("Sent successfully");
      });
      $(this).addClass('disabled');
    }else{
      $('.contact_form').submit(function(e){
        e.preventDefault();
        $('.contact_btn').text("Failed to send");
      });
    }
  });
});

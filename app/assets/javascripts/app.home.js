App.Home = {
  messageForm: function() {
    $('.contact_form').form({
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
  },
  sayHello: function(){
    setTimeout(function(){
      $(document).notification("<div class='ns-thumb'><img src='/user.jpg'/></div><div class='ns-content'><p><a href='#'>Zoe Moulder</a> accepted your invitation.</p></div>");
    }, 3200);
  }
};
document.addEventListener("turbolinks:load", function() {
  $('.contact_btn').on("click",function(){
    if($('.contact_form').form('is valid')){
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

  var bttn = $('#notification-trigger');
  bttn.disabled = false;
  bttn.on('click', function(){
    var self = this
    bttn.addClass('active');
    setTimeout(function(){
      bttn.removeClass('active');

      $(self).notification("<div class='ns-thumb'><img src='/user.jpg'/></div><div class='ns-content'><p><a href='#'>Zoe Moulder</a> accepted your invitation.</p></div>");
    }, 1200);
    this.disabled = true;
  });

});

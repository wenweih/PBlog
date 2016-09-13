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
    });

  },
  sayHello: function(){
    setTimeout(function(){
      $(document).notification("Hello");
    }, 3200);
  }
};

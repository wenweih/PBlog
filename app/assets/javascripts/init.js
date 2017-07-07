//= require headroom
//= require jQuery.headroom
//= require semantic-ui/accordion
//= require semantic-ui/form
//= require semantic-ui/sidebar
//= require semantic-ui/sticky
//= require semantic-ui/site
//= require jquery.timeago
//= require jquery.timeago.zh-CN
//= require jquery.timeago.en
//= require js-routes
//= require typed
//=  require highlight
//= require modernizr.custom
//= require notification
//= require social-share-button
//= require social-share-button/wechat
window.App || (window.App = {});
App = {
  init: function(){
    (function(){
      App.siteBootUp();
      App.turbolinksCache();
      App.sitePageInit();
      App.siteEvents();
    })();
  },
  siteBootUp: function(){
    App.initUI.initHeadroom();
    App.initUI.initTimeago();
    App.initUI.initTyped();
    App.initUI.initSemanticUITool();
    App.initUI.initHighLight();
    App.initUtil();
    // App.initGa();
    return;
  },
  sitePageInit: function(){
    App.initPage.home();
  },
  siteEvents: function(){
    App.bind.events();
  },
  turbolinksCache: function(){
    $(document).on('turbolinks:before-cache', function(){
      App.beforeCache.typedCache();
      App.beforeCache.formCache();
      App.beforeCache.flashCache();
    });
    return;
  },
  initGa: function(){
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-89303689-1', 'auto');
    ga('send', 'pageview');
  },
  initUI: {
    initHeadroom: function(){
      $(".headeroom").headroom();
      $(document).on('scroll', function(){
        if ($(this).scrollTop() == 0){
          $('.headeroom').addClass('header-transparent');
          $(".headeroom").find("a").css({
            color: '#fff'
          });
        }else {
          $('.headeroom').removeClass('header-transparent');
          $(".headeroom").css({
            'background':'#fff',
            'border-bottom':'1px solid #DDD',
          });
          $(".headeroom").find("a").css({
            color: '#66676e'
          });
        }
      });
    },
    initTimeago: function(){
      $("time.timeago").timeago();
    },
    initTyped: function(){
      if($('.home.index').length > 0){
        $('.person-description').typed({
          strings: ['Building Hight Performance Software'],
          loop: true,
          showCursor: true,
          startDelay: 500,
          backSpeed: 10,
          backDelay: 1500,
          typeSpeed: 80,
          contentType: 'html'
        });
      }
    },
    initSemanticUITool: function(){
      $('.comment_form').accordion({
        onOpen: function(e){
          $("body").animate({ scrollTop: $('.comment-head').offset().top});
        }
      });
      $('.ui.sidebar').sidebar('attach events', '.toc.item');
      $('.sub_menu').sticky({ context: '.post-index' });
    },
    initHighLight: function(){
      $(".simditor-body pre").each(function(i, block) {
        // http://stackoverflow.com/questions/31753617/how-can-i-remove-leading-whitespace-in-my-pre-code-block-without-removing-in
        var html = $(this).html();
        var pattern = html.match(/\s*\n[\t\s]*/);
        $(this).html(html.replace(new RegExp(pattern, "g"),'\n'));

        hljs.highlightBlock(block);
      });
    }
  },
  initUtil: function(){
    $('html,body').on("scroll mousedown DOMMouseScroll mousewheel keyup", function(e){
      if ( e.which > 0 || e.type === "mousedown" || e.type === "mousewheel"){
        $('html,body').stop().on('scroll mousedown DOMMouseScroll mousewheel keyup');
      }
    });
  },
  initPage: {
    home: function(){
      if($('.home.index').length > 0){
        App.Home.messageForm();
      }
    }
  },
  beforeCache:  {
    typedCache: function(){
      $('.typed-cursor').remove();
    },
    formCache: function(){
      $('.contact_form').form('clear');
    },
    flashCache: function(){
      $('.ns-box').remove();
    }
  },
  bind: {
    events: function(){
      $(document).on('click',"*[data-behavior]", function(e){
        var behavior = $(e.target).attr("data-behavior");
        if ( behavior !== undefined ) {
          eval("App.events." + behavior + "();");
          e.stopPropagation();
        }
      })
    }
  },
  events: {
    homeScrollNext: function(){
      $("body").animate({ scrollTop: $(window).height()}, 800);
    },
    homeContactMe: function(){
      $("html,body").animate({ scrollTop: $(document).height()}, 800);
    },
    messageForm:  function(){
      var $form = $('.contact_form');
      if($form.form('is valid')){
        $(this).addClass('disabled');
      }else{
        $form.submit(function(e){
          e.preventDefault();
          $('.contact_btn').text("Failed to send");
        });
      }
    },
    commentaccordion: function(){
      $('.comment_form').accordion('close', 0)
    }
  }
};

$(document).on('turbolinks:load', function(){
  App.init();
});

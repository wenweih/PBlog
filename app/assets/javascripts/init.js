//= require headroom
//= require jQuery.headroom
//= require semantic-2-2-4
//= require jquery.timeago
//= require jquery.timeago.zh-CN
//= require js-routes
//= require typed
//=  require highlight
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
    });
    return;
  },

  initUI: {
    initHeadroom: function(){
      $(".headeroom").headroom();
      $(document).on('scroll', function(){
        if ($(this).scrollTop() == 0){
          $('.headeroom').addClass('header-transparent');
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
          strings: ['致力于 Web 全栈开发'],
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
      $('.ui.sidebar').sidebar('attach events', '.toc.item');
      $('.sub_menu').sticky({ context: '.post-index' });
    },
    initHighLight: function(){
      $('pre code').each(function(i, block) {
        // http://stackoverflow.com/questions/31753617/how-can-i-remove-leading-whitespace-in-my-pre-code-block-without-removing-in
        var html = $(this).html();
        var pattern = html.match(/\s*\n[\t\s]*/);
        $(this).html(html.replace(new RegExp(pattern, "g"),'\n'));

        hljs.highlightBlock(block);
      });
    }
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
    }
  },
  bind: {
    events: function(){
      $(document).on('click', function(e){
        var behavior = $(e.target).attr("data-behavior");
        if ( behavior !== undefined ) {
          eval("App.events." + behavior + "();");
        }
      })
    }
  },
  events: {
    homeScrollNext: function(){
      console.log("run...");
      $("html,body").animate({ scrollTop: $(window).height()}, 800);
    }
  }
};

$(document).on('turbolinks:load', function(){
  App.init();
});

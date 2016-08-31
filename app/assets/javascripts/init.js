//= require headroom
//= require jQuery.headroom
//= require semantic-2-2-4
//= require jquery.timeago
//= require jquery.timeago.zh-CN
//= require js-routes
//= require typed
window.App || (window.App = {});
App = {
  init: function(){
    (function(){
      App.siteBootUp();
      App.turbolinksCache();
    })();
  },
  siteBootUp: function(){
    App.initUI.initHeadroom();
    App.initUI.initTimeago();
    App.initUI.initTyped();
    App.initUI.initSemanticUITool();
    return;
  },
  turbolinksCache: function(){
    $(document).on('turbolinks:before-cache', function(){
      App.beforeCache.typedCache();
    });
    return;
  },

  initUI: {
    initHeadroom: function(){
      $(".headeroom").headroom();
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
    }
  },

  beforeCache:  {
    typedCache: function(){
      $('.typed-cursor').remove();
    }
  },
};

$(document).on('turbolinks:load', function(){
  App.init();
});

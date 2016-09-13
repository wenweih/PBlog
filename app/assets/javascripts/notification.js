;(function ($, window, document, undefined) {
  "use strict";
  var docElem = window.document.documentElement,
    support = { animations : Modernizr.cssanimations },
		animEndEventNames = {
			'WebkitAnimation' : 'webkitAnimationEnd',
			'OAnimation' : 'oAnimationEnd',
			'msAnimation' : 'MSAnimationEnd',
			'animation' : 'animationend'
		},
		// animation end event name
		animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ];


  var Notification = function(el, parameters) {

    this.options;
    if ($.isPlainObject(parameters)){
      this.options = $.extend({}, $.fn.notification.defaults, parameters);
    }else{
      this.options = $.extend({}, $.fn.notification.defaults);
    }
    this.wrapper = this.options.wrapper;
    this.ttl = this.options.ttl;
    (typeof parameters === 'string') ? (this.message = parameters) : this.message = this.options.message;

    this.build();
    this.show();
  };

  // 当新建函数时，prototype(原型)属性同时也被创建,这个属性又是包含了很多属性和方法的对象；
  // 换句话说，原型充当两种角色：一种是新建函数的属性（作为属性）；另一种是 Object 类型的实例（作为对象），包含了特定引用类型实例的属性和方法
  // 这些属性和方法能够被特定引用类型(Object, function 等)的实例调用
  // 每个原型都有一个 constructor 属性，该属性指向创出该原型的函数。
  Notification.prototype = {

    // 每个原型都有一个 constructor 属性，该属性指向创出该原型的函数。
    // http://stackoverflow.com/questions/8453887/why-is-it-necessary-to-set-the-prototype-constructor
    constructor: Notification,

    build: function() {

      var $existElm = $('.ns-box');
      if ($existElm !== undefined){
        $existElm.remove();
      }
      // create HTML structure
      this.ntf = document.createElement( 'div' );
      var msg = this.message;
      this.ntf.className = 'ns-box ns-other' + ' ns-effect-thumbslider' + ' ns-type-' + this.options.type;
      var strinner = '<div class="ns-box-inner">';
      strinner += "<div class='ns-thumb'><img src='/user.jpg'/></div><div class='ns-content'><p><a href='#'>Wenwei Huang</a>\n</p>"
      strinner += "<p>"+ msg + "</p>"
      strinner += "</div>"
      strinner += '</div>';
      strinner += '<span class="ns-close"></span></div>';
      this.ntf.innerHTML = strinner;

      this._initEvents();
    },

    // init events
    _initEvents: function() {
      var self = this;
      // dismiss notification
      $(document).on('click','.ns-close', function(){ self.dismiss() } );
    },

    // show the notification
    show: function() {
      this.active = true;
      $(this.wrapper).prepend(this.ntf);
      $(this.ntf).removeClass('ns-hide');
      $(this.ntf).addClass('ns-show');
      if (typeof this.options.onOpen === 'function'){
        this.options.onOpen();
      }
      // dismiss after [options.ttl]ms
      var self = this;

      if(this.ttl) { // checks to make sure ttl is not set to false in notification initialization
        this.dismissttl = setTimeout( function(){
          if( self.active ) {
            self.dismiss();
          }
        }, this.ttl );
      }
    },

    // dismiss the notification
    dismiss: function() {
      var self = this;
      this.active = false;
      clearTimeout( this.dismissttl );
      $(this.ntf).removeClass('ns-show');
      setTimeout( function() {
        $(self.ntf).addClass('ns-hide');
        // callback
        if (typeof self.options.onClose === 'function')
          self.options.onClose();
      }, 25 );

      // after animation ends remove ntf from the DOM
      var onEndAnimationFn = function( ev ) {
        if( support.animations ) {
          if( ev.target !== self.ntf ) return false;
          this.removeEventListener( animEndEventName, onEndAnimationFn );
        }
        self.wrapper.removeChild( self.ntf );
      };

      if( support.animations ) {
        this.ntf.addEventListener( animEndEventName, onEndAnimationFn );
      }
      else {
        onEndAnimationFn();
      }
    },
  };

  // 调用 notification 函数时，用户有可能传入的参数为:
  // 1. 参数为空
  // 2. 参数为字符串
  // 3. 参数为 Object 对象
  $.fn.notification = function(parameters) {
    var $allModules    = $(this);
    return $allModules.each(function() {
      var $this = $(this);
      new Notification($this, parameters);
    });
  };

  $.fn.notification.defaults = {
    // element to which the notification will be appended
    // defaults to the document.body
    wrapper : "body",
    // the message
    message : 'yoyoyoyoyoyoyoyoyoyoyoyo!',
    // notice, warning, error, success
    // will add class ns-type-warning, ns-type-error or ns-type-success
    type : 'error',
    // if the user doesn´t close the notification then we remove it
		// after the following time
    ttl : 6000,
    // callbacks
    onClose : function() { return false; },
    onOpen : function() { return false; }
  };
})( jQuery, window, document );

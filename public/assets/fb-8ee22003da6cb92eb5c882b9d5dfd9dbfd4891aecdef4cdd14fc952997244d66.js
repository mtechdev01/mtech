(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  ObserveJS.bind('FB', (function() {
    function _Class() {
      this.initialize = __bind(this.initialize, this);
      this.loaded = __bind(this.loaded, this);
    }

    _Class.prototype.root = document.createElement('div');

    _Class.prototype.root.id = 'fb-root';

    _Class.prototype.loaded = function() {
      if (!document.body.contains(this.root)) {
        document.body.appendChild(this.root);
      }
      if (typeof FB !== "undefined" && FB !== null) {
        return FB.XFBML.parse();
      } else {
        return this.initialize();
      }
    };

    _Class.prototype.initialize = function() {
      var js, script;
      js = document.createElement('script');
      script = document.getElementsByTagName('script')[0];
      js = document.createElement('script');
      js.id = 'facebook-jssdk';
      js.src = "//connect.facebook.net/fr_FR/all.js#xfbml=1&appId=708003905969064&version=2.6";
      return script.parentNode.insertBefore(js, script);
    };

    return _Class;

  })());

}).call(this);

// Generated by CoffeeScript 1.6.3
(function() {
  var Canvas, Screen, app, c, cancelAnimationFrame, cmd, draw, requestAnimFrame, requestID;

  app = angular.module("canvasApp", ["ngCookies", "ngResource", "ngSanitize", "ngRoute"]);

  Screen = (function() {
    function Screen(width, height) {
      this.width = width;
      this.height = height;
      this.pixels = new Array(width * height);
    }

    Screen.prototype.test = function() {
      console.log(this.width);
      console.log(this.height);
      return console.log(this.pixels.length);
    };

    Screen.prototype.render = function() {
      var x, y, _i, _results;
      _results = [];
      for (y = _i = 0; _i <= 63; y = _i += 1) {
        _results.push((function() {
          var _j, _results1;
          _results1 = [];
          for (x = _j = 0; _j <= 63; x = _j += 1) {
            _results1.push(this.pixels[x + y * this.width] = "#789");
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };

    return Screen;

  })();

  Canvas = (function() {
    function Canvas() {
      this.canvas = null;
      this.ctx = null;
      this.w = null;
      this.h = null;
      this.screen = null;
    }

    Canvas.prototype.create_canvas = function() {
      var cbrdr, coffs, cpad, ct, ctext, cwidth;
      ct = "Your browser does not support &lt;canvas&gt;, " + "try one of <a href='#'>these</a> instead.";
      this.canvas = document.createElement("canvas");
      ctext = document.createTextNode(ct);
      document.getElementById("spawn-canvas").appendChild(this.canvas).appendChild(ctext);
      cpad = window.getComputedStyle(this.canvas, null).getPropertyValue("padding");
      cbrdr = window.getComputedStyle(this.canvas, null).getPropertyValue("border-width");
      coffs = parseInt(cpad) * 2 + parseInt(cbrdr) * 2;
      cwidth = document.getElementsByClassName("main-content")[0].offsetWidth - coffs;
      this.w = this.canvas.width = cwidth;
      this.h = this.canvas.height = this.canvas.width / 16 * 9;
      return this.ctx = this.canvas.getContext("2d");
    };

    Canvas.prototype.block = function(color, coords, s) {
      this.canvas.getContext("2d").fillStyle = color;
      return this.canvas.getContext("2d").fillRect(coords[0] * s, coords[1] * s, s, s);
    };

    Canvas.prototype.pixel = function(color, coords) {
      return c.block(color, coords, 1);
    };

    Canvas.prototype.spawn = function() {
      var height, width;
      console.log("Spawned!");
      height = Math.floor(this.canvas.height);
      width = Math.floor(this.canvas.width);
      return this.screen = new Screen(width, height);
    };

    return Canvas;

  })();

  requestAnimFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame;

  cancelAnimationFrame = window.cancelAnimationFrame || window.webkitCancelAnimationFrame || window.mozCancelAnimationFrame || window.oCancelAnimationFrame || window.msCancelAnimationFrame;

  c = new Canvas;

  requestID = null;

  draw = function() {
    c.ctx.clearRect(0, 0, c.w, c.h);
    c.ctx.fillStyle = "#000";
    c.ctx.fillRect(0, 0, c.w, c.h);
    return requestID = requestAnimationFrame(draw);
  };

  cmd = document.getElementById("cmd");

  document.onkeydown = function(e) {
    var keyCode;
    if (!e) {
      e = window.event;
    }
    if (e.target !== cmd) {
      keyCode = e.keyCode ? e.keyCode : e.which;
      if (keyCode === 27) {
        return cmd.focus();
      }
    }
  };

  cmd.onkeypress = function(e) {
    var command, exists;
    if (!e) {
      e = window.event;
    }
    if (e.keyCode === 13 || e.which === 13) {
      command = cmd.value.toLowerCase();
      exists = document.getElementsByTagName("canvas")[0] !== void 0;
      cmd.value = "";
      switch (command) {
        case "start":
          if (exists) {
            requestID = requestAnimationFrame(draw);
            return console.log("Start");
          }
          break;
        case "stop":
          if (exists) {
            cancelAnimationFrame(requestID);
            return console.log("Stop");
          }
          break;
        case "clear":
          if (exists) {
            cancelAnimationFrame(requestID);
            c.ctx.clearRect(0, 0, c.w, c.h);
            return console.log("Clear");
          }
          break;
        case "create":
          if (!exists) {
            c.create_canvas();
            c.spawn();
            return console.log("Create");
          }
          break;
        case "remove":
          if (exists) {
            c.canvas.parentNode.removeChild(c.canvas);
            return console.log("Remove");
          }
          break;
        default:
          return console.log("Invalid command");
      }
    }
  };

}).call(this);

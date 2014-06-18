// Generated by CoffeeScript 1.6.3
(function() {
  define(["underscore", "backbone"], function(_, Backbone) {
    var VertexView, ctx;
    ctx = canvas.getContext("2d");
    canvas.width = canvas.parentElement.offsetWidth;
    canvas.height = canvas.width / 16 * 9;
    VertexView = (function() {
      function VertexView() {}

      VertexView.prototype.run = function(model) {
        this.model = model;
        this.model.on("add", this.render, this);
        return this.model.on("remove", this.render, this);
      };

      VertexView.prototype.render = function() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        return this.model.each(this.renderVertex);
      };

      VertexView.prototype.renderVertex = function(vertex) {
        var radius, x, y;
        x = vertex.get("x");
        y = vertex.get("y");
        radius = vertex.get("radius");
        ctx.beginPath();
        ctx.arc(x, y, radius, 0, 2 * Math.PI);
        ctx.closePath();
        return ctx.fill();
      };

      return VertexView;

    })();
    return VertexView;
  });

}).call(this);

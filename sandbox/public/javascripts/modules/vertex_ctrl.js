// Generated by CoffeeScript 1.6.3
(function() {
  define(["underscore", "backbone", "models/vertex", "collections/vertex_list"], function(_, Backbone, Vertex, model) {
    var VertexCtrl;
    VertexCtrl = (function() {
      function VertexCtrl() {
        var self, vertex_being_dragged;
        self = this;
        vertex_being_dragged = null;
        canvas.addEventListener("mousedown", function(e) {
          var keyCode, vertex;
          keyCode = e.which || e.keyCode;
          switch (keyCode) {
            case 1:
              if (vertex_being_dragged) {
                return vertex_being_dragged = null;
              } else {
                vertex_being_dragged = self.findVertex(e.pageX, e.pageY);
                if (!vertex_being_dragged) {
                  vertex = new Vertex({
                    x: e.pageX,
                    y: e.pageY,
                    radius: 10
                  });
                }
                return model.add(vertex);
              }
              break;
            case 3:
              model.remove(self.findVertex(e.pageX, e.pageY));
              return window.oncontextmenu = function() {
                return false;
              };
            default:
              return null;
          }
        });
        canvas.addEventListener("mousemove", function(e) {
          if (vertex_being_dragged) {
            return vertex_being_dragged.set({
              x: e.pageX,
              y: e.pageY
            });
          }
        });
        document.onkeydown = function(e) {
          var keyCode;
          keyCode = e.which || e.keyCode;
          if (keyCode === 27) {
            return model.remove(vertex_being_dragged);
          }
        };
      }

      VertexCtrl.prototype.findVertex = function(x, y) {
        return model.find(function(vertex) {
          return vertex.contains(x, y, vertex.get("radius"));
        });
      };

      return VertexCtrl;

    })();
    return VertexCtrl;
  });

}).call(this);

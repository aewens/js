// Generated by CoffeeScript 1.6.3
(function() {
  require(["jquery", "underscore", "backbone", "model/x"], function($, _, Backbone, X) {
    var XView;
    _.templateSettings = {
      interpolate: /\{\{(.+?)\}\}/g
    };
    XView = Backbone.View.extend({
      model: X
    });
    return XView;
  });

}).call(this);

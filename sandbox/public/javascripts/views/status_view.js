// Generated by CoffeeScript 1.6.3
(function() {
  define(["jquery", "underscore", "backbone", "models/status"], function($, _, Backbone, Status) {
    var StatusView;
    StatusView = Backbone.View.extend({
      model: new Status,
      tagName: "div",
      initialize: function() {
        return this.template = _.template($("#status-tmpl").html());
      },
      render: function() {
        $(this.el).addClass("media").html(this.template(this.model.toJSON()));
        return this;
      }
    });
    return StatusView;
  });

}).call(this);

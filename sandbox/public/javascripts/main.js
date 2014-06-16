// Generated by CoffeeScript 1.6.3
(function() {
  require.config({
    paths: {
      "jquery": "../vendor/jquery/dist/jquery.min",
      "underscore": "../vendor/underscore/underscore",
      "backbone": "../vendor/backbone/backbone"
    }
  });

  require(["jquery", "underscore", "backbone", "models/status", "collections/status_list", "views/status_view"], function($, _, Backbone, Status, StatusList, StatusView) {
    var StatusiView, status_list;
    status_list = new StatusList;
    StatusiView = Backbone.View.extend({
      model: status_list,
      el: $(".page"),
      initialize: function() {
        return this.model.on("add", this.render, this);
      },
      render: function() {
        var self;
        self = this;
        self.$el.html("");
        return _.each(this.model.toArray().reverse(), function(status, i) {
          self.$el.append((new StatusView({
            model: status
          })).render().$el);
          return this;
        });
      }
    });
    return $(document).ready(function() {
      var statusi_view;
      $("#new-status").submit(function(e) {
        var status;
        e.preventDefault();
        status = new Status({
          author: $("input[name=author]").val(),
          content: $("input[name=content]").val()
        });
        status_list.add(status);
        console.log(status_list.toJSON());
        return false;
      });
      return statusi_view = new StatusiView;
    });
  });

}).call(this);

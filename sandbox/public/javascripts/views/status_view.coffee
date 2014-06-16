define [
    "jquery",
    "underscore", 
    "backbone", 
    "models/status"
], ($, _, Backbone, Status) ->
    StatusView = Backbone.View.extend
        model: new Status
        tagName: "div"
        initialize: ->
            this.template = _.template($("#status-tmpl").html())
        render: ->
            $(this.el).addClass("media").html this.template this.model.toJSON()
            return this
        
    return StatusView
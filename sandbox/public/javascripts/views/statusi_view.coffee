define [
    "jquery", 
    "underscore", 
    "backbone"
    "views/status_view"
], ($, _, Backbone, StatusView) ->
    StatusiView = Backbone.View.extend
        el: $(".page")
        initialize: ->
            this.model.on("add", this.render, this)
            this.model.on("remove", this.render, this)
        render: ->
            self = this
            self.$el.html("")
            _.each this.model.toArray().reverse(), (status, i) ->
                model = new Backbone.Model
                model.set {status: status, status_list: self.model}
                view = new StatusView {model: model}
                self.$el.append(view.render().$el)
                return this
        
    return StatusiView
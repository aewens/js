require.config
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require [
    "jquery", 
    "underscore", 
    "backbone",
    "models/status",
    "collections/status_list",
    "views/status_view"
], ($, _, Backbone, Status, StatusList, StatusView) ->
    status_list  = new StatusList
    
    StatusiView = Backbone.View.extend
        model: status_list
        el: $(".page")
        initialize: ->
            this.model.on("add", this.render, this)
        render: ->
            self = this
            self.$el.html("")
            _.each this.model.toArray().reverse(), (status, i) ->
                self.$el.append((new StatusView {model: status}).render().$el)
                return this
            
    $(document).ready ->
        $("#new-status").submit (e) ->
            e.preventDefault()
            status = new Status
                author: $("input[name=author]").val()
                content: $("input[name=content]").val()
            status_list.add status
            
            console.log status_list.toJSON()
            return false
        
        statusi_view = new StatusiView
define ["underscore", "backbone"], (_, Backbone) ->
    Status = Backbone.Model.extend
        defaults: ->
            author: ""
            content: ""
            reply: false
            depth: 0
    return Status
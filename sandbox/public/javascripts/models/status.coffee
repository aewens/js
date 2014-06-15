define ["underscore", "backbone"], (_, Backbone) ->
    Status = Backbone.Model.extend
        defaults: ->
            author: ""
            content: ""
    return Status
define ["underscore", "backbone"], (_, Backbone) ->
    X = Backbone.Model.extend
        defaults: ->
            key: "value"
    return X
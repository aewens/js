define ["underscore", "backbone"], (_, Backbone) ->
    Vertex = Backbone.Model.extend
        defaults: ->
            x: 0
            y: 0
            radius: 0
            
    return Vertex
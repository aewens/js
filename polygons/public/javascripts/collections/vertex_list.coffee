define ["underscore", "backbone", "models/vertex"], (_, Backbone, Vertex) ->
    VertexList = Backbone.Collection.extend
        model: Vertex
        initialize: ->
            this.sortVar = "node"
        comparator: (collection) ->
            that = this
            return collection.get(that.sortVar)
        
    return new VertexList
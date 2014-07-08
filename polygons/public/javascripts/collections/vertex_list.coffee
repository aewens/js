define ["underscore", "backbone", "models/vertex"], (_, Backbone, Vertex) ->
    VertexList = Backbone.Collection.extend
        model: Vertex
        
    return new VertexList
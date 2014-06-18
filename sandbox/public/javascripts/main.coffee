require.config
    # urlArgs: "nocache=" + (new Date).getTime()
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require [
    "jquery", 
    "underscore", 
    "backbone",
    "models/vertex",
    "collections/vertex_list",
    "views/vertex_view",
    "modules/vertex_ctrl"
], ($, _, Backbone, Vertex, VertexList,  VertexView) ->
    $(document).ready ->
        vertices = new VertexList
                
        vertex_view = (new VertexView).run(vertices)
        
        vertices.add new Vertex {x: 100, y: 100, radius: 10}
        setTimeout (->
            vertices.add new Vertex {x: 200, y: 200, radius: 10}
        ), 500
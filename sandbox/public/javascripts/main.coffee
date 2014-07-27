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
], ($, _, Backbone, Vertex, VertexList,  VertexView, VertexCtrl) ->
    $(document).ready ->
        vertex_view = new VertexView
        vertex_ctrl = new VertexCtrl
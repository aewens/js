require ["jquery", "underscore", "backbone", "model/x"], ($, _, Backbone, X) ->
    _.templateSettings =
        interpolate: /\{\{(.+?)\}\}/g
    
    XView = Backbone.View.extend
        model: X
        
    return XView
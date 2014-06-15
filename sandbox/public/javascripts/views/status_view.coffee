define [
    "underscore", 
    "backbone", 
    "models/status_list"
], (_, Backbone, StatusList) ->
    StatusView = Backbone.View.extend
        model: StatusList
        el: $(".page")
        
    return StatusView
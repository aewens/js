define ["underscore", "backbone", "collections/status"], (_, Backbone, Status) ->
    StatusiView = Backbone.View.extend
        model: Status
        
        
    return StatusiView
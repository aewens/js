define ["underscore", "backbone", "models/status"], (_, Backbone, Status) ->
    StatusList = Backbone.Collection.extend
        model: Status
        
    return StatusList 
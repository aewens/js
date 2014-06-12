define ["underscore", "backbone"], (_, Backbone) ->
    List = Backbone.Model.extend
        defaults:
            users: []
            
    return List
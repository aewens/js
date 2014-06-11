define ["underscore", "backbone"], (_, Backbone) ->
    Users = Backbone.Model.extend
        defaults:
            list: []
            
    return Users
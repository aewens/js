define ["underscore", "backbone"], (_, Backbone) ->
    Router = Backbone.Router.extend
        routes:
            "": "home"
            
    return Router
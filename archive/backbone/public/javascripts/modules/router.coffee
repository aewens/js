define ["underscore", "backbone"], (_, Backbone) ->
    Router = Backbone.Router.extend
        routes:
            "": "home"
            "new": "editUser"
            
    return Router
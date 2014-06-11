requirejs.config
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require [
    "underscore",
    "backbone",
    "modules/router",
    "views/userlist"
], (_, Backbone, Router, UserList) ->
    user_list = new UserList
    
    router = new Router
    router.on "route:home", ->
        user_list.render()
        
    Backbone.history.start()
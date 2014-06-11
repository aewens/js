requirejs.config
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require [
    "underscore",
    "backbone",
    "modules/router",
    "views/userlist",
    "models/users"
], (_, Backbone, Router, UserList, Users) ->
    user_list = new UserList {model: new Users}
    
    router = new Router
    router.on "route:home", ->
        user_list.render()
    router.on "route:editUser", ->
        console.log "Show user form"
        
    Backbone.history.start()
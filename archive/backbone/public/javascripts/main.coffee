requirejs.config
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require [
    "underscore",
    "backbone",
    "modules/router",
    "models/list"
    "views/userlist",
    "views/edituser"
], (_, Backbone, Router, List, UserList, EditUser) ->
    user_list = new UserList {model: new List}
    edit_user = new EditUser
    
    router = new Router
    router.on "route:home", ->
        user_list.render()
    router.on "route:editUser", ->
        edit_user.render()
        
    Backbone.history.start()
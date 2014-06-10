requirejs.config
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require ["modules/router", "backbone"], (Router, Backbone) ->
    router = new Router
    router.on "route:home", ->
        console.log "Home page"
        
    Backbone.history.start()
require.config
    urlArgs: "nocache=" + (new Date).getTime()
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require [
    "jquery", 
    "underscore", 
    "backbone"
], ($, _, Backbone) ->
    $(document).ready ->
        console.log "Document ready..."
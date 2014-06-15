require.config
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require [
    "jquery", 
    "underscore", 
    "backbone",
    "models/status",
    "collections/status_list"
], ($, _, Backbone, Status, Statuses) ->
    statuses = new Statuses
    
    $(document).ready ->
        $("#new-status").submit (e) ->
            status = new Status
                author: $("input[name=author]").val()
                content: $("input[name=content]").val()
            statuses.add status
            
            console.log statuses.toJSON()
            return false
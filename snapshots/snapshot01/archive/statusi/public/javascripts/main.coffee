require.config
    urlArgs: "nocache=" + (new Date).getTime()
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require [
    "jquery", 
    "underscore", 
    "backbone",
    "models/status",
    "collections/status_list",
    "views/statusi_view"
], ($, _, Backbone, Status, StatusList, StatusiView) ->
    status_list = new StatusList
            
    $(document).ready ->
        $("#new-status").submit (e) ->
            e.preventDefault()
            status = new Status
                author: $("input[name=author]").val()
                content: $("input[name=content]").val()
            status_list.add status
            # console.log status_list.toJSON()
            return false
        
        statusi_view = new StatusiView {model: status_list}
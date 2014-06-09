define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
    App = Backbone.Model.extend
            initialize: ->
                this.bind "change:other", ->
                    console.log "Update: \"" + this.get("other") + "\""
                this.bind "invalid", (model, error) ->
                    console.log error
            defaults:
                test: "default",
                other: null
            validate: (attrs) -> # attributes
                if attrs.test != "default"
                    return "`test` was changed to \"" + attrs.test + "\""
            
    return App
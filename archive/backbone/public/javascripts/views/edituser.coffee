define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
    $.fn.serailizeObject = ->
        o = {}
        a = this.serializeArray()
        $.each a, ->
            if o[this.name] != undefined
                if !o[this.name].push
                    o[this.name] = [o[this.name]]
                o[this.name].push this.value || ""
            else
                o[this.name] = this.value || ""
        return o
    
    EditUser = Backbone.View.extend
        el: ".page"
        render: ->
            template = _.template($("#edit_user").html(), {})
            this.$el.html template
        events:
            "submit #edit_user_form": "saveUser"
        saveUser: (e) ->
            user_creds = $(e.currentTarget).serailizeObject()
            console.log user_creds
            return false
            
    return EditUser
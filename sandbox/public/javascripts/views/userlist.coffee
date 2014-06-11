define [
    "jquery",
    "underscore",
    "backbone"
], ($, _, Backbone) ->
    UserList = Backbone.View.extend
        initialize: ->
            this.model.on "change", this.render, this
        el: ".page"
        render: ->
            self = this
            $.get "/javascripts/data/users.json", (data) ->
                if self.model.get("list") != [] 
                    self.model.set("list", data)
            users = this.model.get("list")
            template = _.template($("#user_list").html(), {users: users})
            this.$el.html template
            
    return UserList
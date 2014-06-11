define [
    "jquery",
    "underscore",
    "backbone",
    "modules/users"
], ($, _, Backbone, Users) ->
    UserList = Backbone.View.extend
        el: ".page"
        render: ->
            users = new Users
            template = _.template($("#user_list_tmpl").html(), 
                                    {users: users.get("list")})
            this.$el.html template
            
    return UserList
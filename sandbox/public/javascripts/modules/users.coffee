define ["underscore", "backbone"], (_, Backbone) ->
    Users = Backbone.Model.extend
            initialize: ->
                console.log "Loading users..."
            defaults:
                list: [
                    {username: "root", first: "_", last: "_"},
                    {username: "admin", first: "Admin", last: "Istrator"},
                    {username: "guest", first: "Guest", last: "Guest"},
                    {username: "anonymous", first: "Anon", last: "Ymous"},
                    {username: "banned", first: "Who", last: "Cares"},
                    {username: "generic", first: "Gen", last: "Eric"},
                    {username: "username", first: "User", last: "Name"},
                    {username: "camel_case", first: "Camel", last: "Case"},
                    {username: "not_nsa", first: "Edward", last: "Snowden"},
                    {username: "l33t_hacker", first: "Leet", last: "Hacker"},
                    {username: "asdfas", first: "Asdfas", last: "Hjklhj"},
                    {username: "qwerty", first: "Qwerty", last: "Uiop"},
                    {username: "bot", first: "Google", last: "Bot"},
                    {username: "kai", first: "K", last: "Ai"}
                ]
            
    return Users
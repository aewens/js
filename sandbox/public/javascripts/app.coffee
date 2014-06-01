# Angular
app = angular.module "sandbox", ["ngRoute"]

app.controller "HelpCtrl", ($scope) ->
    $scope.header =
        command:     "Command"
        description: "Description"
    $scope.helper = [
        {command: "help",   description: "See what you are reading now."},
        {command: "clear",  description: "Revert back to original state."},
        {command: "reload", description: "Reload the current page."},
        {command: "posts",  description: "Redirects to the 'posts' page."}
    ]
        
app.config ($routeProvider) ->
    $routeProvider
    .when "/",
        # controller: "HelpCtrl"
        templateUrl: "partials/index"
    .otherwise
        redirectTo: "/error"
        templateUrl: "partials/404"

# Effects
run = ->
    cmd   = $(".cmd")
    sheet = $(".sheet")
    
    # Will display error in console if this is undefined
    check = document.getElementsByClassName("cmd")[0].style.width
    
    cmd.width (cmd.width() - 26) + "px"
    cmd.focus()

    help = ->
        cmd.addClass "shift"
        sheet.addClass "shift"
        # sheet.html help_text()
    
    clear = ->
        cmd.removeClass "shift"
        sheet.removeClass "shift"
        # sheet.html ""
        
    redirect = (path) ->
        window.location.href = "http://" + window.location.host + "/" + path
    
    cmd.keypress (e) ->
        if e.keyCode == 13
            txt = cmd.val()
            cmd.val ""
            dir =
                "up":    "top"
                "down":  "bottom"
                "left":  "left"
                "right": "right"
            if dir[txt] != undefined
                cache = cmd.css dir[txt]
                if cache == "" then cache = 0
                cmd.css dir[txt], (parseFloat(cache) - 100) + "px"
            else
                switch txt
                    when "help" then help()
                    when "clear" then clear()
                    when "reload" then document.location.reload true
                    when "posts" then redirect "posts"
                    else return
                        
# Hack to make everything work
setTimeout run, 500
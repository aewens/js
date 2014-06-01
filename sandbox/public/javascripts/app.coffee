# Angular
app = angular.module "sandbox", ["ngRoute"]

app.config ($routeProvider) ->
    $routeProvider
        .when "/",
            templateUrl: "partials/index"
        .otherwise
            redirectTo: "/error"
            templateUrl: "partials/404"

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
    
app.directive "enter", ->
    restrict: "A"
    scope: {}
    controller: class CommandCtrl
        constructor: ($scope) ->
            $scope.help = ->
                $(".cmd").addClass "shift"
                $(".sheet").addClass "shift"
            
            $scope.clear = ->
                $(".cmd").removeClass "shift"
                $(".sheet").removeClass "shift"
                
            $scope.redirect = (path) ->
                window.location.href = 
                    "http://" + window.location.host + "/" + path
                
    link: (scope, element) ->
        element.bind "keypress", (e) ->
            if e.keyCode == 13
                # scope.$apply attrs.enter
                text = $(".cmd").val()
                $(".cmd").val ""
                dir =
                    "up":    "top"
                    "down":  "bottom"
                    "left":  "left"
                    "right": "right"
                if dir[text] != undefined
                    cache = $(".cmd").css dir[txt]
                    if cache == "" then cache = 0
                    $(".cmd").css dir[text], (parseFloat(cache) - 100) + "px"
                else
                    switch text
                        when "help" then scope.help()
                        when "clear" then scope.clear()
                        when "reload" then scope.redirect ""
                        when "posts" then scope.redirect "posts"
                        else return
                        
# Effects
run = ->
    # Will display error in console if this is undefined
    check = document.getElementsByClassName("cmd")[0].style.width
    
    cmd   = $(".cmd")
    sheet = $(".sheet")
    
    cmd.width (cmd.width() - 26) + "px"
    cmd.focus()
                        
# Hack to make things work
setTimeout run, 500
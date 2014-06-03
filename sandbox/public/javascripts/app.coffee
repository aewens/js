# Angular
app = angular.module "sandbox", ["ngRoute"]

app.config ($routeProvider) ->
    $routeProvider
        .when "/",
            controller: "HelpCtrl"
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
        {command: "canvas", description: "Load the <canvas> onto the page."}
    ]
    
app.directive "enter", ->
    restrict: "A"
    scope: {}
    controller: class CommandCtrl
        constructor: ($scope) ->
            $scope.help = ->
                $(".cmd").addClass("shift")
                $(".sheet").addClass("shift")
            
            $scope.clear = ->
                $(".cmd").removeClass("shift")
                $(".sheet").removeClass("shift")
                
            $scope.redirect = (path) ->
                window.location.href = 
                    "http://" + window.location.host + "/" + path
            
            $scope.show_canvas = ->
                cmd    = document.getElementsByClassName("cmd")[0]
                parent = document.getElementsByClassName("view")[0]
                spawn  = document.getElementById("canvas")
                
                cmd.classList.add("shift")
                
                if spawn.innerHTML == ""
                    canvas = document.createElement("canvas")
                    text   = "Your browser does not support &lt;canvas&gt;, " +
                             "try one of <a href='http://browsehappy.com'>" +
                             "these</a> instead."
                    canvas.innerHTML = text
                    spawn.appendChild(canvas)
                    
                    spawn.style.width = parent.offsetWidth
                    canvas.width  = spawn.offsetWidth / 2
                    canvas.height = canvas.width / 16 * 9
                    canvas_margin = (spawn.offsetWidth - canvas.width) / 2
                    canvas.style.margin = "0 " + canvas_margin + "px"
                    canvas.style.borderRadius = "5px"
                    canvas.style.boxShadow = "0 3px 5px 0 rgba(0, 0, 0, 0.5)," +
                                             "0 3px 0 -2px rgba(0,0,0,0.1)"
                    
                    cw  = canvas.width
                    ch  = canvas.height
                    ctx = canvas.getContext("2d")
                    
                    ctx.fillStyle = "#000"
                    ctx.fillRect(0, 0, cw, ch)
                else return
                
    link: (scope, element) ->
        element.bind "keypress", (e) ->
            if e.keyCode == 13
                # scope.$apply attrs.enter
                text = $(".cmd").val()
                $(".cmd").val("")
                dir =
                    "up":    "top"
                    "down":  "bottom"
                    "left":  "left"
                    "right": "right"
                if dir[text] != undefined
                    cache = $(".cmd").css(dir[txt])
                    if cache == "" then cache = 0
                    $(".cmd").css(dir[text], (parseFloat(cache) - 100) + "px")
                else
                    switch text
                        when "help" then scope.help()
                        when "clear" then scope.clear()
                        when "reload" then scope.redirect("")
                        when "posts" then scope.redirect("posts")
                        when "canvas" then scope.show_canvas()
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
setTimeout(run, 500)
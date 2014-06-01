# Effects
window.onload = ->
    cmd = document.getElementsByClassName("cmd")[0]
    cmd.focus()
    cmd.onkeydown = (e) ->
        keyCode = if e.which then e.which else e.keyCode
        if keyCode == 13
            text = cmd.value
            cmd.value = ""
            dir =
                "up":    "top"
                "down":  "bottom"
                "left":  "left"
                "right": "right"
            if dir[text] != undefined
                cache = cmd.style[dir[text]]
                if cache == "" then cache = 0
                cmd.style[dir[text]] = (parseFloat(cache) - 100) + "px"
            else
                switch text
                    when "clear"
                        cmd.style.top   = 0
                        cmd.style.down  = 0
                        cmd.style.left  = 0
                        cmd.style.right = 0
                    else return

# Angular
app = angular.module "sandbox", ["ngRoute"]

app.controller "IndexCtrl", ->
app.config ($routeProvider) ->
    $routeProvider
    .when "/",
        templateUrl: "partials/index"
    .otherwise
        redirectTo: "/error"
        templateUrl: "partials/404"
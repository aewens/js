# Effects
window.onload = ->
    cmd   = document.getElementsByClassName("cmd")[0]
    sheet = document.getElementsByClassName("sheet")[0]
    
    cmd.style.width = (parseFloat(cmd.offsetWidth) - 52) + "px"
    cmd.focus()
    
    help_text = ->
        text = ""
        text = text + "<p><strong>Command</strong> <strong class='pull-right'>
                        Description</strong></p>"
        text = text + "<p>help <em class='pull-right'>
                        See what you are reading now.</em></p>"
        text = text + "<p>clear <em class='pull-right'>
                        Revert back to original state.</em></p>"

    help = ->
        cmd.classList.add "shift"
        sheet.classList.add "shift"
        sheet.innerHTML = help_text()
    
    clear = ->
        cmd.classList.remove "shift"
        sheet.classList.remove "shift"
        sheet.innerHTML = ""
    
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
                    when "help" then help()
                    when "clear" then clear()
                    when "reload" then document.location.reload true
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
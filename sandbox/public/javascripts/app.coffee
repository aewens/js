# Effects
window.onload = ->
    cmd   = $(".cmd")
    sheet = $(".sheet")
    
    cmd.width (cmd.width() - 26) + "px"
    cmd.focus()
    
    help_text = ->
        header = (cmd, desc) ->
            text = ""
            text = text + "<p><strong>" + cmd + "</strong>"
            text = text + "<strong class='pull-right'>" + desc + "</strong></p>"
        format = (cmd, desc) ->
            "<p>" + cmd + "<em class='pull-right'>" + desc + "</em></p>"
                
        text = ""
        text = text + header "Command", "Description"
        text = text + format "help",    "See what you are reading now."
        text = text + format "clear",   "Revert back to original state."
        text = text + format "reload",   "Reload the current page."

    help = ->
        cmd.addClass "shift"
        sheet.addClass "shift"
        sheet.html help_text()
    
    clear = ->
        cmd.removeClass "shift"
        sheet.removeClass "shift"
        sheet.html ""
    
    cmd.keypress (e) ->
        if e.keyCode == 13
            text = cmd.val()
            cmd.val ""
            dir =
                "up":    "top"
                "down":  "bottom"
                "left":  "left"
                "right": "right"
            if dir[text] != undefined
                cache = cmd.css dir[text]
                if cache == "" then cache = 0
                cmd.css dir[text], (parseFloat(cache) - 100) + "px"
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
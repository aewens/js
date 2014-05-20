app = angular.module "canvasApp", ["ngCookies","ngResource","ngSanitize","ngRoute"]

canvas = null
ctx    = null
w      = null
h      = null

create_canvas = ->
    ct = "Your browser does not support &lt;canvas&gt;, " +
         "try one of <a href='#'>these</a> instead."
         
    canvas = document.createElement "canvas"
    ctext  = document.createTextNode ct
    document.getElementById("spawn-canvas").appendChild(canvas).appendChild(ctext)

    cpad   = window.getComputedStyle(canvas, null).getPropertyValue "padding"
    cbrdr  = window.getComputedStyle(canvas, null).getPropertyValue "border-width"
    coffs  = parseInt(cpad) * 2 + parseInt(cbrdr) * 2
    cwidth = document.getElementsByClassName("main-content")[0].offsetWidth - coffs

    w = canvas.width  = cwidth
    h = canvas.height = canvas.width / 16 * 9

    ctx = canvas.getContext "2d"

pixel = (color, coords) ->
    canvas.getContext("2d").fillStyle = color
    canvas.getContext("2d").fillRect coords[0], coords[1], 1, 1

block = (color, coords, s) -> # s == scale
    canvas.getContext("2d").fillStyle = color
    canvas.getContext("2d").fillRect coords[0] * s, coords[1] * s, s, s
    
requestAnimFrame =
    window.requestAnimationFrame       || 
    window.webkitRequestAnimationFrame || 
    window.mozRequestAnimationFrame    || 
    window.oRequestAnimationFrame      || 
    window.msRequestAnimationFrame
    
cancelAnimationFrame =
    window.cancelAnimationFrame       || 
    window.webkitCancelAnimationFrame || 
    window.mozCancelAnimationFrame    || 
    window.oCancelAnimationFrame      || 
    window.msCancelAnimationFrame
    
requestID = null
      
i = parseInt("100",16)
draw = ->
    # Updates
    
    # Clear
    ctx.clearRect 0, 0, w, h
    ctx.fillStyle = "#000"
    ctx.fillRect 0, 0, w, h
    
    #Render
    ctx.fillStyle = "#"+i.toString 16
    ctx.fillRect 0, 0, w, h
                    
    i = if i == parseInt("fff",16) then parseInt("100",16) else i + 1
    
    # Recurse
    requestID = requestAnimFrame draw
    
document.onkeydown = (e) ->
    if !e then e = window.event
    cmd = document.getElementById("cmd")
    if e.target != cmd
        keyCode = if e.keyCode then e.keyCode else e.which
        if keyCode == 27
                cmd.focus()

cmd = document.getElementById("cmd")
cmd.onkeypress = (e) ->
    if !e then e = window.event
    if e.keyCode == 13 || e.which == 13
        command   = cmd.value.toLowerCase()
        exists    = document.getElementsByTagName("canvas")[0] != undefined
        cmd.value = ""
        switch command
            when "start"
                if exists
                    requestID = requestAnimationFrame draw
            when "stop"
                if exists
                    cancelAnimationFrame requestID
            when "clear"
                if exists
                    cancelAnimationFrame requestID
                    ctx.clearRect 0, 0, w, h
            when "create"
                if !exists
                    create_canvas()
            when "remove"
                if exists
                    canvas.parentNode.removeChild canvas
            else console.log "Invalid command"
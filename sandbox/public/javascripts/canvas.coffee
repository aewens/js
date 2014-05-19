canvas = document.getElementsByTagName("canvas")[0]
cpad   = window.getComputedStyle(canvas, null).getPropertyValue "padding"
cbrdr  = window.getComputedStyle(canvas, null).getPropertyValue "border-width"
coffs  = parseInt(cpad) * 2 + parseInt(cbrdr) * 2
cwidth = document.getElementsByClassName("main-content")[0].offsetWidth - coffs

w = canvas.width  = cwidth
h = canvas.height = canvas.width / 16 * 9

ctx = canvas.getContext "2d"
ctx.font = "16px Arial"

# Background
ctx.fillStyle = "#000"
ctx.fillRect 0, 0, w, h

pixel = (color, coords) ->
    canvas.getContext("2d").fillStyle = color
    canvas.getContext("2d").fillRect coords[0], coords[1], 1, 1
    
requestAnimFrame =
    window.requestAnimationFrame       || 
    window.webkitRequestAnimationFrame || 
    window.mozRequestAnimationFrame    || 
    window.oRequestAnimationFrame      || 
    window.msRequestAnimationFrame

draw = ->
    # Updates
    
    # Clear
    ctx.clearRect 0, 0, w, h
    ctx.fillStyle = "#000"
    ctx.fillRect 0, 0, w, h
    
    # Render
    ctx.fillStyle = "#fff"
    ctx.fillText "<canvas>", 16, 32
    
    # Recurse
    requestAnimFrame draw
    
draw()
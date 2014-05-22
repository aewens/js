class Canvas
    constructor: ->
        this.canvas = null
        this.ctx    = null
        this.w      = null
        this.h      = null
        this.screen = null
    
    create_canvas: ->
        ct = "Your browser does not support &lt;canvas&gt;, " +
             "try one of <a href='#'>these</a> instead."
             
        this.canvas = document.createElement "canvas"
        ctext  = document.createTextNode ct
        document.getElementById("spawn-canvas").appendChild(this.canvas).appendChild(ctext)

        cpad   = window.getComputedStyle(this.canvas, null).getPropertyValue "padding"
        cbrdr  = window.getComputedStyle(this.canvas, null).getPropertyValue "border-width"
        coffs  = parseInt(cpad) * 2 + parseInt(cbrdr) * 2
        cwidth = document.getElementsByClassName("main-content")[0].offsetWidth - coffs

        this.w = this.canvas.width  = cwidth
        this.h = this.canvas.height = this.canvas.width / 16 * 9

        this.ctx = this.canvas.getContext "2d"

    block: (color, coords, s) -> # s == scale
        this.canvas.getContext("2d").fillStyle = color
        this.canvas.getContext("2d").fillRect coords[0] * s, coords[1] * s, s, s

    pixel: (color, coords) ->
        block color, coords, 1

    spawn: ->
        console.log "Spawned!"
        height = Math.floor this.canvas.height
        width  =  Math.floor this.canvas.width
        this.screen = new Screen width, height
            
            
        
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
        
c = new Canvas
        
# i = parseInt("100",16)
requestID = null
draw = ->
    # Updates
    
    # Clear
    this.ctx.clearRect 0, 0, w, h
    this.ctx.fillStyle = "#000"
    this.ctx.fillRect 0, 0, w, h
    
    #Render
    # ctx.fillStyle = "#"+i.toString 16
    # ctx.fillRect 0, 0, w, h
    #                 
    # i = if i == parseInt("fff",16) then parseInt("100",16) else i + 1
    
    # Recurse
    requestID = requestAnimFrame draw
    
cmd = document.getElementById("cmd")
document.onkeydown = (e) ->
    if !e then e = window.event
    if e.target != cmd
        keyCode = if e.keyCode then e.keyCode else e.which
        if keyCode == 27
                cmd.focus()

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
                    c.ctx.clearRect 0, 0, w, h
            when "create"
                if !exists
                    c.create_canvas()
                    c.spawn()
            when "remove"
                if exists
                    c.canvas.parentNode.removeChild canvas
            else console.log "Invalid command"
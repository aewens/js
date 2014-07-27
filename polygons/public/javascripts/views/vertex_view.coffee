define [
    "underscore", 
    "backbone", 
    "collections/vertex_list"
], (_, Backbone, model) ->
    ctx           = canvas.getContext("2d")
    canvas.width  = canvas.parentElement.offsetWidth
    canvas.height = canvas.parentElement.offsetHeight
    
    class VertexView
        constructor: ->
            model.on("add", this.render, this)
            model.on("change", this.render, this)
            model.on("remove", this.render, this)
        render: ->
            ctx.clearRect(0, 0, canvas.width, canvas.height)
            model.sort(model)
            
            self = this
            
            ctx.beginPath()
            prev = model.last() # set to null to disable node polygonify
            ctx.moveTo prev.get("x"), prev.get("y")
            model.each (curr) -> ctx.lineTo curr.get("x"), curr.get("y")
            ctx.closePath()
            ctx.fillStyle = "#ccc"
            ctx.fill()
            ctx.stroke()
            model.each(this.render_vertex)
                
        render_vertex: (vertex) -> 
            x      = vertex.get "x"
            y      = vertex.get "y"
            radius = vertex.get "radius"
            ctx.beginPath()
            ctx.arc(x, y, radius, 0, 2 * Math.PI)
            ctx.closePath()
            ctx.fillStyle = "#000"
            ctx.fill()
            
    return VertexView
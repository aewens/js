define ["underscore", "backbone"], (_, Backbone) ->
    ctx           = canvas.getContext("2d")
    canvas.width  = canvas.parentElement.offsetWidth
    canvas.height = canvas.width / 16 * 9
    
    class VertexView
        run: (model) ->
            this.model = model
            this.model.on("add", this.render, this)
            this.model.on("remove", this.render, this)
        render: ->
            ctx.clearRect(0, 0, canvas.width, canvas.height)
            this.model.each(this.renderVertex)
        renderVertex: (vertex) ->
            x      = vertex.get "x"
            y      = vertex.get "y"
            radius = vertex.get "radius"
            ctx.beginPath()
            ctx.arc(x, y, radius, 0, 2 * Math.PI)
            ctx.closePath()
            ctx.fill()
            
    return VertexView
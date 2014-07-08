define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->    
    c             = $("#canvas")[0]
    ctx           = c.getContext("2d")
    canvas.width  = c.parentElement.offsetWidth
    canvas.height = c.width / 16 * 9
    
    VertexView = Backbone.View.extend
        initialize: ->
            this.model.on("add", this.render, this)
            this.model.on("remove", this.render, this)
        render: ->
            ctx.clearRect(0, 0, c.width, c.height)
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
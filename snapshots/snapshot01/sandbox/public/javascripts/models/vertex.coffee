define ["underscore", "backbone"], (_, Backbone) ->
    Vertex = Backbone.Model.extend
        defaults: ->
            x: 0
            y: 0
            radius: 0
            node: 0
        contains: (x, y, radius) ->
            dx       = x - this.get("x")
            dy       = y - this.get("y")
            distance = Math.sqrt dx*dx + dy*dy
            
            return distance <= radius
            
    return Vertex
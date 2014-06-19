define [
    "underscore", 
    "backbone", 
    "models/vertex",
    "collections/vertex_list"
], (_, Backbone, Vertex, model) ->
    class VertexCtrl
        constructor: ->
            self = this
            vertex_being_dragged = null
            
            canvas.addEventListener "mousedown", (e) ->
                keyCode = e.which or e.keyCode
                switch keyCode
                    when 1
                        if vertex_being_dragged then vertex_being_dragged = null
                        else
                            vertex_being_dragged = 
                                self.findVertex(e.pageX, e.pageY)
                            if !vertex_being_dragged
                                vertex = new Vertex
                                    x: e.pageX
                                    y: e.pageY
                                    radius: 10
                            
                            model.add(vertex)
                    when 3
                        model.remove self.findVertex(e.pageX, e.pageY)
                        window.oncontextmenu = ->
                            return false
                    else null
                        
            canvas.addEventListener "mousemove", (e) ->
                if vertex_being_dragged
                    vertex_being_dragged.set
                        x: e.pageX
                        y: e.pageY
                        
            document.onkeydown = (e) ->
                keyCode = e.which or e.keyCode
                if keyCode == 27
                    model.remove(vertex_being_dragged)
                    # vertex_being_dragged = null
                    
            # Uncomment to make mouseup disable dragging
            # canvas.addEventListener "mouseup", (e) ->
            #     vertex_being_dragged = null
                    
        findVertex: (x, y) ->
            model.find (vertex) ->
                vertex.contains(x, y, vertex.get("radius"))
    
    return VertexCtrl
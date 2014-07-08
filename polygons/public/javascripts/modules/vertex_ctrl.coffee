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
                                node = null
                                if model.length <= 2 then node = model.length
                                else
                                    ds = []
                                    model.each (v) ->
                                        x1 = v.get("x")
                                        y1 = v.get("y")
                                        x0 = e.pageX
                                        y0 = e.pageY
                                        d0 = Math.pow(x1-x0,2)+Math.pow(y1-y0,2)
                                        d1 = Math.round(Math.sqrt(d0))
                                        n  = v.get("node")
                                        ds.push [n,d1]
                                    order = ds.sort (a,b) -> return a[1] - b[1]
                                    pair  = [order[0],order[1]].sort (a,b) ->
                                                return a - b
                                    if pair[0][0] == 0 and
                                       pair[1][0] == model.length - 1
                                        node = model.length
                                    else
                                        node = pair[1][0]
                                        model.each (v) ->
                                            if v.get("node") >= node
                                                v.set("node", v.get("node") + 1)
                                    
                                    console.log node
                                    
                                vertex = new Vertex
                                    x: e.pageX
                                    y: e.pageY
                                    radius: 10
                                    node: node
                            
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
                    node = vertex_being_dragged.get("node")
                    model.remove(vertex_being_dragged)
                    model.each (v) ->
                        if v.get("node") > node
                            v.set("node", v.get("node") - 1)
                    # vertex_being_dragged = null
                    
            # Uncomment to make mouseup disable dragging
            # canvas.addEventListener "mouseup", (e) ->
            #     vertex_being_dragged = null
                    
        findVertex: (x, y) ->
            model.find (vertex) ->
                vertex.contains(x, y, vertex.get("radius"))
    
    return VertexCtrl
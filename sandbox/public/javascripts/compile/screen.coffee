class Screen
    constructor: (width, height) ->
        this.width  = width
        this.height = height
        this.pixels = new Array width * height
    
    test: ->
        console.log this.width
        console.log this.height
        console.log this.pixels.length
        
    render: ->
        for y in [0..63] by 1 #[0..this.height-1] by 1
            for x in [0..63] by 1 #[0..this.width-1] by 1
                this.pixels[x + y * this.width] = "#789"
        # console.log this.pixels
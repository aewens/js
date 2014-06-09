requirejs.config
    paths: 
        "jquery":     "../vendor/jquery/dist/jquery.min"
        "underscore": "../vendor/underscore/underscore"
        "backbone":   "../vendor/backbone/backbone"
        
require ["models/test"], (TestModel) ->
    view0 = new TestModel
    view1 = new TestModel { test: "parameter" }
    view2 = new TestModel
    
    console.log view0.get "test"
    console.log view1.get "test"
    console.log view2.get "test"
    
    view2.set "test", "setter", {validate: true}
    view2.set
        test: "setters"
        other: "nil"
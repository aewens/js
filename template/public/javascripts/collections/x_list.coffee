define ["underscore", "backbone", "models/x"], (_, Backbone, X) ->
    Xs = Backbone.Collection.extend
        model: X
        
    return Xs
title = "Sandbox"
Post  = require("./models/post")

exports.index = (req, res) ->
    res.render "index", { title : title }

exports.posts = (req, res) ->
    Post.find({}).sort("-date").exec (err, posts) ->
        if err then console.log err
        
        res.render "feed", 
        { title : title, layout : "posts", posts : posts.reverse() }

exports.new_post = (req, res) ->
    post = new Post
        title:  req.body.title
        author: req.body.author
        slug:   req.body.slug
        body:   req.body.body
        
    post.save (err) ->
        if err then console.log err
        else res.redirect "/posts"

exports.partials = (req, res) ->
    res.render "partials/" + req.params.name, { title : title }

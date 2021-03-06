// Generated by CoffeeScript 1.6.3
(function() {
  var Post, title;

  title = "Sandbox";

  Post = require("./models/post");

  exports.index = function(req, res) {
    return res.render("index", {
      title: title
    });
  };

  exports.posts = function(req, res) {
    return Post.find({}).sort("-date").exec(function(err, posts) {
      if (err) {
        console.log(err);
      }
      return res.render("feed", {
        title: title,
        layout: "posts",
        posts: posts.reverse()
      });
    });
  };

  exports.new_post = function(req, res) {
    var post;
    post = new Post({
      title: req.body.title,
      author: req.body.author,
      slug: req.body.slug,
      body: req.body.body
    });
    return post.save(function(err) {
      if (err) {
        return console.log(err);
      } else {
        return res.redirect("/posts");
      }
    });
  };

  exports.partials = function(req, res) {
    return res.render("partials/" + req.params.name, {
      title: title
    });
  };

}).call(this);

#Module dependencies
express  = require "express"
stylus   = require "stylus"
nib      = require "nib"
route    = require "./routes"
mongoose = require "mongoose"

mongoose.connect "mongodb://localhost/postsdb"

#Express yourself!
app = express()

#Setup: Begin
compile= (str, path) ->
    stylus(str).set("filename", path).use(nib())
        
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use express.logger "dev"
app.use stylus.middleware
    src:     __dirname + "/public"
    compile: compile

app.use express.static __dirname + "/public"
app.use express.bodyParser()
#Setup: End

#Routes
app.get  "/", route.index
app.get  "/partials/:name", route.partials
app.get  "/new", route.index
app.post "/new", route.new_post

#Launch
app.listen 8123
console.log "Node @ http:#localhost:8123...\n"
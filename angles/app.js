//Module dependencies
var express = require('express'),
	stylus	= require('stylus'),
	nib		= require('nib'),
	route 	= require('./routes')

//Express yourself!
var app = express()

//Setup: Begin
function compile(str, path) {
	return stylus(str)
		.set('filename', path)
		.use(nib())
}
app.set('views', __dirname + '/views')
app.set('view engine', 'jade')
app.use(express.logger('dev'))
app.use(stylus.middleware(
	{ src: 		__dirname + '/public',
	  compile: 	compile
	}
))
app.use(express.static(__dirname + '/public'))
//Setup: End

//Routes
app.get('/', route.index)
app.get('/partials/:name', route.partials)
app.get('*', route.index)

//Launch
app.listen(8123)
console.log("Node @ http://localhost:8123...\n")
app = angular.module "nglearnApp", ["ngCookies","ngResource","ngSanitize","ngRoute"]

app.controller "TestCtrl",
class TestCtrl
    constructor: ($scope) ->
        $scope.data = message: "World"

app.controller "ThisCtrl",
class ThisCtrl 
    constructor: ($scope) ->
app.controller "ThatCtrl",
class ThisCtrl
    constructor: ($scope) ->

app.factory "Share", ->
    message: "Sharing is caring"

app.filter "mirror", (Share) ->
    (text) ->
        text.split("").reverse().join("") + " " + Share.message

app.controller "RedCtrl",
class RedCtrl
    constructor: ($scope, Share) ->
        $scope.share = Share;

app.controller "BlueCtrl",
class BlueCtrl
    constructor: ($scope, Share) ->
        $scope.share = Share

        $scope.flipMessage = (message) ->
            message.split("").reverse().join("")

app.factory "Project", ->
    tools:
        [
            {name: "Node.js",       isFor: "Server"}
            {name: "Express",       isFor: "Framework"}
            {name: "Jade",          isFor: "HTML"}
            {name: "Stylus",        isFor: "CSS"}
            {name: "Coffeescript",  isFor: "JavaScript"}
            {name: "AngularJS",     isFor: "MVC"}
        ]

app.controller "ProjectCtrl", 
class ProjectCtrl
    constructor: ($scope, Project) ->
        $scope.project = Project

app.directive "fromjs", ->
    restrict: "E"
    template: "<span>App.js made me!</span>"

app.directive "fromjs", ->
    restrict: "A"
    link: ->
        console.log "App.js made me here!"

app.directive "stacked", ->
    restrict: "A"
    link: ->
        console.log "App.js stacked me here!"

app.directive "fromjs", ->
    restrict: "C"
    link: ->
        span = document.createElement "span"
        text = document.createTextNode "App.js made me, too!"
        document.getElementById("fromjs").appendChild(span).appendChild(text)

app.directive "enter", ->
    (scope, element) ->
        element.bind "mouseenter", ->
            element.addClass "emphasis"

app.directive "leave", ->
    (scope, element) ->
        element.bind "mouseleave", ->
            element.removeClass "emphasis"












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

app.directive "hoveron", ->
    (scope, element, attrs) ->
        element.bind "mouseenter", ->
            element.addClass attrs.hoveron

app.directive "hoveroff", ->
    (scope, element, attrs) ->
        element.bind "mouseleave", ->
            element.removeClass attrs.hoveron

app.controller "TwitterCtrl",
class TwitterCtrl
    constructor: ($scope) ->
        $scope.loadMoreTweets = ->
            console.log "Loading tweets..."
        $scope.deleteTweets = ->
            console.log "Deleting tweets..."

app.directive "enter", ->
    (scope, element, attrs) ->
        element.bind "mouseenter", ->
            scope.$apply attrs.enter

app.directive "player", ->
    restrict: "E"
    scope: {}
    controller: class Player
        constructor: ($scope) ->
            $scope.powers = []
            this.addHealth = ->
                $scope.powers.push "health"
            this.addStrength = ->
                $scope.powers.push "stregth"
            this.addDefense = ->
                $scope.powers.push "defense"
    link: (scope, element) ->
        element.bind "mouseenter", ->
            console.log scope.powers

app.directive "health", ->
    require: "player"
    link: (scope, element, attrs, player) ->
        player.addHealth()

app.directive "strength", ->
    require: "player"
    link: (scope, element, attrs, player) ->
        player.addStrength()

app.directive "defense", ->
    require: "player"
    link: (scope, element, attrs, player) ->
        player.addDefense()

app.controller "TaskCtrl",
class TaskCtrl
    constructor: ($scope) ->
        $scope.logTask = (task) ->
            div  = document.createElement("div")
            text = document.createTextNode task + " is done!"
            document.getElementById("tasks").appendChild(div).appendChild(text)

app.directive "servant", ->
    restrict: "A"
    scope: 
        done: "&"
    template: "<input type='text' ng-model='task' class='form-control'>" +
              "<h3>{{task}}</h3>" +
              "<span ng-click='done({task:task})'>Click me!</span>"

app.filter "capitalise", ->
    (text) ->
        text.substring(0,1).toUpperCase() + text.substring 1

app.directive "icecream", ->
    scope: flavor: "@" #scope.flavor = attrs.flavor
    template: "Today's ice cream flavor is: <span>{{flavor | capitalise}}</span>"












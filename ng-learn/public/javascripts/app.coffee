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
    message: "Lorem ipsum"

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
    template: "<input type='text' ng-model='task' placeholder='Task' class='form-control'>" +
              "<h3>{{task}}</h3>" +
              "<span ng-click='done({task:task})'>Click me!</span>"

app.filter "capitalise", ->
    (text) ->
        text.substring(0,1).toUpperCase() + text.substring 1

app.controller "FlavorCtrl",
class FlavorCtrl
    constructor: ($scope) ->
        $scope.icecream = "vanilla"

app.directive "icecream", ->
    scope: 
        flavor: "@"
    template: "Today's ice cream flavor is: <span>{{flavor | capitalise}}</span>"

app.controller "ChoiceCtrl",
class ChoiceCtrl
    constructor: ($scope) ->
        $scope.drink = "soda"

app.directive "drink", ->
    scope: 
        choice: "="
    template: "Today's drink choice is: <span>{{choice | capitalise}}</span>"

app.controller "PhoneCtrl",
class PhoneCtrl
    constructor: ($scope) ->
        $scope.callHome = (message) ->
            console.log "You said: " + (message || "nothing...")

app.directive "phone", ->
    scope:
        dial: "&"
    template: "<input type='input' ng-model='value' placeholder='Message' class='form-control'>" +
              "<span class='hover' ng-click='dial({message:value})'>Phone home</span>"

app.controller "MessageCtrl",
class MessageCtrl
    constructor: ($scope) ->
        $scope.sendMessage = (server, user, message) ->
            console.log user + "@" + server + ": " + message

app.directive "client", ->
    restrict: "E"
    scope:
        server:  "@"
        user:    "="
        ping: "&"
    template: "<div>Server: {{server}}</div>" +
              "<input type='text' ng-model='name' placeholder='Username' class='form-control'>" +
              "<input type='text' ng-model='value' placeholder='Message' class='form-control'>" +
              "<span class='hover' ng-click='ping({server: server, user: name, message: value})'>Send</span>"

app.directive "transclusion", ->
    restrict: "E"
    transclude: true
    template: "<span>Hello from &lt;transclusion&gt;</span><div ng-transclude></div>"

someApp = {}
someApp.controllers = {}
someApp.controllers.SomeCtrl = 
class SomeCtrl
    constructor: ($scope) ->
        this.someFunc = ->
            console.log "I do something"

        return $scope.SomeCtrl = this

app.controller someApp.controllers

app.directive "showhide", ->
    restrict: "E"
    transclude: true
    scope:
        title: "@"
    template: "<h2 ng-click='toggleContent()' class='hover'>{{title}}</h2>" +
              "<span ng-show='isContentVisible' ng-transclude></span>"
    link: (scope) ->
        scope.isContentVisible = false
        scope.toggleContent = ->
            scope.isContentVisible = !scope.isContentVisible

app.directive "passwordy", ->
    returnElement = angular.element "<h3>{{model.password}}</h3>"
    this.link = (scope, element) ->
            scope.$watch "model.password", (value) ->
                if value != undefined and value.toLowerCase() is "password"
                    returnElement.addClass("ng-output")
                else
                    returnElement.removeClass("ng-output")

    restrict: "E"
    replace: true
    template: "<div>" +
                "<input type='text' ng-model='model.password' placeholder='Password...' class='form-control'>" +
              "</div>"
    compile: (tmplElem) ->
        tmplElem.append returnElement
        return link
    
        
            
                












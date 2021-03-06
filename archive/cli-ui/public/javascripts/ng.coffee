app = angular.module "canvasApp"

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
    template: "<div class='ng-output'>App.js made me!</div>"

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
        div = document.createElement "div"
        div.classList.add "ng-output"
        text = document.createTextNode "App.js made me, too!"
        document.getElementById("fromjs").appendChild(div).appendChild(text)

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
              "<div class='ng-output' ng-click='done({task:task})'>Click me!</div>"

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
    template: "Today's ice cream flavor is: <div class='ng-output'>{{flavor | capitalise}}</div>"

app.controller "ChoiceCtrl",
class ChoiceCtrl
    constructor: ($scope) ->
        $scope.drink = "soda"

app.directive "drink", ->
    scope: 
        choice: "="
    template: "Today's drink choice is: <div class='ng-output'>{{choice | capitalise}}</div>"

app.controller "PhoneCtrl",
class PhoneCtrl
    constructor: ($scope) ->
        $scope.callHome = (message) ->
            console.log "You said: " + (message || "nothing...")

app.directive "phone", ->
    scope:
        dial: "&"
    template: "<input type='input' ng-model='value' placeholder='Message' class='form-control'>" +
              "<div class='ng-output hover' ng-click='dial({message:value})'>Phone home</div>"

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
              "<div class='ng-output hover' ng-click='ping({server: server, user: name, message: value})'>Send</div>"

app.directive "transclusion", ->
    restrict: "E"
    transclude: true
    template: "<div class='ng-output'>Hello from &lt;transclusion&gt;</div><div ng-transclude></div>"

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
              "<div class='ng-output' ng-show='isContentVisible' ng-transclude></div>"
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
    templateUrl: "passwordy.html"
    compile: (tmplElem) ->
        tmplElem.append returnElement
        return link

app.run ($templateCache) ->
    $templateCache.put "passwordy2.html", "<div>" + 
                                             "<input type='text' ng-model='model.password2' " +
                                             "placeholder='Password...' class='form-control'>" +
                                          "</div>"

app.directive "passwordy2", ($templateCache) ->
    returnElement = angular.element "<h3>{{model.password2}}</h3>"
    this.link = (scope, element) ->
            scope.$watch "model.password2", (value) ->
                if value != undefined and value.toLowerCase() is "password"
                    returnElement.addClass("ng-output")
                else
                    returnElement.removeClass("ng-output")
    restrict: "E"
    replace: true
    template: $templateCache.get "passwordy2.html"
    compile: (tmplElem) ->
        tmplElem[0].style.marginTop = "10px"
        tmplElem.append returnElement
        return link

app.config ($routeProvider) ->
    $routeProvider
    .when "/",
        templateUrl: "partials/route",
        controller: "Route1Ctrl"
        resolve:
            loadPromises: routeCtrl.loadPromises

    .when "/say/:message",
        template: "<div class='ng-output'>URL says: {{model.message}}</div>"
        controller: "Route2Ctrl"
    .when "/tell/:message",
        redirectTo: (routeParams, path, search) ->
            console.log routeParams # {message: ~}
            console.log path        # /tell/~
            console.log search      # {\?.+:    ~}
            return "/"
    .otherwise
        redirectTo: ->
            "/"

routeCtrl = app.controller "Route1Ctrl", 
class Route1Ctrl
    constructor: ($scope, $q, $route) ->
        console.log $route
        defer = $q.defer()
        defer.promise
        .then (weapon) ->
            console.log "You have my " + weapon + "."
            return "bow"
        .then (weapon) ->
            console.log "And my " + weapon + "."
            return "axe"
        .then (weapon) ->
            console.log "And my " + weapon + "!"
        defer.resolve("sword")

        $scope.model = 
            message: "Route provider put me here, but it took a a second."

routeCtrl.loadPromises = 
    ($q, $timeout) ->
        defer = $q.defer()
        $timeout ->
            defer.reject "Promises were rejected"
        , 1000
        defer.promise  

app.controller "Route2Ctrl", 
class Route2Ctrl
    constructor: ($scope, $routeParams) ->
        $scope.model = 
            message: $routeParams.message

app.controller "FailSafe",
class FailSafe
    constructor: ($rootScope) ->
        # Other events include:
        #   routeChangeStart
        #   routeChangeSuccess
        $rootScope.$on "$routeChangeError", (event, current, previous, rejection) ->
            console.log event, current, previous
            console.log rejection

app.directive "error", ($rootScope) ->
    restrict: "E"
    replace: true
    template: "<div class='ng-output' ng-show='isError'>Error: Promises were not resolved!</div>"
    link: (scope) ->
        $rootScope.$on "$routeChangeError", (event, current, previous, rejection) ->
            scope.isError = true

# Where factories come from
app.config ($provide) ->
    _age = ""
    # provider :: alias for `factory`
    $provide.provider "person", ->
        setAge: (value) ->
            _age = value
        $get: ->
            name: "No Name"
            age: _age

app.config (personProvider) ->
    personProvider.setAge "Unknown"

app.controller "ProvideCtrl",
class ProvideCtrl
    constructor: ($scope, person) ->
        $scope.data = 
            name: person.name
            age:  person.age


    
        
            
                












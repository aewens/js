app = angular.module "sandbox", ["ngRoute"]

app.controller "IndexCtrl", ->
app.config ($routeProvider) ->
    $routeProvider
    .when "/",
        templateUrl: "partials/index"
    .otherwise
        redirectTo: "/error"
        templateUrl: "partials/404"
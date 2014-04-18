"use strict";

var app = angular.module("nglearnApp", ["ngCookies","ngResource","ngSanitize","ngRoute"]);

function TestCtrl($scope) {
    $scope.data = { message: "World" }
}

function ThisCtrl($scope) {}
function ThatCtrl($scope) {}

app.factory("Share", function() {
    return { message: "Sharing is caring" }
});

app.filter("mirror", function(Share) {
    return function(text) {
        return text.split("").reverse().join("") + " " + Share.message;
    }
});

function RedCtrl($scope, Share) {
    $scope.share = Share;
}
function BlueCtrl($scope, Share) {
    $scope.share = Share;

    $scope.flipMessage = function(message) {
        return message.split("").reverse().join("");
    }
}
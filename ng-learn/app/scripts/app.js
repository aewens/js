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

function RedCtrl($scope, Share) {
    $scope.share = Share;
}
function BlueCtrl($scope, Share) {
    $scope.share = Share;
}
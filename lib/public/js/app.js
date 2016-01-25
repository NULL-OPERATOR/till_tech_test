var app = angular.module('App', []);

app.controller('AppCtrl', function($scope, $http) {

   $scope.loadData = function(route) {
      $http.get(route).success(function(data) {
         $scope.items = data;
      });
   };

   $scope.pushData = function(method, input) {
     console.log(method)
    var data = { "method":method, "input":input };
    $http.post("pushData", data).success(function(result) {
        console.log(result);
    });
  };


});

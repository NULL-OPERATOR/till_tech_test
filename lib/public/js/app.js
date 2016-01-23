var app = angular.module('App', []);

app.controller('AppCtrl', function($scope, $http) {

   $scope.loadData = function () {
      $http.get('getData').success(function(data) {
         $scope.items = data;
      });
   };

   $scope.pushData = function(route, input) {
     console.log(route)
    var data = { "route":route, "input":input };
    $http.post("new", data).success(function(result) {
        // console.log(result);
    });
  };


});

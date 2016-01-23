var app = angular.module('myApp', []);

app.controller('MyCtrl', function($scope, $http) {

   $scope.loadData = function () {
      $http.get('getData').success(function(data) {
         $scope.items = data;
      });
   };

   $scope.pushTask = function() {
    var data = { 'name': $scope.task };
    $http.post("new", data).success(function(result) {
        console.log(result);
    });
  };


});

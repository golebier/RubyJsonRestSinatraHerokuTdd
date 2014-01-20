var app = angular.module('angularjs-starter', ['ngRoute']);

app.config(function ($routeProvider) {
   $routeProvider
      .when('/', {
         templateUrl: 'h5/html/parts/mainView.html'
      })
      .when('/displayAll', {
         controller: 'CtrlAll',
         templateUrl: 'h5/html/parts/displayAllView.html'
      })
      .when('/addNewCompany', {
         controller: 'CtrlAdd',
         templateUrl: 'h5/html/parts/addNewCompanyView.html'
      })
      .when('/displayCompany/:id', {
         controller: 'CtrlShow',
         templateUrl: 'h5/html/parts/displayCompanyView.html'
      })
      .when('/deleteCompany/:id', {
         controller: 'CtrlDelete',
         templateUrl: '#/displayAll'
      })
      .when('/editCompany/:id', {
         controller: 'CtrlEdit',
         templateUrl: 'h5/html/parts/editCompanyView.html'
      })
      .otherwise({redirectTo: '/'});
});

app.controller('CtrlShow', function($scope, $routeParams, $http) {
     $scope.items = [];

     $http.get('/api/company/'+$routeParams.id).success(function(data) {
        $scope.items = data;
     });
});

app.controller('CtrlAll', function($scope, $http) {
   $scope.items = [];

   $http.get('/api/companies').success(function(data) {
      $scope.items = data;
   });
});

function clr($scope) {
  $scope.name = '';
  $scope.address = '';
  $scope.city = '';
  $scope.country = '';
  $scope.email = '';
  $scope.phone_number = '';
}

app.controller('CtrlAdd', function($scope, $http) {
   clr($scope);
   $scope.submit = function() {
      $http.post('/api/companies', {
         name: $scope.name, address: $scope.address, city: $scope.city, country: $scope.country, email: $scope.email, phone_number: $scope.phone_number
      }).success(function(data) {
         $scope.items = data;
      });
      clr($scope);
  };
});

app.controller('CtrlDelete', function($scope, $routeParams, $http) {
   $http.delete('/api/company/'+$routeParams.id).success(function(data) {
      // $scope.deleted = true
   });
});

app.controller('CtrlEdit', function($scope, $routeParams, $http) {
   $scope.item = [];

   $http.get('/api/company/'+$routeParams.id).success(function(data) {
      $scope.item = data;
   });

   $scope.submit = function() {
      $http.put('/api/company/'+$routeParams.id, {
	 name: $scope.item.name, address: $scope.item.address, city: $scope.item.city, country: $scope.item.country, email: $scope.item.email, phone_number: $scope.item.phone_number
      }).success(function(data) {
         $scope.item = data;
      });
   };
});


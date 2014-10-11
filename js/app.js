var myApp = angular.module('giftApp', ['ui.router', 'restangular']);

myApp.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/products");

    $stateProvider.state('products', {
        url: '/products',
        templateUrl: 'products.html'
    }).state('products1', {
        url: '/products1',
        templateUrl: 'products1.html'
    });

}).config(function (RestangularProvider) {
    RestangularProvider.setBaseUrl('/gift')
}).controller('ProductsCtrl', ['$scope', 'Restangular', function ($scope, Restangular) {
    var EndPoint = Restangular.all('welcome');

    EndPoint.customGET('products').then(function (response) {
        $scope.products = response;
    }, function () {
        alert('err');
    });

    EndPoint.customGET('measures').then(function (response) {
        $scope.measures = response;
    }, function () {
        alert('err');
    });

    EndPoint.customGET('categories').then(function (response) {
        $scope.categories = response;
    }, function () {
        alert('err');
    });
}]);
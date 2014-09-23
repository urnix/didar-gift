angular.module('giftApp', ['restangular'])
    .config(function (RestangularProvider) {
        RestangularProvider.setBaseUrl('http://localhost/gift/')
    })
    .controller('ProductsCtrl', ['$scope', 'Restangular', function ($scope, Restangular) {
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

    }])
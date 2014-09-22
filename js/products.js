angular.module('giftApp', []).controller('ProductsCtrl', ['$scope', function ($scope) {

    $scope.products = [
        {name:'Product1', amount: 100},
        {name:'Product2', amount: 200},
        {name:'Product3', amount: 300}
    ];

}])
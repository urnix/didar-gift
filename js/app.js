var myApp = angular.module('giftApp', ['ui.router', 'restangular']);

var storageCheckAuth = function ($q, $state, Restangular) {
    var defered = $q.defer();
    var EndPoint = Restangular.all('welcome');

    function reject() {
        defered.reject();
        localStorage.removeItem('authToken');
        Restangular.setDefaultRequestParams({Authorization: null});
        $state.go('login');
    }

    EndPoint.customGET('empty_').then(function (response) {
        if (response.error == 'not logged') {
            reject();
        } else {
            defered.resolve(true);
        }
    }, function () {
        reject();
    });

    return defered.promise;
};

myApp.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/products");

    $stateProvider.state('login', {
        url: '/login',
        views: {
            'content': {
                templateUrl: 'js/login.html',
                controller: 'LoginCtrl'
            }
        }
    }).state('products', {
        url: '/products',
        views: {
            'content': {
                templateUrl: 'js/products.html',
                controller: 'ProductsCtrl'
            }
        },
        resolve: {
            factory: storageCheckAuth
        }
    });
}).config(function (RestangularProvider) {
    RestangularProvider.setBaseUrl('/gift')
}).factory('UtilsSrv', ['$state', function ($state) {
    return {
        responseCheckAuth: function (response) {
            if (response.error == 'not logged') {
                localStorage.removeItem('authToken');
                Restangular.setDefaultRequestParams({Authorization: null});
                $state.go('login');
                return false;
            }
        }
    }
}]).controller('LoginCtrl', ['$scope', '$http', '$state', '$timeout', 'Restangular', function ($scope, $http, $state, $timeout, Restangular) {
    var EndPoint = Restangular.all('welcome');
    $scope.isLogged = false;

    function deferredGoProducts() {
        $timeout(function () {
            $state.go('products');
        }, 500);
    }

    function login(token) {
        if (token && token.length >= 6) {
            EndPoint.customPOST({sert_identifier: token}, 'login').then(function (response) {
                if (response.status == 'ok') {
                    var authToken = response.auth_token;
                    Restangular.setDefaultRequestParams({Authorization: 'Bearer ' + authToken});
//                    $http.defaults.headers.common.Authorization = 'Bearer ' + authToken;
//                    Restangular.setDefaultHeaders({'Authorization': 'Bearer ' + authToken, 'Content-Type': 'application/x-www-form-urlencoded'});
                    window.localStorage.authToken = authToken;
                    $scope.isLogged = true;
                    deferredGoProducts();
                }
            }, function () {
                alert('err');
            })
        }
    }

    $scope.$watch('sertId', function (newValue) {
        login(newValue);
    });

    if (window.localStorage.authToken) {
        login(window.localStorage.authToken);
    }
}]).controller('ProductsCtrl', ['$scope', 'Restangular', 'UtilsSrv', function ($scope, Restangular, UtilsSrv) {
    var EndPoint = Restangular.all('welcome');


    EndPoint.customGET('products').then(function (response) {
        UtilsSrv.responseCheckAuth(response);
        $scope.products = response.products;
    }, function () {
        alert('err');
    });

    EndPoint.customGET('measures').then(function (response) {
        UtilsSrv.responseCheckAuth(response);
        $scope.measures = response.measures;
    }, function () {
        alert('err');
    });

    EndPoint.customGET('categories').then(function (response) {
        UtilsSrv.responseCheckAuth(response);
        $scope.categories = response.categories;
    }, function () {
        alert('err');
    });
}]).run(['$rootScope', '$http', '$state', 'Restangular', function ($rootScope, $http, $state, Restangular) {
    var authToken = window.localStorage.authToken;
    Restangular.setDefaultRequestParams({Authorization: 'Bearer ' + authToken});
//    $http.defaults.headers.common.Authorization = 'Bearer ' + authToken;
//    Restangular.setDefaultHeaders({'Authorization': 'Bearer ' + authToken, 'Content-Type': 'application/x-www-form-urlencoded'});

    $rootScope.curStateName = function () {
        return $state.$current.name;
    };

    $rootScope.logout = function () {
        localStorage.removeItem('authToken');
        Restangular.setDefaultRequestParams({Authorization: null});
        $state.go('login');
    };
}]);
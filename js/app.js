var myApp = angular.module('giftApp', ['ui.router', 'restangular', 'pascalprecht.translate']);

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
    $urlRouterProvider.otherwise("/products/list");

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
                templateUrl: 'js/empty.html'
            }
        },
        resolve: {
            factory: storageCheckAuth
        }
    }).state('products.list', {
        url: '/list',
        views: {
            'content': {
                templateUrl: 'js/products.html',
                controller: 'ProductsListCtrl'
            }
        },
        resolve: {
            factory: storageCheckAuth
        }
    }).state('products.view', {
        url: '/view/:id',
        views: {
            'content': {
                templateUrl: 'js/product.html',
                controller: 'ProductViewCtrl'
            }
        },
        resolve: {
            factory: storageCheckAuth
        }
    }).state('faq', {
        url: '/faq',
        views: {
            'content': {
                templateUrl: 'js/faq.html',
                controller: 'FaqCtrl'
            }
        },
        resolve: {
            factory: storageCheckAuth
        }
    });
}).config(function (RestangularProvider, $translateProvider) {
    RestangularProvider.setBaseUrl('/gift');

    $translateProvider.translations('en', {
        'brand caption': 'Umasterov Gift',
        'to other language': 'ru',
        'faq': 'FAQ',
        'all rights reserved': 'All rights reserved!',
        'certificate id': 'Enter certificate ID',
        'login successful': 'Login successful.',
        'logout': 'Logout',
        'hi pepole': 'Hi, people!',
        'we are the best': 'We are the best of the best of the best of the best of the best of the best of the best of the best of the best of the best of the best of the best of the best of the best.',
        'products': 'Products:',
        'measures': 'Measures:',
        'categories': 'Categories:'
    });
    $translateProvider.translations('ru', {
        'brand caption': 'Umasterov Gift',
        'to other language': 'en',
        'faq': 'FAQ',
        'all rights reserved': 'Все права защищены!',
        'certificate id': 'Введите ID сертификата',
        'login successful': 'Вход выполнен.',
        'logout': 'Выход',
        'hi pepole': 'Привет люди!',
        'we are the best': 'Мы лучшие из лучших  из лучших  из лучших  из лучших  из лучших  из лучших  из лучших  из лучших  из лучших  из лучших  из лучших  из лучших  из лучших.',
        'products': 'Продукты:',
        'measures': 'Мероприятия:',
        'categories': 'Категории:'
    });
    $translateProvider.preferredLanguage('ru');
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
}]).filter('cut', function () {
    return function (value, wordwise, max, tail) {
        if (!value) return '';

        max = parseInt(max, 10);
        if (!max || value.length <= max) return value;

        value = value.substr(0, max);
        if (wordwise) {
            var lastspace = value.lastIndexOf(' ');
            if (lastspace != -1) {
                value = value.substr(0, lastspace);
            }
        }

        return value + (tail || ' …');
    };
}).controller('LoginCtrl', ['$rootScope', '$scope', '$http', '$state', '$timeout', 'Restangular', function ($rootScope, $scope, $http, $state, $timeout, Restangular) {
    var EndPoint = Restangular.all('welcome');
    $rootScope.isLogged = false;
    $scope.loaded = true;

    function deferredGoProducts() {
        $timeout(function () {
            $state.go('products');
        }, 1000);
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
}]).controller('ProductsListCtrl', ['$rootScope', '$scope', 'Restangular', 'UtilsSrv', function ($rootScope, $scope, Restangular, UtilsSrv) {
    var EndPoint = Restangular.all('welcome');

    var loadedCheckCount = 3;
    var loadedCheck = function () {
        loadedCheckCount--;
        $rootScope.loaded = !loadedCheckCount;
    };

    EndPoint.customGET('products').then(function (response) {
        UtilsSrv.responseCheckAuth(response);
        $scope.products = response.products;
        loadedCheck();
    }, function () {
        alert('err');
        loadedCheck();
    });

    EndPoint.customGET('measures').then(function (response) {
        UtilsSrv.responseCheckAuth(response);
        $scope.measures = response.measures;
        loadedCheck();
    }, function () {
        alert('err');
        loadedCheck();
    });

    EndPoint.customGET('categories').then(function (response) {
        UtilsSrv.responseCheckAuth(response);
        $scope.categories = response.categories;
        loadedCheck();
    }, function () {
        alert('err');
        loadedCheck();
    });
}]).controller('ProductViewCtrl', ['$rootScope', '$scope', '$stateParams', 'Restangular', 'UtilsSrv', function ($rootScope, $scope, $stateParams, Restangular, UtilsSrv) {
    var EndPoint = Restangular.all('welcome');

    EndPoint.customGET('product/' + $stateParams.id).then(function (response) {
        UtilsSrv.responseCheckAuth(response);
        $scope.product = response.product;
        $rootScope.loaded = true;
    }, function () {
        alert('err');
        $rootScope.loaded = true;
    });
}]).controller('FaqCtrl', ['$rootScope', '$scope', '$location', '$stateParams', '$anchorScroll', function ($rootScope, $scope, $location, $stateParams, $anchorScroll) {
    $anchorScroll();
    $rootScope.loaded = true;
}]).run(['$rootScope', '$http', '$state', '$translate', 'Restangular', function ($rootScope, $http, $state, $translate, Restangular) {
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

    $rootScope.changeLang = function () {
        $translate.use($translate.use() == 'en' ? 'ru' : 'en');
    };
}]);
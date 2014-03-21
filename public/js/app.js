angular.module('fleetonrails-api', [
        'ngRoute',
        'ui.bootstrap',
        'fleetonrails-api.controllers',
        'fleetonrails-api.directives',
        'hljs'
    ])

    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider.
            when('/', {templateUrl: 'partials/main.html'}).
            when('/docs', {templateUrl: 'partials/docs/api/docs.html'}).
            when('/docs/oauth', {templateUrl: 'partials/docs/api/oauth.html'}).
            when('/docs/me', {templateUrl: 'partials/docs/api/me.html'}).
            when('/docs/users', {templateUrl: 'partials/docs/api/users.html'}).
            when('/docs/cars', {templateUrl: 'partials/docs/api/cars.html'}).
            when('/docs/service_records', {templateUrl: 'partials/docs/api/service_records.html'}).
            when('/docs/vendors', {templateUrl: 'partials/docs/api/vendors.html'}).
            when('/docs/groups', {templateUrl: 'partials/docs/api/groups.html'}).
            otherwise({redirectTo: '/'});
    }])

    .config(function (hljsServiceProvider) {
        hljsServiceProvider.setOptions({
            tabReplace: '    '
        });
    });

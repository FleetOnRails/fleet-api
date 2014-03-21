angular.module('fleetonrails-api', [
        'ngRoute',
        'ui.bootstrap',
        'fleetonrails-api.controllers',
        'hljs'
    ])

    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider.
            when('/', {templateUrl: 'partials/docs.html'}).
            otherwise({redirectTo: '/'});
    }])

    .config(function (hljsServiceProvider) {
        hljsServiceProvider.setOptions({
            tabReplace: '    '
        });
    });

'use strict';

/* Directives */


angular.module('fleetonrails-api.directives', [])

    .directive('navbar', function () {
        return {
            restrict: 'E',
            templateUrl: 'partials/navbar.html'
        }
    });

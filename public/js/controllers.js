'use strict';

/* Controllers */

angular.module('fleetonrails-api.controllers', [])

    .controller('ToggleCtrl', ['$scope', function ($scope) {
        $scope.isCollapsed = true;
    }]);
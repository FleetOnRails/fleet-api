'use strict';

/* Controllers */

angular.module('fleetonrails-api.controllers', [])

    .controller('MainCtrl', ['$scope', function ($scope) {
        $scope.version = 'v0.0.4'
    }])

    .controller('ToggleCtrl', ['$scope', function ($scope) {
        $scope.isCollapsed = true;
    }])

    .controller('OauthController', ['$scope', 'OauthService', function ($scope, OauthService) {
        $scope.isCollapsed = true;

        OauthService.get(function (data) {
            $scope.applications = data.applications;
        });

        $scope.createApplication = function () {
            var attributes = {
                application: {
                    name: $scope.application.name,
                    redirect_uri: 'urn:ietf:wg:oauth:2.0:oob:fleetonrails-api'
                }
            };
            OauthService.create(attributes,function (data) {
            }).success(function (data) {
                $scope.applications.push(data)
                $scope.apply
            })
        };

        $scope.deleteCar = function (id) {
            OauthService.delete(id, function (data) {
                console.log(data);
            })
        };
    }]);
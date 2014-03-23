'use strict';

/* Services */


// Demonstrate how to register services
// In this case it is a simple value service.
angular.module('fleetonrails-api.services', [])
    .factory('OauthService', [ '$http', function ($http) {
        return {
            get: function (success) {
                $http({
                    method: 'GET',
                    url: '/oauth/applications.json',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    }
                }).success(function (data) {
                    console.log('success', data);
                    success(data);
                }).error(function (data) {
                    console.log(data);
                })
            },

            create: function(data, success) {
                $http({
                    method: 'POST',
                    url: '/oauth/applications.json',
                    data: data,
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    }
                }).success(function (data) {
                    success(data);
                }).error(function (data) {
                    console.log(data);
                })
            }
        }
    }]);


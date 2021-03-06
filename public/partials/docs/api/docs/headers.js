angular.module('fleetonrails.services.me-service', [])

    .factory('MeService', [ '$http', 'globalSettings', function ($http, globalSettings) {
        return {
            get: function (success) {
                $http({
                    method: 'GET',
                    url: globalSettings.api_base_url + '/v1/me',
                    headers: {
                        'Authorization': 'Bearer ' + localStorage.getItem('access_token'),
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    }
                }).success(function (user) {
                    success(user);
                })
            }
        }
    }]);
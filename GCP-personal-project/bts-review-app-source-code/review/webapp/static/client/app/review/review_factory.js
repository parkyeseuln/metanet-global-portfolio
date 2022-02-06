(function () {

    var module = angular.module('qiqReview');

    module.factory('reviewFactory', reviewFactory);

    reviewFactory.$inject = ['$http']

    function reviewFactory($http) {

        return {
            sendReview: sendReview, 
        };

        function sendReview(rating, review) {
            return $http.post('/review', {
                review: review,
                rating: rating,
                timestamp: Date.now(),
            }).then(function (response) {
                return response.data; 
            });
        }
    }


})();
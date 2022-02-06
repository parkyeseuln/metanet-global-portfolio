(function () {

    var module = angular.module('qiqReview');

    module.controller('ReviewController', ReviewController);

    ReviewController.$inject = ['reviewFactory'];

    function ReviewController(reviewFactory) {
        var rc = this;
        rc.sendReview = sendReview;
        rc.reviewSent = false;
        rc.rating = -1;

        init();

        function init() {
           
        }

        function sendReview() {
            console.log({rating:rc.rating, review:rc.review});
            reviewFactory.sendReview(rc.rating, rc.review).then(function (data) {
                rc.reviewSent = true;
            });
        }
    }

})();
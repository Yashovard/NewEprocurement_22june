// Code goes here Contractor Registration
var myApp = angular.module('myApp', [])
.controller('myRegistration', function($scope, $http) {
     $scope.contractor_details = [];
//Save the Contractor data     
$scope.saveContractor = function() {
                
 var form = $("#Savecontractor").serialize();
//       alert(form); 
        $http.post("Contractorsave?form=" + form)
        .then(function (response) {
        //$scope.contractor_details = response.data; 
        var message = response.data;
        if (message !== "") {
            swal(
                    '',
                    message,
                    'error'
                    )
        }
        var message = response.data;
        if (message !== "") {
            swal(
                    '',
                    message,
                    'success'
                    )
        }
                });                
};
//Clear the input field after submit data
$scope.openModal = function () {
        $("#firstname").val("");
        $("#middlename").val("");
        $("#lastname").val("");
        $("#fullname").val("");
        $("#company").val("");
        $("#designation").val("");
        $("#mobile").val("");
        $("#email").val("");
        $("#password").val("");
        $("#password1").val("");
        $("#captcha").val("");
    };
});
// Code goes here
var myApp = angular.module('myApp', ['angularUtils.directives.dirPagination']);
function MyController($scope, $http) {
    $scope.currentPage = 1;
    $scope.pageSize = 10;
    $scope.all_departments = [];
    $scope.departmentUser = [];
    $scope.all_states = [];
    $scope.name1 = "";                                          
     
     alert("hello");
    //Call to fetch the department User
    $http.get("departmentDetails.action")
        .then(function (response) {
             $scope.all_departments = response.data;
        });
    
    $scope.editDeptUser = function(id){
        alert(id);
       
        //id = parse(id);
        $http.get("updateDepartmentUser?id="+id)       
             .then(function (response) {    
//                 alert(response);
             $scope.departmentUser = response.data;
             $scope.privi = $scope.departmentUser.userPrivileges;
             var array = new Array();
           
             array = $scope.privi.split(',');
              for(i=0;i<=18;i++){
                    $("#userPrivileges"+i).prop("checked",false); 
                  
              }
           angular.forEach(array, function(value, key) {
//                 alert(value);
              $("#userPrivileges"+value).prop("checked",true);
   
         });
        });
         $http.get("departmentDetails.action")
        .then(function (response) {
             alert(response.data);
             $scope.all_departments = response.data;
        });
    };
     
    $scope.showModel = function(){
       
         var response = " ";
          $scope.departmentUser = response.data;     
        for(var i=0;i<=18;i++){
          $("#userPrivileges"+i).prop("checked",false);             
         }             
         return true;  
    };
    
    //Call to save the department User Details
    $scope.addMore = function(){    
      var form = $("#form").serialize();
      alert(form);
        alert("reg id is : "+$("#reg_Id").val());
      
//        var reg_Id = $("#reg_Id").val();        
//        alert(reg_Id);
//        +"&reg_Id="+reg_Id
        $http.post("saveDepartmentUser?form="+form+"&registerId="+$("#reg_Id").val())
                .then(function (response) {
         //alert(response);
        });        
        
        $http.get("departmentDetails.action")
        .then(function (response) {
//             alert(response.data);
             $scope.all_departments = response.data;
        });
    };
  
    $scope.printDiv = function(divName) {       
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    };
    
    
    $scope.getStateData = function() {
        $scope.all_departments = [];
        var s = $("#state").val();
        $http.get('http://192.168.0.107/tender_alert_new/admin/dashboard/depart_report',
            { params:{state: s} }

        ).then(function (response) {
            // response.all_departments.empty();
            // alert(JSON.stringify(response.data));
            var res = response.data;
            res.all_departments.forEach(function (value) {
                // alert(value);
                $scope.all_departments.push(value); 
                // $('#state').append('<option value="'+value.state_id+'">'+value.statename+'</option>');
            });
        });
    };
}

myApp.factory('Excel',function($window){
    var uri='data:application/vnd.ms-excel;base64,',
        template='<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
        base64=function(s){return $window.btoa(unescape(encodeURIComponent(s)));},
        format=function(s,c){return s.replace(/{(\w+)}/g,function(m,p){return c[p];});};
    return {
        tableToExcel:function(tableId,worksheetName){
            var table=$(tableId),
                ctx={worksheet:worksheetName,table:table.html()},
                href=uri+base64(format(template,ctx));
            return href;
        }
    };
});
    myApp.controller('MyCtrl',function(Excel,$timeout,$scope){
        $scope.exportToExcel=function(tableId){ // ex: '#my-table'
            var exportHref=Excel.tableToExcel(tableId,'WireWorkbenchDataExport');
            $timeout(function(){location.href=exportHref;},100); // trigger download
        };
    });


myApp.controller("listController", ["$scope",
    function($scope) {
       // $scope.data=  [{"agence":"CTM","secteur":"Safi","statutImp":"operationnel"}];
        $scope.export = function(){
            html2canvas(document.getElementById('print'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("test.pdf");
                }
            });
        };           
    } 
]);

function OtherController($scope) {
    $scope.pageChangeHandler = function(num) {
        console.log('going to page ' + num);
    };
}

myApp.controller('MyController', MyController);
myApp.controller('OtherController', OtherController);
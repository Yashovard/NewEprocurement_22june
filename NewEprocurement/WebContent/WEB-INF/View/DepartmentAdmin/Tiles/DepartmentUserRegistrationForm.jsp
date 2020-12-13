<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" ng-app="myApp">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <!-- TITLE-->
        <title>Super Admin</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="<c:url value="/resources/images/fav-icon.png" />" sizes="32x32">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
              rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">    
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/new-dashboard.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/commoncss.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/wizards-style.css" />">       
        <link rel="stylesheet" href="<c:url value="/resources/css/build.min.css" />">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
        <script data-require="angular.js@1.3.0" data-semver="1.3.0" src="https://code.angularjs.org/1.3.0/angular.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
         <script src="<c:url value="/resources/js/angular/script.js" />"></script>
        <script src="<c:url value="/resources/js/build.min.js" />"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/fastselect.min.css" />">
        <script src="<c:url value="/resources/js/fastselect.standalone.js" />"></script>
        <!--<script type="text/javascript" src="<c:url value="/resources/js/bootstrap3-wysihtml5.js" />"></script>-->
        <script src="<c:url value="/resources/js/jquery-1.10.2.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script>
        <script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
        <!--<script type="text/javascript" src="<c:url value="/resources/js/jquery-wz.min.js" />"></script>-->
        <script type="text/javascript" src="<c:url value="/resources/js/bootstrap-datetimepicker-wz.js" />"></script>
        <!--------------------->
        <script type="text/javascript" src="<c:url value="/resources/js/moment.min.rg.js" />"></script>
        <!-- Include Date Range Picker -->
        <script type="text/javascript" src="<c:url value="/resources/js/daterangepicker.js" />"></script> 
    <script src="<c:url value="/resources/js/angular/dirPagination.js" />"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
        <!-- Include Required Prerequisites -->
        <script src="http://cdn.ckeditor.com/4.4.5/standard/ckeditor.js"></script>
        <script>
            function runLoader() {
                $('body').append('<div style="" id="loadingDiv"><div class="loader">Loading...</div></div>');
                //$(window).on('load', function(){
                setTimeout(removeLoader, 2000); //wait for page load PLUS two seconds.
                //});
                function removeLoader() {
                    $("#loadingDiv").fadeOut(500, function () {
                        // fadeOut complete. Remove the loading div
                        $("#loadingDiv").remove(); //makes page more lightweight 
                    });
                }
            }
             

        </script>
          <script>
    $(document).ready(function () {
//  alert("welcome");
        $("#email").change(function () {
           
            var email = $("#email").val();
            
           
            $.ajax({
                url: "checkUserEmail",
                data: {email: email},
                success: function (res) {
                    // alert(res);
                    if (res !== "valid Email") {
                       // alert("done");
                        $("#errorEmail").css('color', 'red');
                        $("#errorEmail").html("Email address is already exist");
                        $("#email").append(res);
                    }
                }
            });
        });

        $("#mobile_no").change(function () {
            
            var mobile_no = $("#mobile_no").val();
          
            $.ajax({
                url: "checkUserContacts",
                data: {mobile_no: mobile_no},
                success: function (res) {
                    // alert(res);
                    if (res !== "valid mobile_no") {
                        // alert("done");
                        $("#errorMobile_no").css('color', 'red');
                        $("#errorMobile_no").html("Mobile No. is already exist");
                        $("#mobile_no").append(res);
                    }

                }
            });
        });
       
    });
</script>


        <style>
            .affix {
                top: -60px;
                width: 100%;
                z-index: 999;
            }

            .attireMainNav {
                display: none;
            }
            /**********tool-tip**************/

            .input-dashboard [data-tip] {
                position: relative;
                z-index: 333;
            }

            .input-dashboard [data-tip]:hover:before,
            .input-dashboard [data-tip]:hover:after {
                display: block;
            }

            .input-dashboard [data-tip]:before {
                content: '';
                display: none;
                content: '';
                border-left: 9px solid transparent;
                border-right: 9px solid transparent;
                border-bottom: 16px solid #E91E63;
                position: absolute;
                top: 25px;
                left: 19px;
                z-index: 8;
                font-size: 10px;
                line-height: 0;
                /* width: 17px; */
                height: 0px;
            }

            .input-dashboard [data-tip]:after {
                display: none;
                content: attr(data-tip);
                position: absolute;
                top: 39px;
                left: 0px;
                padding: 3px 18px;
                background: #ffffff;
                -moz-border-radius: inherit;
                white-space: nowrap;
                word-wrap: normal;
                line-break: auto;
                border-radius: 6px;
                border: 2px solid #E91E63;
                box-shadow: rgb(85, 85, 85) 4px 4px 4px;
                color: rgb(0, 0, 0);
                background-color: rgb(255, 255, 255);
                opacity: 0.85;
                z-index: 32767;
                text-align: left;
                font-family: Arial;
                font-weight: bold;
                font-size: 87%;
                visibility: visible;
                letter-spacing: 0.10em;
            }
            .dashboard-header .nav>li>a {
                position: relative;
                display: block;
                padding: 10px 20px;
                color: #ffffff;
                border-radius: 0px;
                font-size: 14px;
                transition: 0.3s ease;
                text-decoration: none;
            }
            .logout-a {
                background: #F44336!important;
                color: #fff!important;
                padding: 4px 4px!important;
                border-radius: 2px!important;
                margin-top: 9px!important;
            }
            .notification-side li {
                display: block;
            }
            .departmentRegistration {
                padding: 30px 0;
                background: #f0f0f0;
                    border-radius: 4px;
            }
            .departmentForm{
                background: #fff;
                padding: 50px;
                padding-top: 25px;
            }
            .departmentRegistration h4.modal-title{
                
            }
            hr.userRegistration {
                margin-top: 25px;
            }
            .registerForm {
                clear: both;
                overflow: hidden;
                padding: 20px;
            }
            .labelbdr-bt{
                display:block;
            }
            .registerForm input[type="checkbox"], .registerForm  input[type="radio"] {

                margin: 4px 0 0;
                margin-top: 1px\9;
                line-height: normal;
                position: relative;
                top: 6px;

            }
            .labelbdr-bt {

                display: block;
                margin-top: 10px;
                margin-bottom: 0;

            }
            .registerForm .checkboxinline span label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: normal;
                margin: 0px 8px 7px;
            }
            .labelbdr-bt b {
                font-size: 15px;
            }
             .registerForm.ng-pristine.ng-valid svg{
                right: 35px!important;
                top: 73%!important;
            }
            .registerForm.ng-pristine.ng-valid .form-control{
                border:1px solid #dedede!important;
                box-shadow: none!important;
            }
            label.checkbox-inline strong{
                padding-left: 10px;
            } 
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".dropdown").hover(
                        function () {
                            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                            $(this).toggleClass('open');
                        },
                        function () {
                            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                            $(this).toggleClass('open');
                        }
                );
       
            });
        </script>
      
         <script type="text/javascript">
$(document).ready(function(){
  
    $('#select_all').on('click',function(){
       
        
        if(this.checked){
            $('.checkboxall').each(function(){
                this.checked = true;
               
               if($('#userPrivileges6').is(':checked')){
               $('#div1').show();
               } 
            
            });
        }else{
             $('.checkboxall').each(function(){
                this.checked = false;
                 if($('#userPrivileges6').is(':checked')){
               $('#div1').hide();
               } 
            });
        }
    });
    
    $('.checkboxall').on('click',function(){
        if($('.checkboxall:checked').length == $('.checkboxall').length){
            $('#select_all').prop('checked',true);
        }else{
            $('#select_all').prop('checked',false);
        }
    });
    
      //for privilege Checkbox auto checked on update
            var privilege=$('#user').val();
           
          var array = new Array();
             array = privilege.split(',');
           $.each(array, function(value, key) {
              
              $("#userPrivileges"+key).prop("checked",true);
   
         
         });
                
          var circle_id=$('#circle1').val();
          alert("!@"+circle_id);
          
            var division=$('#division').val();
//          alert("divisionName "+division);
            myFunction(circle_id);
            
        var division=$('#division1').val();
        alert("divisionName "+division);
   
     var selectdivision = division;
//     alert(selectdivision);
     $('#division1').val(selectdivision);
     
//     getSubDivision(division);
      var subDivision=$('#subDivision1').val();
//   alert("subdivisionName "+subDivision);
     var selectSubDivision = subDivision;
     $('#subDivision1').val(selectSubDivision);
     
//                     
//$(function() {
//    var temp="a"; 
//    $("#MySelect").val(temp);
//});
//
//<select name="MySelect" id="MySelect">
//    <option value="a">a</option>
//    <option value="b">b</option>
//    <option value="c">c</option>
//</select>



  if($('#userPrivileges6').is(':checked')){
                 
                  $('#div1').show();
               } else{
                  $('#div1').hide();
               } 

});

  function showMe(val) {   
 
            var cvalue=val.id;
//            alert(cvalue);
            if(cvalue === 'userPrivileges6'){
               if($('#'+cvalue).is(':checked')){
                 
                  $('#div1').show();
               } else{
                  $('#div1').hide();
               } 
            }
           
         }
         

               
               
            function myFunction(circleid)
            {
               
                $.ajax({
                    type: "GET",
                    url: 'getDivisionByAjax',
                    data: {'circleid': circleid},
                   
                    success: function (response) {
                        alert(response);
                   
                        var $select = $('#division1');
                        $select.find('option').remove();
                        $('<option>').val("-1").text("Select").appendTo($select);
                        $.each(JSON.parse(response), function (key, value) {
                            alert(value['division']);
                            $('<option>').val(value["division_id"]).text(value["division"]).appendTo($select);
                        });

                        document.getElementById('wait').style.display = 'none';
                    },
                    error: function (e) {
                        alert('Error: ' + e);
                        document.getElementById('wait').style.display = 'none';
                    }
                });
            }
            
              function getSubDivision(division_id)
            {
//                var division_id = document.getElementById("division1").value;
//               alert("division id in ajx call"+division_id);
            
                $.ajax({
                    type: "GET",
                    url: 'getSubDivisionByAjax.action',
                    data: {'division_id': division_id},
                   
                    success: function (response) {
                  alert(response);
                   
                        var $select = $('#subDivision1');
                        $select.find('option').remove();
                        $('<option>').val("-1").text("Select").appendTo($select);
                        $.each(JSON.parse(response), function (key, value) {
                            $('<option>').val(value["subdivision_id"]).text(value["subdivision"]).appendTo($select);
                        });

                        document.getElementById('wait').style.display = 'none';
                    },
                    error: function (e) {
                        alert('Error: ' + e);
                        document.getElementById('wait').style.display = 'none';
                    }
                });
            }
        </script>
        
    </head>

    <body ng-controller="MyController" ng-app>
       <%@include file="AdminDashboardHeader.jsp" %>

     

<div class="departmentRegistration" >
                        <div class="container">
                            <div class="departmentForm">
                                <h4 class="modal-title text-center">Department User Registration<hr class="userRegistration"></h4>
                          
                                
                                <form:form class="registerForm" modelAttribute="departmentUser" id="form">
                                    <div class="row">
                                        <div class="form-group col-md-6" id="FirstnamE">
                                            <form:hidden path="reg_Id" id="reg_Id"/>
                                            <label for="firstName">First Name<a style="color:red;">*</a></label>
                                             
                                            <form:input class="form-control" id="firstName" placeholder="" path="firstName"/>
                                        
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                        <div class="form-group col-md-6" id="LastnamE">
                                            <label for="lastName">Last Name<a style="color:red;">*</a></label>
                                             
                                            <form:input class="form-control" id="lastName" placeholder=" " path="lastName" />
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6" id="EmailiD">
                                            <label for="emailAdd">Email ID<a style="color:red;">*</a></label><span id="errorEmail"></span>
                                            
                                            <form:input class="form-control" id="email" placeholder=" " path="emailAdd"  ng-required="true"/>
                                        
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                        <div class="form-group col-md-6" id="PassworD">
                                            <label for="inputPassword4">Password<a style="color:red;">*</a></label>
                                             
                                            <form:password  class="form-control" id="password" placeholder=" " path="password"  ng-required="true"/>
                                        
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-6" id="MobilE">
                                            <label for="inputEmail4">Mobile No.<a style="color:red;">*</a></label><span id="errorMobile_no"></span>
                                             
                                            <form:input class="form-control" id="mobile_no" placeholder=" " path="mobNo"  ng-required="true"/>
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                        <div class="form-group col-md-6" id="LogiN">
                                            <label for="inputPassword4">Login Id<a style="color:red;">*</a></label>
                                            
                                            <form:input class="form-control" id="userId" placeholder=" " path="userId"  ng-required="true"/>
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6" id="Deg">
                                            <label for="inputEmail4" id="des">Designation<a style="color:red;">*</a></label>
                                           
                                            <form:select  class="form-control" path="designationName" id="designationList" ng-required="true"><form:option value="">Select Designation</form:option>
                          <c:forEach var="designationList" items="${designationList}" >  
                                       <form:option value="${designationList.designationid}">${designationList.designation}</form:option>  
                            </c:forEach>
                                                </form:select>
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                        <div class="form-group col-md-6" id="cirCle">
                                            <label for="inputPassword4">Circle/Basin/Project<a style="color:red;">*</a></label>
                                            
                                            <form:select  class="form-control" path="circleName" id="circle1" onchange="myFunction(this.value)" ng-required="true"><form:option value="">Select Circle</form:option>
                                            <c:forEach var="circleList" items="${circleList}" >  
                                       <form:option value="${circleList.circleid}">${circleList.circle}</form:option>  
                                               </c:forEach>
                                                </form:select>
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6" id="Div">
                                            <label for="inputZip">Division<a style="color:red;">*</a></label>
                                          
                                            <form:select class="form-control" path="divisionName" id="division1" onchange="getSubDivision(this.value);" ng-required="true"></form:select>
                                       
                                           
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>

                                        <div class="form-group col-md-6" id="SubdiV">
                                            <label for="inputZip">Sub Division<a style="color:red;">*</a></label>
                                           <form:select class="form-control" path="subdivisionName" id="subDivision1" ng-required="true"></form:select>
                                        
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6" id="AddresS">
                                            <label for="inputEmail4">Address<a style="color:red;">*</a></label>
                                            <form:input class="form-control" id="address" placeholder="" path="address"  ng-required="true"/>
                                         <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                        <div class="form-group col-md-6" id="PincodE">
                                            <label for="inputPassword4">Pincode<a style="color:red;">*</a></label>
                           
                                            <form:input class="form-control" id="pincode" placeholder=" " path="pincode"  ng-required="true"/>
                                            <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="form-group col-md-12 checkboxinline">
                                            <label class="checkbox-inline" style="padding-left: 0;margin-bottom: 4px;"><form:checkbox path="" id="select_all" value=""/><strong>Select All Privilege</strong></label>
                                              
                                              
                                              <form:hidden path="userPrivileges" id="user"/>
                                            <label for="inputEmail4" class="labelbdr-bt"><b>Administration Privilege</b></label>
                                           <form:checkboxes  items="${administration}" path="userPrivileges" id="userPrivileges" class="checkboxall" style="width:20px;height: 20px;"/>
                                         
                                           
                                           
                                            <label for="inputEmail4" class="labelbdr-bt"><b>E-Tendering Privileges</b></label>
                                            <form:checkboxes  items="${ETendering}" path="userPrivileges" class="checkboxall" onclick="showMe(this);" id="userPrivileges" style="width:20px;height: 20px;"/>
                                           
                                                          <span id="div1" style="display:none;">                           Please enter P.A.C. Limit for this officer:
                                                           <form:input path="psclimit" id="psclimit" placeholder="Enter PAC value"/> 
                                                              </span>
                                         
                                           <label for="inputEmail4" class="labelbdr-bt"><b>Pre-Tendering Privileges</b></label>
                                           <form:checkboxes  items="${PreTendering}" path="userPrivileges" id="userPrivileges" class="checkboxall" style="width:20px;height: 20px;"/>
                                           

                                           <label for="inputEmail4" class="labelbdr-bt"><b>Post-Tendering Privileges</b></label>
                                            <form:checkboxes  items="${PostTendering}" path="userPrivileges" id="userPrivileges" class="checkboxall" style="width:20px;height: 20px;"/>
                                            

                                           <label for="inputEmail4" class="labelbdr-bt"><b>E-Auction Privileges</b></label>
                                           <form:checkboxes  items="${EAuction}" path="userPrivileges" id="userPrivileges" class="checkboxall" style="width:20px;height: 20px;"/>
                                           

                                           <label for="inputEmail4" class="labelbdr-bt"><b>RFX Privileges</b></label>
                                           <form:checkboxes  items="${RFX}" path="userPrivileges" id="userPrivileges" class="checkboxall" style="width:20px;height: 20px;"/>
                                           

                                            <label for="inputEmail4" class="labelbdr-bt"><b>Inventory Privileges</b></label>
                                            <form:checkboxes  items="${Inventory}" path="userPrivileges" id="userPrivileges" class="checkboxall" style="width:20px;height: 20px;"/>


                                          

                                        </div>

                                        <div class="row">
                                            <div class="form-group text-center col-md-offset-4 col-md-4">
                                                <form:button type="button" class="btn btn-success" id="saveDept" ng-click="addMore()" value="submit" >Register</form:button>
                                            </div>
                                        </div>
                                    </div>

                                </form:form>
                             

                            </div>
                         </div>
                    </div>
                         <!--FOOTER_SECTION_START-->
        
<!--        <div style="height:500px;"></div>-->
        <!---------Start-Footer-section------------->
        <section class="footer-section">
            <div class="container">
                <div class="link-btn">
                    <a href="disclaimber.action" target="_blank">Disclaimer </a> |
                    <a href="term.action" target="_blank">Terms &amp; Condition and Privacy Policy</a>
                </div>
                <p>Copyright ?
                    <script language="JavaScript" type="text/javascript">
                        document.write((new Date()).getFullYear());
                    </script> All Rights Reserved @ <a href="https://osmoindia.com/" target="_blank">OSMO IT SOLUTION PVT. LTD.</a> </p>
            </div>            
         </section>                                
        <script type="text/javascript">
                        $(function () {
                            $(".daterange").daterangepicker({
                                autoUpdateInput: false,
                                timePicker: true,
                                timePickerIncrement: 30,
                                locale: {
                                    format: 'MM/DD/YYYY h:mm A',
                                    cancelLabel: 'Clear'
                                }
                            });
                        });

                        $(".daterange").on('apply.daterangepicker', function (ev, picker) {
                            $(this).val(picker.startDate.format('DD-MM-YYYY h:mm A') + ' / ' + picker.endDate.format('DD-MM-YYYY h:mm A'));
                        });

                        $(".daterange").on('cancel.daterangepicker', function (ev, picker) {
                            $(this).val('');

                        });
                        $('.multipleSelect').fastselect();
        </script>

<!--vikalp--> 
<!--<link rel="stylesheet" type="text/css" href="/resources/css/app.css">-->
<link rel="stylesheet" href="<c:url value="/resources/css/app3.css"/>">
 
        
<script>
    
    $(document).ready(function() {

    var firstregex = new RegExp(
        '^(([a-zA-Z]+$))'
    );

    var lastregex = new RegExp(
        '^(([a-zA-Z]+$))'
    );
    
    var emailregex = new RegExp(
        '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
        '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
        '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
    );
    
    var passregex = new RegExp(
        '^((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,10})'
    );
    
     var mobregex = new RegExp(
        '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
    );
    
    var loginregex = new RegExp(
        '^(([a-zA-Z0-9 ]+$))'
    );
   
    
    var addressregex = new RegExp(
        '^(([a-zA-Z0-9 ]+$))'
    );
    
    var pinregex = new RegExp(
        '^(([a-zA-Z0-9 ]+$))'
    );
    
    
 
 
    $('#FirstnamE input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', firstregex.test($(this).val()));
    });

    $('#LastnamE input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', lastregex.test($(this).val()));
    });
    
    $('#EmailiD input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', emailregex.test($(this).val()));
    });
    
    $('#PassworD input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', passregex.test($(this).val()));
    });
    
    $('#MobilE input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', mobregex.test($(this).val()));
    });
    
    $('#LogiN input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', loginregex.test($(this).val()));
    });
    
    
    $('#Deg select').on('change', function(e) {
    alert($('#designationList').val());    
        
        if($('#designationList').val() !== ''){ 
                 alert($('#designationList').val());
             
                 $(this).parent().toggleClass('success', true);
            } else {
             $(this).parent().toggleClass('success', false);
        }
       
        
    });
    
    
    $('#cirCle select').on('change', function(e) {
    alert($('#circle1').val());    
        
        if($('#circle1').val() !== ''){ 
                 alert($('#circle1').val());
             
                 $(this).parent().toggleClass('success', true);
            } else {
             $(this).parent().toggleClass('success', false);
        }
       
        
    });
    
    
    $('#Div select').on('change', function(e) {
        
      if($('#division1').val() !== ''){ 
                
        $(this).parent().toggleClass('success', true);
      } else {
          
        $(this).parent().toggleClass('success', false);
        
        }
    });    
    
     $('#SubdiV select').on('change', function(e) {
        
      if($('#subDivision1').val() !== ''){ 
                
        $(this).parent().toggleClass('success', true);
      } else {
          
        $(this).parent().toggleClass('success', false);
        
        }
    });    
    
    $('#AddresS input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', addressregex.test($(this).val()));
    });
    
    $('#PincodE input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', pinregex.test($(this).val()));
    });
     
        
        
       
});

    </script>
    
    
    <script>
     $(document).ready(function() {
  
$(function() {
   
    $('#saveDept').attr('disabled', 'disabled');
});

var regex = /^[a-zA-Z]*$/;
var reg = /^[a-zA-Z0-9 ]*$/;
var mobNoreg = /^[0]?[789]\d{9}$/;
var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
var passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/ ;

$('input[type=text],input[type=password]').keyup(function() {
        
    if ($('#firstName').val() !='' && regex.test($('#firstName').val()) &&  

        $('#lastName').val() != '' && regex.test($('#lastName').val()) &&
        
        $('#email').val() != '' && emailidreg.test($('#email').val()) &&
        
        $('#password').val() != '' && passreg.test($('#password').val()) &&
        
        $('#mobile_no').val() != '' && mobNoreg.test($('#mobile_no').val()) &&
        
        $('#userId').val() != '' && reg.test($('#userId').val()) &&
         
        $('#designationList').val() != '' &&
          
        $('#circle1').val() != '' &&
           
        $('#division1').val() != '' &&
            
        $('#subDivision1').val() != '' &&
       
        $('#address').val() != '' && reg.test($('#address').val()) &&
                
        $('#pincode').val() != '' && reg.test($('#pincode').val())
       
    
    ) 
    {
      
        $('#saveDept').removeAttr('disabled');
    } else {
        $('#saveDept').attr('disabled', 'disabled');
    }
});
    });
</script>
       
    </body>
</html>

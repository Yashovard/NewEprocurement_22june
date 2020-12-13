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
           <style>
            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height:34px;
            }

            .switch input {display:none;}

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;                               
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider {
                background-color: #2196F3;
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(26px);
                -ms-transform: translateX(26px);
                transform: translateX(26px);
            }

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

            .slider.round:before {
                border-radius: 50%;
            }
        </style>
        


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
         
        </style>
        <script>
$(document).ready(function(){
    $('.search').on('keyup',function(){
        var searchTerm = $(this).val().toLowerCase();
        $('#abcd tr').each(function(){
            var lineStr = $(this).text().toLowerCase();
            if(lineStr.indexOf(searchTerm) === -1){
                $(this).hide();
            }else{
                $(this).show();
            }
        });
    });
});
</script>
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
         <script>

                    function myfunction(reg_Id) {
                        var status = $('#status' + reg_Id).is(':checked');
                        alert("just for check status is "+status+" id is "+reg_Id);
                       if(status===true){
                          
                       status="Enable";
                        $.ajax({
                    type: "GET",
                    url: "statusValue",
                    data: {'reg_Id': reg_Id,'status':status},
                   
                    success: function (response) {
                return true;
                            }
                           
                        });
        } else if(status===false){
            
                           status="Disable";
                     $.ajax({
                    type: "GET",
                    url: "statusValue",
                    data: {'reg_Id': reg_Id,'status':status},
                   success: function (response) {
                    return true;
                            }
                           
                        });
                    }
                    }
        </script>
    </head>

    <body ng-controller="MyController">
       <%@include file="Tiles/AdminDashboardHeader.jsp" %>

        <!---------Start Smart Table------------->
        <div class="container" >
            <div class="headertitl">
                <h2 class="subtitle-h2">View Department's Details </h2>
            </div>
        </div>	
        <div class="teblesmart">
            <div class="container" >
                <div class="row">
                    <div class="col-lg-12">

                        <div  class="my-controller">
                            <div class="panel panel-default">
                                <div class="panel-body">

                                    <div class="row">
                                        <div class="col-xs-6">
                                            <label for="search" class="tableSearch">Search:</label>
                                            <input  id="search" class="search form-control" placeholder="Filter text">
                                        </div>
                                        
                                         <div class="col-xs-2"> 
                                             <!--<button focus-index="1" class="btn btn-primary"  data-toggle="modal"  data-target=".bs-example-modal-lg" ng-click="showModel();">Add More</button>-->
                                             <a href="register" ><button focus-index="2" class="btn btn-primary" ng-click="showModel();">Add More</button></a>
                                         <%--on click of add more button the Department User regsitration form fetch from this link--%>
                                         <%--<%@include file="Tiles/DepartmentUserRegistrationForm.jsp" %>--%>
                                         
                                </div>
                                    </div>
                                    <div id ="print">      
                                        <table id="abc"  class="table table-bordered bordered table-striped table-condensed datatable" ui-jq="dataTable" ui-options="dataTableOpt">
                                            <tr>
                                                <th>Name</th>
                                                <th>Designation</th>
                                                <th>Circle</th>
                                                <th>Division</th>
                                                <th>Subdivision</th>
                                                <th>Action</th>
                                                <th>Status</th>
                                                <th>Status</th>
                                            </tr>
                                            <tbody id="abcd">
                                                <tr ng-repeat="all_department in all_departments" current-page="currentPage" >
                                                    <td>{{ all_department.firstName }}&nbsp;{{ all_department.lastName }}</td>
                                                    <td>{{all_department.designations}}</td>
                                                     <td>{{all_department.circle}}</td>
                                                      <td>{{all_department.division}}</td>
                                                    <td>{{ all_department.subDivision}}</td>
<!--                                                     <td><center><a href="updateDepartmentUser?id={{all_department.reg_Id}}"><button  class="btn btn-primary">view/Edit</button></a></center></td>-->
                              <td><center><a href="updateDepartmentUserview?id={{all_department.reg_Id}}"><button  class="btn btn-primary">view/Edit</button></a></center></td>                                        
                                        <td><div id=""> {{all_department.status}} </div> </td>
                                       <td> 
                          <div ng-if="all_department.status == 'Enable'">
    
        <label class="switch">                                      <label class="switch" >
                <input type="checkbox" id="status{{all_department.reg_Id}}" name="status" value="{{all_department.reg_Id}}" onclick="myfunction(this.value)" checked/>
                <span class="slider round"></span> </label>
                  </div>

                        <div ng-if="all_department.status == 'Disable'">
     
                  <label class="switch">
            <label class="switch">
                <input type="checkbox" id="status{{all_department.reg_Id}}" name="status" value="{{all_department.reg_Id}}" onclick="myfunction(this.value)" /> 
                <span class="slider round"></span>
            </label>
                 </div>
                                </td> 
                                
                                                    <!--<td><center><button  class="btn btn-primary" ng-click="editDeptUser(all_department.reg_Id )">Update User</button></center></td>-->
                                                   
                                        
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>  <!-- end of controller -->
                  
                            <div  class="other-controller">
                                <div class="text-center">
                                    <!--<dir-pagination-controls boundary-links="true" on-page-change="pageChangeHandler(newPageNumber)" template-url="dirPagination.tpl.html"></dir-pagination-controls>-->
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--END SMART_TABLE-->

            </div>
        </div>
        <!--FOOTER_SECTION_START-->
        
        <div style="height:500px;"></div>
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
       
    </body>
</html>

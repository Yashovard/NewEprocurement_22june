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
				.editbtn button.btn {
			min-width: 170px;
			padding: 8px;
			margin: 0 6px;
		}
	.registerForm span.form-control{
	border-color:#dedede;
	}
	.keywordcheck li span{
	color:grey;
	}
	.keywordcheck{
	margin-bottom:20px;
	} 
	textarea.textarea {
    border-color: #dedede;
    background-color: white!important;
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
//       var pac=$('#pac').val();
//       alert(pac);
            });
        </script>
       
    </head>

    <body ng-controller="MyController" ng-app>
       <%@include file="AdminDashboardHeader.jsp" %>

      <div class="departmentRegistration" >
                        <div class="container">
                            <div class="departmentForm">
                                <h4 class="modal-title text-center">Department User Registration<hr class="userRegistration"></h4>
                          
                                
                                <div id="form" class="registerForm"   >
                                    <div class="row">
                                        <div class="form-group col-md-6" id="FirstnamE">
                                         
                                            <label for="firstName">First Name</label>
                                             
                                          <span class="form-control">${departmentUser.firstName}</span>
                                        
                                        </div>
                                        <div class="form-group col-md-6" id="LastnamE">
                                            <label for="lastName">Last Name</label>
                                             
                                           <span class="form-control">${departmentUser.lastName}</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6" id="EmailiD">
                                            <label for="emailAdd">Email ID</label><span id="errorEmail"></span>
                                            
                                           <span class="form-control">${departmentUser.emailAdd}</span>
                                        
                                        </div>
                                        
                                        <div class="form-group col-md-6" id="PincodE">
                                            <label for="inputPassword4">Pincode</label>
                            <span class="form-control">${departmentUser.pincode}</span>
                                        </div>
                                       
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-6" id="MobilE">
                                            <label for="inputEmail4">Mobile No.</label><span id="errorMobile_no"></span>
                                            <span class="form-control">${departmentUser.mobNo}</span>
                                        </div>
                                        <div class="form-group col-md-6" id="LogiN">
                                            <label for="inputPassword4">Login Id</label>
                                            <span class="form-control">${departmentUser.userId}</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6" id="Deg">
                                            <label for="inputEmail4" id="des">Designation</label>
                                          <span class="form-control">${departmentUser.designations}</span>
                                        </div>
                                        <div class="form-group col-md-6" id="cirCle">
                                            <label for="inputPassword4">Circle/Basin/Project</label>
                                            
                                          <span class="form-control">${departmentUser.circle}</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6" id="Div">
                                            <label for="inputZip">Division</label>
                                           <span class="form-control">${departmentUser.division}</span>
                                        
                                        </div>

                                        <div class="form-group col-md-6" id="SubdiV">
                                            <label for="inputZip">Sub Division</label>
                                         <span class="form-control">${departmentUser.subDivision}</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6" id="AddresS">
                                            <label for="inputEmail4">Address</label>
                                           <textarea class="form-control textarea" readonly="readonly">${departmentUser.address}</textarea>
                                        </div>
                                        
                                           <c:if test="${departmentUser.psclimit!=null}">
                                       <div class="form-group col-md-6" id="PAClimit">
                                            <label for="inputPassword4">P.A.C. Limit</label>
                                            <span class="form-control">${departmentUser.psclimit}
                                              </span>
                                        </div>
                                        </c:if>
                                    </div>


                                    <div class="keywordprivileges">
									<h4> Privileges:</h4>
                                                                        
                                        <ul class="keywordcheck">
                                           	 <c:forEach var="linksPrivileges" items="${linksPrivileges}">
                                            <li><span>${linksPrivileges.privilegeName}</span>.</li>
							</c:forEach>		
									
									
										</ul>
										 </div>
                                        <div class="row">
                                            <div class="form-group text-center col-md-offset-3 col-md-6 editbtn">
                                                <a href="updateDepartmentUser?id=${departmentUser.reg_Id}"><button  class="btn btn-success" style="width:auto;">Edit</button></a>
                                             
                                             <button type="button" class="btn btn-danger" style="width:auto;">Close</button>
                                            </div>
                                        </div>
                                   

                                </div>
                             

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
     

    </body>
</html>

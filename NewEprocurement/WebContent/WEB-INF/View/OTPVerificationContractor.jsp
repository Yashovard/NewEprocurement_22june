<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js" ng-app="PasswordStrength">
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <style>
            .be-detail-header { 
                border-bottom: 1px solid #edeff2;
                margin-bottom: 50px;
            }
        </style>
    </head>
    <body>
        <div class="container be-detail-container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <br>
                    <img src="https://cdn2.iconfinder.com/data/icons/luchesa-part-3/128/SMS-512.png" class="img-responsive" style="width:200px; height:200px;margin:0 auto;"><br>

                    <h1 class="text-center">Verify your mobile number</h1><br>
                    <p class="lead" style="align:center"></p><p> Thanks for giving your details. An OTP has been sent to your Mobile Number. Please enter the 4 digit OTP below for Successfully Change Your Password.</p>  <p></p>
                    <br>

                    <form:form id="veryfyotp" action="verifyOTPContractor" name="joinTeamForm" role="form" >
                        <input type="hidden" id="generatedotp" name="generatedotp" value="${generatedotp}">
                        <div class="row">                    
                            <div class="form-group col-sm-8">
                                <input id="verifyingotp" class="form-control" name="verifyingotp" placeholder="Enter your OTP number" required="">
                            </div>
                              <input type="hidden" id="regid" name="regid" value="${regid}">
                              <input type="hidden" id="contId" name="contId" value="${contOtherId}">
                            <button type="submit" class="btn btn-primary  pull-right col-sm-3" ng-disabled="joinTeamForm.$invalid">Verify</button>
                        </div>
                    </form:form>
                    <br><br>
                </div>
            </div>        
        </div>
        <script src="resources/bower_components/angular/angular.min.js"></script>
        <script src="resources/assets/js/app.js"></script>
    </body>
    <script>
            $(document).ready(function () {      
                var generatedotp = $("#generatedotp").val();
                alert("generatedotp::" + generatedotp);
            });
    </script>   
</html>
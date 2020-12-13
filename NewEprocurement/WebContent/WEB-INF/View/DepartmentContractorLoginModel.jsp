<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
function Captcha() {
    var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');
    var i;
    for (i = 0; i < 6; i++) {
        var a = alpha[Math.floor(Math.random() * alpha.length)];
        var b = alpha[Math.floor(Math.random() * alpha.length)];
        var c = alpha[Math.floor(Math.random() * alpha.length)];
        var d = alpha[Math.floor(Math.random() * alpha.length)];
        var e = alpha[Math.floor(Math.random() * alpha.length)];
        var f = alpha[Math.floor(Math.random() * alpha.length)];
        var g = alpha[Math.floor(Math.random() * alpha.length)];
    }
    var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' ' + f + ' ' + g;
    document.getElementById("mainCaptcha").value = code
    document.getElementById("mainCaptcha1").value = code
}
function ValidCaptcha() {
       var str = removeSpaces(document.getElementById('mainCaptcha1').value);
//    alert("str::"+str);
    var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
    var string2 = removeSpaces(document.getElementById('txtInput').value);
    var string3 = removeSpaces(document.getElementById('txtInput1').value);
                
    if(string3 === ""){    
  var message = 'Must Keep Captcha';
                if (message !== "") {
                    swal(
                            '',
                            message,
                            'error'
                            )
                }
document.getElementyId("validateCaptcha").innerHTML = "Must Keep Captcha";
        return false;        
    }
    else{
     document.getElementById("validateCaptcha").innerHTML = "";   
    }
 
    if (string1 === string2 || str === string3) {
            return true;
    }
    else {
document.getElementById("validateCaptcha").innerHTML = "Captcha Does Not Matched";
return false;
    }
}
function removeSpaces(string) {
    return string.split(' ').join('');
}
</script> 
</head>
<div class="modal fade" id="myModal1" role="dialog">
<div class="modal-dialog" style="width:50%;height: 50px;">

<!------------------------------- Modal content------------------------------>
<div class="modal-content">
    <div class="modal-header">
        <div class="img-logo11">
            <a href="#"><img src="resources/images/demo.png" style="height: 70px;width: 120px;" alt="LOTUSPROCURE_LOGO_IMAGE" ></a>
        </div>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="title-heading1" style="margin-top: 70px;">Login Form</h2>
    </div>

    <div class="modal-body ">
        <div class="model-form">

            <div class="tab-content">
                <div id="home111" class="tab-pane fade active in">
                    <h5 style="color: red">${invalidUser}</h5>
<form:form action="login" id="form" modelAttribute="commonlogin" onsubmit="return ValidateForm()" autocomplete="off">

<input type="hidden" name="testMessage" value="" id="ContractorLoginCheck_testMessage">

    <input type="hidden" name="rfqMessage" value="" id="ContractorLoginCheck_rfqMessage">

        <input type="hidden" name="loginErrorMessage" value="" id="ContractorLoginCheck_loginErrorMessage"> 

            <input type="hidden" name="myip" value="192.99.34.207" id="ContractorLoginCheck_myip">
                <input type="hidden" name="macAddressName" value="BC-EE-7B-DC-AD-9C" id="ContractorLoginCheck_macAddressName">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <!--      <input type="text" name="emailAdnamed" class="form-control" id="inputGroupSuccess3" placeholder="Contractor User Id" aria-describedby="inputGroupSuccess3Status">-->
                        <div id="wwgrp_ContractorLoginCheck_emailAdd" class="wwgrp">
                            <div id="wwctrl_ContractorLoginCheck_emailAdd" class="wwctrl">
                                <form:input path="emailid" id="email_id" name="emailid" placeholder="Enter Email Id/Contact No"  class="text form-control" autocomplete="off" /></div> </div>
                                <form:errors path="emailid" cssClass="error" />
                    </div><br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-key"></i></span>
                            <!--      <input type="password" name="password" class="form-control" id="inputGroupSuccess3" placeholder="Password" aria-describedby="inputGroupSuccess3Status">-->
                            <div id="wwgrp_ContractorLoginCheck_password" class="wwgrp">
                                <div id="wwctrl_ContractorLoginCheck_password" class="wwctrl">
                                    <form:password path="password" id="enc_pwd" name="enc_pwd" placeholder="Enter Password" class="text form-control" autocomplete="off" /></div> </div>
                        </div>
                        <br>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="text" id="txtInput" placeholder="Enter Below Text" class="form-control" onpaste="return false;" ondrop="return false;">

                            </div>
                            <br>
                                <input type="text" class="captchaimg-bg" id="txtCaptcha" readonly="" value="33333" style="background-image: url(./images/1.jpg);
                                       color: #fff;
                                       text-align: center;
                                       border: none;
                                       font-weight: bold;
                                       font-family: Modern;
                                       letter-spacing: 1em;
                                       font-size: 18px;
                                       width:100%;">
                                    <input type="text" id="mainCaptcha" />
                                    <h5>Click Here <span style="color:red;"><a href="#" style="color:red;"><i class="fa fa-refresh" id="btnrefresh" value="Refresh" onclick="Captcha();"></i></a></span> for Refresh</h5> 
                                    <br>
                                        <br>
                                            <input type="submit" value="Login" onclick="ValidCaptcha();" class="btn btn-success pull-right" ng-disabled="joinTeamForm.$invalid">

                                                <a href="forgotPassword" style="color:#000;">Forget Password ?</a>
                                                <!--                                              <div class="row"> <a href="forgetId.jsp" class="button-1" >Forgot Password</a>
                                                <input type="submit" class="button" value="Login"></input> </div>-->
                                            </form:form> 

                                            </div>

                                            </div>
                                            </div>
                                            </div>
                                            </div>

</div>
</div>
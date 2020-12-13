<div class="modal fade" id="myModal3" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="img-logo11">
                                    <a href="#"><img src="<c:url value="/resources/images/demo.png"/>" alt="LOTUSPROCURE_LOGO_IMAGE"></a>
                                </div>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Login Form</h4>
                            </div>

                            <div class="modal-body bg-gr">
                                <div class="model-form">
                                    <h2 class="title-heading1">Login Form</h2>
                                    <div class="tab-content">
                                        <div id="home111" class="tab-pane fade active in">
                                            <form id="ContractorLoginCheck" name="form" action="DepartmentAdminLogin" method="post" autocomplete="off" onsubmit=" return ValidCaptcha();">

                                                <input type="hidden" name="testMessage" value="" id="ContractorLoginCheck_testMessage">

                                                <input type="hidden" name="rfqMessage" value="" id="ContractorLoginCheck_rfqMessage">

                                                <input type="hidden" name="loginErrorMessage" value="" id="ContractorLoginCheck_loginErrorMessage">

                                                <input type="hidden" name="myip" value="192.99.34.207" id="ContractorLoginCheck_myip">
                                                <input type="hidden" name="macAddressName" value="BC-EE-7B-DC-AD-9C" id="ContractorLoginCheck_macAddressName">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>

                                                    <div id="wwgrp_ContractorLoginCheck_emailAdd" class="wwgrp">
                                                        <div id="wwctrl_ContractorLoginCheck_emailAdd" class="wwctrl">
                                                            <input type="text" name="emailAdd" value="" id="ContractorLoginCheck_emailAdd" class="text form-control" autocomplete="off" placeholder="User ID">
                                                        </div>
                                                    </div>

                                                </div>
                                                <br>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                                    <div id="wwgrp_ContractorLoginCheck_password" class="wwgrp">
                                                        <div id="wwctrl_ContractorLoginCheck_password" class="wwctrl">
                                                            <input type="password" name="password" id="ContractorLoginCheck_password" class="text form-control" autocomplete="off" placeholder="Your Password">
                                                        </div>
                                                    </div>

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
	width:100%;"> Click Here <span style="color:red;"><a href="#" style="color:red;"><i class="fa fa-refresh" id="btnrefresh" value="Refresh" onclick="DrawCaptcha();"></i></a></span> for Refresh

                                                <br>
                                                <br>

                                                <input type="submit" value="Login" onclick="ValidCaptcha();" class="btn btn-success pull-right">
                                                <input type="submit" value="Reset" onclick="ValidCaptcha();" class="btn  btn-danger btn-success pull-right" style="">
                                                <a href="forgetId.jsp" style="color:#000;">Forget Password ?</a>
                                            </form>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
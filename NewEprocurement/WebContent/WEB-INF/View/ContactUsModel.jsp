<div class="modal fade" id="myModal555" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <div class="img ">
                    <img src="<c:url value="/resources/images/demo.png"/>" alt="contact_us">
                         <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

            </div>

            <div class="modal-body bg-gr ">
                <div class="model-form">
                    <div class="row">
                        <div class="col-sm-6">

                            <form method="POST" action="" class="form  cntcfrm" id="regqqqqq">
                                <h2 class="title">Contact Us</h2>
                                <span id="reqecc"></span>
                                <div class="form-group">
                                    <input class="form-control" name="name1" id="name1" value="" placeholder="Full name" type="text">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" name="email1" id="email1" value="" placeholder="E-mail" type="email">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" name="mobile1" id="mobile1" value="" placeholder="Contact No" type="text">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control messagebox" name="message1" id="message1" placeholder="Message"></textarea>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" name="mobile1" id="mobile1" value="" placeholder="Enter Below Text" type="text">
                                </div>
                                <span  ><img src="<c:url value="/resources/images/captcha.png"/>" alt="Captcha_img" style="width:30%;"></span> Click Here <span style="color:red;"><a href="#" style="color:red;"><i class="fa fa-refresh" id="btnrefresh" value="Refresh" onclick="DrawCaptcha();"></i></a></span> for Refresh

                                <input type="Submit" value="submit" onclick="ValidCaptcha();" class="btn btn-info pull-right">
                                <input type="submit" value="Reset" onclick="ValidCaptcha();" class="btn btn-danger pull-right">  
                            </form>


                        </div>

                        <div class="col-sm-6">
                            <div class="hlpdesk">
                                <!-- <h2 class="title">Help Desk</h2>-->
                                <div class="img-support"> <img src="<c:url value="/resources/images/helpdesksupport.png"/>" align="Help_Desk"></div>
                                <ul class="help-desk">
                                    <li><a href="#"><span class="icn-cnt"><i class="fa fa-phone" aria-hidden="true"></i></span></a>0755-4078646/48 </li>
                                    <li><a href="#"><span class="icn-cnt"><i class="fa fa-envelope-o" aria-hidden="true"></i></span> support@lotusprocure.in</a></li>
                                    <li><a href="#"><span class="icn-cnt"><i class="fa fa-clock-o" aria-hidden="true"></i></span></a>Mon to Sat - 10:00 AM to 7:00 PM </li>
                                </ul>
                            </div>
                        </div>

                    </div><!--close row-->

                </div>
            </div>
        </div>

    </div>
</div>
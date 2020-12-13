<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<html ng-app="myApp">
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="<c:url value="/resources/js/angular/ContractorController.js" />"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2"></script>
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<!---------Vikalp  CSS Start------------->
        <style>
            .svgposition{
                position:relative;
            }
            .svgposition svg {
                z-index: 1;
                right: 14px;
                top: 50%;
                width: 20px;
                height: 20px;
                fill: none;
                margin: -10px 0 0 0;
                position: absolute;
                top: -54px;
            }
            .true svg polyline, .true svg path {
                stroke-width: 1.4;
                stroke-linecap: round;
                stroke-linejoin: round;
                transition: stroke 0.3s ease 0s;
            }
            .true svg path {
                stroke-dasharray: 64;
                stroke-dashoffset: 127;
                transition: stroke-dasharray 0.8s ease 0.8s, stroke-dashoffset 0.8s ease 0.5s;
            }
            .true svg polyline {
                stroke-dasharray: 18;
                stroke-dashoffset: 18;
                transition: stroke-dashoffset 0.5s ease 0s;
            }
            .valid .success svg polyline, .valid .success svg path {
                stroke: #69dd95;
            }
            .valid .success svg path {
                stroke-dasharray: 46;
                stroke-dashoffset: 150;
                transition: stroke-dasharray 0.6s ease 0s, stroke-dashoffset 0.8s ease 0.3s, stroke 0.3s ease 0.6s;
            }
            .valid .success svg polyline {
                stroke-dashoffset: 0;
                transition: stroke-dashoffset 0.5s ease 0.6s, stroke 0.3s ease 0.6s;
            }

            .false .error-icon-first {
                stroke-dashoffset: 11.3137px;
                transition: stroke-dashoffset .25s ease-in;
                -webkit-transition: stroke-dashoffset .25s ease-in;
            }

            .false .error-icon-last {
                stroke-dashoffset: 11.3137px;
                transition: stroke-dashoffset .25s cubic-bezier(.25,.8,.25,1);
                -webkit-transition: stroke-dashoffset .25s cubic-bezier(.25,.8,.25,1);
                transition-delay: .25s;
                -webkit-transition-delay: .25s;
            }

            .works-active .false .error-icon-first {
                stroke-dashoffset: 0;
            }

            .works-active .false .error-icon-last {
                stroke-dashoffset: 0;
            }

        </style>
<!---------Vikalp css end------------->        
<!---------Contractor Registration------------->
    </head>
    <body ng-controller="myRegistration" onload="DrawCaptcha();">

        <div class="modal fade" id="indentModal1" role="dialog" data-backdrop="static">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="border-btm">
                        <div class="row">
                            <div class="col-md-2 col-sm-3">
                                <div class="img-logo11">
                                    <a href="#">   
                                        <img style="width: 150px;" src="<c:url value="/resources/images/demo.png"/>" alt="LOTUSPROCURE_LOGO_IMAGE"></a>
                                </div>
                            </div>
                            <div class="col-md-9 col-sm-8">
                                <!-----------------start-wizard-tab----------------->
                                <div class="wizard-section rfx-tab-nav indent-tab-nav">
                                    <div class="wizard rfx">
                                        <div class="wizard-inner">
                                            <div class="connecting-line"></div>
                                            <ul class="nav nav-tabs" role="tablist">
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-----------------end-wizard-tab----------------->
                            </div>
                            <div class="col-md-1 col-sm-1 col-sm-1">
                                <div class="pp">

                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                </div>
                            </div>
                        </div>
                        <h4 style="padding-left: 160px;margin-bottom: 10px;margin-top: -12px;">Contractor Registration Details</h4>
                    </div>
                    <!-----------------start-wizard-tab-content----------------->
                    <div class="modal-body ">
                        <div class="wizard-tab-content auction-tender-tab indent-tender-tab ">
                            <s:form modelAttribute="contractor" id="Savecontractor">
                                <s:hidden path="id"/>
                                <div class="tab-content">
                                    <div class="tab-pane active " role="tabpanel" id="step1111"> 
                                        <!--start-Generate Tender Number fields-->
                                        <div class="tab-content1-detail ">

                                            <!--vikalp class="valid"-->     <div class="create-tn-no Tender-Information tn-1tb valid" 
id="tender_create1">                                                    
                                                <div class="col-md-12">
                                                    <div class="form-group col-md-4">
                                                        <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-left: -28px;"> First Name:</label>
                                                        <div class="tender-no">
                                                            <!--vikalp class="First_Name"-->                            <s:input path="firstname" cssClass="form-control First_Name" 
id="firstname" oninput="join_names();" placeholder="First Name" style="width: 177px;margin-left: -28px;"/> 
                                                            <s:errors path="firstname" cssClass="error"/>

                                                            <!--vikalp SVG start-->       <div class="true svgposition successMessage">
                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 
C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 
15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>

                                                            <div class="false svgposition errorMessage">
                                                                <svg width="25" height="25" viewBox="0 0 24 24">
                                                                <path class="error-icon-first" d="M 8 8 L 16 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                                <path class="error-icon-last" d="M 16 8 L 8 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                                </svg>
                                                                <!--vikalp SVG end-->               </div>

                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-left: -15px;"> Middle Name:</label>
                                                        <div class="tender-no">
                                                            <!--vikalp class="Middle_Name"-->           <s:input path="middlename" cssClass="form-control Middle_Name" 
id="middlename" oninput="join_names();" placeholder="Middle Name" style="width: 169px;margin-left: -18px;" />


                                                            <!--vikalp SVG start-->          <div class="true svgposition successMessage">
                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 
C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 
15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>

                                                            <div class="false svgposition errorMessage">
                                                                <svg width="25" height="25" viewBox="0 0 24 24">
                                                                <path class="error-icon-first" d="M 8 8 L 16 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                                <path class="error-icon-last" d="M 16 8 L 8 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                                </svg>
                                                                <!--vikalp SVG end-->             </div>

                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-left: -15px;"> Last Name:</label>
                                                        <div class="tender-no">
                                                            <!--vikalp class="Last_Name"-->          <s:input path="lastname" cssClass="form-control Last_Name" id="lastname" 
oninput="join_names();" placeholder="Last Name" value="" style="margin-left: -16px;width: 176px;"/>
                                                            <s:errors path="lastname" cssClass="error"/>

                                                            <!--vikalp SVG start-->             <div class="true svgposition successMessage">
                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 
C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 
15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>

                                                            <div class="false svgposition errorMessage">
                                                                <svg width="25" height="25" viewBox="0 0 24 24">
                                                                <path class="error-icon-first" d="M 8 8 L 16 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                                <path class="error-icon-last" d="M 16 8 L 8 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                                </svg>
                                                                <!--vikalp SVG end-->               </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-12">
                                                    <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="width:544px;cursor: d;cursor: no-drop;margin-left: 
-13px;margin-right: -82px;"> Full Name:</label>
                                                    <div class="tender-no"  id="FullnamE">
                                                        <s:input path="fullname" cssClass="form-control" id="fullname" style="width:547px;cursor: d;cursor: no-drop;margin-left: 
-12px;" readonly="true"/>


                                                    </div>
                                                </div>

                                                <div class="form-group col-md-4">
                                                    <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-left: -11px;"> Company:</label>
                                                    <div class="tender-no">
                                                        <!--vikalp class="Company"-->             <s:input path="company" cssClass="form-control Company" id="company"   
placeholder="Company"   value="" style="margin-left: -11px;margin-right: 0px;width: 242px;"/>
                                                        <s:errors path="company" cssClass="error"/>

                                                        <!--vikalp SVG start-->              <div class="true svgposition successMessage">
                                                            <svg viewBox="0 0 16 16">
                                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 
5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 
C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                            </svg>
                                                        </div>

                                                        <div class="false svgposition errorMessage">
                                                            <svg width="25" height="25" viewBox="0 0 24 24">
                                                            <path class="error-icon-first" d="M 8 8 L 16 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            <path class="error-icon-last" d="M 16 8 L 8 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            </svg>
                                                            <!--vikalp SVG end-->     </div>

                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-right: 3px;margin-left: 102px;"> 
Designation:</label>
                                                    <div class="tender-no">
                                                        <!--vikalp class="Designation"-->           <s:input path="designation" cssClass="form-control Designation" id="designation" 
placeholder="Designation"  style="width: 244px;margin-left: 99px;margin-right: 23px;" />
                                                        <s:errors path="designation" cssClass="error"/>

                                                        <!--vikalp SVG start-->         <div class="true svgposition successMessage">
                                                            <svg viewBox="0 0 16 16">
                                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 
5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 
C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                            </svg>
                                                        </div>

                                                        <div class="false svgposition errorMessage">
                                                            <svg width="25" height="25" viewBox="0 0 24 24">
                                                            <path class="error-icon-first" d="M 8 8 L 16 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            <path class="error-icon-last" d="M 16 8 L 8 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            </svg>
                                                            <!--vikalp SVG end-->               </div>

                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-left: -11px;"> Mobile No.:</label>
                                                    <div class="tender-no">
                                                        <span id="errormobile"></span>
                                                        <!--vikalp class="Mobile_No"-->           <s:input path="mobileno" cssClass="form-control Mobile_No" id="mobile"  
placeholder="Enter Mobile Number"   value="" style="margin-left: -12px;margin-right: 0px;width: 240px;"/>
                                                        <s:errors path="mobileno" cssClass="error"/>


                                                        <!--vikalp SVG start-->             <div class="true svgposition successMessage">
                                                            <svg viewBox="0 0 16 16">
                                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 
5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 
C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                            </svg>
                                                        </div>

                                                        <div class="false svgposition errorMessage">
                                                            <svg width="25" height="25" viewBox="0 0 24 24">
                                                            <path class="error-icon-first" d="M 8 8 L 16 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            <path class="error-icon-last" d="M 16 8 L 8 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            </svg>
                                                            <!--vikalp SVG end-->             </div>

                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-right: 3px;margin-left: 102px;"> Email 
Id:</label>
                                                    <div class="tender-no">

                                                        <!--vikalp class="Email_Id"-->           <s:input path="emailid" cssClass="form-control Email_Id" id="email"  
placeholder="Enter Email Id"   value="" style="margin-left: 99px;margin-right: 0px;" />
                                                        <s:errors path="emailid" cssClass="error"/>

                                                        <!--vikalp SVG start-->      <div class="true svgposition successMessage">
                                                            <svg viewBox="0 0 16 16">
                                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 
5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 
C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                            </svg>
                                                        </div>

                                                        <div class="false svgposition errorMessage">
                                                            <svg width="25" height="25" viewBox="0 0 24 24">
                                                            <path class="error-icon-first" d="M 8 8 L 16 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            <path class="error-icon-last" d="M 16 8 L 8 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            </svg>
                                                            <!--vikalp SVG end-->          </div>

                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-left: -11px;"> Password:</label>
                                                    <div class="tender-no">
                                                        <!--vikalp class="Password"-->        <s:password path="password" cssClass="form-control Password" id="password"   
placeholder="Enter Password"   value="" style="margin-left: -12px;margin-right: 0px;width: 239px;"  />
                                                        <s:errors path="password" cssClass="error"/>


                                                        <!--vikalp SVG start-->            <div class="true svgposition successMessage">
                                                            <svg viewBox="0 0 16 16">
                                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 
5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 
C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                            </svg>
                                                        </div>

                                                        <div class="false svgposition errorMessage">
                                                            <svg width="25" height="25" viewBox="0 0 24 24">
                                                            <path class="error-icon-first" d="M 8 8 L 16 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            <path class="error-icon-last" d="M 16 8 L 8 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            </svg>
                                                            <!--vikalp SVG end-->          </div>


                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-right: 3px;margin-left: 102px;"> Confirm 
Password:</label>
                                                    <div class="tender-no">

                                                        <!--vikalp class="Confirm_Password"-->          <input type="password" name="password1" Class="form-control 
Confirm_Password" id="password1" placeholder="Confirm Password"   value="" style="margin-left: 99px;margin-right: 0px;width: 
247px;height: 34px;" />


                                                        <!--vikalp SVG start-->        <div class="true svgposition successMessage">
                                                            <svg viewBox="0 0 16 16">
                                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 
5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 
C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                            </svg>
                                                        </div>

                                                        <div class="false svgposition errorMessage">
                                                            <svg width="25" height="25" viewBox="0 0 24 24">
                                                            <path class="error-icon-first" d="M 8 8 L 16 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            <path class="error-icon-last" d="M 16 8 L 8 16" stroke-dasharray="11.3137" stroke-width="2" stroke="#fa625a" />
                                                            </svg>
                                                            <!--vikalp SVG end-->           </div>

                                                    </div>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="colFormLabelSm" class="  col-form-label col-form-label-sm" style="margin-left: -15px;">Captcha: </label>
                                                    <div class="tender-no" >

                                                        <input type="text" id="txtCaptcha" autocomplete="off"
                                                               style="background-image:url(1.jpg); text-align:center; border:none;
                                                               font-weight:bold; font-family:Modern; background: #0784bd; " type="text"> 

                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="colFormLabelSm" class="  col-form-label col-form-label-sm"> </label>
                                                    <div class="tender-no" id="Cap">
                                                        <input type="hidden" value="" id="kaptcha"/>
                                                        <input type="text" id="captcha" Class="form-control" placeholder="Enter Captcha" style="margin-top: 13px;margin-right: 
59px;margin-left: 5px;width: 243px;height: 34px;"  />    
                                                    </div>
                                                </div>
                                                <br>
                                                <div style="width:200px; height:30px;">Click Here <span style="color:red;"><a href="#" style="color:red;"><i class="fa fa-refresh" 
id="btnrefresh" value="Refresh" onclick="DrawCaptcha();"></i></a></span> for Refresh</div>

                                                <br>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="list-inline pull-right">
                                        <li>
                                            <button type="button" class="btn btn-primary" id="sbtbtn" data-dismiss="modal"  disabled="true" 
ng-click="saveContractor();openModal();">save</button>
                                        </li>
                                    </ul>
                                </div>
                            </div>                           
                            <div class="clearfix"></div>
                        </div>
                    </s:form>
                </div>
            </div>
        </div>                                      
    </body>
</html>
<!---------end-Contractor Registration------------->
<!----------Restriction from captcha and password to copy and paste------------->
<script>
    $("#password,#password1 ").on("copy cut paste drop", function () {
        return false;
    });
    $(document).ready(function () {
    });

    $("#txtCaptcha,#captcha").on("copy cut paste drop", function () {
        return false;
    });
    $(document).ready(function () {

    });

</script>
<!-----------------------------------concatenate------------------------------->
<script type="text/javascript">
    function concatenate(/*String*/string_one, /*String*/string_two, /*String*/string_three, /*boolean*/with_space) {
        if (with_space === true) {
            return string_one + ' ' + string_two + ' ' + string_three;
        }
        else {
            return string_one + string_two + string_three;
        }
    }
    function join_names() {
        var input_name_first = document.getElementById("firstname").value;
        var input_name_middle = document.getElementById("middlename").value;
        var input_name_last = document.getElementById("lastname").value;
        var fullname = document.getElementById('fullname');
        var var_name_full = input_name_first + ' ' + input_name_middle + ' ' + input_name_last;
        document.getElementById('fullname').value = var_name_full;
    }
</script>
<!----------------------Generate captcha--------------------------------------->
<script type="text/javascript">
    var code;
    function DrawCaptcha()
    {
        var a = Math.ceil(Math.random() * 7) + '';
        var b = Math.ceil(Math.random() * 7) + '';
        var c = Math.ceil(Math.random() * 7) + '';
        var d = Math.ceil(Math.random() * 7) + '';
        var e = Math.ceil(Math.random() * 7) + '';
        var f = Math.ceil(Math.random() * 7) + '';
        code = a + ' ' + b + ' ' + c + ' ' + d + ' ' + e + ' ' + f;
        document.getElementById("txtCaptcha").value = code;
      
//        var kcapt = $("#kaptcha").val(code);
//        console.log(kcapt);
//         alert("cc"+kcapt);
//           alert("captcha"+$('#captcha').val()); 
//        if(kcapt == $('#captcha').val()){
//             alert("hello");
//            return false;           
//        }
    }
    function removeSpaces(string)
    {
        return string.split(' ').join('');
    }
</script>
<!----------------------------ClientSide Validation---------------------------->
<!-- Validate CSS -->
<!--<script>
    $(document).ready(function () {
        var firstregex = new RegExp(
                '^(([a-zA-Z]+$))'
                );

        var midregex = new RegExp(
                '^(([a-zA-Z]+$))'
                );

        var lastregex = new RegExp(
                '^(([a-zA-Z]+$))'
                );

        var fullregex = new RegExp(
                '^(([a-zA-Z]+$))'
                );

        var comregex = new RegExp(
                '^(([a-zA-Z ]+$))'
                );

        var degregex = new RegExp(
                '^(([a-zA-Z ]+$))'
                );
        var mobregex = new RegExp(
                '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                );

        var emailregex = new RegExp(
                '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
                );

        var passregex = new RegExp(
                '^((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,10})'
                );

        var cpassregex = new RegExp($("#PassworD").val());

        $('#FirstnamE input').on('keyup', function (e) {
            $(this).parent().toggleClass('success', firstregex.test($(this).val()));
        });

        $('#MiddlenamE input').on('keyup', function (e) {
            $(this).parent().toggleClass('success', midregex.test($(this).val()));
        });

        $('#LastnamE input').on('keyup', function (e) {
            $(this).parent().toggleClass('success', lastregex.test($(this).val()));
        });


        $('#FullnamE input').on('keyup', function (e) {
            $(this).parent().toggleClass('success', fullregex.test($(this).val()));
        });

        $('#CompanY input').on('keyup', function (e) {
            $(this).parent().toggleClass('success', comregex.test($(this).val()));
        });

        $('#Deg input').on('keyup', function (e) {
            $(this).parent().toggleClass('success', degregex.test($(this).val()));
        });


        $('#Mob input').on('keyup', function (e) {
            $(this).parent().toggleClass('success', mobregex.test($(this).val()));
        });

        $('#EmaiL input').on('keyup', function (e) {
            $(this).parent().toggleClass('success', emailregex.test($(this).val()));
        });

        $('#PassworD input').on('keyup', function (e) {
            $(this).parent().toggleClass('success', passregex.test($(this).val()));
        });

        $('#CPassworD input').on('keyup', function (e) {
            if ($("#password").val() == $(this).val()) {
                $(this).parent().toggleClass('success', true);
            } else {
                $(this).parent().toggleClass('success', false);
            }
        });
    });
</script>-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script>
    $(document).ready(function () {
      
        var nameregex = new RegExp(
                '^(([a-zA-Z]+$))'
                );
        var cdregex = new RegExp(
                '^(([a-zA-Z ]+$))'
                );
        var mobregex = new RegExp(
                '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                );
        var emailregex = new RegExp(
                '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{3,3}))$'
                );
        var passregex = new RegExp(
                '^((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,10})'
                );

        $('.First_Name').on('keyup', function (e) {

            if (nameregex.test($(this).val())) {
                $(this).parent().removeClass('works-active');
                $(this).parent().addClass('success');

                console.log("success");
            } else {

                $(this).parent().removeClass('success');
                $(this).parent().addClass('works-active');

                console.log("error");
            }
        });

        $('.Middle_Name').on('keyup', function (e) {

            if (nameregex.test($(this).val())) {
                $(this).parent().removeClass('works-active');
                $(this).parent().addClass('success');

                console.log("success");
            } else {

                $(this).parent().removeClass('success');
                $(this).parent().addClass('works-active');

                console.log("error");
            }
        });

        $('.Last_Name').on('keyup', function (e) {

            if (nameregex.test($(this).val())) {
                $(this).parent().removeClass('works-active');
                $(this).parent().addClass('success');

                console.log("success");
            } else {

                $(this).parent().removeClass('success');
                $(this).parent().addClass('works-active');

                console.log("error");
            }
        });

        $('.Company').on('keyup', function (e) {

            if (cdregex.test($(this).val())) {
                $(this).parent().removeClass('works-active');
                $(this).parent().addClass('success');

                console.log("success");
            } else {

                $(this).parent().removeClass('success');
                $(this).parent().addClass('works-active');

                console.log("error");
            }
        });

        $('.Designation').on('keyup', function (e) {

            if (cdregex.test($(this).val())) {
                $(this).parent().removeClass('works-active');
                $(this).parent().addClass('success');

                console.log("success");
            } else {

                $(this).parent().removeClass('success');
                $(this).parent().addClass('works-active');

                console.log("error");
            }
        });

        $('.Mobile_No').on('keyup', function (e) {

            if (mobregex.test($(this).val())) {
                $(this).parent().removeClass('works-active');
                $(this).parent().addClass('success');

                console.log("success");
            } else {

                $(this).parent().removeClass('success');
                $(this).parent().addClass('works-active');

                console.log("error");
            }
        });

        $('.Email_Id').on('keyup', function (e) {

            if (emailregex.test($(this).val())) {
                $(this).parent().removeClass('works-active');
                $(this).parent().addClass('success');

                console.log("success");
            } else {

                $(this).parent().removeClass('success');
                $(this).parent().addClass('works-active');

                console.log("error");
            }
        });

        $('.Password').on('keyup', function (e) {

            if (passregex.test($(this).val())) {
                $(this).parent().removeClass('works-active');
                $(this).parent().addClass('success');

                console.log("success");
            }
            else {
                $(this).parent().removeClass('success');
                $(this).parent().addClass('works-active');

                console.log("error");
            }
        });

        $('.Confirm_Password').on('keyup', function (e) {

            if ($(".Password").val() == $(this).val()) {
                $(this).parent().removeClass('works-active');
                $(this).parent().addClass('success');

                console.log("success");
            } else {

                $(this).parent().removeClass('success');
                $(this).parent().addClass('works-active');

                console.log("error");
            }
        });
    });
</script>
<!----------------------------ClientSide Validation start---------------------->
<script>
    $(document).ready(function () {
        $(function () {
            $('#sbtbtn').attr('disabled', 'disabled');
        });

        var regex = /^[a-zA-Z]*$/;
        var reg = /^[a-zA-Z ]*$/;
        var num = /^[0-9]*$/;
        var mobNoreg = /^[0]?[789]\d{9}$/;
        var emailidreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/;

        $('input[type=text],input[type=password]').keyup(function () {
            if     ($('#firstname').val() != '' && regex.test($('#firstname').val()) &&
                    $('#lastname').val() != '' && regex.test($('#lastname').val()) &&
                    $('#company').val() != '' && reg.test($('#company').val()) &&
                    $('#designation').val() != '' && reg.test($('#designation').val()) &&
                    $('#mobile').val() != '' && mobNoreg.test($('#mobile').val()) &&
                    $('#email').val() != '' && emailidreg.test($('#email').val()) &&
                    $('#password').val() != '' && passreg.test($('#password').val()) &&
                    $('#password').val() == $('#password1').val() &&
                    $('#captcha').val() != '' && num.test($('#captcha').val()))
            {
                $('#sbtbtn').removeAttr('disabled');
            } else {
                $('#sbtbtn').attr('disabled', 'disabled');
            }
        });
    });

    $(document).ready(function(){
            $("#captcha").blur(function(){
            var txtCaptcha = $("#txtCaptcha").val();
            var txtCap = txtCaptcha.replace(/ /g,'');
//            alert(txtCap);
            var captcha = $("#captcha").val();
//            alert(captcha);
            if(txtCap === captcha)
            {
//                alert("Enable the button");
                $('#sbtbtn').removeAttr('disabled');
            } else {
//                alert("Disable the button");
                $('#sbtbtn').attr('disabled', 'disabled');
            }   
        });
    });
</script>
<!----------------------------ClientSide Validation end---------------------------->

<!-------------------check duplicate email id and mobile number---------------->
<script>
    $(document).ready(function () {

        $("#email").change(function () {
//           alert("just for check");
            var email = $("#email").val();
//            alert(email);
            $.ajax({
                url: "CheckEmail",
                data: {email: email},
                success: function (res) {
//                   alert(res);
                    if (res !== "valid EmailId") {
//                        alert("done");
                        $("#erroremail").css('color', 'red');
                        $("#erroremail").html("Email Id is already exist");
                        $("#email").append(res);
                    }
                    else {
                        $("#erroremail").css('color', 'red');
                        $("#erroremail").html("");
                        $("#email").append(res);
                    }
                }
            });
        });

        $("#mobile").change(function () {
//                        alert("just for check");
            var mobile = $("#mobile").val();
//                           alert(mobile);
            $.ajax({
                url: "checkUserContact",
                data: {mobile: mobile},
                success: function (res) {
//                                alert(res);
                    if (res !== "valid mobile_no") {
//                                    alert("done");
                        $("#errormobile").css('color', 'red');
                        $("#errormobile").html("Mobile No. is already exist");
                        $("#mobile").append(res);
                    }
                    else {
                        $("#errormobile").css('color', 'red');
                        $("#errormobile").html("");
                        $("#mobile").append(res);
                    }
                }
            });
        });
    });
</script>
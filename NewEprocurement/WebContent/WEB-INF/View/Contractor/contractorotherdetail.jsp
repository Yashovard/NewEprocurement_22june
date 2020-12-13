
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
 
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta charset="utf-8">
        <!-- Latest IE rendering engine & Chrome Frame Meta Tags -->
        <!--[if IE]>
            <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
            <![endif]-->
        <!-- TITLE-->
        <title>Dashboard</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="resources/images/demo.png">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/new-dashboard.css">
        <link rel="stylesheet" href="resources/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="resources/css/jquery-ui.css">
        <link rel="stylesheet" href="resources/css/wizards-style.css">
        <link rel="stylesheet" href="resources/css/bootstrap-datetimepicker.wz.css">
        <link rel="stylesheet" type="resources/text/css" href="resources/css/daterangepicker.css" />
        <link rel="stylesheet" href="resources/css/build.min.css">
        <script src="resources/js/build.min.js"></script>
        <link rel="stylesheet" href="resources/css/fastselect.min.css">
        <script src="resources/js/fastselect.standalone.js"></script>
        <!-- Include Required Prerequisites -->
        <script src="http://cdn.ckeditor.com/4.4.5/standard/ckeditor.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2"></script>
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
        <style>
            .affix {
                top: -60px;
                width: 100%;
                z-index: 999;
            }
            .attireMainNav{
                display:none;
            }
            /**********tool-tip**************/

            .input-dashboard [data-tip] {
                position: relative;
                z-index:333;
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
            /**************************/
            .wizard-popup svg{
                display: none;
            }
        </style>
        <!--Start of Tawk.to Script-->
        <script type="text/javascript">
            var Tawk_API = Tawk_API || {},
                    Tawk_LoadStart = new Date();
            (function () {
                var s1 = document.createElement("script"),
                        s0 = document.getElementsByTagName("script")[0];
                s1.async = true;
                s1.src = 'https://embed.tawk.to/5a5891d2d7591465c706aef2/default';
                s1.charset = 'UTF-8';
                s1.setAttribute('crossorigin', '*');
                s0.parentNode.insertBefore(s1, s0);
            })();
        </script>
      
       
        
        
        
        <script type="text/javascript" >
            $(document).ready(function () {

                $("#companytype").hide();
                $("#contCompanyType").change(function () {
                    if ($("#contCompanyType").val() == "Ministry of Micro,Small & Medium Enterprises(MSME)")
                    {
                        $("#companytype").show();
                    }
                    else if ($("#contCompanyType").val() == "National Small Industries Corporation(NSIC)")
                    {
                        $("#companytype").show();
                    }
                    else if ($("#contCompanyType").val() == "Not Applicable") {
                        $("#companytype").hide();
                    }
                    else
                        return true;

                });
            });
       


        </script>
        <script>
            $(document).ready(function () {

                $("#other").hide();
                $("#contOrganization").change(function () {
                    if ($("#contOrganization").val() == "Other")
                    {
                        $("#other").show();
                    }

                    else {
                        $("#other").hide();
                        return true;
                    }

                });
            });

        </script>
        <script>

            function deleteFile(fileName) {
                alert("filename" + fileName);
                var contOtherId = $("#contOtherId").val();
                var fileId = $("#fileId").val();

                $.ajax({
                    url: 'deletefile',
                    data: {'contOtherId': contOtherId, 'fileName': fileName, 'fileId': fileId},
                    method: 'POST',
                    success: function (response) {
                        alert("response:" + response);
                        alert("File is deleted");
                    }, error: function (error) {
                        alert("error : " + error);
                    }
                });

            }

        </script>   
       <script>
          function saveWizard(step)
            {
                alert("step is:" + step);
                var formData = $("#formData").serialize();
                var contOtherId = $("#contOtherId").val();
                alert("id is:" + contOtherId);

                alert("recent form data" + formData);

                $.ajax({
                    url: "saveContractordetails?Contractordetails=" + formData + "&contOtherId=" + contOtherId,
                    method: 'POST',
                    processData: false,
                    contentType: false,
                    success: function (result) {
                        alert(result);
                        $("#contOtherId").val(result);

                    }, error: function (error) {
                        alert("error : " + error);
                    }
                    
                });
            }
        </script>
     
         <script>
            function uploadFile(num, property) {
                var result = checkPdfFile('file' + num);
                alert("Result is:" + result);
                alert("file number is:" + num);
                alert("property is:" + property);
                var file = document.getElementById('file' + num).files[0];
                var id = $("#contOtherId").val();
                alert("contOtherID" + id);
                var fileId = $("#files" + num).val();
                alert("file id is:" + fileId);
                var formData = new FormData();
                formData.append('file', file);
                alert("upload file function call :" + file);
                if (result == true)
                {
                    $.ajax({
                        url: "uploadFile?num=" + num + "&property=" + property + "&id=" + id + "&fileId=" + fileId,
                        data: formData,
                        method: 'POST',
                        processData: false,
                        contentType: false,
                        success: function (response) {

                            alert("Response is:" + response);
                            var obj = JSON.parse(response);
                            $.each(obj, function (key, value) {
                                var html = '<a href="' + obj.docUrl + '/resources/docs/' + obj.docConvertedName + '" target="_blank">' + obj.docName + '</a>';
                                
                                $("#showdoc" + num).html(html);
                                $("#files" + num).val(obj.fileId);
                                alert("File is saved");
                            });



                        }, error: function (error) {
                            alert("error : " + error);
                        }

                    });
                }
                else
                    return false;
            }
            function checkPdfFile(thisform)
            {

                alert("checkpdf file");
                var file = thisform;
                alert("id is:" + thisform);
                var fileName = document.getElementById(thisform).value;
                alert("filename is:" + fileName);
                var numb = file.substring(file.length - 1);
                var fileSize = document.getElementById(thisform).files[0].size;
                fileSize = parseInt(fileSize);
                alert("file number is:" + numb);
                var format = fileName.substring(fileName.lastIndexOf('.') + 1);

                if (!format.match("pdf") && !format.match("png") && !format.match("jpg") && !format.match("jpeg") && !format.match("PDF") && !format.match("PNG") && !format.match("JPEG") && !format.match("JPG")) {
                    document.getElementById("errorpdf" + numb).innerHTML = "Please Upload Valid pdf,png,jpg and jpeg file";
                    return false;
                } else if (fileSize > 10485760) {
                    document.getElementById("errorpdf" + numb).innerHTML = "File Size must be less then 10MB.";
                    return false;
                } else if (fileName = '') {

                    document.getElementById("errorpdf" + numb).innerHTML = ""
                    return false;
                } else {
                    alert("end");
                    return true;
                }
                return true;

            }


        </script><!--
        -->

        <!--End of Tawk.to Script-->

    </head>

    <body>
        <!----------------------------->

        <!----------------------------->
        <!---------Start-Header-Section------------->

        <header class="dashboard-header">
            <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="60">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand11" href="#"><img src="resources/images/demo.png" alt="LOTUSPROCURE_LOGO" title="LOTUSPROCURE_LOGO"></a>
                            </div>
                        </div>
                        <div class="col-md-9 ">
                            <div class="tender-icn department-name">
                                <h3>Indian Institute of Forest Management Bhopal </h3>
                            </div>
                        </div>
                        <div class="col-md-1 col-sm-1 ">
                            <div class="department-logo">
                                <img src="resources/images/iifm.jpg" title="Department Logo" alt="department-logo">
                            </div>
                        </div>

                    </div>

                </div>

                <div class="title-heading-tender">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="collapse navbar-collapse tender-icn" id="myNavbar">
                                    <ul class="nav navbar-nav ">
                                        <li>
                                            <a href="#" title="Dashboard"><img src="resources/images/img/dashboard1.png" alt="Tender_icon">Dashboard</a>
                                        </li>
                                        <li class="active">
                                            <a href="#" title="Tenders"><img src="resources/images/img/tender-small.png" alt="Tender_icon">Tenders</a>
                                        </li>
                                        <li>
                                            <a href="#" title="Auctions"><img src="resources/images/img/auction-small.png" alt="Auctions_icon">Auctions</a>
                                        </li>
                                        <li>
                                            <a href="#" title="RFX"><img src="resources/images/img/RFX-small.png" alt="RFX_icon">RFX</a>
                                        </li>
                                        <li>
                                            <a href="#" title="Indents"><img src="resources/images/img/Indents-small.png" alt="Indents_icon">Indents</a>
                                        </li>
                                        <li>
                                            <a href="#" title="CPM"><img src="resources/images/img/CPM-small.png" alt="CPM_icon">CPM</a>
                                        </li>
                                        <li>
                                            <a href="#" title="Cloud Folder"><img src="resources/images/img/cloud-folder-small.png" alt="cloud-folder_icon">Cloud Folder</a>
                                        </li>
                                        <li>
                                            <a href="#" title="Reports"><img src="resources/images/img/reports-small.png" alt="Reports_icon">Reports</a>
                                        </li>
                                        <div class="certificate-view" style="display:none;">
                                            <a href=""> <img src="resources/images/certificate-g.png" alt="Certificate_icon"></a>
                                            <a href=""> <img src="resources/images/notification_icon.png" title="My Profile" alt="notification_icon" width=50 height=5 0></a>
                                        </div>
                                    </ul>
                                    <ul class="nav navbar-nav navbar-right  btn-left">
                                        <li class="">
                                            <a href="#"><img src="resources/images/certificate-g.png" title="Certificate" alt="Certificate_icon"></a>
                                        </li>
                                        <li class="">
                                            <a href="#"><img src="resources/images/notification_msg.png" title="Notification" alt="notification_icon" width=50 height=5 0></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" classs="dropdown-toggle" data-toggle="dropdown" ><img src="resources/images/profile-user.png" title="My Profile" alt="Reports_icon">                                          
                                            </a>
                                               <ul class="dropdown-menu">
                                              <li><a href="ChangePassword">Change Password</a></li>
                                              <li><a href="#">Update Details</a></li>
   
                                             </ul>
                                        </li>
                                        <li><a href="#" class="logout-a"><span class="img-log"><img src="resources/images/logout-icon.png"></span>Logout</a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </nav>
        </header>
        <!---------End-Header-Section------------->

        <!---------start-wizard-popup-Section------------->
        <div class="wizard-popup">
            <div class="container">
                <!-- Trigger the modal with a button -->
                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog" data-backdrop="static">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="border-btm">
                                <div class="row">
                                    <div class="col-md-2 col-sm-3">
                                        <div class="pp">
                                            <img src="resources/images/demo.png" alt="Popup-logo" style="width:30%;">
                                            <!--  <button type="button" class="close" data-dismiss="modal">×</button>-->
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-sm-8">
                                        <!-----------------start-wizard-tab----------------->
                                        <div class="wizard-section">
                                            <div class="wizard">
                                                <div class="wizard-inner">
                                                    <div class="connecting-line"></div>
                                                    <ul class="nav nav-tabs" role="tablist">

                                                        <li role="presentation" class="active">
                                                            <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" data-tip="SelectContractor">
                                                                <span class="round-tab" data-toggle="tooltip">
                                                                    <img src="resources/images/create-tender.png" alt="create-tender_icon" >
                                                                    <!--<i class="glyphicon glyphicon-pencil"></i>-->
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li role="presentation" class="disabled">
                                                            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" data-tip="Contractor Address Detail">
                                                                <span class="round-tab" data-toggle="tooltip">
                                                                    <img src="resources/images/key_dates1.png" alt="create-tender_icon" >
                                                                    <!--<i class="glyphicon glyphicon-pencil"></i>-->
                                                               </span>
                                                            </a>
                                                        </li>


                                                        <li role="presentation" class="disabled">
                                                            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" data-tip="Company Detail">
                                                                <span class="round-tab" data-toggle="tooltip">
                                                                    <img src="resources/images/tender_icon-black.png" alt="Tender Information" >
                                                                    <!-- <i class="glyphicon glyphicon-picture"></i>-->
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li role="presentation" class="disabled">
                                                            <a href="#step4" data-toggle="tab" aria-controls="step4" role="tab" data-tip="Company Document">
                                                                <span class="round-tab" data-toggle="tooltip">
                                                                    <img src="resources/images/department_documents1.png" alt="department_documents_icon" >
                                                                    <!-- <i class="glyphicon glyphicon-folder-open"></i>-->
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li role="presentation" class="disabled">
                                                            <a href="#step5" data-toggle="tab" aria-controls="step3" role="tab" data-tip="Contact Person Document">
                                                                <span class="round-tab" data-toggle="tooltip">
                                                                    <img src="resources/images/tender_icon-black.png" alt="Tender Information" >
                                                                    <!-- <i class="glyphicon glyphicon-picture"></i>-->
                                                                </span>
                                                            </a>
                                                        </li>




                                                        <li role="presentation" class="disabled">
                                                            <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" data-tip="Bank Detail">
                                                                <span class="round-tab" data-toggle="tooltip">
                                                                    <img src="resources/images/tender_notice.png" alt="Notice_icon" >
                                                                </span>
                                                            </a>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-----------------end-wizard-tab----------------->
                                    </div>
                                    <div class="col-md-1 col-sm-1 col-sm-1">
                                        <div class="pp">
                                            <!-- <img src="resources/images/demo.png" alt="Popup-logo" style="width:30%;">-->
                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-----------------start-wizard-tab-content----------------->
                            <div class="modal-body ">
                                <div class="wizard-tab-content">
                                    <form:form role="form" id="formData" modelAttribute="Contractordetails" >
                                        <div class="tab-content">
                                            <div class="tab-pane active" role="tabpanel" id="step1">
                                                <!--start-Generate Tender Number fields-->
                                                <div class="tab-content1-detail">
                                                   
                                                    <h3>Contractor Registration</h3>
                                                    <div class="create-tn-no Tender-Information tn-1tb" id="tender_create1">
                                                        <div class="form-title">
                                                            <h2 class="title-wz">Contractor Registration<hr></h2>${contOtherId}
                                                        </div>
                                                        <!---->

                                                        <form:hidden path="contOtherId"  id="contOtherId"  value="${contOtherId}"/>
                                                        <input type="hidden" id="regId" name="regId"  value="${regid}">
                                                         <div class="row">


                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Indian Contractor Registration:</label>
                                                                <div class="tender-no col-sm-8" data-tip="Indian Contractor Registration">
                                                                    <form:radiobutton path="contractor" id="contractorreg1" name="contractor" value="indiancontractor"  class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />
                                                                </div>
                                                            </div>

                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Foreign Contractor Registration:</label>
                                                                <div class="tender-no  col-sm-8" data-tip="Foreign Contractor Registration">
                                                                    <form:radiobutton path="contractor" id="contractorreg" name="contractor" value="foreigncontractor " class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" " />
                                                                </div>
                                                            </div>
                                                        </div>
                                                                
                                                         
                                                        <script>

                                                            $(document).ready(function () {
                                                                $("#contractor").hide();
                                                                $("#contractorreg").click(function () {


                                                                    if ($("#contractorreg").is(':checked')) {

                                                                        $("#contractor").show();
                                                                    }
                                                                    else {
                                                                        $("#contractor").hide();
                                                                        return true;
                                                                    }
                                                                });


                                                            });

                                                            $(document).ready(function () {
                                                                $("#contractor").hide();
                                                                $("#contractorreg1").click(function () {


                                                                    if ($("#contractorreg1").is(':checked')) {

                                                                        $("#contractor").hide();
                                                                    }
                                                                    else {
                                                                        $("#contractor").show();
                                                                        return true;
                                                                    }
                                                                });


                                                            });


                                                        </script>


                                                        <div id="contractor">
                                                            <h3>Indian Client Registration Form</h3>

                                                            <div class="row">



                                                                <div class="form-group col-sm-6">

                                                                    <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">First Name:</label>
                                                                    <div class="tender-no col-sm-8" data-tip="First Name" id="FirstnamE">
                                                                         <input type="hidden" id="regid" name="regid" value="${regid}">
                                                                        <form:input path="firstName" id="firstName" name="firstName" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />
                                                                        <svg viewBox="0 0 16 16">
                                                                        <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                        <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                        </svg>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group col-sm-6">
                                                                    <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Middle Name:</label>
                                                                    <div class="tender-no  col-sm-8" data-tip="Middle Name" id="MiddlenamE">
                                                                        <form:input path="middleName" id="middleName" name="middleName" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" " />
                                                                        <svg viewBox="0 0 16 16">
                                                                        <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                        <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                        </svg>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">


                                                                <div class="form-group col-sm-6">
                                                                    <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Last Name:</label>
                                                                    <div class="tender-no col-sm-8" data-tip="lastName" id="LastnamE">
                                                                        <form:input path="lastName" id="lastName" name="lastName" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                        <svg viewBox="0 0 16 16">
                                                                        <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                        <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                        </svg>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group col-sm-6">
                                                                    <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">State:</label>
                                                                    <div class="tender-no  col-sm-8" data-tip="State" id="AddcitY">
                                                                        <form:select path="clientState" id="clientState" class="select form-control" required="true">

                                                                            <form:option value="">Select</form:option>
                                                                            <c:forEach var="stateList" items="${stateList}">
                                                                                <form:option value="${stateList.state_id}">${stateList.state_name}</form:option>
                                                                            </c:forEach>
                                                                        </form:select>

                                                                        <svg viewBox="0 0 16 16">
                                                                        <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                        <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                        </svg>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">


                                                                <div class="form-group col-sm-6">
                                                                    <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">City:</label>
                                                                    <div class="tender-no col-sm-8" data-tip="City" id="AddcitY">
                                                                        <form:select path="clientCity" id="clientCity" class="select form-control" required="true">
                                                                            <form:option value="">Select</form:option>
                                                                            <c:forEach var="citiesList" items="${citiesList}">
                                                                                <form:option value="${citiesList.state_id}">${citiesList.city_name}</form:option>
                                                                            </c:forEach>
                                                                        </form:select>

                                                                        <svg viewBox="0 0 16 16">
                                                                        <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                        <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                        </svg>  
                                                                    </div>
                                                                </div>

                                                                <div class="form-group col-sm-6">
                                                                    <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Contact Number:</label>
                                                                    <div class="tender-no  col-sm-8" data-tip="Contact Number" id="Cont">
                                                                        <form:input path="clientContact" id="clientContact" name="clientContact" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />   

                                                                        <svg viewBox="0 0 16 16">
                                                                        <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                        <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                        </svg> 
                                                                    </div>
                                                                </div>
                                                            </div> 


                                                        </div>

                                                    </div>
                                                </div>
                                                <ul class="list-inline pull-right">
                                                    <!-- <li><button type="button" class="btn btn-danger" data-dismiss="modal">Close</button></li>-->
                                                    <li>
                                                        <button type="button" class="btn btn-primary next-step" onclick="saveWizard('step1');">Save and continue</button>

                                                    </li>
                                                </ul>
                                            </div>
                                            <!---before address detail-->
                                            <div class="tab-pane " role="tabpanel" id="step2">
                                                <!--start-Generate Tender Number fields-->
                                                <div class="tab-content1-detail">

                                                    <h3>Contractor Address Detail </h3>
                                                    <div class="create-tn-no Tender-Information tn-1tb" id="tender_create1">
                                                        <div class="form-title">
                                                            <h2 class="title-wz">Contractor Address Detail<hr></h2>
                                                        </div>
                                                        <!---->
                                                        <div class="form-group row" >
                                                            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Address:</label>
                                                            <div class="tender-no col-sm-10" data-tip="Address" id="AddresS1">
                                                                <form:textarea path="address" id="address"  value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" " />

                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg> 
                                                            </div>
                                                        </div>

                                                        <div class="row">

                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">State:</label>

                                                                <div class="tender-no col-sm-8" data-tip="State"id="AddcitY">
                                                                    <form:select path="state" id="state" class="select form-control" required="true">
                                                                        <form:option value="">Select</form:option>
                                                                        <c:forEach var="stateList" items="${stateList}">
                                                                            <form:option value="${stateList.state_id}">${stateList.state_name}</form:option>
                                                                        </c:forEach>


                                                                    </form:select>

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg> 
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">District:</label>
                                                                <div class="tender-no col-sm-8" data-tip="Company Type" id="AddDisT">
                                                                    <form:select path="district" id="district" class="select form-control" required="true">
                                                                        <form:option value="">Select</form:option>
                                                                        <form:option value="Satna">Satna</form:option>
                                                                        <form:option value="Katni">Katni</form:option>
                                                                        <form:option value="Rewa">Rewa</form:option>
                                                                     </form:select>

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">


                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Place:</label>
                                                                <div class="tender-no col-sm-8" data-tip="Place" id="PlacE">
                                                                    <form:input path="place" id="place" name="place"  class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>
                                                                </div>
                                                            </div>

                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Pincode:</label>
                                                                <div class="tender-no  col-sm-8" data-tip="Company Establishment Year" id="PincodE">
                                                                    <form:input path="pincode" id="pincode" name="pincode" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" " />

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <ul class="list-inline pull-right">
                                                    <!-- <li><button type="button" class="btn btn-danger" data-dismiss="modal">Close</button></li>-->
                                                    <li>
                                                        <button type="button" class="btn btn-default prev-step">Previous</button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn btn-primary next-step" onclick="saveWizard('step2');">Save and continue</button>
                                                    </li>
                                                </ul>
                                            </div>

                                            <!---before Company  Detail--->
                                            <div class="tab-pane" role="tabpanel" id="step3">
                                                <!--start-Generate Tender Number fields-->
                                                <div class="tab-content1-detail">

                                                    <h3>Company Detail</h3>
                                                    <div class="create-tn-no Tender-Information tn-1tb" id="tender_create1">
                                                        <div class="form-title">
                                                            <h2 class="title-wz">Company details <hr></h2>
                                                        </div>
                                                        <!---->
                                                        <div class="row">


                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Company Registration Number:</label>
                                                                <div class="tender-no col-sm-8" data-tip="Company Registration Number" id="CRN">
                                                                    <form:input path="contRegistrationNo" id="contRegistrationNo" name="contRegistrationNo" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>    
                                                                </div>
                                                            </div>

                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Company Establishment Year</label>
                                                                <div class="tender-no  col-sm-8" data-tip="Company Establishment Year" id="CEY">

                                                                    <form:input path="contCompanyEstablishmentYear" id="contCompanyEstablishmentYear" name="contCompanyEstablishmentYear" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" " />

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>   
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!---->
                                                        <div class="row">

                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Company Contact Number:</label>
                                                                <div class="tender-no col-sm-8" data-tip="Company Contact Number" id="CCN">
                                                                    <form:input path="contCompanyContactNo" id="contCompanyContactNo" name="contCompanyContactNo" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>
                                                                </div>
                                                            </div>

                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Company Email Id:</label>
                                                                <div class="tender-no  col-sm-8" data-tip="Company Email Id" id="CE">
                                                                    <form:input path="contCompanyEmail" id="contCompanyEmail" name="contCompanyEmail" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" " />
                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Company Website:</label>
                                                                <div class="tender-no col-sm-8" data-tip="Company Website" id="CW">
                                                                    <form:input path="contCompanyWebsite" id="contCompanyWebsite" name="contRegistrationNo" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>
                                                                </div>
                                                            </div>

                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Type of Organization:</label>
                                                                <div class="tender-no col-sm-8" data-tip=" Type of Organization" id="TORG">
                                                                    <form:select path="contOrganization" id="contOrganization" class="select form-control" required="true">
                                                                        <form:option value="">Select</form:option>
                                                                        <form:option value="Central Government Undertaking">Central Government Undertaking</form:option>
                                                                        <form:option value="State Government Undertaking">State Government Undertaking</form:option>
                                                                        <form:option value="Joint Sector Company">Joint Sector Company</form:option>
                                                                        <form:option value="Public Limited Company">Public Limited Company</form:option>
                                                                        <form:option value="Private Limited Company">Private Limited Company</form:option>
                                                                        <form:option value="Partnership Firm">Partnership Firm</form:option>
                                                                        <form:option value="Proprietary Firm">Proprietary Firm</form:option>
                                                                        <form:option value="Co-operative Society">Co-operative Society</form:option>
                                                                        <form:option value="Social/Charitable Organization">Social/Charitable Organization</form:option>
                                                                        <form:option value="Other" >Other</form:option>

                                                                    </form:select>


                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row"> 
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Registration Details with statutory bodies(MSME, NSIC etc. if any):</label>
                                                                <div class="tender-no col-sm-8" data-tip="Company Type"id="RD">
                                                                    <input type="hidden" id="files1" name="fileId">

                                                                    <form:select path="contCompanyType" id="contCompanyType" class="select form-control" required="true">
                                                                        <form:option value="">Select</form:option>
                                                                        <form:option value="Ministry of Micro,Small & Medium Enterprises(MSME)">Ministry of Micro,Small & Medium Enterprises(MSME)</form:option>
                                                                        <form:option value="National Small Industries Corporation(NSIC)">National Small Industries Corporation(NSIC)</form:option>
                                                                        <form:option value="Not Applicable">Not Applicable</form:option>
                                                                    </form:select>


                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>

                                                                    <div id="companytype">

                                                                        <span id="errorpdf1" style="color:red"></span>
                                                                        <input type="file" name="file" id="file1" class="input form-control" onchange="uploadFile('1', 'msme');"  data-toggle="tooltip" data-placement="bottom"  placeholder="">
                                                                        <span id="showdoc1"></span>
                                                                    </div>
                                                                </div>  
                                                            </div>  
                                                            <div id="other">
                                                                <div class="form-group col-sm-6">
                                                                    <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Other Organization </label>
                                                                    <div class="tender-no  col-sm-8" data-tip="Other Organization" id="CEY">

                                                                        <form:input path="otherOrganization" id="otherOrganization" name="otherOrganization" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" " />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="row">
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">
                                                                    <!--Officer Name:-->
                                                                </label>

                                                            </div>

                                                            <!--End-Generate Tender Number fields-->

                                                        </div>

                                                    </div>
                                                    <!--second-form-open-to click generate tender number-->

                                                    <!----------------->

                                                    <!--tabbing-radio-bt-->

                                                    <!--End-Generate Tender Number fields-->

                                                </div>
                                                <ul class="list-inline pull-right">
                                                    <li>
                                                        <button type="button" class="btn btn-default prev-step">Previous</button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn btn-primary next-step" onclick="saveWizard('step3');">Save and continue</button>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="tab-pane" role="tabpanel" id="step4">
                                                <div class="tab-content1-detail">
                                                    <h3>Company Document</h3>
                                                    <div class="create-tn-no Tender-Information row" id="tender_create1">
                                                        <div class="form-title">
                                                            <h2 class="title-wz">Company Document <hr></h2>
                                                        </div>

                                                        <div class="row">


                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Company Address Proof:</label>

                                                                <div class="tender-no col-sm-8" data-tip="Company Address Proof">
                                                                    <input type="hidden" id="files2" name="fileId">
                                                                    <span id="errorpdf2" style="color:red"></span>
                                                                    <input type="file" name="file" id="file2"  onchange="uploadFile('2', 'addProof');"   class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" ">
                                                                    <span id="showdoc2"></span>


                                                                </div>
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">CompanyPAN Card:</label>
                                                                <span id="errorpdf3" style="color:red"></span>
                                                                <div class="tender-no col-sm-8" data-tip="Company PAN Card">
                                                                    <input type="hidden" id="files3" name="fileId">
                                                                    <input type="file" name="file" id="file3" onchange="uploadFile('3', 'comPANCard');"  value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" "  >
                                                                    <span id="showdoc3"></span>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Company Address:</label>
                                                            <div class="tender-no col-sm-10" data-tip="Company Address" id="CAD">
                                                                <form:textarea path="contCompanyAddressNo" id="contCompanyAddressNo"  value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" " />

                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                        <div class="row">

                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Company PAN No:</label>
                                                                <div class="tender-no col-sm-8" data-tip="Company PAN Card No" id="CPC">
                                                                    <form:input path="contCompanyPanCardNo" id="contCompanyPanCardNo" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Company Registration Document:</label>
                                                                <span id="errorpdf9" style="color:red"></span>
                                                                <div class="tender-no col-sm-8" data-tip="Company Registration Document">
                                                                    <input type="hidden" id="files9" name="fileId">
                                                                    <input type="file" name="file" id="file9" onchange="uploadFile('9', 'comRegDoc');"  value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" "  >
                                                                    <span id="showdoc9"></span>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <ul class="list-inline pull-right">
                                                    <li>
                                                        <button type="button" class="btn btn-default prev-step">Previous</button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn btn-primary next-step" onclick="saveWizard('step4');">Save and continue</button>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="tab-pane" role="tabpanel" id="step5">
                                                <div class="tab-content1-detail">
                                                    <h3>Contact Person Document</h3>
                                                    <div class="create-tn-no Tender-Information row" id="tender_create1">
                                                        <div class="form-title">
                                                            <h2 class="title-wz">Contact Person Document<hr></h2>
                                                        </div>








                                                        <div class="row">

                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Applicant Address Proof:</label>
                                                                <span id="errorpdf4" style="color:red"></span>
                                                                <div class="tender-no col-sm-8" data-tip="Applicant Address Proof">
                                                                    <input type="hidden" id="files4" name="fileId">
                                                                    <input type="file" name="file" id="file4" onchange="uploadFile('4', 'appAddProof');" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom">
                                                                    <span id="showdoc4"></span>

                                                                </div>
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Applicant PAN Card:</label>
                                                                <span id="errorpdf5" style="color:red"></span>
                                                                <div class="tender-no col-sm-8" data-tip="Applicant PAN Card">
                                                                    <input type="hidden" id="files5" name="fileId">
                                                                    <input type="file" name="file" id="file5" onchange="uploadFile('5', 'appPANCard');" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom">
                                                                    <span id="showdoc5"></span>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Applicant Address:</label>
                                                            <div class="tender-no col-sm-10" data-tip="Applicant Address" id="AA">
                                                                <form:textarea path="contAddressNo" id="contAddressNo" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" " />

                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>
                                                        </div> 
                                                        <div class="row">
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Applicant PAN Card No:</label>
                                                                <div class="tender-no col-sm-8" data-tip="Applicant PAN Card No:" id="APC">
                                                                    <form:input path="contPanCardNo" id="contPanCardNo" name="tenderNo" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                    <svg viewBox="0 0 16 16">
                                                                    <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                    <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">PAN(for ID Proof):</label>
                                                                <span id="errorpdf6" style="color:red"></span>
                                                                <div class="tender-no col-sm-8" data-tip="PAN(for ID Proof)">
                                                                    <input type="hidden" id="files6" name="fileId">
                                                                    <input type="file" name="file" id="file6" onchange="uploadFile('6', 'PAN');" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" ">
                                                                    <span id="showdoc6"></span>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-sm-6">
                                                                <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Aadhar Card or Other document(for Address proof):</label>
                                                                <span id="errorpdf7" style="color:red"></span>
                                                                <div class="tender-no col-sm-8" data-tip="Aadhar Card or Other document(for Address proof)">
                                                                    <input type="hidden" id="files7" name="fileId">
                                                                    <input type="file" name="file" id="file7"  onchange="uploadFile('7', 'aadharCard');" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder=" ">
                                                                    <span id="showdoc7"></span>

                                                                </div>
                                                            </div>
                                                        </div>          
                                                    </div>
                                                </div>
                                                <ul class="list-inline pull-right">
                                                    <li>
                                                        <button type="button" class="btn btn-default prev-step">Previous</button>
                                                    </li>
                                                    <li>
                                                        <button type="button" class="btn btn-primary next-step" onclick="saveWizard('step5');">Save and continue</button>
                                                    </li>
                                                </ul>
                                            </div>


                                            <div class="tab-pane" role="tabpanel" id="complete">
                                                <div class="tab-content1-detail">
                                                    <h3>Bank Detail</h3>
                                                    <div class="row">
                                                        <div class="form-group col-sm-6">
                                                            <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Bank Account No:</label>
                                                            <div class="tender-no col-sm-8" data-tip="Bank Account No" id="BAN">
                                                                <form:input path="contBankAccountNo" id="contBankAccountNo" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>
                                                        </div>

                                                        <div class="form-group col-sm-6">
                                                            <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Upload Cheque/Passbook:</label>
                                                            <span id="errorpdf8" style="color:red"></span>
                                                            <div class="tender-no col-sm-8" data-tip="Upload Cheque/Passbook">
                                                                <input type="hidden" id="files8" name="fileId">
                                                                <input type="file" name="file"  id="file8" onchange="uploadFile('8', 'passbook');"  class="input" data-toggle="tooltip" data-placement="bottom" placeholder=" ">
                                                                <span id="showdoc8"></span>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="form-group col-sm-6">
                                                            <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Bank Name:</label>
                                                            <div class="tender-no col-sm-8" data-tip="Bank Name" id="BN">
                                                                <form:input path="contBankName" id="contBankName" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>
                                                        </div>

                                                        <div class="form-group col-sm-6">
                                                            <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Branch Address:</label>
                                                            <div class="tender-no col-sm-8" data-tip="Branch Address" id="BA">
                                                                <form:input path="contBankAddress" id="contBankAddress" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-sm-6">
                                                            <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">Beneficiary Name:</label>
                                                            <div class="tender-no col-sm-8" data-tip="Beneficiary Account No" id="BANN">
                                                                <form:input path="contBeneficiaryAccountNo" id="contBeneficiaryAccountNo" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>
                                                        </div>

                                                        <div class="form-group col-sm-6">
                                                            <label for="colFormLabelSm" class="col-sm-4 col-form-label col-form-label-sm">IFSC Code:</label>
                                                            <div class="tender-no col-sm-8" data-tip="IFSC Code" id="IFC">
                                                                <form:input path="contBankCode" id="contBankCode" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="" />

                                                                <svg viewBox="0 0 16 16">
                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <ul class="list-inline pull-right">
                                                    <li>
                                                        <button type="button" class="btn btn-default prev-step">Previous</button>
                                                    </li>
                                                    <li>
                                                        <input type="submit" class="btn btn-primary btn-info-full next-step" id="wizardSubmit" value="Submit" />
                                                    </li>
                                                </ul>


                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </form:form>
                            </div>
                        </div>
                        <!-----------------end-wizard-tab-content----------------->

                        <div class="modal-footer">
                            <div class="newsp"><p style="height:69px;"></p></div>
                        </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <!---------start-wizard-popup-Section------------->
        <!---------start-Marquee& Time-Section------------->
        <div class="timer-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8 col-sm-8">
                        <div class="marquee-news">
                            <div class="left-slide-notification">
                                <div class="col-md-2 col-sm-2 pd-l">
                                    <div class="left_slide_news">
                                        <h2><span class="media-q">Department</span> Notification</h2>
                                    </div>
                                </div>

                                <div class="col-md-8 col-sm-8 pd-lr">
                                    <marquee behavior="scroll" direction="left" onMouseOver="this.stop();" onMouseOut="this.start();">
                                        <ul>
                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>

                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>

                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>

                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>

                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>
                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>

                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>

                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>

                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>

                                            <li><a href="#"><span><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a></li>

                                        </ul>
                                    </marquee>
                                </div>

                                <div class="col-md-2 col-sm-2 pd-r">
                                    <div class="left_slide_news1">
                                        <a href="">View All</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div class="server-timer">
                            <ul class=" bt-logout">
                                <!--<li><p><i class="fa fa-calendar-o" aria-hidden="true"></i><span>12 January , 2018</span></p></li>-->
                                <li>
                                    <p><i class="fa fa-clock-o" aria-hidden="true"></i><span>12:30:40 PM</span></p>
                                </li>
                            </ul>
                         </div>
                    </div>
                </div>
            </div>
        </div>
        <!---------End-Marquee& Time-Section------------->

        <!---------Start-Search-Tender-section------------->

        <section class="input-dashboard">
            <div class="container">
                <div class="row">
                    <div class="dashbord-search">
                        <div class="form-group col-md-2">
                            <div class="tender-no" data-tip="Tender No. or NIT No.">
                                <input type="text" name="tenderNo" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="Tender No. or NIT No.">
                            </div>
                        </div>
                        <div class="form-group col-md-2">
                            <div class="tender-no">
                                <select name="tender_status" id="tenderStatus" class="select form-control" required="true">
                                    <option value="">Select Status</option>
                                    <option value="1">Created</option>
                                    <option value="2">Live/Inprocess</option>
                                    <option value="3">Amended</option>
                                    <option value="4">Closed/Opened</option>
                                    <option value="5">Canceled</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-2">
                            <div class="tender-no">
                                <select name="tender_status" id="tenderStatus" class="select form-control" required="true">
                                    <option value="0">Officer Name</option>
                                    <option value="1">Dinesh Kushwah</option>
                                    <option value="2">Dinesh Kushwah</option>
                                    <option value="3">Dinesh Kushwah</option>
                                    <option value="4">Dinesh Kushwah</option>
                                    <option value="5">Dinesh Kushwah</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-md-2">
                            <div class="tender-no calendar-dt1" data-tip="Created date">
                                <span class="calendar-dt"></span>
                                <input type="text" name="tenderNo" id="datepicker" value="" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="Created Date">
                            </div>
                        </div>
                        <div class="form-group col-md-2">
                            <button type="button" class="btn btn-success">Search</button>
                        </div>
                        <div class="form-group col-md-2 create-bt" data-tip="Click Here for Contractor Other Details">
                            <button type="button" class="btn btn-success" id="cod" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus-circle" aria-hidden="true"></i>Contractor Other Details</button>

                        </div>


                    </div> 


                </div>
            </div>
        </div>
    </section>

    <!---------End-Search-Tender-section------------->

    <!---------Start-Tabbing-section------------->

    <section class="dashboard-tabbing">
        <div class="container">
            <div class="tabbing-menu">
                <!--Start-Tab-Menu-Button-->
                <ul class="nav nav-tabs ">
                    <li class="active"><a data-toggle="tab" href="#home222">All Tenders</a></li>
                    <li><a data-toggle="tab" href="#menu333">Created Tenders</a></li>
                    <li><a data-toggle="tab" href="#menu444">Live / In Process Tenders</a></li>
                    <li><a data-toggle="tab" href="#menu555">Amended Tenders</a></li>
                    <li><a data-toggle="tab" href="#menu666">Closed / Opened Tenders</a></li>
                    <li><a data-toggle="tab" href="#menu777">Cancelled Tenders</a></li>
                    <li><a data-toggle="tab" href="#menu888">View CS</a></li>
                </ul>
            </div>
            <!--End-Tab-Menu-Button-->

            <div class="tabbing-detail-table">
                <div class="tab-content">
                    <div id="home222" class="tab-pane fade in active">
                        <div class="detail-tender">
                            <p><span>All Tenders:</span>List of all tenders related to you.</p>
                        </div>
                        <div class="table-responsive">
                            <table id="myTable" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Description</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Status</th>
                                        <th>Action / Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description </td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Closed</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Closed</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Closed</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Closed</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Closed</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Closed</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div id="menu333" class="tab-pane fade">
                        <div class="detail-tender">
                            <p><span>Created Tenders:</span>List of tenders, either created by you or sent to you for approval.</p>
                        </div>
                        <div class="table-responsive">
                            <table id="myTable" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Description</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Status</th>
                                        <th>Action / Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div id="menu444" class="tab-pane fade">
                        <div class="detail-tender">
                            <p><span>Live Tenders:</span>Tenders that are currently available for purchase.
                                <span>In Progress:</span>Tenders that are currently active and available for bid submission.</p>
                        </div>
                        <div class="table-responsive">
                            <table id="myTable" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Description</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Status</th>
                                        <th>Action / Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Live</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Inprocess</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Live</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Inprocess</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Live</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Inprocess</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div id="menu555" class="tab-pane fade">
                        <div class="detail-tender">
                            <p><span>Amended Tenders:</span>List of amended tenders or corrigendum.</p>
                        </div>
                        <div class="table-responsive">
                            <table id="myTable" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Description</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Status</th>
                                        <th>Action / Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Amended</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Amended</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Amended</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Amended</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Amended</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Amended</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div id="menu666" class="tab-pane fade">
                        <div class="detail-tender">
                            <p><span>Closed:</span>Tenders Closed by department after the bid submission date/time.<span>Opened Tenders:</span>Tenders are in process of Opening (e.g. Envelop A/B has been opened).</p>
                        </div>
                        <div class="table-responsive">
                            <table id="myTable" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Description</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Status</th>
                                        <th>Action / Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Closed</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Open</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Open</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Closed</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Closed</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Open</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div id="menu777" class="tab-pane fade">
                        <div class="detail-tender">
                            <p><span>Cancelled Tenders:</span> Tenders are cancelled for a reason by tender authority.</p>
                        </div>
                        <div class="table-responsive">
                            <table id="myTable" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Description</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Status</th>
                                        <th>Action / Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Canceled</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Canceled</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Canceled</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Canceled</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Canceled</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Canceled</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div id="menu888" class="tab-pane fade">
                        <div class="detail-tender">
                            <p><span>View CS:</span>View the Comparison Sheet(CS) of financial bid. </p>
                        </div>
                        <div class="table-responsive">
                            <table id="myTable" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Description</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Status</th>
                                        <th>Action / Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>DEMO/NIT1</td>
                                        <td class="tenderdescription">Tender Description</td>
                                        <td><span><i class="fa fa-inr rupee" aria-hidden="true"></i></span>100000/-</td>
                                        <td>1/1/2018</td>
                                        <td>15/1/2018</td>
                                        <td>Created</td>
                                        <td><a href="" class="btn-dtl">View / Edit</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!---------End-Tabbing-section------------->

    <div style="height:400px;"></div>
    <!---------Start-Footer-section------------->
    <section class="footer-section">
        <div class="container">
            <div class="link-btn">
                <a href="disclaimber.action" target="_blank">Disclaimer </a> |
                <a href="term.action" target="_blank">Terms &amp; Condition and Privacy Policy</a>
            </div>
            <p>Copyright ©
                <script language="JavaScript" type="text/javascript">
                    document.write((new Date()).getFullYear());
                </script> All Rights Reserved @ <a href="http://osmoindia.com/" target="_blank">OSMO IT SOLUTION PVT. LTD.</a> </p>
        </div>
    </section>
    <!---------End-Footer-section------------->
    <!--script-link-->
    <script src="resources/js/bootstrap3-wysihtml5.js" type="text/javascript"></script>
    <script src="resources/js/jquery-1.10.2.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/js/jquery.dataTables.min.js"></script>
    <script src="resources/js/jquery-ui.js"></script>
    <script type="text/javascript" src="resources/js/jquery-wz.min.js" ></script>
    <script type="text/javascript" src="resources/js/bootstrap-datetimepicker-wz.js"></script>
    <!--------------------->
    <script type="text/javascript" src="resources/js/moment.min.rg.js"></script>


    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="resources/js/daterangepicker.js"></script>

    <script type="text/javascript">
                        $(function () {
                            $(".daterange").daterangepicker({
                                autoUpdateInput: false,
                                timePicker: true,
                                timePickerIncrement: 30,
                                locale: {format: 'MM/DD/YYYY h:mm A', cancelLabel: 'Clear'}
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
    <script>
        $(function () {
            $("#datepicker").datepicker();
            $("#datepicker2").datepicker();
            $("#datepicker3").datepicker();
            //$("#datepicker4").datepicker();
//			$("#datepicker5").datepicker();
//			$("#datepicker6").datepicker();
//	$("#datepicker7").datepicker();
//		$("#datepicker8").datepicker();
//		$("#datepicker9").datepicker();
//			$("#datepicker10").datepicker();
            //	$("#datepicker11").datepicker();
//			$("#datepicker12").datepicker();
            //$("#datepicker13").datepicker();
//			$("#datepicker14").datepicker();
        });

        function showDiv() {
            document.getElementById('tenderDetails').style.display = "block";
        }
    </script>
    <script>
        $(document).ready(function () {
            $("#information-link").on('click', function () {
                $("#pages .page:not('.hide')").stop().fadeOut('fast', function () {
                    $(this).addClass('hide');
                    $('#information').fadeIn('slow').removeClass('hide');
                });
            });
            $("#portfolio-link").on('click', function () {
                $("#pages .page:not('.hide')").stop().fadeOut('fast', function () {
                    $(this).addClass('hide');
                    $('#portfolio').fadeIn('slow').removeClass('hide');
                });
            });
            $("#blog-link").on('click', function () {
                $("#pages .page:not('.hide')").stop().fadeOut('fast', function () {
                    $(this).addClass('hide');
                    $('#blog').fadeIn('slow').removeClass('hide');
                });
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            //Initialize tooltips
            //$('.nav-tabs > li a[title]').tooltip();

            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                var $target = $(e.target);

                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                //alert("hello");
                $active.find(".round-tab").css({
                    "border-color": "#0784bd",
                    "background-color": "#0784bd"
                });
                $active.next().removeClass('disabled');
                nextTab($active);

            });
            $(".prev-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);

            });
        });

        function nextTab(elem) {
            $(elem).next().find('a[data-toggle="tab"]').click();
        }

        function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }
    </script>
    <script>
        $('.td-table').dataTable();
    </script>

    <script type="text/javascript">
        $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
    </script>
    <script type="text/javascript">
        $('.form_datetime').datetimepicker({
            //language:  'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1
        });
        $('.form_date').datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('.form_time').datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 1,
            minView: 0,
            maxView: 1,
            forceParse: 0
        });
    </script> 

    <!--vikalp-->

    <!--<link rel="stylesheet" type="text/css" href="/resources/css/app.css">-->
    <link rel="stylesheet" href="<c:url value="/resources/css/app.css"/>">


    <script>

        $(document).ready(function () {

            var firstregex = new RegExp(
                    '^(([a-zA-Z ]+$))'
                    );


            var midregex = new RegExp(
                    '^(([a-zA-Z]+$))'
                    );

            var lastregex = new RegExp(
                    '^(([a-zA-Z]+$))'
                    );

            var mobregex = new RegExp(
                    '^([+][9][1]|[9][1]|[0]){0,1}([7-9]{1})([0-9]{9})$'
                    );

            var addregex = new RegExp(
                    '^([A-Za-z0-9\s,-_ ]+$)'

                    );

            var crnregex = new RegExp(
                    '^(([a-zA-Z0-9]+$))'
                    );

            var numregex = new RegExp(
                    '^(([0-9]+$))'
                    );

            var emailregex = new RegExp(
                    '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                    '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                    '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
                    );

            var ifacregex = new RegExp(
    //        '^(([0-9]+$))'
                    '^([A-Za-z]{4}0[0-9]{6})$'
                    );
            var pinregex = new RegExp(
                    '^([1-9][0-9]{5})$'
                    );

            var panregex = new RegExp(
                    '^([A-Z]{5}[0-9]{4}[A-Z]{1})$'
                    );

            var bankregex = new RegExp(
                    '^([0-9]{9,18})$'
                    );

    //    var webregex = new RegExp(
    //    '^((??:https?|ftp):\/\/)?(??!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(??a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/\S*)?$)'
    //   );





            $('#FirstnamE input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', firstregex.test($(this).val()));
            });

            $('#MiddlenamE input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', midregex.test($(this).val()));
            });


            $('#LastnamE input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', lastregex.test($(this).val()));
            });


            $('#AddcitY select').on('change', function (e) {
                alert($('#clientState').val());

                if ($('#clientState').val() !== '') {
                    alert($('#clientState').val());

                    $(this).parent().toggleClass('success', true);
                } else {
                    $(this).parent().toggleClass('success', false);
                }

            });

            $('#AddcitY select').on('change', function (e) {
                alert($('#clientCity').val());

                if ($('#clientCity').val() !== '') {
                    alert($('#clientCity').val());

                    $(this).parent().toggleClass('success', true);
                } else {
                    $(this).parent().toggleClass('success', false);
                }

            });

            $('#Cont input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', mobregex.test($(this).val()));
            });


            $('#AddresS1 textarea').on('keyup', function (e) {
                $(this).parent().toggleClass('success', addregex.test($(this).val()));
            });

            $('#AddDisT select').on('change', function (e) {
                alert($('#clientCity').val());

                if ($('#district').val() !== '') {
                    alert($('#district').val());

                    $(this).parent().toggleClass('success', true);
                } else {
                    $(this).parent().toggleClass('success', false);
                }

            });

            $('#PlacE input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', firstregex.test($(this).val()));
            });

            $('#PincodE input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', pinregex.test($(this).val()));
            });

            $('#CRN input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', crnregex.test($(this).val()));
            });

            $('#CEY input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', numregex.test($(this).val()));
            });

            $('#CCN input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', mobregex.test($(this).val()));
            });

            $('#CE input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', emailregex.test($(this).val()));
            });

            $('#CW input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', emailregex.test($(this).val()));
            });

            $('#TORG select').on('change', function (e) {
                alert($('#contOrganization').val());

                if ($('#contOrganization').val() !== '') {
                    alert($('#contOrganization').val());

                    $(this).parent().toggleClass('success', true);
                } else {
                    $(this).parent().toggleClass('success', false);
                }

            });


            $('#RD select').on('change', function (e) {
                alert($('#contCompanyType').val());

                if ($('#contCompanyType').val() !== '') {
                    alert($('#contCompanyType').val());

                    $(this).parent().toggleClass('success', true);
                } else {
                    $(this).parent().toggleClass('success', false);
                }

            });


            $('#CAD textarea').on('keyup', function (e) {
                $(this).parent().toggleClass('success', addregex.test($(this).val()));
            });

            $('#CPC input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', panregex.test($(this).val()));
            });

            $('#AA textarea').on('keyup', function (e) {
                $(this).parent().toggleClass('success', addregex.test($(this).val()));
            });


            $('#APC input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', panregex.test($(this).val()));
            });

            $('#BAN input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', bankregex.test($(this).val()));
            });

            $('#BN input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', firstregex.test($(this).val()));
            });

            $('#BA input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', addregex.test($(this).val()));
            });

            $('#BANN input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', firstregex.test($(this).val()));
            });

            $('#IFC input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', ifacregex.test($(this).val()));
            });

        });

    </script>


</body>

</html>
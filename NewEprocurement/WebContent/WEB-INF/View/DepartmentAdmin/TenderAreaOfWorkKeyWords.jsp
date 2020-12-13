<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <!-- TITLE-->
        <title>Dashboard</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="<c:url value="/resources/images/fav-icon.png" />" sizes="32x32">

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
              rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">    
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/new-dashboard.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/commoncss.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/wizards-style.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/build.min.css" />">
        <script src="<c:url value="/resources/js/build.min.js" />"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/fastselect.min.css" />">
        <script src="<c:url value="/resources/js/fastselect.standalone.js" />"></script>
        <!-- Include Required Prerequisites -->
        <script src="http://cdn.ckeditor.com/4.4.5/standard/ckeditor.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2"></script>
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
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

        </style>
        <style type="text/css">
            .error {
                color: red;
            }
        </style>   
        <!-----------------------JS VALIDATION---------------->  
                <script>
                    function validateForm() {
                        var x = document.forms["myForm"]["tender_category_id"].value;
        //                alert("x::"+x)
                        var y = document.forms["myForm"]["areaofwork_name"].value;
        //                alert("y::"+y);
                        if (x == "-1")
                        {
                            //  alert("Tender Category must be filled out");
                            document.getElementById("spanid11").innerHTML = "Please Select Tender Category";
                            return false;
                        }
                        else {
                            document.getElementById("spanid11").innerHTML = "";
                        }
                        if (y == "") {
                            //  alert("Area of Work must be filled out");
                            document.getElementById("spanid22").innerHTML = "Please Enter Area Of Work";
                            return false;
                        }
                        else {
                            document.getElementById("spanid22").innerHTML = "";
                        }
                        if (!/^[a-zA-Z0-9 ]*$/g.test(document.myForm.areaofwork_name.value)) {
                            //   alert("Enter Alphabets Only");
                            document.getElementById("spanid22").innerHTML = "Special Characters are not Allowed";
                            return false;
                        }
                    }
                </script>
        <!-----------------------JS VALIDATION END---------------->

        <!-----------------------JS VALIDATION---------------->
                        <script>
                            function Formvalidation() {
                                var x = document.forms["mineForm"]["tender_category_id"].value;
                                var y = document.forms["mineForm"]["areaofwork_id"].value;
                                var z = document.forms["mineForm"]["tenderKeyWordsName"].value;
                                if (x == -1)
                                {
                                    // alert("Tender Category must be filled out");
                                    document.getElementById("spanid1").innerHTML = "Please Select Tender Category";
                                    return false;
                                } else {
                                    document.getElementById("spanid1").innerHTML = "";
                                }
                                if (y == -1) {
                                    //  alert("Area of Work must be filled out");
                                    document.getElementById("spanid2").innerHTML = "Please Select Area Of Work";
                                    return false;
                                } else {
                                    document.getElementById("spanid2").innerHTML = "";
                                }
                                if (z == "") {
                                    //  alert("Keyword must be filled out");
                                    document.getElementById("spanid3").innerHTML = "Please Enter Tender Keyword";
                                    return false;
                                } else {
                                    document.getElementById("spanid3").innerHTML = "";
                                }
                                if (!/^[a-zA-Z0-9 ]*$/g.test(document.mineForm.tenderKeyWordsName.value)) {
                                    alert("Enter Alphabets Only");
                                    document.getElementById("spanid3").innerHTML = "Special Characters are not Allowed";
                                    return false;
                                }
                            }
                
                        </script>
        <!-----------------------JS VALIDATION END---------------->
        <script>
            function categoryid() {
                var tender_category_id = $("#selectcategoryid").val();
//                alert(tender_category_id);
                $.ajax({
                    type: "GET",
                    url: "getTenderAreaWorkByCatId",
                    data: {'tender_category_id': tender_category_id},
                    dataType: 'text',
                    success: function (response) {
                        // alert(response);
                        var $select = $('#areaofwork');
                        $select.find('option').remove();
                        $('<option>').val("-1").text("Select").appendTo($select);
                        $.each(JSON.parse(response), function (key, value) {
                            $('<option>').val(value["areaofwork_id"]).text(value["areaofwork_name"]).appendTo($select);
                        });
                        //again onchange function
                        $("#areaofwork").change(function () {
                            var areaofwork_id = $("#areaofwork").val();
                            alert(areaofwork_id);
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

        <script type="text/javascript">
            function Area_of_WorkModal() {
//                alert("Test");
                $("#areaofwork_name").val("");
                $("#category_id").val("-1");
                $("#category_id").attr('disabled', false);
            }

            function Keyword_Modal() {
//                alert("Test");
                $("#selectcategoryid").val("-1");
                $("#areaofwork").val("-1");
                $("#tenderkeywordid").val("");
                $("#selectcategoryid").attr('disabled', false);
                $("#areaofwork").attr('disabled', false);
                $("#addDynamicInput1").empty();
                $("#addDynamicInput2").empty();
            }

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
            $(document).ready(function (e) {
                $.ajax({
                    type: "GET",
                    url: 'fetchTenderCategory',
                    dataType: 'text',
                    success: function (response) {
//                        alert(response);
                        var innerhtmldata = '';
                        var res = JSON.parse(response);
                        $.each(res, function (key, value) {
                            var html = '<li><a href="javascript:void(0);" id="tender_category_id" onclick="areaofwork(' + value["tender_category_id"] + ');">' + value["tender_category_name"] + '</a></li>';
                            innerhtmldata = innerhtmldata + html;
                        });
                        $("#category").html(innerhtmldata);
                    }
                });

                $(".container .themes>span").click(function (e) {
                    $(".container .themes>span").removeClass("selectedx");
                    $(this).addClass("selectedx");
                });
            });
            function areaofwork(tender_category_id) {
                $("#keyword").empty();
                $("#areaofworkDiv").empty();
                $.ajax({
                    type: "GET",
                    url: 'fetchAreaOfWork',
                    data: {'tender_category_id': tender_category_id},
                    dataType: 'text',
                    success: function (response) {
//                        alert(response);
                        var innerhtmldata = '';
                        var res = JSON.parse(response);
                        $.each(res, function (key, value) {
                            var html = '<li><a href="javascript:void(0);" id="areaofwork_id" onclick="keyword(' + value["areaofwork_id"] + ');"><i data-toggle="modal" data-target="#myModal2" class="fa fa-pencil" aria-hidden="true" onclick="editAreaOfWork( ' + value.areaofwork_id + ' )"></i>' + value["areaofwork_name"] + '</a></li>';
                            innerhtmldata = innerhtmldata + html;
                        });
                        $("#areaofworkDiv").html(innerhtmldata);
                    }
                });
            }
            function keyword(areaofwork_id) {
                $("#keyword").empty();
                $.ajax({
                    type: "GET",
                    url: 'fetchKeyword',
                    data: {'areaofwork_id': areaofwork_id},
                    dataType: 'text',
                    success: function (response) {
//                        alert(response);
                        var innerhtmldata = '';
                        var res = JSON.parse(response);
                        $.each(res, function (key, value) {
                            var html = '<li><a href="javascript:void(0);" id="tenderKeyWordsId" ><i data-toggle="modal" data-target="#myModal3" class="fa fa-pencil" aria-hidden="true" onclick="edit_Keyword( ' + value.tenderKeyWordsId + ' )" data-toggle="modal"></i>' + value["tenderKeyWordsName"] + '</a></li>';
                            innerhtmldata = innerhtmldata + html;
                        });
                        $("#keyword").html(innerhtmldata);
                    }
                });
            }
            function editAreaOfWork(areaofwork_id) {
//                alert(areaofwork_id);
                $.ajax({
                    type: "GET",
                    url: "edit_AreaOfWork",
                    data: {'id': areaofwork_id},
                    dataType: 'text',
                    success: function (response) {
                        alert(response);
                        $("#addDynamicInput").empty();
                        var obj = JSON.parse(response);
                        $.each(obj, function (key, value) {
                            $("#" + key).val(value);
                            $("#category_id").val(obj.tender_category_id);
                            $("#areaofwork_idP").val(obj.areaofwork_id);
                        });
//                        $("#category_id").prop('disabled', 'disabled');
//                        $("#category_id").attr("readonly", "readonly");  
//                        $("#category_id").attr("readonly", true);  
//                        $("#category_id").prop('readonly', true);
                        document.getElementById("category_id").readOnly = true;
                    }
                });
            }
            function edit_Keyword(tenderKeyWordsId) {
//                alert(tenderKeyWordsId);
                $.ajax({
                    type: "GET",
                    url: "edit_Keyword",
                    data: {'id': tenderKeyWordsId},
                    dataType: 'text',
                    success: function (response) {
                        alert(response);
                        var obj = JSON.parse(response);
                        $.each(obj, function (key, value) {
                            $("#tenderkeywordid").val(obj.tenderKeyWordsName);
                            $("#selectcategoryid").val(obj.tender_category_id);
                            var $select = $('#areaofwork');
                            $select.find('option').remove();
                            $('<option>').val(obj.areaofwork_id).text(obj.areaofwork_name).appendTo($select);
                            $("#tenderKeyWordsIdP").val(obj.tenderKeyWordsId);

                        });
//                        $("#selectcategoryid").attr('disabled', 'disabled');
//                        $("#areaofwork").attr('disabled', 'disabled');
                    }
                });
            }

            $(document).ready(function () {

                var message = '<c:out value="${msg}"></c:out>';
                if (message !== "") {
                    swal(
                            '',
                            message,
                            'success'
                            )
                }
                var message = '<c:out value="${msg2}"></c:out>';
                if (message !== "") {

                    swal(
                            '',
                            message,
                            'error'
                            )
                }
            });

            </script>
        </head>

        <body>
        <%@include file="Tiles/AdminDashboardHeader.jsp" %>
        <!----------------------------->   
        <div class="subdivisoncreate">
            <div class="container">
                <div class="headertitl">
                    <h2 class="subtitle-h2">TenderCategory-AreaOfWork-KeyWords</h2>
                    <span style="color: red;margin-left:200px;">${msg1}</span> 
                </div>
                <div class="row cityContent">
                    <div class="col-md-3 border">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Tender Category <form action="" class="search-form">
                                    <div class="form-group has-feedback">
                                        <label for="search" class="sr-only">Search</label>
                                        <input type="text" class="form-control" name="search" onkeyup="myFunctionCategory()" id="search1" placeholder="Search Tender Category">
                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form></h4>
                            <ul class="listcitydata" id="category">
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 border">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Area Of Work<form action="" class="search-form">
                                    <div class="form-group has-feedback">
                                        <label for="search" class="sr-only">Search</label>
                                        <input type="text" class="form-control" name="search" onkeyup="myFunctionAreaOfWork()"id="search2" placeholder="Search Area Of Work">
                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form></h4>
                            <ul class="listcitydata" id="areaofworkDiv">

                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 border">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Keyword<form action="" class="search-form">
                                    <div class="form-group has-feedback">
                                        <input type="text" class="form-control" onkeyup="myFunctionKeyword()" name="search" id="search3" placeholder="Search Keyword">
                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form></h4>
                            <ul class="listcitydata" id="keyword">
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 border brderright">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Action</h4>
                            <div class="listcitydata text-center" style="overflow-y:hidden">
                                <button type="button" class="btn btn-info" id="add_Area_of_Work" onclick="Area_of_WorkModal();" data-toggle="modal" data-target="#myModal2">Add more Area Of Work</button>
                                <button type="button" class="btn btn-primary" id="add_All_Keyword" onclick="Keyword_Modal();" data-toggle="modal" data-target="#myModal3">Add more Keywords</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- All model are here -->
        <!-- Area Of Work model is here -->
        <div class="modal fade" id="myModal2" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header1">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title categoryTitle"><img src="img/logo.png" alt="modal_logo">Area Of Work</h4>
                    </div>
                    <div class="modal-body">
                        <div class="subdivisoncreate">
                            <div class="col-md-12">
                                <div class="inputfield_division">
                                    <form:form action="save_AreaOfWork" modelAttribute="addareaofwork" name="myForm" class="createdivison" onsubmit="return validateForm();">
                                        <form:hidden path="areaofwork_id" id="areaofwork_idP"/>
                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label">Tender Category</label>    
                                            <div class="col-sm-8">
                                                <span id="spanid11" style="color:red"></span>
                                                <form:errors path="tender_category_id" cssClass="error" />
                                                <form:select path="tender_category_id" class="form-control" id="category_id" onchange="getId()">
                                                    <form:option value="-1">Select</form:option>
                                                    <c:forEach var="categoryList" items="${categoryList}" >   
                                                        <form:option value="${categoryList.tender_category_id}">${categoryList.tender_category_name}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label">Area Of Work</label>    
                                            <div class="col-sm-8" id="areaWork"> 
                                                <span id="spanid22" style="color:red"></span>
                                                <form:errors path="areaofwork_name" cssClass="error" />
                                                <form:input path="areaofwork_name" id="areaofwork_name" class="form-control" placeholder="Area Of Work"/>


                                                <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                </svg>
                                            </div>    
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label" > </label>
                                            <div class="col-sm-8">
                                                <div class="">
                                                    <button type="submit" class="btn btn-success">Add</button>
                                                    <button type="reset" class="btn btn-danger">Reset</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Keyword model is here -->
        <div class="modal fade" id="myModal3" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header1">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title categoryTitle"><img src="img/logo.png" alt="modal_logo">Keyword</h4>
                    </div>
                    <div class="modal-body">
                        <div class="subdivisoncreate">
                            <!--  <div class="headertitl">
                                  <h2 class="subtitle-h2">Create Sub Division</h2>
                                           </div>-->
                            <div class="col-md-12">
                                <div class="inputfield_division">
                                    <form:form action="save_Keywords" modelAttribute="addkeywords" name="mineForm" class="createdivison" onsubmit="return Formvalidation();">                                  
                                        <form:hidden path="tenderKeyWordsId" id="tenderKeyWordsIdP"/>
                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label">Tender Category</label>    
                                            <div class="col-sm-8">
                                                <span id="spanid1" style="color:red"></span>  
                                                <form:errors path="tender_category_id" cssClass="error" />
                                                <form:select path="tender_category_id" id="selectcategoryid" onchange="categoryid()" class="form-control">
                                                    <form:option value="-1">Select</form:option>
                                                    <c:forEach var="categoryList" items="${categoryList}" >   
                                                        <form:option value="${categoryList.tender_category_id}">${categoryList.tender_category_name}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label">Area Of Work</label>    
                                            <div class="col-sm-8">
                                                <span id="spanid2" style="color:red"></span>  
                                                <form:errors path="areaofwork_id" cssClass="error" />
                                                <form:select path="areaofwork_id" id="areaofwork" class="form-control">  
                                                    <form:option value="-1">Select</form:option>      
                                                    <form:option value="1">First Select Category</form:option>
                                                </form:select>   
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label">Keywords</label>    
                                            <div class="col-sm-8" id="keyW">
                                                <span id="spanid3" style="color:red"></span>  
                                                <form:errors path="tenderKeyWordsName" cssClass="error" />
                                                <form:input path="tenderKeyWordsName" id="tenderkeywordid"  class="form-control" placeholder="Keywords"/>
                                                <!--                                                <svg viewBox="0 0 16 16">
                                                                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                                                                </svg>-->
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label"> </label>
                                            <div class="col-sm-8">
                                                <div class="">
                                                    <button type="submit" class="btn btn-success">Add</button>
                                                    <button type="reset" class="btn btn-danger">Reset</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

            </div>
        </div>
        <!--FOOTER_SECTION_START-->

        <div style="height:200px; margin-top: 150px;"></div>
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
        <!--script-link-->
        <script src="<c:url value="/resources/js/bootstrap3-wysihtml5.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/jquery-1.10.2.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.dataTables.min.js" />"></script>
        <script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/jquery-wz.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/bootstrap-datetimepicker-wz.js" />"></script>
        <!--------------------->
        <script type="text/javascript" src="<c:url value="/resources/js/moment.min.rg.js" />"></script>
        <!-- Include Date Range Picker -->
        <script type="text/javascript" src="<c:url value="/resources/js/daterangepicker.js" />"></script>
        <script data-require="angular.js@1.3.0" data-semver="1.3.0" src="https://code.angularjs.org/1.3.0/angular.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="<c:url value="/resources/js/angular/script.js" />"></script>
        <script src="<c:url value="/resources/js/angular/dirPagination.js" />"></script>

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
        <script>
            $(document).ready(function () {
                $("#addCountry").click(function () {
                    $("#CountryModal").modal();
                });
            });
        </script>    

        <!--vikalp-->

        <!--<link rel="stylesheet" type="text/css" href="/resources/css/app.css">-->
        <link rel="stylesheet" href="<c:url value="/resources/css/app.css"/>">


        <script>

            $(document).ready(function () {

                var cirregex = new RegExp(
                        '^(([a-zA-Z0-9]+$))'
                        );

                var divregex = new RegExp(
                        '^(([a-zA-Z0-9 ]+$))'
                        );

                var subdivregex = new RegExp(
                        '^(([a-z\s]+$))'
                        );

                var nitshortregex = new RegExp(
                        '^(([a-z\s]+$))'
                        );

                var nitnoworkregex = new RegExp(
                        '^(([a-z\s]+$))'
                        );

                var nitpacregex = new RegExp(
                        '^(([a-z\s]+$))'
                        );

                var nitpacwregex = new RegExp(
                        '^(([a-z\s]+$))'
                        );

                var nitemdregex = new RegExp(
                        '^(([a-z\s]+$))'
                        );

                var nitemdwregex = new RegExp(
                        '^(([a-z\s]+$))'
                        );

                var nitfeewregex = new RegExp(
                        '^(([a-z\s]+$))'
                        );

                var nitfeewwregex = new RegExp(
                        '^(([a-z\s]+$))'
                        );



                var updateregex = new RegExp(
                        '^(([a-zA-Z0-9 ]+$))'
                        );

                var updatesubregex = new RegExp(
                        '^(([a-zA-Z0-9 ]+$))'
                        );








                var emailregex = new RegExp(
                        '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                        '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                        '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
                        );

                $('#Cir input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', cirregex.test($(this).val()));
                });

                $('#DIV input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', divregex.test($(this).val()));
                });

                $('#SubDiv input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', subdivregex.test($(this).val()));
                });

                $('#short textarea').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', nitshortregex.test($(this).val()));
                });

                $('#Nowork input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', nitnoworkregex.test($(this).val()));
                });

                $('#pac input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', nitpacregex.test($(this).val()));
                });

                $('#pacW input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', nitpacwregex.test($(this).val()));
                });

                $('#emd input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', nitemdregex.test($(this).val()));
                });

                $('#emdW input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', nitemdwregex.test($(this).val()));
                });

                $('#fee input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', nitfeewregex.test($(this).val()));
                });

                $('#feeW input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', nitfeewregex.test($(this).val()));
                });

                $('#timeP input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', nittimepregex.test($(this).val()));
                });



                $('#upd input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', updateregex.test($(this).val()));
                });

                $('#updsub input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', updatesubregex.test($(this).val()));
                });


                $('#circle1').on('change', function (e) {
                    alert($('#circle1').val());
                    if ($('#circle1').val() !== '') {
                        alert($(this).val());
                        $(this).parent().toggleClass('success');

                    }

//        $(this).parent().toggleClass('success', cirCregex.test($(this).val()));
                });







                $('.email input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', emailregex.test($(this).val()));
                });

            });

        </script>

        <script>
            $(document).ready(function () {

                $(function () {
                    $('#sbtbtn').attr('disabled', 'disabled');
                });
                var regex = /^[a-zA-Z0-9 ]*$/;
                $('input[type=text],input[type=password]').keyup(function () {

                    if ($('#target1').val() != '' && regex.test($('#target1').val()))
                    {

                        $('#sbtbtn').removeAttr('disabled');
                    } else {
                        $('#sbtbtn').attr('disabled', 'disabled');
                    }
                });
            });
        </script>
        <script>
            $(document).ready(function () {

                $(function () {
                    $('#sbtbtn2').attr('disabled', 'disabled');
                });
                var regex = /^[a-zA-Z0-9 ]*$/;
                $('input[type=text],input[type=password],input[type=select]').keyup(function () {

                    if ($('#circle1').val() != '' &&
                            $('#division_name').val() != '' && regex.test($('#division_name').val())) {

                        $('#sbtbtn2').removeAttr('disabled');
                    } else {
                        $('#sbtbtn2').attr('disabled', 'disabled');
                    }
                });
            });
        </script>
        <script>
            $(document).ready(function () {

                $(function () {
                    $('#sbtbtn3').attr('disabled', 'disabled');
                });
                var regex = /^[a-zA-Z0-9 ]*$/;
                $('input[type=text],input[type=password],input[type=select]').keyup(function () {

                    if ($('#circle10').val() != '' && $('#division1').val() != '' &&
                            $('#subdivision_name').val() != '' && regex.test($('#subdivision_name').val())) {

                        $('#sbtbtn3').removeAttr('disabled');
                    } else {
                        $('#sbtbtn3').attr('disabled', 'disabled');
                    }
                });
            });
        </script>
        <script>
            function myFunctionCategory() {
                var input, filter, ul, li, a, i;
                input = document.getElementById("search1");
                filter = input.value.toUpperCase();
                ul = document.getElementById("category");
                li = ul.getElementsByTagName("li");
                for (i = 0; i < li.length; i++) {
                    a = li[i].getElementsByTagName("a")[0];
                    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        li[i].style.display = "";
                    } else {
                        li[i].style.display = "none";
                    }
                }
            }
            function myFunctionAreaOfWork() {
                var input, filter, ul, li, a, i;
                input = document.getElementById("search2");
                filter = input.value.toUpperCase();
                ul = document.getElementById("areaofworkDiv");
                li = ul.getElementsByTagName("li");
                for (i = 0; i < li.length; i++) {
                    a = li[i].getElementsByTagName("a")[0];
                    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        li[i].style.display = "";
                    } else {
                        li[i].style.display = "none";
                    }
                }
            }
            function myFunctionKeyword() {
                var input, filter, ul, li, a, i;
                input = document.getElementById("search3");
                filter = input.value.toUpperCase();
                ul = document.getElementById("keyword");
                li = ul.getElementsByTagName("li");
                for (i = 0; i < li.length; i++) {
                    a = li[i].getElementsByTagName("a")[0];
                    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        li[i].style.display = "";
                    } else {
                        li[i].style.display = "none";
                    }
                }
            }
        </script>
    </body>

</html>

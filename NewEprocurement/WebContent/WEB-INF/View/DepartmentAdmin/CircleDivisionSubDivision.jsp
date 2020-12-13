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
        <style type="text/css">
            .error {
                color: red;
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
            $(document).ready(function (e) {

//        $(".stepsForm").stepsForm({
//            theme: 'purple'
//        });
                // alert("Hello");
                $.ajax({
                    type: "GET",
                    url: 'getCircleByAjax.action',
                    dataType: 'text',
                    success: function (response) {
                        // alert(response);
                        var innerhtmldata = '';
                        var res = JSON.parse(response);
                        $.each(res, function (key, value) {
                            var html = '<li><a href="javascript:void(0);" id="circleid" onclick="Circle(' + value["circleid"] + ');"><i class="fa fa-pencil" aria-hidden="true" data-toggle="modal" data-target="#myModal" onclick="editCircle(' + value["circleid"] + ');"></i>' + value["circle"] + '</a></li>';
                            innerhtmldata = innerhtmldata + html;
                        });

                        $("#circle").html(innerhtmldata);

                    }
                });

                $(".container .themes>span").click(function (e) {
                    $(".container .themes>span").removeClass("selectedx");
                    $(this).addClass("selectedx");
                    //    $(".stepsForm").removeClass().addClass("stepsForm");
                    //	$(".stepsForm").addClass("sf-theme-"+$(this).attr("data-value"));
                });
            });
            function Circle(circleid) {
                // alert("circle called" + circleid);
                var resData = '';
                $.ajax({
                    type: "GET",
                    url: 'getDivisionByAjax.action',
                    data: {'circleid': circleid},
                    success: function (response) {
                        //  alert(response);
                        var division = JSON.parse(response);
                        $.each(division, function (key, value) {
                            // alert(value["division"]);                            
                            var html1 = '<li><a href="javascript:void(0);" id="division_id" onclick="division(' + value["division_id"] + ');"><i class="fa fa-pencil" aria-hidden="true" onclick="editDivision(' + value["division_id"] + ');" ></i>' + value["division"] + '</a></li>';
                            resData = resData + html1;
                        });
                        $("#division").html(resData);
                    }
                });
            }

            function editCircle(circleid) {
                alert(circleid);
                $.ajax({
                    type: "GET",
                    url: 'editCircle.action',
                    data: {'id': circleid},
                    dataType: 'text',
                    success: function (response) {
                        alert(response);
                        var circle = JSON.parse(response);
                        alert("circleID:::" + circle.circleid);
                        $("#idcircle").val(circle.circleid);
                        $("#target1").val(circle.circle);
                        $("addCircle").click();
                        alert("ok");
                    }
                });

            }

            function division(division_id) {
                // alert("division called");
                // alert(division_id);
                var resData = '';
                $.ajax({
                    type: "GET",
                    url: 'getSubDivisionByAjax.action',
                    data: {'division_id': division_id},
                    dataType: 'text',
                    success: function (response) {
                        //               alert(response);
                        var subdivision = JSON.parse(response);
                        $.each(subdivision, function (key, value) {
                            var html1 = '<li><a href="javascript:void(0);" id="subdivision_id" onclick="division(' + value["division_id"] + ');"><i class="fa fa-pencil" aria-hidden="true" onclick="editSubDivision(' + value["subdivision_id"] + ')" ></i>' + value["subdivision"] + '</a></li>';
                            resData = resData + html1;
                            $("#subdivision").html(resData);
                        });
                    }
                });
            }

            function editDivision(id) {
                alert(id);
                // alert('for update');
                //alert("Division Id" + id);

                $.ajax({
                    type: "GET",
                    url: 'editDivision.action',
                    data: {'id': id},
                    dataType: 'text',
                    success: function (response) {
                        //alert(response);
                        var division = JSON.parse(response);
                        alert("circleID:::" + division.circleid);
                        $("#division_names").val(division.division);
                        $("#division_id2").val(division.division_id);
                        $("#circle1").val(division.circleid);
                        $("#circle2").val(division.circleid);
                        $("#circle_name").val(division.circle)
                        $("#updateDivision").click();
                    }
                });
            }
            function editSubDivision(id) {
                //alert('for update');
                // alert(id);
                $.ajax({
                    type: "GET",
                    url: 'editSubDivision',
                    data: {'id': id},
                    dataType: 'text',
                    success: function (response) {
                        //  alert(response);
                        var subdivision = JSON.parse(response);
                        //  alert(subdivision.subdivision);
                        // alert(subdivision.division_id);

                        $("#circle10").val(subdivision.circleid);
                        $("#circleid3").val(subdivision.circleid);
                        $("#division_id3").val(subdivision.division_id);
                        $("#subdivision_id2").val(subdivision.subdivision_id);
                        $("#subdivision_names").val(subdivision.subdivision);
                        $("#circlename").val(subdivision.circle);
                        $("#divisionname").val(subdivision.division);
                        $("#updateSubDivision").click();
                    }
                });
            }

            function openModel(modelId) {
                // alert(modelId);
                $("#division_name").val("");
                $("#division_id").val("");
                $("#circle1").val("");
                $("#addDivision").modal();

                $("#circle10").val("");
                $("#division1").val("");
                $("#subdivision_id").val("");
                $("#subdivision_names").val("");
                $("#addSubDivision").modal();

                $("#idcircle").val("");
                $("#target1").val("");
                $("#addCircle").modal();
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
            <script>
                function myFunction()
                {
                    var circleid = $("#circle10").val();
                    // alert(circleid);

                    $.ajax({
                        type: "GET",
                        url: 'getDivisionByAjax.action',
                        data: {'circleid': circleid},
                        dataType: 'text',
                        success: function (response) {
                            //  alert(response);
                            var $select = $('#division1');
                            $select.find('option').remove();
                            $('<option>').val("-1").text("Select").appendTo($select);
                            $.each(JSON.parse(response), function (key, value) {
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
            </script>
            <script>
                function ValidateForm() {
                    var circle = document.myform.circle.value;
                    if (circle === null || circle === "") {
                        $("#errorCircleName").css('color', 'red');
                        $("#errorCircleName").html("Please specify the circle name");
                        return false;
                    }
                    return true;
                }
                function ValidateForm2() {
                    var circleid = document.myform2.circle1.value;
                    if (circleid === "") {
                        $("#errorCircleSelect").css('color', 'red');
                        $("#errorCircleSelect").html("Please specify the circle name");
                        return false;
                    }
                    var division = document.myform2.division.value;
                    if (division === null || division === "") {
                        $("#errorDivisionName").css('color', 'red');
                        $("#errorDivisionName").html("Please specify the division name");
                        return false;
                    }
                }
                function ValidateForm3() {
                    var circleid = document.myform3.circle10.value;
                    if (circleid === "") {
                        $("#errorCircleSelect2").css('color', 'red');
                        $("#errorCircleSelect2").html("Please specify the circle name");
                        return false;
                    }
                    var division = document.myform3.division1.value;
                    if (division === "") {
                        $("#errorDivisionName2").css('color', 'red');
                        $("#errorDivisionName2").html("Please specify the division name");
                        return false;
                    }
                    var subdivision = document.myform3.subdivision.value;
                    if (subdivision === null || subdivision === "") {
                        $("#errorSubDivisionName").css('color', 'red');
                        $("#errorSubDivisionName").html("Please specify the Subdivision name");
                        return false;
                    }
                }

            </script>

        </head>

        <body>
        <%@include file="Tiles/AdminDashboardHeader.jsp" %>
        <!----------------------------->    
        <!--CREATE_SUB_DIVISION-->
        <div class="subdivisoncreate">
            <div class="container">
                <div class="headertitl">
                    <h2 class="subtitle-h2">Circle-Division-Subdivision</h2>
                </div>
                <div class="row cityContent">
                    <div class="col-md-3 border">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Circle <form action="" class="search-form">
                                    <div class="form-group has-feedback">
                                        <label for="search" class="sr-only">Search</label>
                                        <input type="text" class="form-control" name="search" id="search" placeholder="Search Country">
                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form></h4>
                            <ul class="listcitydata" id="circle">
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 border">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Division<form action="" class="search-form">
                                    <div class="form-group has-feedback">
                                        <label for="search" class="sr-only">Search</label>
                                        <input type="text" class="form-control" name="search" id="search" placeholder="Search State / Provision">
                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form></h4>
                            <ul class="listcitydata" id="division">

                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 border">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">SubDivision<form action="" class="search-form">
                                    <div class="form-group has-feedback">
                                        <input type="text" class="form-control" name="search" id="search" placeholder="Search City">
                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form></h4>
                            <ul class="listcitydata" id="subdivision">
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 border brderright">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Action</h4>
                            <div class="listcitydata text-center" style="overflow-y:hidden">
                                <button type="button" class="btn btn-info" id="addCircle"  data-toggle="modal" data-target="#myModal" onclick="openModel(this.id)">Add Circle</button>
                                <button type="button" class="btn btn-primary" id="addDivision" data-toggle="modal" data-target="#myModal2" onclick="openModel(this.id)">Add Division</button> 
                                <button type="button" class="btn btn-success" id="addSubDivision"  data-toggle="modal" data-target="#myModal3" onclick="openModel(this.id)">Add Subdivision</button>
                            </div>

                            <div id="modelbutton" hidden="true">
                                <button type="button" class="btn btn-default btn-lg" id="updateDivision"  data-toggle="modal" data-target="#myModal4"> Division</button><br><br>
                                <button type="button" class="btn btn-default btn-lg" id="updateSubDivision"  data-toggle="modal" data-target="#myModal5"> SubDivision</button><br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- All model are here -->
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header1">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title categoryTitle"><img src="img/logo.png" alt="modal_logo">Create Circle</h4>
                    </div>
                    <div class="modal-body">
                        <div class="subdivisoncreate">
                            <!--  <div class="headertitl">
                                  <h2 class="subtitle-h2">Create Sub Division</h2>
                                           </div>-->
                            <div class="col-md-12">
                                <form:form action="savecircleModel" class="createdivison"  modelAttribute="circle">

                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label">Circle Name</label>
                                        <div class="col-sm-8" id="Cir">

                                            <form:hidden path="circleid" id="idcircle"/>
                                            <form:errors path="circle" cssClass="error"/>
                                            <form:input path="circle" class="form-control" placeholder="Enter Circle name" id="target1"/>

                                            <svg viewBox="0 0 16 16">
                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label"> </label>
                                        <div class="col-sm-8">
                                            <div class="">
                                                <button type="submit" id="sbtbtn" class="btn btn-success">Add</button>
                                                <button type="button" class="btn btn-danger">Reset</button>
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


    <!-- State model is here -->
    <!-- Modal -->
    <div class="modal fade" id="myModal2" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header1">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title categoryTitle"><img src="img/logo.png" alt="modal_logo">Create Division</h4>
                </div>
                <div class="modal-body">
                    <div class="subdivisoncreate">
                        <!--  <div class="headertitl">
                              <h2 class="subtitle-h2">Create Sub Division</h2>
                                       </div>-->
                        <div class="col-md-12">
                            <div class="inputfield_division">
                                <form:form action="savedivision" class="createdivison" modelAttribute="division"  id="divisionForm">
                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label">Circle Name</label>
                                        <div class="col-sm-8" id="cirCle">
                                            <form:hidden path="division_id" id="division_id"/>
                                            <form:errors path="circleid" cssClass="error"/>
                                            <form:select path="circleid" id="circle1" class="select form-control">
                                                <form:option value="">Select</form:option>
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

                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label">SubDivision Name</label>
                                        <div class="col-sm-8" id="DIV">
                                            <form:errors path="division" cssClass="error"/>
                                            <form:input path="division" class="form-control" placeholder="Enter Division" id="division_name"/>
                                            <svg viewBox="0 0 16 16">
                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label"> </label>
                                        <div class="col-sm-8">
                                            <div class="">
                                                <button type="submit" id="sbtbtn2" class="btn btn-success">Add</button>
                                                <button type="button" class="btn btn-danger">Reset</button>
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


    <!-- Modal -->
    <div class="modal fade" id="myModal3" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header1">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title categoryTitle"><img src="img/logo.png" alt="modal_logo">Create Sub Division</h4>
                </div>
                <div class="modal-body">
                    <div class="subdivisoncreate">
                        <!--  <div class="headertitl">
                              <h2 class="subtitle-h2">Create Sub Division</h2>
                                       </div>-->
                        <div class="col-md-12">
                            <div class="inputfield_division">
                                <form:form action="savesubdivision" class="createdivison" modelAttribute="subdivision">
                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label">Circle Name</label>
                                        <div class="col-sm-8" id="AddcirclE">
                                            <form:hidden path="subdivision_id" id="subdivision_id"/>
                                            <form:errors path="circleid" cssClass="error"/>
                                            <form:select path="circleid" id="circle10" onchange="myFunction()" class="select form-control">
                                                <form:option value="" >Select</form:option>
                                                <c:forEach var="circleList" items="${circleList}" >  
                                                    <form:option value="${circleList.circleid}" >${circleList.circle}</form:option>  
                                                </c:forEach>
                                            </form:select>
                                            <svg viewBox="0 0 16 16">
                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label">Division Name</label>
                                        <div class="col-sm-8" id="AdddivisioN">
                                            <form:errors path="division_id" cssClass="error"/>
                                            <form:select path="division_id" id="division1" class="select form-control">
                                                <form:option value="">Select</form:option>
                                            </form:select>

                                            <svg viewBox="0 0 16 16">
                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label">SubDivision Name</label>
                                        <div class="col-sm-8" id="SubDiv">
                                            <form:errors path="subdivision" cssClass="error"/>
                                            <form:input path="subdivision" class="form-control" placeholder="Enter SubDivision"  id="subdivision_name"/>
                                            <svg viewBox="0 0 16 16">
                                            <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                            <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                            </svg>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label"> </label>
                                            <div class="col-sm-8">
                                                <div class="">
                                                    <button type="submit" id="sbtbtn3"class="btn btn-success">Add</button>
                                                    <button type="button" class="btn btn-danger">Reset</button>
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
    </div>
    <!--update Division-->
    <div class="modal fade" id="myModal4" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header1">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title categoryTitle"><img src="img/logo.png" alt="modal_logo">Create Sub Division</h4>
                </div>
                <div class="modal-body">
                    <div class="subdivisoncreate">
                        <!--  <div class="headertitl">
                              <h2 class="subtitle-h2">Create Sub Division</h2>
                                       </div>-->
                        <div class="col-md-12">
                            <form:form action="savedivision" class="createdivison" modelAttribute="division" name="myform2" onsubmit="return ValidateForm2()" id="divisionForm">
                                <form:hidden path="division_id"  id="division_id2"/>
                                <form:hidden path="circleid" id="circle2"/>
                                <div class="form-group row">
                                    <label for="inputSubdivision" class="col-sm-4 col-form-label">Circle</label>
                                    <div class="col-sm-8">
                                        <form:errors path="circle" cssClass="error"/>
                                        <form:input path="circle" class="form-control" id="circle_name" readonly="true"/>

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputSubdivision" class="col-sm-4 col-form-label">Division</label>
                                    <div class="col-sm-8">
                                        <form:errors path="circle" cssClass="error"/>
                                        <form:input path="division" class="form-control" id="division_names"/>

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputSubdivision" class="col-sm-4 col-form-label"> </label>
                                    <div class="col-sm-8">
                                        <div class="">
                                            <button type="submit" id="" class="btn btn-success">Add</button>
                                            <button type="button" class="btn btn-danger">Reset</button>
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


    <div class="modal fade" id="myModal5" role="dialog">
        <div class="col-md-12">
            <div class="col-md-6 col-md-offset-3">

                <div class="modal-body">
                    <div class="row">
                        <div class="inputfield_division">
                            <form:form action="savesubdivision" class="createdivison" modelAttribute="subdivision" name="myform3" onsubmit="return ValidateForm3()">
                                <form:hidden path="subdivision_id" id="subdivision_id2"/>
                                <form:hidden path="division_id" id="division_id3"/>
                                <form:hidden path="circleid" id="circleid3"/>
                                <h4 align="center"><b>Update SubDivision here</b></h4>
                                <span><br></span>
                                <div class="form-group row">

                                    <label for="inputSubdivision" class="col-sm-4 col-form-label">Circle</label> 
                                    <div class="col-sm-8"><h5 style="color: green">${msg1}</h5>  <h5 style="color: red">${msg2}</h5>
                                        <span id="errorCircleSelect2"></span>
                                        <form:input path="circle" class="form-control" id="circlename" readonly="true"/>
                                    </div>


                                    <label for="inputSubdivision" class="col-sm-4 col-form-label">Division</label> 
                                    <div class="col-sm-8">
                                        <span><br></span>
                                            <form:input path="division" class="form-control" id="divisionname" readonly="true"/>
                                    </div>

                                    <span id="errorSubDivisionName"></span>
                                    <label for="inputSubdivision" class="col-sm-4 col-form-label">Subdivision</label> 
                                    <div class="col-sm-8" id="updsub">
                                        <span><br></span>
                                        <input type="text" class="form-control" placeholder="Enter SubDivision" name="subdivision" id="subdivision_names">

                                        <svg viewBox="0 0 16 16">
                                        <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                        <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                        </svg>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputSubdivision" class="col-sm-4 col-form-label"> </label>
                                    <div class="col-sm-8">
                                        <div class="col-sm-3">
                                            <button type="submit"  class="btn btn-success">Update</button>
                                        </div>
                                        <div class="col-sm-4">
                                            <button type="reset" class="btn btn-danger">Reset</button>
                                        </div>
                                    </div>
                                </div>

                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
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

    <link rel="stylesheet" href="<c:url value="/resources/css/app.css"/>">

<script src="<c:url value="/resources/js/valid.js" />"></script>


    <script src="<c:url value="/resources/js/btndsbl.js" />"></script>

</body>

</html>

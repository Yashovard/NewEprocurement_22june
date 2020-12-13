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
                // alert("hello");
                $.ajax({
                    type: "GET",
                    url: "getProductcategoryByAjax",
                    dataType: 'text',
                    success: function (response) {
                        // alert(response);
                        var innerhtmldata = '';
                        var res = JSON.parse(response);
                        $.each(res, function (key, value) {
                            var html = '<li><a href="javascript:void(0);" id="productCategoryId" onclick="productSubCategory(' + value["productCategoryId"] + ');"><i class="fa fa-pencil" aria-hidden="true"  data-toggle="modal" data-target="#myModal" onclick="editProductCategory(' + value["productCategoryId"] + ')" ></i>' + value["productCategoryName"] + '</a></li>';
                            innerhtmldata = innerhtmldata + html;

                        });
                        $("#productcategory").append(innerhtmldata);
                    }
                });
                $(".container .themes>span").click(function (e) {
                    $(".container .themes>span").removeClass("selectedx");
                    $(this).addClass("selectedx");
                    //    $(".stepsForm").removeClass().addClass("stepsForm");
                    //	$(".stepsForm").addClass("sf-theme-"+$(this).attr("data-value"));
                });
            });
            function productSubCategory(productCategoryId) {
                //  alert(productCategoryId);
                //alert("productCategoryId"+productCategoryId);
                var resData = '';
                $.ajax({
                    type: "GET",
                    url: 'getProductSubCategoryByAjax.action',
                    data: {'productCategoryId': productCategoryId},
                    success: function (response) {
                        // alert(response);
                        var ProductSubCategory = JSON.parse(response);
                        $.each(ProductSubCategory, function (key, value) {
                            // alert(value["productSubCategoryName"]);
                            var html1 = '<li><a href="javascript:void(0);" id="productSubCategoryId" onclick="division(' + value["productSubCategoryId"] + ');"><i class="fa fa-pencil" aria-hidden="true" onclick="editProductSubCategory(' + value["productSubCategoryId"] + ')" ></i>' + value["productSubCategoryName"] + '</a></li>';
                            resData = resData + html1;
                        });
                        $("#productsubcategory").html(resData);
                    }
                });
            }
            function editProductSubCategory(id) {
                // alert('for update');
                $.ajax({
                    type: "GET",
                    url: 'editProductSubCategory.action',
                    data: {'id': id},
                    dataType: 'text',
                    success: function (response) {
                        //  alert(response);
                        var ProductSubCategory = JSON.parse(response);
                        $("#productSubCategory_Name").val(ProductSubCategory.productSubCategoryName);
                        $("#productSubCategoryId2").val(ProductSubCategory.productSubCategoryId);
                        $("#prcategory").val(ProductSubCategory.productCategoryId);
                        $("#productCategoryId2").val(ProductSubCategory.productCategoryId);
                        $("#productCategory_Name").val(ProductSubCategory.productCategoryName);
                        $("#updateProductSubCategory").click();
                    }
                });
            }

            function editProductCategory(productCategoryId)
            {
                alert('for update');
                alert(productCategoryId);
                $.ajax({
                    type: "GET",
                    url: 'editProductCategory.action',
                    data: {'id': productCategoryId},
                    dataType: 'text',
                    success: function (response) {
                        alert(response);
                        var ProductCategory = JSON.parse(response);
                        $("#idproductcategory").val(ProductCategory.productCategoryId);
                        $("#target1").val(ProductCategory.productCategoryName);
                        $("#addProductCategory").click();
                    }
                });
            }



            function openModel(modelId) {
                // alert(modelId);
                $("#productSubCategory_Name").val("");
                $("#productSubCategoryId2").val("");
                $("#prcategory").val("");
                $("#productCategoryId2").val("");
                $("#productCategory_Name").val("");
                $("#addProductSubCategory").modal();

                $("#idproductcategory").val("");
                $("#target1").val("");
                $("#addProductCategory").modal();
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
        </head>

        <body>
        <%@include file="Tiles/AdminDashboardHeader.jsp" %>
        <!--CREATE_Product_Categories-->
        <div class="subdivisoncreate">
            <div class="container">
                <div class="headertitl">
                    <h2 class="subtitle-h2">ProductCategory-SubCategory</h2>
                </div>
                <div class="row cityContent">
                    <div class="col-md-4 border">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Product Category <form action="" class="search-form">
                                    <div class="form-group has-feedback">
                                        <label for="search" class="sr-only">Search</label>
                                        <input type="text" class="form-control" name="search"  onkeyup="myFunction()" id="search1" placeholder="Search Country">
                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form></h4>
                            <ul class="listcitydata" id="productcategory">
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 border">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Product SubCategory


                                <form action="" class="search-form">
                                    <div class="form-group has-feedback">
                                        <label for="search" class="sr-only">Search</label>
                                        <input type="text" class="form-control" name="search" id="search" placeholder="Search State / Provision">
                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form></h4>
                            <ul class="listcitydata" id="productsubcategory">

                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4 border brderright">
                        <div class="sidetabdata">
                            <h4 class="subtitle-h4">Action</h4>
                            <div class="listcitydata text-center" style="overflow-y:hidden">
                                <button type="button" class="btn btn-info" id="addProductCategory"  data-toggle="modal" data-target="#myModal" onclick="openModel(this.id)">Add Product Category</button>
                                <button type="button" class="btn btn-success" id="addProductSubCategory" data-toggle="modal" data-target="#myModal2" onclick="openModel(this.id)">Add Product SubCategory</button> 
                            </div>
                            <div id="modelbutton" hidden="true">
                                <button type="button" class="btn btn-default btn-lg" id="updateProductSubCategory"  data-toggle="modal" data-target="#myModal4"> Division</button><br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- All model are here -->
        <!----Product Category-->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header1">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title categoryTitle"><img src="img/logo.png" alt="modal_logo">Product Category</h4>
                    </div>
                    <div class="modal-body">
                        <div class="subdivisoncreate">
                            <!--  <div class="headertitl">
                                  <h2 class="subtitle-h2">Create Sub Division</h2>
                                           </div>-->
                            <div class="col-md-12">
                                <form:form action="saveProductCategories" class="createdivison" modelAttribute="category">

                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label">Product Category</label>
                                        <div class="col-sm-8" id="Pcate">
                                            <form:hidden path="productCategoryId" id="idproductcategory"/>
                                            <form:errors path="productCategoryName" cssClass="error"/>
                                            <form:input path="productCategoryName" class="form-control" placeholder="Enter Product Category" id="target1"/>
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


        <div class="modal fade" id="myModal2" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header1">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title categoryTitle"><img src="img/logo.png" alt="modal_logo">Product SubCategory</h4>
                    </div>
                    <div class="modal-body">
                        <div class="subdivisoncreate">
                            <!--  <div class="headertitl">
                                  <h2 class="subtitle-h2">Create Sub Division</h2>
                                           </div>-->
                            <div class="col-md-12">
                                <div class="inputfield_division" >
                                    <form:form action="saveProductSubCategory" class="createdivison" modelAttribute="productSubCategory">
                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label">Product Category</label>
                                            <div class="col-sm-8" id="AddprosubcaT">
                                                <form:hidden path="productSubCategoryId" id="productSubCategoryId"/>
                                                <form:errors path="productCategoryId" cssClass="error"/>
                                                <form:select path="productCategoryId" id="prcategory" class="select form-control">
                                                    <form:option value="">Select</form:option>
                                                    <c:forEach var="productList" items="${productList}" >  
                                                        <form:option value="${productList.productCategoryId}">${productList.productCategoryName}</form:option>  
                                                    </c:forEach>
                                                </form:select>

                                                <svg viewBox="0 0 16 16">
                                                <path d="M10.8000002,10.8000002 C9.85000038,11.6500006 9.18349609,12 8,12 C5.80000019,12 4,10.1999998 4,8 C4,5.80000019 5.80000019,4 8,4 C10.1999998,4 12,6 12,8 C12,9.35332031 12.75,9.5 13.5,9.5 C14.25,9.5 15,8.60000038 15,8 C15,4 12,1 8,1 C4,1 1,4 1,8 C1,12 4,15 8,15 C12,15 15,12 15,8"></path>
                                                <polyline points="5 8.375 7.59090909 11 14.5 4" transform='translate(0 -0.5)'></polyline>
                                                </svg>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="inputSubdivision" class="col-sm-4 col-form-label">Product SubCategory</label>
                                            <div class="col-sm-8" id="Pscat">
                                                <form:errors path="productSubCategoryName" cssClass="error"/>
                                                <form:input path="productSubCategoryName" class="form-control" placeholder="Enter productSubCategoryName" id="psc"/>
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
        <!--End Product Sub-Categories-->

        <!--Update Product Sub-Categories -->
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
                                <form:form action="saveProductSubCategory" class="createdivison" modelAttribute="productSubCategory">
                                    <form:hidden path="productSubCategoryId" id="productSubCategoryId2"/>
                                    <form:hidden path="productCategoryId" id="productCategoryId2"/>
                                    <div class="form-group row" >
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label">Product Category</label>
                                        <div class="col-sm-8">
                                            <form:input path="productCategoryName" class="form-control" id="productCategory_Name" readonly="true"/>

                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="inputSubdivision" class="col-sm-4 col-form-label">Product SubCategory</label>
                                        <div class="col-sm-8" id="Upscat">
                                            <form:errors path="productSubCategoryName" cssClass="error"/>
                                            <form:input path="productSubCategoryName" class="form-control" id="productSubCategory_Name"/>
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

        <!--End Update Product-Sub-Categories-->

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

        <script>
            function myFunction() {
                var input, filter, ul, li, a, i;
                input = document.getElementById("search1");
                filter = input.value.toUpperCase();
                ul = document.getElementById("productcategory");
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

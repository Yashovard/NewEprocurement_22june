<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <title>Lotus Procure</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <link rel="shortcut icon" href="<c:url value="/resources/images/favicon.png"/>" >
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/lotushomepagethemecss.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/datepicker.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/datepicker.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/jquery.dataTables.min.css"/>">
           
           
    <link href="<c:url value="/resources/css/bootstrap-combobox.css"/>" rel="stylesheet" type="text/css">
        <script data-require="angular.js@1.3.0" data-semver="1.3.0" src="https://code.angularjs.org/1.3.0/angular.js"></script>
    <!-- Optional theme -->
    
    <!-- Optional theme -->
    <script src="<c:url value="/resources/js/angular/script.js" />"></script>
    <script src="<c:url value="/resources/js/jquery-1.10.2.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.dataTables.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/datepicker.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/datepicker.js"/>"></script>
    <script src="<c:url value="/resources/js/datepicker.en.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap-combobox.js"/>"></script>
    <script>
        $(window).load(function() {
            $('#myModal').modal('show');
        });
        
        $(document).ready(function() {
            $('.combobox').combobox()
        });
    </script>
</head>
<body>
   
    <!-----Open popup load windows ---->
    <div class="popup-section">
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="pp">
                        <img src="<c:url value="/resources/images/demo.png"/>" alt="Popup-logo" style="width:19%;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-header">
                        <h4 class="modal-title text-center">Important Notification</h4>
                    </div>
                    <div class="modal-body bosy-content">
                        <ul class="notice">
                            <li><a href="#"><span class="icon-nt"><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span> IHM  Tender Advertisement (1) Dated, 24 June 2016</a><img src="images\new.gif"></li>
                            <li><a href="#"><span class="icon-nt"><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span>  IHM  Tender Advertisement (2) Dated, 24 June 2016</a><img src="images\new.gif"></li>
                            <li><a href="#"><span class="icon-nt"><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span>  KEYDATES UPDATE FOR ALL IHM TENDERS</a><img src="images\new.gif"></li>
                            <li><a href="#"><span class="icon-nt"><i class="fa fa-dot-circle-o" aria-hidden="true"></i></span>  IHM : Bid Submission Notification </a><img src="images\new.gif"></li>
                        </ul>
                        <div class="btn-a pull-left more-dtl"><a href="">More Details</a></div>
                        <div class="btn-a"><a href="" data-dismiss="modal">Close</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="advance-searchpopup faq-popup contact-us">        
    <%@include file="AdvancedSearchModel.jsp" %>
    
    </div>

    <div class="top-header">
        <div class="container">
            <div class="number-detail"></div>
            <div class="advance-searchpopup faq-popup contact-us">
            <%@include file="ContactUsModel.jsp" %>    
            </div>
            <div class="advance-searchpopup faq-popup contact-us ">
            <%@include file="HelpDeskModel.jsp" %>    
            </div>
             <div class="contact-us-bt">
                <a href="" class="hvr help-desk-a" data-toggle="modal" data-target="#myModal555">Contact Us</a>
            </div>
            <div class="help-desk-b">
                <a href="" class="hvr help-desk-a" data-toggle="modal" data-target="#myModal666">Help Desk</a>
            </div>
        </div>
    </div>

    <div class="logo-header">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-5">
                    <div class="img-logo logotenderalert">
                        <a href="demo.home.html"><img src="<c:url value="/resources/images/demo.png"/>" title="LotusProcure" alt="LOTUSPROCURE_LOGO_IMAGE"></a>
                    </div>
                </div>
                <div class="col-md-8 col-sm-7">
                    <div class="btn_area">
                        <div class="btn_se">
                            <ul>
                                <li><a href="#" class="hvr-bounce-to-right1" data-toggle="modal" data-target="#myModal1"><span><i class="fa fa-sign-in"></i></span>Login</a></li>
                                <li><a href="#" class="hvr-bounce-to-right1 bg-cl1" data-toggle="modal" data-target="#indentModal1" onclick="return ClearData();"><span><i class="fa fa-pencil"></i></span>Contractor Registration</a></li>
                                <%@include file="ContractorRegistrationModel.jsp" %>
                                <li><a href="#" class="hvr-bounce-to-right1" data-toggle="modal" data-target="#myModal3"><span><i class="fa fa-sign-in"></i></span>Department Login</a></li>
                                <li> <a href="#" data-toggle="modal" data-target="#myModal22">FAQ's</a></li>                           
                            </ul>                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="login-popup ">
                <%@include file="DepartmentContractorLoginModel.jsp" %>                    
                <%@include file="DepartmentAdminModel.jsp" %>                
            </div>
        </div>
    </div>
      
    <section class="content1111 search-tender mrgn" id="section1">
        <div class="container">
            <h4 class="title-heading"><i class="fa fa-search" aria-hidden="true"></i>Search</h4>
            <div class="bubble-white"></div>
            <div class="space40" style="height:0px;"></div>

            <ul class="nav nav-tabs">
                <li class="active">
                    <a data-toggle="tab" href="#home33"><img src="<c:url value="/resources/images/tender1.png"/>" alt="Tender_img">Tender</a>
                </li>
                <li>
                    <a data-toggle="tab" href="#menu33"><img src="<c:url value="/resources/images/auction.png"/>" alt="auction_img">Auction</a>
                </li>
                <li>
                    <a data-toggle="tab" href="#menu44"><img src="<c:url value="/resources/images/rfx1.png"/>" alt="RFX_img">RFX</a>
                </li>
            </ul>

            <div class="tab-content">
                <div id="home33" class="tab-pane fade in active">
                    <div class="row">
                        <form class="tender-form">
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">Tender No. / NIT No.</label>
                                    <div class="tender-no" data-tip="Tender No. or NIT No.">
                                        <input type="text" name="tenderNo" value="" id="tenderNo" class="input form-control" data-toggle="tooltip" data-placement="bottom" title="Tender No. / NIT No." placeholder="Tender No. or NIT No.">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">Departments</label>
                                    <div class="tender-no select-depart">
                                        <select class="combobox input-large form-control" name="normal">
                                            <option value="" selected="selected">Select </option>
                                            <option value="AL">Indian Institute of Forest Management Bhopal</option>
                                            <option value="AK">Institute of Hotel Management Catering Technology and Applied Nutrition Bhopal</option>
                                            <option value="AZ">Central Institute of Plastics Engineering and Technology Bhopal</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">From Date</label>
                                    <div class='input-group date calendar-dt1'>
                                        <input type='text' class="form-control datepicker-here" data-language='en' data-position="right top" placeholder="From" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">To Date</label>
                                    <div class='input-group date calendar-dt1'>
                                        <input type='text' class="form-control datepicker-here" data-language='en' data-position="right top" placeholder="To" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">Tender Keywords</label>
                                    <div class="tender-no" data-tip=" Search Tender Keywords">
                                        <input type="text" name="tenderNo" value="" id="tenderNo" class="input form-control" data-toggle="tooltip" data-placement="bottom" placeholder="Enter Keywords">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <div class="bt-ms">
                                        <button type="button" class="btn btn-success hvr-bounce-to-right">Search</button>
                                    </div>
                                    <div class="button-advance"><a href="" class="hvr1" data-toggle="modal" data-target="#myModal44">Advance Search<i class="fa fa-search" aria-hidden="true"></i></a></div>
                                </div>
                        </form>
                        </div>
                    </div>
                    <div class="status-button">
                        <div class="radio">
                            <label>
                                <input type="radio" name="Live Tender" value="Live Tender" checked>Live Tender</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="Live Tender">Amendment</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="Live Tender">Inprocess</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="Live Tender">Archived</label>
                        </div>
                    </div>
                </div>
                <div id="menu33" class="tab-pane fade">
                    <div class="row">
                        <form class="tender-form">
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">Auction No.</label>
                                    <div class="tender-no" data-tip="Fill in the Auction No.">
                                        <input type="text" name="tenderNo" value="" id="tenderNo" class="input form-control" data-toggle="tooltip" data-placement="bottom" title="Tender No. / NIT No." placeholder="Auction No.">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">Departments</label>
                                    <div class="tender-no select-depart">
                                        <select class="combobox input-large form-control" name="normal">
                                            <option value="" selected="selected">Select </option>
                                            <option value="AL">Indian Institute of Forest Management Bhopal</option>
                                            <option value="AK">Institute of Hotel Management Catering Technology and Applied Nutrition Bhopal</option>
                                            <option value="AZ">Central Institute of Plastics Engineering and Technology Bhopal</option>

                                        </select>

                                    </div>

                                </div>
                            </div>

                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">From Date</label>
                                    <div class='input-group date calendar-dt1'>
                                        <input type='text' class="form-control datepicker-here" data-language='en' data-position="right top" placeholder="From" />

                                    </div>

                                </div>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">To Date</label>

                                    <div class='input-group date calendar-dt1'>
                                        <input type='text' class="form-control datepicker-here" data-language='en' data-position="right top" placeholder="To" />

                                    </div>

                                </div>

                            </div>

                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">Auction Keyword</label>
                                    <div class="tender-no" data-tip="Search in the Auction Keyword">
                                        <input type="text" name="tenderNo" value="" id="tenderNo" class="input form-control" placeholder="Auction Keyword">

                                    </div>
                                </div>

                            </div>

                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <div class="bt-ms">
                                        <button type="button" class="btn btn-success hvr-bounce-to-right">Search</button>
                                    </div>
                                </div>

                        </form>

                        </div>
                    </div>
                    <div class="status-button">
                        <div class="radio">
                            <label>
                                <input type="radio" name="Auction" value="Auction" checked>Live Auction</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="Auction">Amendment</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="Auction">Inprocess</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="Auction">Archived</label>
                        </div>
                    </div>
                </div>
                <div id="menu44" class="tab-pane fade">
                    <div class="row">
                        <form class="tender-form">
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">RFX No.</label>
                                    <div class="tender-no" data-tip="Fill in the RFX No.">
                                        <input type="text" name="tenderNo" value="" id="tenderNo" class="input form-control" data-toggle="tooltip" data-placement="bottom" title="Tender No. / NIT No." placeholder="RFX No.">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">Departments</label>
                                    <div class="tender-no select-depart">
                                        <select class="combobox input-large form-control" name="normal">
                                            <option value="" selected="selected">Select </option>
                                            <option value="AL">Indian Institute of Forest Management Bhopal</option>
                                            <option value="AK">Institute of Hotel Management Catering Technology and Applied Nutrition Bhopal</option>
                                            <option value="AZ">Central Institute of Plastics Engineering and Technology Bhopal</option>

                                        </select>

                                    </div>

                                </div>
                            </div>

                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">From Date</label>
                                    <div class='input-group date calendar-dt1'>
                                        <input type='text' class="form-control datepicker-here" data-language='en' data-position="right top" placeholder="From" />
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">To Date</label>

                                    <div class='input-group date calendar-dt1'>
                                        <input type='text' class="form-control datepicker-here" data-language='en' data-position="right top" placeholder="To" />
                                    </div>

                                </div>

                            </div>

                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <label for="">RFX Keywords</label>
                                    <div class="tender-no" data-tip="Search in the RFX Keywords">
                                        <input type="text" name="tenderNo" value="" id="tenderNo" class="input form-control" placeholder="Enter Keywords">

                                    </div>
                                </div>

                            </div>

                            <div class="col-md-2 col-sm-6">
                                <div class="form-group">
                                    <div class="bt-ms">
                                        <button type="button" class="btn btn-success hvr-bounce-to-right">Search</button>
                                    </div>
                                </div>

                        </form>

                        </div>
                    </div>
                    <div class="status-button">
                        <div class="radio">
                            <label>
                                <input type="radio" name="RFX" value="RFX" checked>Live RFX</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="RFX">Amendment</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="RFX">Inprocess</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="RFX">Archived</label>
                        </div>
                    </div>
    </section>
             
<!----------------------------------------------------------------------------------------------------------------->
    <section class="tabb-section tender-list " id="section000">

        <div class="container">
            <div class="slider-notification111">
                <div class="carousel slide media-carousel " id="media">
                    <div class="carousel-inner">
                        <div class="item  active">
                            <div class="tbbbb">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#home"><span class="date">December 18, 2017</span>
	                               <span class="day">Monday</span>
	                                
                                       <span class="count empty">Tender No.</span></a></li>
                                    <li>
                                        <a data-toggle="tab" href="#menu1">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu2">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu3">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu4">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li><a data-toggle="tab" href="#menu5"><span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="item">
                            <div class="tbbbb">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#home"><span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu1">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu2">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu3">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu4">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li><a data-toggle="tab" href="#menu5"><span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="item">
                            <div class="tbbbb">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a data-toggle="tab" href="#home">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu1">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu2">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu3">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu4">
                                            <span class="date">December 18, 2017</span>
                                            <span class="day">Monday</span>
                                            <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#menu5">
                                            <span class="date">December 18, 2017</span>
	                                    <span class="day">Monday</span>
	                                    <span class="count empty">Tender No.</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <a data-slide="prev" href="#media" class="left carousel-control"><</a>
                    <a data-slide="next" href="#media" class="right carousel-control">></a>
                </div>

                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">
                        <div class="table-responsive">
                            <table id="myTable" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Departments</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>

                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="menu1" class="tab-pane fade">
                        <div class="table-responsive">
                            <table id="myTable1" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Departments</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="menu2" class="tab-pane fade">
                        <div class="table-responsive">
                            <table id="myTable2" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Departments</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="menu3" class="tab-pane fade">
                        <div class="table-responsive">
                            <table id="myTable3" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Departments</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="menu4" class="tab-pane fade">
                        <div class="table-responsive">
                            <table id="myTable4" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Departments</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>

                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="menu5" class="tab-pane fade">
                        <div class="table-responsive">
                            <table id="myTable5" class="td-table table">
                                <thead>
                                    <tr>
                                        <th>Tender No.</th>
                                        <th>NIT No.</th>
                                        <th>Departments</th>
                                        <th>PAC</th>
                                        <th>Release Date</th>
                                        <th>Purchase Date</th>
                                        <th>Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>3434334444</td>
                                        <td>Central Institute of Plastics Engineering and Technology</td>
                                        <td><i class="fa fa-inr ruppee" aria-hidden="true"></i>350000/-</td>
                                        <td>26/10/2017</td>
                                        <td>26/11/2017</td>
                                        <td><a href="#"><span><i class="fa fa-info-circle" aria-hidden="true"></i></span>details</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
<!----------------------------------------------notification------------------------------------------------------->
    <div class="notification mrgn" id="section2">
        <div class="container">
            <h4 class="title-heading">
<i class="fa fa-bell" aria-hidden="true"></i>Notification
                            </h4>
            <div class="bubble-white"></div>
            <div class="space40"></div>
            <div class="slider-notification">
                <div class="carousel slide media-carousel my-carousel1" id="media1">
                    <div class="carousel-inner">
                        <div class="item  active">
                            <div class="row">
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">
                                        <a href="#"> IHM  Tender Advertisement (1)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">
                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">
                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                   <div class="notify">
                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">
                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">
                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">
                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">

                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-3 col-sm-3">

                                    <div class="notify">

                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">
                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">
                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <div class="notify">
                                        <a href="#">  IHM  Tender Advertisement (2)</a>
                                        <span class="date"> 24 June 2016</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a data-slide="prev" href="#media1" class="left carousel-control">?</a>
                    <a data-slide="next" href="#media1" class="right carousel-control">?</a>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    
<!---------------------------------------------------Download-section---------------------------------------------->
    <div class="about-section mrgn" id="section211">
        <div class="container">
            <h4 class="title-heading">
                <i class="fa fa-info-circle" aria-hidden="true"></i>About  LotusProcure
            </h4>
            <div class="bubble-white"></div>
            <div class="space40"></div>
            <div class="about-details">
                <p>Lotus Procure - eTendering System
                    <br> Lotus Procure is a system that can automate all the tendering activities. </p>
                <a class="hvr" href="http://www.lotusprocure.in/" target="_blank">Click Here</a>
            </div>
        </div>
    </div>
   
    
    
    
<!-------------------------------------------------Download-section------------------------------------------------>
    <div class="down-load mrgn" id="section3">
        <div class="container">
            <h4 class="title-heading">
                <i class="fa fa-download" aria-hidden="true"></i>Download
            </h4>
            <div class="bubble-white"></div>
            <div class="space40"></div>
            <ul id="animated-example" class="dwn animated bounceInRight">
                <li>
                    <a href="http://cca.gov.in/cca/?q=root_certificate.html">
                        <div class="img-cr">
                            <img src="images/certificate.png" alt="img_certificate">
                            <span class="title-link">Root Chian Certificate</span>
                        </div>
                        <div class="caption-img">
                            <span class="title-link">Root Chian Certificate</span>
                            <button type="button" class="btn btn-success">Get It</button>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="https://www.teamviewer.com/hi/download/windows/">
                        <div class="img-cr">
                            <img src="images/teamviewer.png" alt="img_teamviewer">
                            <span class="title-link">Team Viewer</span>
                        </div>
                        <div class="caption-img">
                            <span class="title-link">Team Viewer</span>
                            <button type="button" class="btn btn-success">Get It</button>
                        </div>
                    </a>
                </li>

                <li>
                    <a href="http://www.ammyy.com/en/downloads.html">
                        <div class="img-cr">
                            <img src="images/ammyy-admin.png" alt="img_certificate">
                            <span class="title-link">Ammy Admin</span>
                        </div>
                        <div class="caption-img">
                            <span class="title-link">Ammy Admin</span>
                            <button type="button" class="btn btn-success">Get It</button>
                        </div>
                    </a>
                </li>

                <li>
                    <a href="https://www.mozilla.org/en-US/firefox/new/">
                        <div class="img-cr">
                            <img src="images/firefox.png" alt="img_certificate">
                            <span class="title-link">Firefox</span>
                        </div>
                        <div class="caption-img">
                            <span class="title-link">Firefox</span>
                            <button type="button" class="btn btn-success">Get It</button>
                        </div>
                    </a>
                </li>

                <li>
                    <a href="https://java.com/en/download/">
                        <div class="img-cr">
                            <img src="images/java-logo.png" alt="img_certificate">
                            <span class="title-link">Java Download</span>
                        </div>
                        <div class="caption-img">
                            <span class="title-link">Java Download</span>
                            <button type="button" class="btn btn-success">Get It</button>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>

<!-----------------------------------------------Products---------------------------------------------------------> 
    <div class="product-section mrgn " id="section4">
        <div class="container">
            <h4 class="title-heading">

<i class="fa fa-inbox" aria-hidden="true"></i>Products
                            </h4>
            <div class="bubble-white"></div>
            <div class="space40"></div>
            <div class="product-width">
                <div class="row">
                    <div class="col-md-4 col-sm-4">
                        <div id="animated-example" class="our-product animated bounceInLeft">
                            <h2>
<span><i class="fa fa-bolt" aria-hidden="true"></i></span>
<a href=""><img src="<c:url value="/resources/images/tenderalert.png"/>" alt="products_images"></a>
</h2>
                            <div class="backend-content">
                                <h4>Tender Alert</h4>
                                <a href="" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div id="animated-example" class="our-product animated bounceInLeft">

                            <h2>
<span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
<a href=""><img src="<c:url value="/resources/images/signature.png"/>" alt="products_images"></a>
</h2>
                            <div class="backend-content">
                                <h4>Digital Signature</h4>
                                <a href="" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div id="animated-example" class="our-product animated bounceInLeft">
                            <h2>
<span><i class="fa fa-file-pdf-o" aria-hidden="true"></i></span>
<a href=""><img src="<c:url value="/resources/images/pdf_logo1.png"/>" alt="products_images"></a>
</h2>
                            <div class="backend-content">
                                <h4>OSMO Signer</h4>
                                <a href="" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!----------------------------------------------------Get In Touch/Recent Post------------------------------------->
    <section class="social-blog">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h4 class="title-heading">

<i class="fa fa-location-arrow" aria-hidden="true"></i>Get In Touch
                            </h4>
                    <div class="bubble-white"></div>
                    <div class="space40"></div>
                    <div class="social-media">
                        <p>FB-12, 13, 14, Mansarovar Complex, Near Habibganj Railway Station,Bhopal Madhya Pradesh India - 462016 </p>
                        <p>Mail:<a href="#"> info@osmoindia.com</a></p>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3666.50663434879!2d77.43380931455022!3d23.22464398485105!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c42b7e0c88693%3A0x28b82d447849aabd!2sOsmo+IT+Solution+Pvt.+Ltd.!5e0!3m2!1sen!2sin!4v1515567550335" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                </div>
                <div class="col-md-6">
                    <h4 class="title-heading">

<i class="fa fa-rss" aria-hidden="true"></i>Recent Post
                            </h4>
                    <div class="bubble-white"></div>
                    <div class="space40"></div>
                    <div class="social-media msy">
                        <ul>
                            <li><a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                            <li><a href=""><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <li><a href=""><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            <li><a href=""><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                            <li><a href=""><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                            <li><a href=""><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                    <div class="blog-post">
                        <a href="#">
                            <div class="recent-img">
                                <!-- IMAGE-->
                                <img class="img-circle" src="<c:url value="/resources/images/content/blog/thumb/1.jpg"/>" width="60" height="60" alt="">
                            </div>
                            <div class="recent-text">
                                <!-- TEXT-->
                                <h6 class="recent-title">Indian Government's Guidelines for Usage of Digital Signatures in E-Governance</h6>
                                <!-- META-->
                                <p class="meta-date typo-lgrey">27th August, 2015</p>
                            </div>
                        </a>
                        <a href="#">
                            <div class="recent-img">
                                <!-- IMAGE-->
                                <img class="img-circle" src="<c:url value="/resources/images/content/blog/thumb/1.jpg"/>" width="60" height="60" alt="">
                            </div>
                            <div class="recent-text">
                                <!-- TEXT-->
                                <h6 class="recent-title">E-Tendering - Best Way to Prevent Corruption in Tendreing</h6>
                                <!-- META-->
                                <p class="meta-date typo-lgrey">27th August, 2015</p>
                            </div>
                        </a>
                        <a href="#">
                            <div class="recent-img">
                                <!-- IMAGE-->
                                <img class="img-circle" src="<c:url value="/resources/images/content/blog/thumb/1.jpg"/>" width="60" height="60" alt="">
                            </div>
                            <div class="recent-text">
                                <!-- TEXT-->
                                <h6 class="recent-title">How a Reverse Auction Works</h6>
                                <!-- META-->
                                <p class="meta-date typo-lgrey">27th August, 2015</p>
                            </div>
                        </a>
                        <div class=" text-right">
                            <a class=" view-post" href="" target="_blank">View More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-----social-s------->   
    <%@include file="Footer.jsp" %>
    <script>
        $(document).ready(function() {
            $('#media1').media - carousel({
                pause: true,
                interval: false,
            });
        });
    </script>

    <script>
        $('.td-table').dataTable();
    </script>

    <script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function() {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
                document.getElementById("myBtn").style.display = "block";
            } else {
                document.getElementById("myBtn").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction2() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
 <!----FAQ's-Popup------->
    <%@include file="FAQs.jsp" %>

</body>

</html>
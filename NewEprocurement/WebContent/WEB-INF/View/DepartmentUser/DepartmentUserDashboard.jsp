<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <!-- TITLE-->
    <title>Super Admin</title>
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
    <script>
        function runLoader() {
            $('body').append('<div style="" id="loadingDiv"><div class="loader">Loading...</div></div>');
            //$(window).on('load', function(){
            setTimeout(removeLoader, 2000); //wait for page load PLUS two seconds.
            //});
            function removeLoader() {
                $("#loadingDiv").fadeOut(500, function() {
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
        .dashboard-header .nav>li>a {
		position: relative;
		display: block;
		padding: 10px 20px;
		color: #ffffff;
		border-radius: 0px;
		font-size: 14px;
		transition: 0.3s ease;
		text-decoration: none;
	}
	.logout-a {
		background: #F44336!important;
		color: #fff!important;
		padding: 4px 4px!important;
		border-radius: 2px!important;
		margin-top: 9px!important;
	}
	.notification-side li {
		display: block;
	}
    </style>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".dropdown").hover(
                function() {
                    $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                    $(this).toggleClass('open');
                },
                function() {
                    $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                    $(this).toggleClass('open');
                }
            );
        });
    </script>
</head>

<body>
   
 
    
    <!--CREATE_SUB_DIVISION-->
     <div class="maindahboard">
	 <div class="container">
	 <div class="row">
	 <div class="col-md-6 col-sm-6 col-xm-12">
	  <div class="widget widget-nopad">
    <div class="widget-header"><i class="fa fa-list-alt" aria-hidden="true"></i>
        <h3> Today's Stats</h3>
    </div>
    <!-- /widget-header -->
    <div class="widget-content">
        <div class="widget big-stats-container">
            <div class="widget-content">
                <h6 class="bigstats">A fully responsive premium quality admin template built on Twitter Bootstrap by <a href="#" target="_blank">lotusprocure.in</a>.  These are some dummy lines to fill the area.</h6>
                <div id="big_stats" class="cf">
                    <div class="stat"> <i class="fa fa-anchor" aria-hidden="true"></i> <span class="value">851</span> </div>
                    <!-- .stat -->

                    <div class="stat"> <i class="fa fa-thumbs-o-up" aria-hidden="true"></i><span class="value">423</span> </div>
                    <!-- .stat -->

                    <div class="stat"><i class="fa fa-twitch" aria-hidden="true"></i> <span class="value">922</span> </div>
                    <!-- .stat -->

                    <div class="stat"><i class="fa fa-globe" aria-hidden="true"></i><span class="value">25%</span> </div>
                    <!-- .stat -->
                </div>
            </div>
            <!-- /widget-content -->
        </div>
    </div>
</div>
	 </div>
	 <div class="col-md-6 col-sm-6 col-xm-12">
    <div class="widget">
        <div class="widget-header"> <i class="fa fa-bookmark-o" aria-hidden="true"></i>
            <h3>Important Shortcuts</h3>
        </div>
        <!-- /widget-header -->
        <div class="widget-content">
            <div class="shortcuts"><a href="#" class="shortcut"><i class="fa fa-list-alt shortcut-icon" aria-hidden="true"></i><span class="shortcut-label">Apps</span></a>
			<a href="#" class="shortcut"><i class="fa fa-bookmark shortcut-icon" aria-hidden="true"></i><span class="shortcut-label">Bookmarks</span> </a>
			<a href="#" class="shortcut"><i class="fa fa-file-text shortcut-icon" aria-hidden="true"></i><span class="shortcut-label">Reports</span> </a>
			<a href="#" class="shortcut"><i class="fa fa-comment-o shortcut-icon" aria-hidden="true"></i><span class="shortcut-label">Comments</span> </a>
			<a href="#" class="shortcut"><i class="fa fa-user shortcut-icon" aria-hidden="true"></i><span class="shortcut-label">Users</span> </a>
			<a href="#" class="shortcut"><i class="fa fa-sticky-note shortcut-icon" aria-hidden="true"></i><span class="shortcut-label">Notes</span> </a>
			<a href="#" class="shortcut"><i class="fa fa-file-image-o shortcut-icon" aria-hidden="true"></i> <span class="shortcut-label">Photos</span> </a>
			<a href="#" class="shortcut"><i class="fa fa-tag shortcut-icon" aria-hidden="true"></i><span class="shortcut-label">Tags</span> </a>
            </div>
            <!-- /shortcuts -->
        </div>
        <!-- /widget-content -->
    </div>            
      <!--plot for the Development of Calender -->
        </div>
    </div>	 
</div>	 
	
</div>

    <!--FOOTER_SECTION_START-->
    <div class="bell-alert">
        <div class="container">
            <div class="text-no"><span class="count">1</span></div>
            <a href="#" data-toggle="modal" data-target="#myModalNotification">
                <div class="bell-icon"><i class="fa fa-bell-o" aria-hidden="true"></i>
				</div>
            </a>
            <div class="ass-product">
                <div class="modal fade in" id="myModalNotification" data-backdrop="static" role="dialog">
                    <div class="modal-dialog ">
                        <!-- Modal content-->
                        <div class="modal-content fancybox-content">
                            <div class="modal-header1">
                                <button type="button" class="close" data-dismiss="modal">X</button>
                                <h4 class="modal-title categoryTitle"><img src="img/logo.png" alt="modal_logo">Notification</h4>
                            </div>
                            <!--Start Modal body-->
                            <div class="modal-body">
                                <div class="inner-submenu">
                                    <ul class="notification-side">
                                        <li>
                                            <a href="#"> <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
                                                <div class="notifiaction-blog">
                                                    <span class="notification-title"> IHM  Tender Advertisement</span>
                                                    <small><i class="fa fa-calendar-plus-o" aria-hidden="true"></i> Aug 22,2016 at 5:50 pm</small>
                                                </div>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#"> <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
                                                <div class="notifiaction-blog">
                                                    <span class="notification-title"> IHM  Tender Advertisement</span>
                                                    <small><i class="fa fa-calendar-plus-o" aria-hidden="true"></i> Aug 22,2016 at 5:50 pm</small>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"> <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
                                                <div class="notifiaction-blog">
                                                    <span class="notification-title">IHM  Tender AdvertisementIHM  Tender AdvertisementIHM  Tender Advertisement IHM  Tender Advertisement</span>
                                                    <small><i class="fa fa-calendar-plus-o" aria-hidden="true"></i> Aug 22,2016 at 5:50 pm</small>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"> <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
                                                <div class="notifiaction-blog">
                                                    <span class="notification-title"> IHM  Tender Advertisement</span>
                                                    <small><i class="fa fa-calendar-plus-o" aria-hidden="true"></i> Aug 22,2016 at 5:50 pm</small>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"> <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
                                                <div class="notifiaction-blog">
                                                    <span class="notification-title"> IHM  Tender Advertisement</span>
                                                    <small><i class="fa fa-calendar-plus-o" aria-hidden="true"></i> Aug 22,2016 at 5:50 pm</small>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"> <i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
                                                <div class="notifiaction-blog">
                                                    <span class="notification-title"> IHM  Tender Advertisement</span>
                                                    <small><i class="fa fa-calendar-plus-o" aria-hidden="true"></i> Aug 22,2016 at 5:50 pm</small>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    <a href "#" class="btn btn-info pull-right">View All</a>
                                </div>
                            </div>
                            <!--End Modal body -->
                        </div>
                        <!--End Modal content-->
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div style="height:500px;"></div>
    <%@include file="../DepartmentAdmin/Tiles/Footer.jsp" %>
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

    <script type="text/javascript">
        $(function() {
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

        $(".daterange").on('apply.daterangepicker', function(ev, picker) {
            $(this).val(picker.startDate.format('DD-MM-YYYY h:mm A') + ' / ' + picker.endDate.format('DD-MM-YYYY h:mm A'));
        });

        $(".daterange").on('cancel.daterangepicker', function(ev, picker) {
            $(this).val('');

        });
        $('.multipleSelect').fastselect();
    </script>

</body>

</html>

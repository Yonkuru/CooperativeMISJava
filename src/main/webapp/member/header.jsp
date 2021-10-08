<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.coops.dao.AnnouncementDao"%>
<%@page import="com.coops.classes.Announcement"%>
<%@page import="com.coops.classes.Includes" %>
<%
//Includes includes = new Includes();
String title = inclus.getTitle();
String pageTitle = inclus.getPageTitle();
String pageCrumb = inclus.getPageCrumb();


//For Manager
int id = 0;
String firstname = null;
String lastname = null;
int cop_id = 0;
String cop_name = null;
int acc_id = 0;
if(request.getSession() != null){
	if(session.getAttribute("id") != null){
		id = (Integer)session.getAttribute("id");
		firstname = (String)session.getAttribute("firstname");
		lastname = (String)session.getAttribute("lastname");
		cop_name = (String)session.getAttribute("cop_name");
		cop_id = (Integer)session.getAttribute("cop_id");
		acc_id = (Integer)session.getAttribute("acc_id");
		
	} else if(session.getAttribute("cop_id") != null){
		cop_id = (Integer)session.getAttribute("cop_id");
		cop_name = (String)session.getAttribute("cop_name");
	} else{
		session.invalidate();
		response.sendRedirect("../login.jsp");
	}
}else{
	response.sendRedirect("../login.jsp");
}

Announcement an = AnnouncementDao.getCounts(id);
int all = an.getAllCount();
int read = an.getReadCount();
int unread = an.getUnreadCount();

List<Announcement> notList = AnnouncementDao.getAllAnnouncements(id);
request.setAttribute("notList", notList);
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <title><%=title %></title>
        <meta content="Admin Dashboard" name="description" />
        <meta content="ThemeDesign" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <link rel="shortcut icon" href="../assets/images/favicon.ico">

        <!--Morris Chart CSS -->
        <link rel="stylesheet" href="../assets/plugins/morris/morris.css">

        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css">

    </head>


    <body class="fixed-left">

        <!-- Loader -->
        <div id="preloader"><div id="status"><div class="spinner"></div></div></div>

        <!-- Begin page -->
        <div id="wrapper">

            <%@include file="sidebar.jsp" %>

            <!-- Start right Content here -->

            <div class="content-page">
                <!-- Start content -->
                <div class="content">

                    <!-- Top Bar Start -->
                    <div class="topbar">

                        <div class="topbar-left	d-none d-lg-block">
                            <div class="text-center">
                                
                                <a href="index.html" class="logo"><img src="../assets/images/logo.png" height="60" alt="logo"></a>
                            </div>
                        </div>

                        <nav class="navbar-custom">

                            <ul class="list-inline float-right mb-0">
                            	<li class="list-inline-item dropdown notification-list">
                                    <a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                        <i class="mdi mdi-bell-outline noti-icon"></i>
                                        <%
                                        if(unread > 0){
                                        	%>
                                        	<span class="badge badge-success badge-pill noti-icon-badge"><%=unread %></span>
                                        	<%
                                        }
                                        %>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-menu-lg">
                                        <!-- item-->
                                        <div class="dropdown-item noti-title">
                                            <span class="badge badge-danger float-right"><%=all %></span>
                                            <h5>Notification</h5>
                                        </div>

                                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 405.3px;"><div class="slimscroll" style="max-height: 230px; overflow: hidden; width: auto; height: 405.3px;">
											
											<c:forEach items="${notList}" var="notif">
												<%
												int notId = ((Announcement)(pageContext.findAttribute("notif"))).getId();
												int notStatus = ((Announcement)(pageContext.findAttribute("notif"))).getStatus();
												if(notStatus == 0){
													%>
													<a href="./?anc=1&notf=<%=notId %>" class="dropdown-item notify-item">
		                                                <div class="notify-icon bg-primary"><i class="ion-ios7-star"></i></div>
		                                                <p class="notify-details">${notif.getTitle()}<span class="text-muted">${notif.getMessage()}</span></p>
		                                            </a>
													<%
												}else{
													%>
													<!-- item-->
		                                            <a href="./?anc=1&notf=<%=notId %>" class="dropdown-item notify-item">
		                                                <div class="notify-icon bg-success"><i class="ion-ios7-checkmark"></i></div>
		                                                <p class="notify-details">${notif.getTitle()}<span class="text-muted">${notif.getMessage()}</span></p>
		                                            </a>
													<%
												}
												%>
											</c:forEach>
                                        </div><div class="slimScrollBar" style="background: rgb(158, 165, 171) none repeat scroll 0% 0%; width: 5px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px; height: 146.944px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;"></div></div>

                                        <!-- All-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-all">
                                            View All
                                        </a>

                                    </div>
                                </li>
                                <li class="list-inline-item dropdown notification-list">
                                    <a class="nav-link dropdown-toggle arrow-none waves-effect nav-user" data-toggle="dropdown" href="#" role="button"
                                       aria-haspopup="false" aria-expanded="false">
                                        <img src="../assets/images/users/user-1.jpg" alt="user" class="rounded-circle">
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated profile-dropdown ">
                                        <a class="dropdown-item" href="#"><i class="mdi mdi-account-circle m-r-5 text-muted"></i> <%=firstname+" "+ lastname %></a>
                                        <a class="dropdown-item" href="#"><span class="badge badge-success mt-1 float-right">5</span><i class="mdi mdi-settings m-r-5 text-muted"></i> Settings</a>
                                        <a class="dropdown-item" href="#"><i class="mdi mdi-lock-open-outline m-r-5 text-muted"></i> Lock screen</a>
                                        <a class="dropdown-item" href="logout.jsp"><i class="mdi mdi-logout m-r-5 text-muted"></i> Logout</a>
                                    </div>
                                </li>

                            </ul>

                            <ul class="list-inline menu-left mb-0">
                                <li class="list-inline-item">
                                    <button type="button" class="button-menu-mobile open-left waves-effect">
                                        <i class="ion-navicon"></i>
                                    </button>
                                </li>
                            </ul>

                            <div class="clearfix"></div>

                        </nav>

                    </div>
                    <!-- Top Bar End -->

                    <div class="page-content-wrapper ">

                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="float-right page-breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#">IPCCCI</a></li>
                                            <li class="breadcrumb-item active"><%=pageCrumb %></li>
                                        </ol>
                                    </div>
                                    <h5 class="page-title"><%=pageTitle %></h5>
                                </div>
                            </div>
                            <!-- end row -->
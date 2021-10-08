<%@page import="sun.rmi.log.LogOutputStream"%>
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

//For COOPERATIVE User
int cop_id = 0;
String cop_name = null;
if(request.getSession() != null){
	if(session.getAttribute("id") != null){
		id = (Integer)session.getAttribute("id");
		firstname = (String)session.getAttribute("firstname");
		lastname = (String)session.getAttribute("lastname");
		cop_name = (String)session.getAttribute("cop_name");
		cop_id = (Integer)session.getAttribute("cop_id");
		
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
                                    <a class="nav-link dropdown-toggle arrow-none waves-effect nav-user" data-toggle="dropdown" href="#" role="button"
                                       aria-haspopup="false" aria-expanded="false">
                                       
                                        <img src="../assets/images/users/user-1.jpg" alt="user" class="rounded-circle">
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated profile-dropdown ">
                                        <a class="dropdown-item" href="#">
                                        	<i class="mdi mdi-account-circle m-r-5 text-muted"></i> 
                                        	<%
                                        	if(id > 0){
                                        		out.print(firstname+" "+lastname);
                                        	} else if(cop_id > 0){
                                        		out.print("Cooperative Admin");
                                        	}
                                        	%>
                                        </a>
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
                                            <li class="breadcrumb-item"><a href="./"><%=cop_name %></a></li>
                                            <li class="breadcrumb-item active"><%=pageCrumb %></li>
                                        </ol>
                                    </div>
                                    <h5 class="page-title"><%=pageTitle %></h5>
                                </div>
                            </div>
                            <!-- end row -->
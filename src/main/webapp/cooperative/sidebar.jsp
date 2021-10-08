			<!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">
                <button type="button" class="button-menu-mobile button-menu-mobile-topbar open-left waves-effect">
                    <i class="ion-close"></i>
                </button>

                <div class="left-side-logo d-block d-lg-none">
                    <div class="text-center">
                        
                        <a href="index.html" class="logo"><img src="../assets/images/logo-dark.png" height="20" alt="logo"></a>
                    </div>
                </div>

                <div class="sidebar-inner slimscrollleft">
                    
                    <div id="sidebar-menu">
                        <ul>
                            <li class="menu-title">Main</li>

                            <li>
                                <a href="./" class="waves-effect">
                                    <i class="dripicons-meter"></i>
                                    <span> Dashboard </span>
                                </a>
                            </li>
                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-account-multiple"></i> <span> Members </span> <span class="menu-arrow float-right"><i class="mdi mdi-chevron-right"></i></span></a>
                                <ul class="list-unstyled">
           							<%
           							if(id > 0){
           								%>
           								<li><a href="memberNew.jsp"><i class="mdi mdi-account-plus"></i> New Member</a></li>
	                                    <li><a href="stockNew.jsp"><i class="mdi mdi-bank"></i> New Stock</a></li>
	                                    <li><a href="stockLogs.jsp"><i class="mdi mdi-basket"></i> Stock Log</a></li>
           								<%
           							}else{
           								%>
           								<li><a href="memberNew.jsp"><i class="mdi mdi-account-plus"></i> New Member</a></li>
           								<li><a href="memberPay.jsp"><i class="mdi mdi-currency-usd"></i> Pay Member</a></li>
	                                    <li><a href="stockLogs.jsp"><i class="mdi mdi-basket"></i> Stock Log</a></li>
           								<%
           							}
           							%>
                                    
                                </ul>
                            </li>
                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-bell-ring"></i> <span> Announcements </span> <span class="menu-arrow float-right"><i class="mdi mdi-chevron-right"></i></span></a>
                                <ul class="list-unstyled">
                                	<!-- <li><a href="viewAno.jsp"><i class="mdi mdi-bell"></i> All Announcements</a></li> -->
	                              	<li><a href="newAno.jsp"><i class="mdi mdi-bell-plus"></i> New Announcement</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="./logout.jsp" class="waves-effect">
                                    <i class="dripicons-exit"></i>
                                    <span> Logout </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div> <!-- end sidebarinner -->
            </div>
            <!-- Left Sidebar End -->
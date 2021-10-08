<%@page import="com.coops.dao.MemberDao"%>
<%@page import="com.coops.dao.CoopDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | Dashboard");
inclus.setPageTitle("DashBoard");
inclus.setPageCrumb("Home");

int coopCount = CoopDao.countCooperatives();
int mbrCount = MemberDao.countMembers();
%>

<%@include file="header.jsp" %>
                            <div class="row">
                                <div class="col-xl-3 col-md-6">
                                    <div class="card mini-stat m-b-30">
                                        <div class="p-3 bg-primary text-white">
                                            <div class="mini-stat-icon">
                                                <i class="mdi mdi-cube-outline float-right mb-0"></i>
                                            </div>
                                            <h6 class="text-uppercase mb-0">IPCCCI System</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="border-bottom pb-4">
                                            	<a href="./coopView.jsp">
                                            		<span class="badge badge-success"> <%=coopCount %> </span> <span class="ml-2 text-muted">Cooperatives</span>
                                            	</a>
                                            </div>
                                            <div class="mt-4 text-muted">
                                                <div class="float-right">
                                                	<a href="./memberView.jsp">
                                                		<p class="m-0">Total Members : <%=mbrCount %></p>
                                                	</a>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end row -->
<%@include file="footer.jsp" %>
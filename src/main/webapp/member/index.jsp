<%@page import="com.coops.dao.MemberAccountDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.coops.dao.StockLogDao"%>
<%@page import="com.coops.classes.StockLog"%>
<%@page import="java.util.List"%>
<%@page import="com.coops.dao.MemberDao"%>
<%@page import="com.coops.classes.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | Member");
inclus.setPageTitle("DashBoard");
inclus.setPageCrumb("Home");
%>

<%@include file="header.jsp" %>

<%
int x = 0;
Member count = MemberDao.countMembers(cop_id);
List<StockLog> stList = StockLogDao.getLogsByMemberAcc(acc_id);
request.setAttribute("list", stList);
int logsCount = StockLogDao.countMyLogs(acc_id);
double balance = MemberAccountDao.getMemberBalance(id);
%>
                            <div class="row">
                                <div class="col-xl-3 col-md-6">
                                    <div class="card mini-stat m-b-30">
                                        <div class="p-3 bg-primary text-white">
                                            <div class="mini-stat-icon">
                                                <i class="mdi mdi-cube-outline float-right mb-0"></i>
                                            </div>
                                            <h6 class="text-uppercase mb-0"><%=cop_name %></h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="border-bottom pb-4">
                                                    <span class="badge badge-success"> <%=count.getMemberPercent() %>% </span> <span class="ml-2 text-muted">Members (No Managers)</span>
                                            </div>
                                            <div class="mt-4 text-muted">
                                                <div class="float-right">
                                                    <p class="m-0">Total Members: <%=count.getMemberCount() %></p>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card mini-stat m-b-30">
                                        <div class="p-3 bg-primary text-white">
                                            <div class="mini-stat-icon">
                                                <i class="mdi mdi-cart-outline float-right mb-0"></i>
                                            </div>
                                            <h6 class="text-uppercase mb-0">Account</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="border-bottom pb-4">
                                                <span class="badge badge-success"> <%=logsCount %> </span> <span class="ml-2 text-muted">Store Logs</span>
                                            </div>
                                            <div class="mt-4 text-muted">
                                                <div class="float-right">
                                                	<c:set var = "balance" value="<%=balance %>" />
                                                    <h6>
                                                    <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${balance}" /> Rwf
                                                    </h6>
                                                </div>
                                                <h5 class="m-0">Balance:</h5>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end row -->
                            
                            <%
                            if(request.getParameter("notf") != null){
                            	int ano_id = Integer.parseInt(request.getParameter("notf"));
                            	Announcement ano = AnnouncementDao.getAnnouncementById(ano_id);
                            	int anStatus = ano.getStatus();
                            	if(anStatus == 0){
                            		int updateStatus = AnnouncementDao.setRead(ano_id);
                            	}
%>
                            	
	                            <div class="row">
	                                <div class="col-12">
	                                    <div class="card m-b-30">
	                                        <div class="card-body">
	                                            <div class="row justify-content-center">
	                                                <div class="col-xl-5">
	                                                    <div class="text-center mb-5">
	                                                        <h4>Announcement</h4>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="row justify-content-center">
	                                                <div class="col-xl-10">
	                                                    <div class="row">
	                                                    	<div class="col-lg-6">
		                                                      	<div class="faq-box mb-5">
		                                                          	<div class="faq-ques rounded">
		                                                              	<h6 class="pb-2"><i class="mdi mdi-hangouts text-primary mr-4 faq-icon"></i> <%=ano.getTitle() %></h6>
		                                                       		</div>
		                                                            <p class="text-muted pt-2"><%=ano.getMessage() %></p>
		                                                       	</div>
		                                                  	</div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <!-- end row -->
                            	<%
                            } else if((request.getParameter("anc") != null) && (request.getParameter("notf") == null)){
                            	
                            	
                            	
                            	%>
                            	
	                            <div class="row">
	                                <div class="col-12">
	                                    <div class="card m-b-30">
	                                        <div class="card-body">
	                                            <div class="row justify-content-center">
	                                                <div class="col-xl-5">
	                                                    <div class="text-center mb-5">
	                                                        <h4>Announcements</h4>
	                                                        <p class="text-muted">On this page you fine different announcements from the Cooperative Manager / President</p>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="row justify-content-center">
	                                                <div class="col-xl-10">
	                                                    <div class="row">
	                                                    	<c:forEach items="${notList}" var="notif">
	                                                    		<%
	                                                    		int notifId = ((Announcement)(pageContext.findAttribute("notif"))).getId();
	                                                    		int anStatus = ((Announcement)(pageContext.findAttribute("notif"))).getStatus();
	                                                        	if(anStatus == 0){
	                                                        		int updateStatus = AnnouncementDao.setRead(notifId);
	                                                        	}
	                                                    		%>
	                                                    		<div class="col-lg-6">
		                                                            <div class="faq-box mb-5">
		                                                                <div class="faq-ques rounded">
		                                                                    <h6 class="pb-2"><i class="mdi mdi-hangouts text-primary mr-4 faq-icon"></i> ${notif.getTitle()}</h6>
		                                                                </div>
		                                                                <p class="text-muted pt-2">${notif.getMessage()}</p>
		                                                            </div>
		                                                        </div>
															</c:forEach>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <!-- end row -->
                            	<%
                            } else{
                            	%>
                            	<div class="row">
	                                <div class="col-12">
	                                    <div class="card m-b-30">
	                                        <div class="card-body">
	            
	                                            <h4 class="mt-0 header-title">Stock History</h4>
	                                            <p class="text-muted m-b-30 font-14">This is the list of all members and days they have brought Irish potatoes.
	                                            </p>
	            
	                                            <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
	                                                <thead>
	                                                <tr>
	                                                    <th>S/N</th>
	                                                    <th>Product</th>
	                                                    <th>Quantity (Kg)</th>
	                                                    <th>Unit Price (Rwf)</th>
	                                                    <th>Total Price (Rwf)</th>
	                                                    <th>DateTime</th>
	                                                    <!-- <th>Edit</th> -->
	                                                    <th>View</th>
	                                                </tr>
	                                                </thead>
	            
	            
	                                                <tbody>
	                                                <c:forEach items="${list}" var="stl">
	                                                	<%x+=1; %>
	                                                	<tr>
	                                                		<td><%=x %></td>
		                                                    <td>${stl.getStockName()}</td>
		                                                    <td>
		                                                    	<%
		                                                    	double qty = ((StockLog)(pageContext.findAttribute("stl"))).getQuantity();
		                                                    	%>
		                                                    	<c:set var = "qty" value="<%=qty %>" />
		                                                    	<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${qty}" />
		                                                    </td>
		                                                    <td>
		                                                    	<%
		                                                    	double uPrice = ((StockLog)(pageContext.findAttribute("stl"))).getuPrice();
		                                                    	%>
		                                                    	<c:set var = "u_price" value="<%=uPrice %>" />
		                                                    	<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${u_price}" /> Rwf
		                                                    </td>
		                                                    <td>
		                                                    	<%
		                                                    	double tPrice = qty * uPrice;
		                                                    	%>
		                                                    	<c:set var = "t_price" value="<%=tPrice %>" />
		                                                    	<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${t_price}" /> Rwf
		                                                    </td>
		                                                    <td>
		                                                    	<%
		                                                    	String times = ((StockLog)(pageContext.findAttribute("stl"))).getRegDate();
		                                                    	Timestamp stamp = new Timestamp(Long.parseLong(times)*1000);
		                                                    	Date date = new Date(stamp.getTime());
		                                                    	DateFormat formatter = new SimpleDateFormat("MMM dd, yyyy hh:mm");
		                                                    	out.println(formatter.format(date));
		                                                    	%>
		                                                    </td>
		                                                    <%-- <td><a href="logEditForm.jsp?id=${stl.getId()}" class="btn btn-primary waves-effect waves-light">Edit Invoice</a></td> --%>
		                                                    <td><a href="logView.jsp?id=${stl.getId()}" class="btn btn-dark waves-effect waves-light">Get Invoice</a></td>
		                                                </tr>
	                                                </c:forEach>
	                                                </tbody>
	                                            </table>
	            
	                                        </div>
	                                    </div>
	                                </div> <!-- end col -->
	                            </div> <!-- end row -->
                            	<%
                            }
                            %>
                        	
                        	

                            
<%@include file="footer.jsp" %>
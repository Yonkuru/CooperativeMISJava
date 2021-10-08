<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.coops.dao.CoopDao"%>
<%@page import="com.coops.classes.Cooperative"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | COOPVIEW");
inclus.setPageTitle("Registered Cooperatives");
inclus.setPageCrumb("CoopView");
%>

<%@include file="header.jsp" %>  
<%
List<Cooperative> list = CoopDao.getAllCooperatives();
request.setAttribute("list", list);
%>
		<!-- DataTables -->
        <link href="../assets/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <!-- Responsive datatable examples -->
        <link href="../assets/plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css">                  

							<div class="row">
                                <div class="col-12">
                                    <div class="card m-b-30">
                                        <div class="card-body">
                                            <p class="text-muted m-b-30 font-14">
												All registered cooperatives:
                                            </p>
            
                                            <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead>
                                                <tr>
                                                    <th>COOP Name</th>
                                                    <th>COOP Email</th>
                                                    <th>COOP Address</th>
                                                    <th>COOP Username</th>
                                                    <th>Registered Date</th>
                                                    <th>Edit</th>
                                                    <th>Delete</th>
                                                </tr>
                                                </thead>
            
            
                                                <tbody>
                                                <c:forEach items="${list}" var="co">
                                                	<tr>
	                                                    <td>${co.getName()}</td>
	                                                    <td>${co.getEmail()}</td>
	                                                    <td>${co.getAddress()}</td>
	                                                    <td>${co.getUsername()}</td>
	                                                    <td>
	                                                    	<%
	                                                    	String times = ((Cooperative)(pageContext.findAttribute("co"))).getRegDate();
	                                                    	Timestamp stamp = new Timestamp(Long.parseLong(times)*1000);
	                                                    	Date date = new Date(stamp.getTime());
	                                                    	DateFormat formatter = new SimpleDateFormat("MMM dd, yyyy");
	                                                    	out.println(formatter.format(date));
	                                                    	%>
	                                                    </td>
	                                                    <td><a href="coopEditForm.jsp?id=${co.getId()}" class="btn btn-primary waves-effect waves-light">Edit</a></td>
	                                                    <td><a href="coopDelete.jsp?id=${co.getId()}" onClick="return confirm('Are you sure, you want to permanently delete this Cooperative?');" class="btn btn-dark waves-effect waves-light">Delete</a></td>
	                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
            
                                        </div>
                                    </div>
                                </div> <!-- end col -->
                            </div> <!-- end row -->
<%@include file="footer.jsp" %>
		<!-- Required datatable js -->
        <script src="../assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="../assets/plugins/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Buttons examples -->
        <script src="../assets/plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="../assets/plugins/datatables/buttons.bootstrap4.min.js"></script>
        <script src="../assets/plugins/datatables/jszip.min.js"></script>
        <script src="../assets/plugins/datatables/pdfmake.min.js"></script>
        <script src="../assets/plugins/datatables/vfs_fonts.js"></script>
        <script src="../assets/plugins/datatables/buttons.html5.min.js"></script>
        <script src="../assets/plugins/datatables/buttons.print.min.js"></script>
        <script src="../assets/plugins/datatables/buttons.colVis.min.js"></script>
        <!-- Responsive examples -->
        <script src="../assets/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="../assets/plugins/datatables/responsive.bootstrap4.min.js"></script>

        <!-- Datatable init js -->
        <script src="../assets/pages/datatables.init.js"></script>
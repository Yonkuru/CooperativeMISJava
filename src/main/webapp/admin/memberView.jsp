
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.coops.dao.MemberDao"%>
<%@page import="com.coops.classes.Member"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | Members");
inclus.setPageTitle("Registered Members");
inclus.setPageCrumb("MembersView");
%>
 
<%@include file="header.jsp" %>  
<!-- DataTables -->
        <link href="../assets/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <!-- Responsive datatable examples -->
        <link href="../assets/plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css">  <!-- DataTables -->
        <link href="../assets/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <!-- Responsive datatable examples -->
        <link href="../assets/plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css">  
<%
List<Member> mbList = MemberDao.getAllMembers();
request.setAttribute("mbList", mbList);
int x = 0;
%>
		               

							<div class="row">
                                <div class="col-12">
                                    <div class="card m-b-30">
                                        <div class="card-body">
            
                                            <h4 class="mt-0 header-title">Registered Members</h4>
                                            <p class="text-muted m-b-30 font-14">This is the list of all members registered in All cooperatives.
                                            </p>
            
                                            <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead>
                                                <tr>
                                                    <th>S/N</th>
                                                    <th>FirstName</th>
                                                    <th>LastName</th>
                                                    <th>Cooperative</th>
                                                    <th>UserType</th>
                                                    <th>Email</th>
                                                    <th>Registered Date</th>
                                                    <th>Edit</th>
                                                    <th>Delete</th>
                                                </tr>
                                                </thead>
            
            
                                                <tbody>
                                                <c:forEach items="${mbList}" var="mb">
                                                	<%x+=1; %>
                                                	<tr>
                                                		<td><%=x %></td>
	                                                    <td>${mb.getFirstname()}</td>
	                                                    <td>${mb.getLastname()}</td>
	                                                    <td>${mb.getCooperativeName()}</td>
	                                                    <td>${mb.getUserTypeDesc()}</td>
	                                                    <td>${mb.getEmail()}</td>
	                                                    <td>
	                                                    	<%
	                                                    	String times = ((Member)(pageContext.findAttribute("mb"))).getRegDate();
	                                                    	Timestamp stamp = new Timestamp(Long.parseLong(times)*1000);
	                                                    	Date date = new Date(stamp.getTime());
	                                                    	DateFormat formatter = new SimpleDateFormat("MMM dd, yyyy");
	                                                    	out.println(formatter.format(date));
	                                                    	%>
	                                                    </td>
	                                                    <td><a href="memberEditForm.jsp?id=${mb.getId()}" class="btn btn-primary waves-effect waves-light">Edit</a></td>
	                                                    <td><a href="memberDelete.jsp?id=${mb.getId()}" onClick="return confirm('Are you sure, you want to permanently delete this Member?');" class="btn btn-dark waves-effect waves-light">Delete</a></td>
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
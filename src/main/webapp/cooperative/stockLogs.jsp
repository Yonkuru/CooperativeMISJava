
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.coops.dao.StockLogDao"%>
<%@page import="com.coops.classes.StockLog"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | Stock Logs");
inclus.setPageTitle("IPCS");
inclus.setPageCrumb("Stock");

%>
        
<%@include file="header.jsp" %>
<!-- DataTables -->
        <link href="../assets/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <!-- Responsive datatable examples -->
        <link href="../assets/plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

<%
int x = 0;

List<StockLog> stList = StockLogDao.getLogsByCopId(cop_id);
request.setAttribute("list", stList);
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
                                                    <th>Member Names</th>
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
	                                                    <td>${stl.getMemberFirstname()} ${stl.getMemberLastname()}</td>
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
	                                                    <td><a href="logView.jsp?id=${stl.getId()}" class="btn btn-dark waves-effect waves-light">View Invoice</a></td>
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

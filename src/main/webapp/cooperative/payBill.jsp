<%@page import="com.coops.dao.Notification"%>
<%@page import="com.coops.dao.PaymentDao"%>
<%@page import="com.coops.classes.MemberAccount"%>
<%@page import="com.coops.dao.StockLogDao"%>
<%@page import="com.coops.dao.MemberAccountDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.coops.dao.MemberDao"%>
<%@page import="com.coops.classes.Member"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! 
int i;
long unixTime;
String regDate;
%>
<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | PayBill");
inclus.setPageTitle("PayBill");
inclus.setPageCrumb("Bill");

unixTime = System.currentTimeMillis() /1000L;
regDate = Long.toString(unixTime);

String amt = request.getParameter("amount");
String mbid = request.getParameter("member");
int mbr_id = Integer.parseInt(mbid);
double amount = Double.parseDouble(amt);

MemberAccount mac = MemberAccountDao.getAccountByMemberId(mbr_id);
Member mb = MemberDao.getMemberById(mbr_id);
%>
        
<%@include file="header.jsp" %>
<!-- DataTables -->
        <link href="../assets/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <!-- Responsive datatable examples -->
        <link href="../assets/plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
<jsp:useBean id="py" class="com.coops.classes.Payment" />
<jsp:setProperty property="member" name="py"/>
<jsp:setProperty property="account" name="py" value="<%=mac.getId() %>"/>
<jsp:setProperty property="amount" name="py" value="<%=amount %>"/>
<jsp:setProperty property="regDate" name="py" value="<%=regDate %>"/>
<%
i = PaymentDao.savePayment(py);
if(i > 0){
	Member mbr = MemberDao.getMemberById(mbr_id);
	MemberAccount mc = MemberAccountDao.getAccountByMemberId(mbr_id);
	int sent = Notification.sendPaymentMessage(mbr.getPhone(), mbr.getFirstname(), mbr.getLastname(), amount, mc.getBalance());
	%>
	<script type="text/javascript">
		window.alert('Member Payment Done Successfully!');
	</script>
	<%
} else{
	%>
	<script type="text/javascript">
		window.alert('Member Payment Failed! Try again');
		window.location = './';
	</script>
	<%
}
%>


            				<div class="row">
                                <div class="col-12">
                                    <div class="card m-b-30">
                                        <div class="card-body">
            
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="invoice-title">
                                                        <h4 class="float-right font-16"><strong>Member Payment</strong></h4>
                                                        <h3 class="m-t-0">
                                                            <img src="../assets/images/logo-dark.png" alt="logo" height="22"/>
                                                        </h3>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <address>
                                                                <strong>Payed To:</strong><br>
                                                                <%=mb.getFirstname()+" "+mb.getLastname() %><br>
                                                                <%=mb.getPhone() %><br>
                                                                <%=mb.getEmail() %><br>
                                                            </address>
                                                        </div>
                                                        <div class="col-6 text-right">
                                                            <address>
                                                                <strong>Payed Amount:</strong><br>
                                                                <c:set var = "amount" value="<%=amount %>" />
	                                                    		<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${amount}" /> Rwf<br>
                                                            </address>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-6 m-t-30">
                                                            <address>
                                                                <strong>Payment Method:</strong><br>
                                                                IPCCCS | E-Payment<br>
                                                            </address>
                                                        </div>
                                                        <div class="col-6 m-t-30 text-right">
                                                            <address>
                                                                <strong>Payment Date:</strong><br>
                                                                <%
		                                                    	String times = regDate;
		                                                    	Timestamp stamp = new Timestamp(Long.parseLong(times)*1000);
		                                                    	Date date = new Date(stamp.getTime());
		                                                    	DateFormat formatter = new SimpleDateFormat("MMM dd, yyyy hh:mm");
		                                                    	out.println(formatter.format(date));
		                                                    	%><br><br>
                                                            </address>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
            
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="panel panel-default">
                                                        <div class="">
                                                            <div class="d-print-none mo-mt-2">
                                                                <div class="float-right">
                                                                    <a href="javascript:window.print()" class="btn btn-success waves-effect waves-light"><i class="fa fa-print"></i> Print Bill</a>
                                                                    <a href="./" class="btn btn-primary waves-effect waves-light"><i class="ion-ios7-home"></i> Home</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
            
                                                </div>
                                            </div> <!-- end row -->
            
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

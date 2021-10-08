<%@page import="com.coops.dao.Notification"%>
<%@page import="com.coops.classes.Member"%>
<%@page import="com.coops.dao.StockLogDao"%>
<%@page import="com.coops.dao.MemberAccountDao"%>
<%@page import="com.coops.classes.MemberAccount"%>
<%@page import="com.coops.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! 
int i;
long unixTime;
String regDate;
%>
<%
unixTime = System.currentTimeMillis() /1000L;
regDate = Long.toString(unixTime);
String mb_id = request.getParameter("member");
String qty = request.getParameter("quantity");
String up = request.getParameter("uPrice");

double quantity = Double.parseDouble(qty);
double uPrice = Double.parseDouble(up);
MemberAccount mac = MemberAccountDao.getAccountByMemberId(Integer.parseInt(mb_id));
int acc_id = mac.getId();

%>
<jsp:useBean id="stl" class="com.coops.classes.StockLog" />
<jsp:setProperty property="member" name="stl"/>
<jsp:setProperty property="stock" name="stl"/>
<jsp:setProperty property="quantity" name="stl" value="<%=quantity %>"/>
<jsp:setProperty property="uPrice" name="stl" value ="<%=uPrice %>"/>
<jsp:setProperty property="account" name="stl" value="<%=acc_id %>"/>
<jsp:setProperty property="regDate" name="stl" value="<%=regDate %>"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Saving....</title>
</head>
<body>
<%
i = StockLogDao.saveStockLog(stl);
if(i > 0){
	Member mb = MemberDao.getMemberById(Integer.parseInt(mb_id));
	MemberAccount mc = MemberAccountDao.getAccountByMemberId(Integer.parseInt(mb_id));
	
	int sent = Notification.sendStockMessage(mb.getPhone(), mb.getFirstname(), mb.getLastname(), quantity, uPrice, mc.getBalance());
	%>
	<script type="text/javascript">
		window.alert('Member Stock Saved Successfully! ');
		window.location = './';
	</script>
	<%
} else{
	%>
	<script type="text/javascript">
		window.alert('The Member stock Not Saved! Try again');
		window.location = './';
	</script>
	<%
}
%>
</body>
</html>
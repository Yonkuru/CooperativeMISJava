<%@page import="com.coops.dao.MemberAccountDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String get_id = request.getParameter("id");
int id = Integer.parseInt(get_id);
double balance = MemberAccountDao.getMemberBalance(id);
%>
<c:set var = "balance" value="<%=balance %>" />

<label>Amount  (Not above <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${balance}" /> Rwf):</label>
<div>
	
 	<input data-parsley-type="number" data-parsley-max="<%=(int)balance %>" name="amount" type="text" class="form-control" required placeholder="Enter Amount">
</div>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.Instant"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!long unixTime; %>
<%
unixTime = System.currentTimeMillis() /1000; 
out.print(unixTime+"<br>");

Date now = new Date();
long ut3 = now.getTime() / 1000L;
out.println(ut3+"<br>");

long ut1 = Instant.now().getEpochSecond();
out.println(ut1+"<br>");

String times = Long.toString(unixTime);
Timestamp stamp = new Timestamp(Long.parseLong(times)*1000);
Date date = new Date(stamp.getTime());
out.println(date+"<br>");

DateFormat formatter = new SimpleDateFormat("MMM dd, yyyy");
String output = formatter.format(date);
out.println(output);
%>

</body>
</html>
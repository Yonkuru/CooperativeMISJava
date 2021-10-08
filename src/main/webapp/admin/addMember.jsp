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
String code = "+25";
String phone = request.getParameter("phone");

%>
<jsp:useBean id="mb" class="com.coops.classes.Member" />
<jsp:setProperty property="cooperative" name="mb"/>
<jsp:setProperty property="firstname" name="mb"/>
<jsp:setProperty property="lastname" name="mb"/>
<jsp:setProperty property="phone" name="mb" value="<%=code+phone %>"/>
<jsp:setProperty property="email" name="mb"/>
<jsp:setProperty property="password" name="mb"/>
<jsp:setProperty property="userType" name="mb"/>
<jsp:setProperty property="regDate" name="mb" value="<%=regDate %>"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Saving....</title>
</head>
<body>
<%
i = MemberDao.saveMember(mb);
if(i > 0){
	%>
	<script type="text/javascript">
		window.alert('Member Saved Successfully!');
		window.location = 'memberView.jsp';
	</script>
	<%
} else{
	%>
	<script type="text/javascript">
		window.alert('The Member Not Saved! Try again');
		window.location = 'memberNew.jsp';
	</script>
	<%
}
%>
</body>
</html>
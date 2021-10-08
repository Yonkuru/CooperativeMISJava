<%@page import="com.coops.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! 
int i;
%>

<jsp:useBean id="mb" class="com.coops.classes.Member" />
<jsp:setProperty property="id" name="mb"/>
<jsp:setProperty property="cooperative" name="mb"/>
<jsp:setProperty property="firstname" name="mb"/>
<jsp:setProperty property="lastname" name="mb"/>
<jsp:setProperty property="phone" name="mb"/>
<jsp:setProperty property="email" name="mb"/>
<jsp:setProperty property="password" name="mb"/>
<jsp:setProperty property="userType" name="mb"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IPCCCI | Saving....</title>
</head>
<body>
<%
i = MemberDao.updateMember(mb);
if(i > 0){
	%>
	<script type="text/javascript">
		window.alert('Member Info Updated Successfully!');
		window.location = './';
	</script>
	<%
} else{
	%>
	<script type="text/javascript">
		window.alert('The Member is Not Updated! Try again');
		window.location = './';
	</script>
	<%
}
%>
</body>
</html>
<%@page import="com.coops.classes.Includes"%>
<%@page import="com.coops.classes.Admin"%>
<%@page import="com.coops.dao.AdminDao"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Redirecting...</title>
	</head>
	<body>
<%
if(request.getParameter("login") != null){
	String uname = request.getParameter("username");
	String password = request.getParameter("password");
	Admin adm= AdminDao.login(uname, password);
	
	if(adm != null){
		session.setAttribute("id", adm.getId());
		session.setAttribute("username", adm.getUsername());
		session.setAttribute("password", adm.getPassword());
		
		response.sendRedirect("./");
	} else{
		%>
		<script type="text/javascript">
			window.alert('Invalid Username or password! Tyr again');
			window.location = './login.jsp';
		</script>
		<%
	}
} else{
	response.sendRedirect("./login.jsp");
}
%>
	</body>
</html>
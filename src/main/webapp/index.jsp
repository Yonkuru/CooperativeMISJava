
<%@page import="com.coops.dao.MemberAccountDao"%>
<%@page import="com.coops.classes.MemberAccount"%>
<%@page import="javax.websocket.Session"%>
<%@page import="com.coops.dao.CoopDao"%>
<%@page import="com.coops.classes.Cooperative"%>
<%@page import="com.coops.dao.MemberDao"%>
<%@page import="com.coops.classes.Member"%>

<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | Redirecting...");


if(request.getParameter("login") != null){
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	Member mb = MemberDao.login(username, password);
	Cooperative co = CoopDao.login(username, password);
	
	if(mb != null){
		MemberAccount mac = MemberAccountDao.getAccountByMemberId(mb.getId());
		session.setAttribute("id", mb.getId());
		session.setAttribute("firstname", mb.getFirstname());
		session.setAttribute("lastname", mb.getLastname());
		session.setAttribute("cop_id", mb.getCooperative());
		session.setAttribute("cop_name", mb.getCooperativeName());
		session.setAttribute("acc_id", mac.getId());
		if(mb.getUserTypeDesc().equals("Member")){
			response.sendRedirect("member/");
		} else if(mb.getUserTypeDesc().equals("Store Keeper")){
			response.sendRedirect("cooperative/");
		} else{
			response.sendRedirect("./login.jsp");
		}
	} else{
		if(co != null){
			session.setAttribute("cop_id", co.getId());
			session.setAttribute("cop_name", co.getName());
			response.sendRedirect("cooperative/");
		}else{
			%>
			<script type="text/javascript">
				window.alert('Invalid Username / Email or password! Tyr again');
				window.location = './login.jsp';
			</script>
			<%
		}
	}
} else{
	response.sendRedirect("./login.jsp");
}
%>

<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
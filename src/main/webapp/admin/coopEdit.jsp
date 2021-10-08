<%@page import="com.coops.dao.CoopDao"%>
<jsp:useBean id="co" class="com.coops.classes.Cooperative" />
<jsp:setProperty property="id" name="co"/>
<jsp:setProperty property="name" name="co"/>
<jsp:setProperty property="email" name="co"/>
<jsp:setProperty property="address" name="co"/>
<jsp:setProperty property="username" name="co"/>
<jsp:setProperty property="password" name="co"/>

<%
int i = CoopDao.updateCooperative(co);
if(i > 0){
	%>
	<script>
		window.alert('Cooperative info updated Successfully!');
		window.location = ('coopView.jsp');
	</script>
	<%
} else{
	%>
	<script>
		window.alert('Cooperative info not updated!');
		window.location = ('coopView.jsp');
	</script>
	<%
}
%>
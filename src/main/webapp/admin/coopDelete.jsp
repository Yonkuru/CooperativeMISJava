<%@page import="com.coops.dao.CoopDao"%>
<jsp:useBean id="co" class="com.coops.classes.Cooperative" />
<jsp:setProperty property="*" name="co"/>
<%
int deleted = CoopDao.deleteCooperative(co);
if(deleted > 0){
	%>
	<script>
		window.alert('Cooperative deleted Successfully!');
		window.location = ('coopView.jsp');
	</script>
	<%
} else{
	%>
	<script>
		window.alert('Cooperative is not deleted!');
		window.location = ('coopView.jsp');
	</script>
	<%
}
%>
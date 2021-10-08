<%@page import="com.coops.dao.MemberDao"%>
<%@page import="com.coops.dao.CoopDao"%>
<jsp:useBean id="mb" class="com.coops.classes.Member" />
<jsp:setProperty property="*" name="mb"/>
<%
int deleted = MemberDao.deleteMember(mb);
if(deleted > 0){
	%>
	<script>
		window.alert('Member deleted Successfully!');
		window.location = ('memberView.jsp');
	</script>
	<%
} else{
	%>
	<script>
		window.alert('Member is not deleted!');
		window.location = ('memberView.jsp');
	</script>
	<%
}
%>
<html></html>
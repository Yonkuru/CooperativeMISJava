<%@page import="com.coops.dao.CoopDao"%>
<%! 
int i;
long unixTime;
String regDate;
%>
<%
unixTime = System.currentTimeMillis() /1000L;
regDate = Long.toString(unixTime);

%>
<jsp:useBean id="co" class="com.coops.classes.Cooperative" />
<jsp:setProperty property="name" name="co"/>
<jsp:setProperty property="email" name="co"/>
<jsp:setProperty property="address" name="co"/>
<jsp:setProperty property="username" name="co"/>
<jsp:setProperty property="password" name="co"/>
<jsp:setProperty property="regDate" name="co" value="<%=regDate %>"/>

<%
i = CoopDao.saveCoop(co);
if(i > 0){
	%>
	<script type="text/javascript">
		window.alert('Cooperative Saved Successfully!');
		window.location = 'coopView.jsp';
	</script>
	<%
} else{
	%>
	<script type="text/javascript">
		window.alert('Cooperative Not Saved! Try again');
		window.location = 'coopNew.jsp';
	</script>
	<%
}
%>

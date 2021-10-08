<%@page import="com.coops.dao.MessageDao"%>
<%@page import="com.coops.dao.AnnouncementDao"%>
<%@page import="com.coops.dao.MemberDao"%>
<%@page import="com.coops.classes.Member"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>




<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | Sending...");
inclus.setPageTitle("Sanding Announcement...");
inclus.setPageCrumb("SendAno");

%>
<%@include file="header.jsp" %>
<%! 
int i;
long unixTime;
String regDate;
%>
<%
unixTime = System.currentTimeMillis() /1000L;
regDate = Long.toString(unixTime);
%>
<jsp:useBean id="msg" class="com.coops.classes.Message"/>
<jsp:setProperty property="title" name="msg"/>
<jsp:setProperty property="message" name="msg"/>
<jsp:setProperty property="regDate" name="msg" value="<%=regDate %>"/>
<%
List<Member> list = MemberDao.getMembersByCopId(cop_id);
request.setAttribute("list", list);
int msg_id = MessageDao.saveMessage(msg, cop_id);
%>
<c:forEach items="${list}" var="mb">
 	<%
 	int mbr_id = ((Member)(pageContext.findAttribute("mb"))).getId();
 	i = AnnouncementDao.saveAnnouncement(msg_id, mbr_id);
	%>
</c:forEach>
<%

if(i > 0){
	%>
	<script type="text/javascript">
		window.alert('Announcement is sent Successfully!');
		window.location = './';
	</script>
	<%
} else{
	%>
	<script type="text/javascript">
		window.alert('Announcement is not sent! Try again');
		window.location = './';
	</script>
	<%
}
%>
<%@page import="com.coops.classes.Member"%>
<%@page import="com.coops.dao.MemberDao"%>
<%@page import="com.coops.dao.UsertypeDao"%>
<%@page import="com.coops.classes.Usertype"%>
<%@page import="com.coops.dao.CoopDao"%>
<%@page import="com.coops.classes.Cooperative"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | Edit Member");
inclus.setPageTitle("Edit Member");
inclus.setPageCrumb("MemberEdit");
%>

<%@include file="./header.jsp" %>
<%
List<Cooperative> list = CoopDao.getAllCooperatives();
List<Usertype> utList = UsertypeDao.getUsertypes();
request.setAttribute("list", list);
request.setAttribute("utype", utList);

String mbr_id = request.getParameter("id");
Member mb = MemberDao.getMemberById(Integer.parseInt(mbr_id));
%>
							<div class="row">
                                <div class="col-lg-6">
                                    <div class="card m-b-30">
                                        <div class="card-body">
                                            <p class="text-muted m-b-30 font-14">Update the Cooperative Member data by providing all required information.</p>
            
                                            <form class="" action="memberEdit.jsp" method="post">
                                            	<input type="hidden" value="<%=mb.getId() %>" name="id" />
                                            	<div class="form-group">
                                                    <label>Member Cooperative:</label>
                                                    <select name="cooperative" class="form-control" required readonly>
                                                    	<option disabled hidden>--Select Cooperative--</option>
                                                    	<c:forEach items="${list}" var="co">
                                                    		<%
                                                    		if(mb.getCooperative() == ((Cooperative)(pageContext.findAttribute("co"))).getId()){
                                                    			%>
                                                    			<option selected value="${co.getId()}">${co.getName()}</option>
                                                    			<%
                                                    		}
                                                    		%>
                                                    	</c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Firstname:</label>
                                                    <input type="text" value="<%=mb.getFirstname() %>" name="firstname" class="form-control" required placeholder="Type Firstname"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Lastname:</label>
                                                    <input type="text" value="<%=mb.getLastname() %>" name="lastname" class="form-control" required placeholder="Type Lastname"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Phone Number (Remember code: +250)</label>
                                                    <div>
                                                        <input value="<%=mb.getPhone() %>" name="phone" type="text" class="form-control" required="" placeholder="Enter phone number">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Member E-Mail:</label>
                                                    <div>
                                                        <input type="email" value="<%=mb.getEmail() %>" name="email" class="form-control" required
                                                               parsley-type="email" placeholder="Enter a valid e-mail"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Member User Type:</label>
                                                    <select name="userType" class="form-control" required>
                                                    	<option disabled hidden>--Select User Type--</option>
                                                    	<c:forEach items="${utype}" var="ut">
                                                    		<%
                                                    		if(mb.getUserType() == ((Usertype)(pageContext.findAttribute("ut"))).getId()){
                                                    			%>
                                                    			<option selected value="${ut.getId()}">${ut.getDescription()}</option>
                                                    			<%
                                                    		} else{
                                                    			%>
                                                    			<option value="${ut.getId()}">${ut.getDescription()}</option>
                                                    			<%
                                                    		}
                                                    		%>
                                                    	</c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Password:</label>
                                                    <div>
                                                        <input type="password" value="<%=mb.getPassword() %>" name="password" id="pass2" class="form-control" required
                                                               placeholder="Password"/>
                                                    </div>
                                                </div> 
                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" name="submit" class="btn btn-primary waves-effect waves-light">
                                                            Update Info
                                                        </button>
                                                        <a href="./" class="btn btn-secondary waves-effect m-l-5">Cancel</a>
                                                    </div>
                                                </div>                                                   
                                            </form>
            
                                        </div>
                                    </div>
                                </div> <!-- end col -->

                            </div> <!-- end row -->
		
<%@include file="footer.jsp" %>
		
    	<!-- Parsley js -->
        <script src="../assets/plugins/parsleyjs/parsley.min.js"></script>

        <!-- App js -->
        <!-- <script src="../assets/js/app.js"></script> -->

        <script>
            $(document).ready(function() {
                $('form').parsley();
            });
        </script>     
        
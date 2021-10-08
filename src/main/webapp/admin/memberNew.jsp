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
inclus.setTitle("IPCCCI | New Member");
inclus.setPageTitle("Register Member");
inclus.setPageCrumb("MemberNew");

List<Cooperative> list = CoopDao.getAllCooperatives();
List<Usertype> utList = UsertypeDao.getUsertypes();
request.setAttribute("list", list);
request.setAttribute("utype", utList);
%>

<%@include file="header.jsp" %>
							<div class="row">
                                <div class="col-lg-6">
                                    <div class="card m-b-30">
                                        <div class="card-body">
                                            <p class="text-muted m-b-30 font-14">Register the Cooperative Member by providing all required information.</p>
            
                                            <form class="" action="addMember.jsp" method="post">
                                            	<div class="form-group">
                                                    <label>Member Cooperative:</label>
                                                    <select name="cooperative" class="form-control" required>
                                                    	<option selected disabled hidden>--Select Cooperative--</option>
                                                    	<c:forEach items="${list}" var="co">
                                                    		<option value="${co.getId()}">${co.getName()}</option>
                                                    	</c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Firstname:</label>
                                                    <input type="text" name="firstname" class="form-control" required placeholder="Type Firstname"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Lastname:</label>
                                                    <input type="text" name="lastname" class="form-control" required placeholder="Type Lastname"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Phone Number:</label>
                                                    <div>
                                                        <input data-parsley-type="number" name="phone" type="text" class="form-control" required="" placeholder="Enter phone number">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Member E-Mail:</label>
                                                    <div>
                                                        <input type="email" name="email" class="form-control" required
                                                               parsley-type="email" placeholder="Enter a valid e-mail"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Member User Type:</label>
                                                    <select name="userType" class="form-control" required>
                                                    	<option selected disabled hidden>--Select User Type--</option>
                                                    	<c:forEach items="${utype}" var="ut">
                                                    		<option value="${ut.getId()}">${ut.getDescription()}</option>
                                                    	</c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Create Password:</label>
                                                    <div>
                                                        <input type="password" name="password" id="pass2" class="form-control" required
                                                               placeholder="Password"/>
                                                    </div>
                                                    <div class="m-t-10">
                                                        <input type="password" class="form-control" required
                                                               data-parsley-equalto="#pass2"
                                                               placeholder="Re-Type Password"/>
                                                    </div>
                                                </div> 
                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" name="submit" class="btn btn-primary waves-effect waves-light">
                                                            Submit
                                                        </button>
                                                        <button type="reset" class="btn btn-secondary waves-effect m-l-5">
                                                            Cancel
                                                        </button>
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
        
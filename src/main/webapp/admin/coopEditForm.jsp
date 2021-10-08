<%@page import="com.coops.dao.CoopDao"%>
<%@page import="com.coops.classes.Cooperative"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | Edit COOP");
inclus.setPageTitle("Edit Cooperative");
inclus.setPageCrumb("CoopEdit");
String mid = request.getParameter("id");
Cooperative co = CoopDao.getCooperativeById(Integer.parseInt(mid));
%>

<%@include file="header.jsp" %>
							<div class="row">
                                <div class="col-lg-6">
                                    <div class="card m-b-30">
                                        <div class="card-body">
                                            <p class="text-muted m-b-30 font-14">Register the Cooperative by providing all required information.</p>
            
                                            <form class="" action="coopEdit.jsp" method="post">
                                            	<input type="hidden" name="id" value="<%=co.getId() %>" />
                                                <div class="form-group">
                                                    <label>Cooperative Name:</label>
                                                    <input type="text" name="name" value="<%=co.getName() %>" class="form-control" required placeholder="Type COOP name"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Cooperative E-Mail</label>
                                                    <div>
                                                        <input type="email" name="email" value="<%=co.getEmail() %>" class="form-control" required
                                                               parsley-type="email" placeholder="Enter a valid e-mail"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Cooperative Address:</label>
                                                    <input type="text" name="address" value="<%=co.getAddress() %>" class="form-control" required placeholder="Type COOP Address"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Username:</label>
                                                    <input type="text" name="username" value="<%=co.getUsername() %>" class="form-control" required placeholder="Type Username"/>
                                                </div>
            
                                                <div class="form-group">
                                                    <label>Password:</label>
                                                    <div>
                                                        <input type="password" name="password" value="<%=co.getPassword() %>" class="form-control" required
                                                               placeholder="Password"/>
                                                    </div>
                                                </div> 
                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" name="submit" class="btn btn-primary waves-effect waves-light">
                                                            Update
                                                        </button>
                                                        <button type="reset" class="btn btn-secondary waves-effect m-l-5">
                                                            Reset All
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
   
        
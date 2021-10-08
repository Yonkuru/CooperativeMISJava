<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Includes inclus = new Includes();
inclus.setTitle("IPCCCI | New COOP");
inclus.setPageTitle("Register Cooperative");
inclus.setPageCrumb("CoopNew");
%>

<%@include file="header.jsp" %>
							<div class="row">
                                <div class="col-lg-6">
                                    <div class="card m-b-30">
                                        <div class="card-body">
                                            <p class="text-muted m-b-30 font-14">Register the Cooperative by providing all required information.</p>
            
                                            <form class="" action="addCoop.jsp" method="post">
                                                <div class="form-group">
                                                    <label>Cooperative Name:</label>
                                                    <input type="text" name="name" class="form-control" required placeholder="Type COOP name"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Cooperative E-Mail</label>
                                                    <div>
                                                        <input type="email" name="email" class="form-control" required
                                                               parsley-type="email" placeholder="Enter a valid e-mail"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Cooperative Address:</label>
                                                    <input type="text" name="address" class="form-control" required placeholder="Type COOP Address"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Create Username:</label>
                                                    <input type="text" name="username" class="form-control" required placeholder="Type Username"/>
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
        
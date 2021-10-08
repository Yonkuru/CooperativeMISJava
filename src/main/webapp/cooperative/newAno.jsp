<%@page import="com.coops.classes.Stock"%>
<%@page import="com.coops.dao.StockDao"%>
<%@page import="com.coops.dao.MemberDao"%>
<%@page import="com.coops.classes.Member"%>
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
inclus.setTitle("IPCCCI | Announcement");
inclus.setPageTitle("New Announcement");
inclus.setPageCrumb("Announcement");


%>

<%@include file="header.jsp" %>
<%
List<Member> list = MemberDao.getMembersByCopId(cop_id);
List<Stock> stList = StockDao.getStock();
request.setAttribute("list", list);
request.setAttribute("stList", stList);
%>
							<div class="row">
                                <div class="col-lg-6">
                                    <div class="card m-b-30">
                                        <div class="card-body">
                                            <p class="text-muted m-b-30 font-14">Use this form to send announcement to your cooperative members.</p>
            
                                            <form class="" action="saveAno.jsp" method="post">
                                                <div class="form-group">
                                                    <label>Title:</label>
                                                    <div>
                                                        <textarea id="textarea" class="form-control" name="title" maxlength="50" rows="1" placeholder="Write you Title (Max 50 chars)..."></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Message:</label>
                                                    <div>
                                                        <textarea id="textarea" class="form-control" name ="message" maxlength="400" rows="3" placeholder="Write you message (Max 225 chars)..."></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" name="submit" class="btn btn-primary waves-effect waves-light">
                                                            Submit
                                                        </button>
                                                        <a href="./" class="btn btn-secondary waves-effect m-l-5" onclick="return confirm('Do you want to leave this page?');">Cancel</a>
                                                   	</div>
                                                </div>                                                   
                                            </form>
                                        </div>
                                    </div>
                                </div> <!-- end col -->

                            </div> <!-- end row -->
		
<%@include file="footer.jsp" %>
		
        <!-- Plugins js -->
        <script src="../assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="../assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="../assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="../assets/plugins/bootstrap-touchspin/js/jquery.bootstrap-touchspin.min.js"></script>
        <!-- Plugins Init js -->
        <script src="../assets/pages/form-advanced.js"></script>


        <script>
            $(document).ready(function() {
                $('form').parsley();
            });
        </script>     
        
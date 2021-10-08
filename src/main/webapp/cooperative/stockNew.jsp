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
inclus.setTitle("IPCCCI | Add Stock");
inclus.setPageTitle("New Stock");
inclus.setPageCrumb("StockNew");


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
                                            <p class="text-muted m-b-30 font-14">Record a new stock provided by the cooperative member.</p>
            
                                            <form class="" action="addStock.jsp" method="post">
                                            	<div class="form-group">
                                                    <label>Cooperative Member:</label>
                                                    <select name="member" class="form-control" required>
                                                    	<option selected disabled hidden>-- Select Member --</option>
                                                    	<c:forEach items="${list}" var="mb">
                                                    		<option value="${mb.getId()}">${mb.getFirstname()} ${mb.getLastname()}</option>
                                                    	</c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Product Type:</label>
                                                    <select name="stock" class="form-control" required>
                                                    	<option selected disabled hidden>--Select Product--</option>
                                                    	<c:forEach items="${stList}" var="st">
                                                    		<option value="${st.getId()}">${st.getName()}</option>
                                                    	</c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Quantity (Kg):</label>
                                                    <div>
                                                        <input data-parsley-type="number" name="quantity" type="text" class="form-control" required="" placeholder="Enter The Quantity (Kg)">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Unit Price (Rwf):</label>
                                                    <div>
                                                        <input data-parsley-type="number" name="uPrice" type="text" class="form-control" required="" placeholder="Enter The Unit Price">
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
		
    	<!-- Parsley js -->
        <script src="../assets/plugins/parsleyjs/parsley.min.js"></script>

        <!-- App js -->
        <!-- <script src="../assets/js/app.js"></script> -->

        <script>
            $(document).ready(function() {
                $('form').parsley();
            });
        </script>     
        
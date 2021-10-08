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
inclus.setTitle("IPCCCI | Pay Member");
inclus.setPageTitle("Member Payment");
inclus.setPageCrumb("MemberPay");


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
                                            <p class="text-muted m-b-30 font-14">Record a new member payment.</p>
            
                                            <form class="" action="payBill.jsp" method="post">
                                            	<div class="form-group">
                                                    <label>Cooperative Member:</label>
                                                    <select name="member" class="form-control member" required>
                                                    	<option selected disabled hidden>-- Select Member --</option>
                                                    	<c:forEach items="${list}" var="mb">
                                                    		<option value="${mb.getId()}">${mb.getFirstname()} ${mb.getLastname()}</option>
                                                    	</c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group amount">
                                                    <label>Amount (Rwf):</label>
                                                    <div>
                                                        <input data-parsley-type="number" name="amount" type="text" class="form-control" required placeholder="Enter Amount" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" name="submit" onclick="return confirm('Do you confirm this payment?');" class="btn btn-primary waves-effect waves-light">
                                                            Pay Member
                                                        </button>
                                                        <a href="./" class="btn btn-secondary waves-effect m-l-5" onclick="return confirm('Do you want to leave this page?');">Cancel</a>
                                                   	</div>
                                                </div>                                                   
                                            </form>
                                        </div>
                                    </div>
                                </div> <!-- end col -->

                            </div> <!-- end row -->
<script type="text/javascript" src="jquery-1.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	$(".member").change(function()
	{
		var id=$(this).val();
		var dataString = 'id='+ id;
	
		$.ajax
		({
			type: "POST",
			url: "get_amount.jsp",
			data: dataString,
			cache: false,
			success: function(html)
			{
				$(".amount").html(html);
			} 
		});
	});
	
});
</script>		
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
        
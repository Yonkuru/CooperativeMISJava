<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="dateYear" class="java.util.Date" />
<fmt:formatDate value="${dateYear}" pattern="yyyy" var="currentYear" />
</div><!-- container fluid -->

                    </div> <!-- Page content Wrapper -->

                </div> <!-- content -->

                <footer class="footer">
                    © <c:out value="${currentYear}" /> <b>IPRC Karongi</b> <span class="d-none d-sm-inline-block"> - Crafted with <i class="mdi mdi-heart text-danger"></i> by UWITONZE Clementine & UMUTONI Clementine.</span>
                </footer>

            </div>
            <!-- End Right content here -->

        </div>
        <!-- END wrapper -->


        <!-- jQuery  -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/modernizr.min.js"></script>
        <script src="../assets/js/detect.js"></script>
        <script src="../assets/js/fastclick.js"></script>
        <script src="../assets/js/jquery.slimscroll.js"></script>
        <script src="../assets/js/jquery.blockUI.js"></script>
        <script src="../assets/js/waves.js"></script>
        <script src="../assets/js/jquery.nicescroll.js"></script>
        <script src="../assets/js/jquery.scrollTo.min.js"></script>

        <!-- skycons -->
        <script src="../assets/plugins/skycons/skycons.min.js"></script>

        <!-- skycons -->
        <script src="../assets/plugins/peity/jquery.peity.min.js"></script>

        <!--Morris Chart-->
        <script src="../assets/plugins/morris/morris.min.js"></script>
        <script src="../assets/plugins/raphael/raphael-min.js"></script>

        <!-- dashboard -->
        <script src="../assets/pages/dashboard.js"></script>

        <!-- App js -->
        <script src="../assets/js/app.js"></script>

    </body>
</html>
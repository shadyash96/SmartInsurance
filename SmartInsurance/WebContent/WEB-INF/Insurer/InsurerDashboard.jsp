<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="connection.DatabaseConnection"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>

<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Insurer Portal</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="insurerCSS/img2/favicon.png">
    <!-- Normalize CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/normalize.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/main.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/all.min.css">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="insurerCSS/fonts2/flaticon.css">
    <!-- Full Calender CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/fullcalendar.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/animate.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="insurerCSS/style.css">
    <!-- Modernize js -->
    <script src="insurerCSS/js2/modernizr-3.6.0.min.js"></script>
</head>
<%Connection c= DatabaseConnection.getConnection();
int InsuredItems=0, InsuranceRequests=0, ClaimRequests=0, Earnings=0;

PreparedStatement ps=c.prepareStatement("select count(Insurance_ID) from InsuredItems where EndDate > GETDATE();");
ResultSet rs= ps.executeQuery();
if (rs.next()){
	InsuredItems=rs.getInt(1);
}
ps=c.prepareStatement("select count(Request_ID) from InsuranceRequest where status='Pending'");
rs= ps.executeQuery();
if (rs.next()){
	InsuranceRequests=rs.getInt(1);
}
ps=c.prepareStatement("select count(ID) from ClaimRequest where status='Pending'");
rs= ps.executeQuery();
if (rs.next()){
	ClaimRequests=rs.getInt(1);
}
ps=c.prepareStatement("select SUM(Payment) from Transactions");
rs= ps.executeQuery();
if (rs.next()){
	Earnings=rs.getInt(1);
}
c.close(); %>
<body>
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <div id="wrapper" class="wrapper bg-ash">
      
      
      <jsp:include page="InsurerSideMenu.jsp">
    				 <jsp:param name="active" value="Dashboard"/>
    				</jsp:include>
        <!-- Page Area Start Here -->
        
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Admin Dashboard</h3>
                    <ul>
                        <li>
                            <a href="index2.html">Home</a>
                        </li>
                        <li>Admin</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- Dashboard summery Start Here -->
                <div class="row gutters-20">
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <div class="item-icon bg-light-green ">
                                        <i class="flaticon-classmates text-green"></i>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="item-content">
                                        <div class="item-title">Insurance</div>
                                        <div class="item-number"><span class="counter" data-num="<%=InsuredItems%>"><%=InsuredItems%></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <div class="item-icon bg-light-blue">
                                        <i class="flaticon-multiple-users-silhouette text-blue"></i>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="item-content">
                                        <div class="item-title">Insurance Requests</div>
                                        <div class="item-number"><span class="counter" data-num="<%=InsuranceRequests%>"><%=InsuranceRequests%></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <div class="item-icon bg-light-yellow">
                                        <i class="flaticon-couple text-orange"></i>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="item-content">
                                        <div class="item-title">Claim requests</div>
                                        <div class="item-number"><span class="counter" data-num="<%=ClaimRequests%>"><%=ClaimRequests%></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-12">
                        <div class="dashboard-summery-one mg-b-20">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <div class="item-icon bg-light-red">
                                        <i class="flaticon-money text-red"></i>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="item-content">
                                        <div class="item-title">Earnings</div>
                                        <div class="item-number"><span>EGP</span><span class="counter" data-num="<%=Earnings%>"><%=Earnings%></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Dashboard Content End Here -->
                <!-- Social Media Start Here -->
                
                <!-- Social Media End Here -->
                <!-- Footer Area Start Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a
                            href="#">PsdBosS</a></div>
                </footer>
                <!-- Footer Area End Here -->
            </div>
        </div>
        <!-- Page Area End Here -->
    </div>
    <!-- jquery-->
    <script src="insurerCSS/js2/jquery-3.3.1.min.js"></script>
    <!-- Plugins js -->
    <script src="insurerCSS/js2/plugins.js"></script>
    <!-- Popper js -->
    <script src="insurerCSS/js2/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="insurerCSS/js2/bootstrap.min.js"></script>
    <!-- Counterup Js -->
    <script src="insurerCSS/js2/jquery.counterup.min.js"></script>
    <!-- Moment Js -->
    <script src="insurerCSS/js2/moment.min.js"></script>
    <!-- Waypoints Js -->
    <script src="insurerCSS/js2/jquery.waypoints.min.js"></script>
    <!-- Scroll Up Js -->
    <script src="insurerCSS/js2/jquery.scrollUp.min.js"></script>
    <!-- Full Calender Js -->
    <script src="insurerCSS/js2/fullcalendar.min.js"></script>
    <!-- Chart Js -->
    <script src="insurerCSS/js2/Chart.min.js"></script>
    <!-- Custom Js -->
    <script src="insurerCSS/js2/main.js"></script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:40 GMT -->
</html>

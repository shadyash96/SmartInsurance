<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
   <%@ page import="connection.DatabaseConnection"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">

<%Connection c= DatabaseConnection.getConnection();
Cookie[] Allcookies = null;
Allcookies = request.getCookies();
String JSessionID = null;
Cookie JSession = null;
if (Allcookies != null) {
	for (int i = 0; i < Allcookies.length; i++) {
		if (Allcookies[i].getName().equals("JSESSIONID")) {
	JSession = Allcookies[i];
		}
	}
}
if (JSession != null)
	JSessionID = JSession.getValue();
String login="null";

PreparedStatement ps=c.prepareStatement("if exists (Select * from accounts where SessionID=?) select 'Exists' else select 'Doesnt'");
ps.setString(1,JSessionID);
ResultSet rs=ps.executeQuery();
rs.next();
if (rs.getString(1).equals("Exists"))
	login="loggedIN";
c.close();
%>


<head>
<!-- Basic Page Needs
    ================================================== -->
<meta charset="UTF-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10"><![endif]-->
<meta name="description"
	content="Insurance is HTML5, responsive website">
<meta name="keywords"
	content="quotes on auto insurance, quote insurance, auto insurance online, online insurance, insurance agent, personal insurance, best car insurance,state insurance ">
<meta name="author" content="iglyphic">
<link rel="shortcut icon" href="images/favicon.png">
<title>Smart Insurance</title>

<!-- Mobile Specific Meta
	================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
	================================================== -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">


<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->


</head>

<body>


	<!-- Start Loading -->

	<section class="loading-overlay">
		<div class="Loading-Page">
			<h1 class="loader">Loading...</h1>
		</div>
	</section>

	<!-- End Loading  -->

	<div class="boxed_wrapper">


		<jsp:include page="header.jsp" />

		<section class="inner-intro bg bg-fixed bg-overlay-black-70"
			style="background-image: url(images/background/inner-page.png);">
			<div class="container">
				<div class="row intro-title text-center">
					<div class="col-sm-12">
						<div class="section-title">
							<h1 class="title text-white">INSURER LOGIN/REGISTER</h1>
						</div>
					</div>
					<div class="col-sm-12">
						<ul class="page-breadcrumb">
							<li><a href="#"><i class="fa fa-home"></i>
									Home</a> <i class="fa fa-angle-double-right"></i></li>
							<li><a href="#">Login</a> <i
								class="fa fa-angle-double-right"></i></li>
							<li><span>LOGIN/REGISTER</span></li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<!--=================================
     banner -->


		<!-- Account Page Content*********************** -->
		<div class="account_page">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 login_form">
						<div class="theme-title">
							<h2>Login Now</h2>
						</div>
						<form action="InsurerLogin" method="post">
							<%if (login.equals("loggedIN")) {%>
						<h3><a href="Logout">You already logged in, click here to logout</a></h3>
						<%}
						else{%>
						<div class="form_group">
								<label>Email</label>
								<div class="input_group">
									<input id="email" name="email" type="email" placeholder="email@contact.com" required>
									<i class="fa fa-user" aria-hidden="true"></i>
								</div>
								<!-- End of .input_group -->
							</div>
							<!-- End of .form_group -->

							<div class="form_group">
								<label>Password</label>
								<div class="input_group">
									<input id="password" name="password" type="password" required placeholder="********"> <i
										class="fa fa-lock" aria-hidden="true"></i>
								</div>
								
								<!-- End of .input_group -->
								<h5 style="color:red;">${login_error}</h5>
							</div>
							<!-- End of .form_group -->

							<!-- <div class="clear_fix">
								<a href="#" class="float_right">Forgot Password?</a>
							</div> -->
							<button type="submit" class="color1_bg tran3s">Login now</button>
							<%} %>
							
						</form>
					
					</div>
					<!-- End of .login_form -->

					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 register_form">
						<div class="theme-title">
							<h2>Register Here</h2>
						</div>
						<form action="InsurerRegister" method="post">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<div class="form_group">
										<label>Email Address</label>
										<div class="input_group">
											<input name="email" id="email" type="email" required> <i class="fa fa-envelope-o"
												aria-hidden="true"></i>
										</div>
										<!-- End of .input_group -->
									</div>
									
									<div class="form_group">
										<label>National ID</label>
										<div class="input_group">
											<input name="NationalID" id="NationalID" pattern="[0-9]{14,14}" required title="Enter a valid ID"> 
											<i class="fa fa-user" aria-hidden="true"></i>
										</div>
										<!-- End of .input_group -->
									</div>
									<!-- End of .form_group -->

									<div class="form_group">
										<label>Password</label>
										<div class="input_group">
											<input id="password" name="password" type="password" pattern="[^ ]{5,}" required title="Password min length 5 characters." > <i class="fa fa-lock"
												aria-hidden="true"></i>
										</div>
										<!-- End of .input_group -->
									</div>
									<div class="form_group">
										<label>Token</label>
										<div class="input_group">
											<input name="Token" id="Token" type="text" required> <i class="fa fa-location-arrow" aria-hidden="true"></i>
										</div>
										<!-- End of .input_group -->
									</div>
									<!-- End of .form_group -->

									
									<!-- End of .form_group -->
								</div>

								<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
									<div class="form_group">
										<label>Name</label>
										<div class="input_group">
											<input id="name" name="name" type="text" required> <i class="fa fa-user" aria-hidden="true"></i>
										</div>
										<!-- End of .input_group -->
									</div>
									<div class="form_group">
										<label>Phone Number</label>
										<div class="input_group">
											<input id="phoneNo" name="phoneNo" type="text" pattern="[0-9]{11,11}" required title="Enter a valid Phone Number"> <i class="fa fa-phone"
												aria-hidden="true"></i>
										</div>
										<!-- End of .input_group -->
									</div>
									<!-- End of .form_group -->

									<div class="form_group">
										<label>Address</label>
										<div class="input_group">
											<input name="address" id="address" type="text" required> <i class="fa fa-location-arrow" aria-hidden="true"></i>
										</div>
										<!-- End of .input_group -->
									</div>
									<!-- End of .form_group -->
									
									<!-- End of .form_group -->
								</div>
							</div>
							<!-- End of .row -->

						     <h4 style="color:red;">${Error}</h4>
							<button name="fetch" value="Register" class="color1_bg tran3s">Create Account</button>
						</form>
					</div>
					
					
					
					<!-- End of .register_form -->
				</div>
				<!-- End of .row -->
			</div>
			<!-- End of .container -->
		</div>
		<!-- End of .account_page -->



		<!-- Footer top -->
		<jsp:include page="Footer.jsp"/>
		<!-- footer-bottom -->

		<!--Scroll to top-->
		<div class="scroll-to-top scroll-to-target" data-target=".main-header">
			<span class="icon flaticon-arrows"></span>
		</div>


	
	
	
	<!-- jQuery js -->
	<script src="assets/jquery/jquery-2.1.4.js"></script>
	<!-- bootstrap js -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery ui js -->
	<script src="assets/jquery-ui-1.11.4/jquery-ui.js"></script>
	<!-- owl carousel js -->
	<script src="assets/owl.carousel-2/owl.carousel.min.js"></script>
	<!-- jQuery validation -->
	<script src="assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<!-- gmap.js helper -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRvBPo3-t31YFk588DpMYS6EqKf-oGBSI"></script>
	<!-- gmap.js -->
	<script src="assets/gmap.js"></script>
	<!-- mixit up -->
	<script src="assets/jquery.mixitup.min.js"></script>
	<script src="assets/jquery.fitvids.js"></script>
	<script src="assets/bootstrap-select.min.js"></script>

	<!-- revolution slider js -->
	<script src="assets/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script src="assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script
		src="assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script
		src="assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script
		src="assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script
		src="assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script
		src="assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script
		src="assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script
		src="assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script
		src="assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script
		src="assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

	<!-- fancy box -->
	<script src="assets/fancyapps-fancyBox/source/jquery.fancybox.pack.js"></script>
	<script
		src="assets/Polyglot-Language-Switcher-master/js/jquery.polyglot.language.switcher.js"></script>
	<script src="assets/nouislider/nouislider.js"></script>
	<script src="assets/bootstrap-touch-spin/jquery.bootstrap-touchspin.js"></script>
	<script src="assets/SmoothScroll.js"></script>

	<script src="assets/jquery-appear/jquery.appear.js"></script>
	<script src="assets/jquery.countTo.js"></script>
	<!-- theme custom js  -->
	<script id="map-script" src="js/default-map.js"></script>
	<script src="js/custom.js"></script>



</body>

<style>
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}</style>

<!-- Mirrored from iglyphic.com/themes/html/html_renter/account.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 11 Mar 2020 23:35:40 GMT -->
</html>
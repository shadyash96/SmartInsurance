<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="client.GetClientInfo"%>
	<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10"><![endif]-->
  <meta name="description" content="Insurance is HTML5, responsive website">
  <meta name="keywords" content="quotes on auto insurance, quote insurance, auto insurance online, online insurance, insurance agent, personal insurance, best car insurance,state insurance ">
  <meta name="author" content="iglyphic">
  <link rel="shortcut icon" href="images/favicon.png">
  <title>Insured | Items</title>

  <!--
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="description" content="Homely - Responsive Real Estate Template">
  <meta name="author" content="Rype Creative [Chris Gipple]">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insured| Items </title> -->

  <!-- CSS file links -->
  <link href="css1/bootstrap.min.css" rel="stylesheet" media="screen">
  <link href="assets1/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" media="screen">
  <link href="assets1/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet">
  <link href="assets1/slick-1.6.0/slick.css" rel="stylesheet">
  <link href="assets1/chosen-1.6.2/chosen.min.css" rel="stylesheet">
  <link href="css1/nouislider.min.css" rel="stylesheet">
  <link href="css1/style.css" rel="stylesheet" type="text/css" media="all" />
  <link href="css1/responsive.css" rel="stylesheet" type="text/css" media="all" />
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">

  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/responsive.css">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <div class="boxed_wrapper">

    <jsp:include page="../../header.jsp" />
    <%
    //0_Name, 1_Email, 2_Address, 3_Phone_No, 4_Identification_no
    Cookie[] cookies = request.getCookies();
    String SessionID=GetClientInfo.getSessionID(request.getCookies());
    String info[];
    info=GetClientInfo.getBasics(SessionID);
  //0_Category, 1_Details, 2_ItemValue, 3_Coverage, 4_Duration, 5_Payment Method, 
  		//6_Installment Duration, 7_Downpayment, 8_Condition, 9_Status, 10_Request_ID
   // ArrayList<String[]> InsuredItems=GetClientInfo.getInsuredItems(SessionID);
    %>
    <section class="subheader">
  <div class="container">
    <h1> User Profile</h1>
    <div class="breadcrumb right">Home <i class="fa fa-angle-right"></i> <a href="#" class="current">User Profile</a></div>
    <div class="clear"></div>
  </div>
</section>

<section class="module favorited-properties" style="background:#e7eef4;">
  <div class="container">

	<div class="row">
    		<div class="col-lg-3 col-md-3 sidebar-left">
    			<div class="widget member-card">
    				<div class="member-card-header">
    					<br><h3><%=info[0]%></h3>
    					<p><i class="fa fa-envelope icon"></i><%=info[1]%></p>
    				</div>
    				<jsp:include page="clientSideMenu.jsp">
    				 <jsp:param name="active" value="UserProfile"/>
    				</jsp:include>
    				
    				
    			</div>
    		</div>

		<div class="col-lg-9 col-md-9">

			<form action="clientChangeInfo" method="post">
			You are only allowed to change your phone no, address, and password.
				<div class="row">				
					<div class="col-lg-9 ">

						<div class="form-block">
							<label>Name</label>
							<input class="border" type="text" name="name" value="<%=info[0]%>" readonly />
						</div>
						<div class="form-block">
							<label>Email</label>
							<input class="border" type="text" name="email" value="<%=info[1]%>" readonly/>
						</div>
            <div class="form-block">
							<label>Address</label>
							<input class="border" type="text" name="address" value="<%=info[2]%>" />
						</div>
						<div class="form-block">
							<label>Phone</label>
							<input class="border" type="text" name="phone" pattern="[0-9]{11,11}" title="Enter a valid Phone Number" value="<%=info[3]%>" />
						</div>
						<div class="form-block">
							<label>National ID</label>
							<input class="border" type="text" name="ID" value="<%=info[4]%>" readonly/>
						</div>
					</div>
				</div><!-- end row -->

				<div class="row">
					<div class="col-lg-6" style="margin-top:10px;">
						<h4>Change Password</h4>
						<div class="divider"></div>

						<div class="form-block">
							<label>New Password</label>
							<input class="border" id="password" type="password" value="" name="new_pass" />
						</div>
						<script>
						setTimeout(
							    function() { $(':password').val(''); },
							    1000  //1,000 milliseconds = 1 second
							);</script>
						<div class="form-block">
							<label>Confirm New Password</label>
							<input class="border" type="password" id="confirmPassword" oninput="ConfirmPassword();" name="new_pass_confirm" />
							<br><h4 id="PasswordMessage"></h4>
						</div>
					</div>
				</div>
				<!-- end row -->
				<script>function ConfirmPassword(){
					//alert("test");
					if (document.getElementById("password").value==document.getElementById("confirmPassword").value)
						{document.getElementById("PasswordMessage").innerHTML="";
						document.getElementById("ButtonSub").disabled=false;
						}
					else{
						document.getElementById("PasswordMessage").innerHTML="Passwords dont match";
						document.getElementById("ButtonSub").disabled=true;
						}
				}</script>
				<div class="form-block" style="margin-top:10px;">
					<button type="submit" id="ButtonSub" class="button button-icon"><i class="fa fa-check"></i>Save Changes</button>
				</div>
				<h4>${message}</h4>
			</form>

		</div><!-- end col -->
	</div><!-- end row -->

  </div><!-- end container -->
</section>


	<!-- Footer top -->
	<footer class="footer has-black-color-overlay has-dark-texture">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="footer-widget about-widget">
						<a href="index.jsp"><img src="images/logo/logo2.png" alt="" /></a>
						<p>Renter is a global provider of Life insurance, annuities, employee benefits and assets management. Insurance has operations in nearly 50 countries serving approximately 100 million coustomers.</p>
						<ul class="list-inline social">
							<li>
								<a href="#"><i class="fa fa-facebook"></i></a>
							</li>
							<!-- comment for inline hack
                    -->
							<li>
								<a href="#"><i class="fa fa-twitter"></i></a>
							</li>
							<!-- comment for inline hack
                    -->
							<li>
								<a href="#"><i class="fa fa-skype"></i></a>
							</li>
							<!-- comment for inline hack
                    -->
							<li>
								<a href="#"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
					<!-- /.footer-widget about-widget -->
				</div>
				<!-- /.col-md-3 -->


				<div class="col-md-3 col-sm-6">
					<div class="footer-widget contact-widget">
						<div class="inner-title">
							<h3>Contact Details</h3>
							<span class="decor-line"></span>
						</div>
						<!-- /.sec-title-two -->
						<div class="footer-contact-info-carousel">
							<div class="item">
								<ul class="contact-infos">
									<li>
										<div class="icon-box">
											<i class="icon-geography"></i>
										</div>
										<!-- /.icon-box -->
										<div class="text-box">
											<p>26 Chatham Hill,Kent ME5,<br>London, United Kingdom.</p>
										</div>
										<!-- /.text-box -->
									</li>
									<li>
										<div class="icon-box">
											<i class="icon-technology-1"></i>
										</div>
										<!-- /.icon-box -->
										<div class="text-box">
											<p>+ (12) 123 - 5567123 <br>info@insurance.com</p>
										</div>
										<!-- /.text-box -->
									</li>
									<li>
										<div class="icon-box">
											<i class="icon-telephone-with-fax"></i>
										</div>
										<!-- /.icon-box -->
										<div class="text-box">
											<p>+(321) 58 759 89123</p>
										</div>
										<!-- /.text-box -->
									</li>
									<li>
										<div class="icon-box">
											<i class="icon-circular-wall-clock-for-livingroom"></i>
										</div>
										<!-- /.icon-box -->
										<div class="text-box">
											<p>Mon-Fri, 9am until 6pm</p>
										</div>
										<!-- /.text-box -->
									</li>
								</ul>
								<!-- /.contact-infos -->
							</div>
							<!-- /.item -->

						</div>
						<!-- /.contact-info-carousel owl-theme owl-carousel -->

					</div>
					<!-- /.footer-widget link-widget -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="footer-widget link-widget">
						<div class="inner-title">
							<h3><span class="white-color-text">Our Service</span></h3>
							<span class="decor-line"></span>
						</div>
						<!-- /.sec-title-two -->
						<ul class="links">
							<li><a href="#">Auto Insurance</a></li>
							<li><a href="#">Home Insurance</a></li>
							<li><a href="#">Life Insurance</a></li>
							<li><a href="#">Bike Insurance</a></li>
							<li><a href="#">Boat Insurance</a></li>
							<li><a href="#">Business Insurance</a></li>
						</ul>
						<!-- /.links -->
					</div>
					<!-- /.footer-widget link-widget -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="footer-widget subscribe-widget">
						<div class="inner-title">
							<h3>Subscribe us</h3>
							<span class="decor-line"></span>
						</div>
						<!-- /.sec-title-two -->
						<p class="highlight">Sign up today for tips and latest news and exclusive special offers.</p>
						<form action="#" class="clearfix mailchimp-form">
							<input type="text" name="email" placeholder="Email address" />
							<button type="submit"><i class="fa fa-envelope-o"></i></button>
						</form>
						<p class="highlight">We dont’t do spam and Your mail id very confidential.</p>
					</div>
					<!-- /.footer-widget link-widget -->
				</div>
				<!-- /.col-md-3 -->

			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</footer>
	<!-- End Footer top -->

	<!-- Start footer bottom -->
	<section class="footer-bottom">
		<div class="container">
			<div class="pull-left get-text">
				<ul>
					<li><a href="#">Cookies</a></li>
					<li><a href="#">Policies</a></li>
					<li><a href="#">Terms</a></li>
					<li><a href="#">Blog</a></li>
				</ul>
			</div>
			<!-- /.pull-right -->
			<div class="pull-right copy-text">
				<p>Copyright 2017 <a href="#">iGlyphic, All Right Reserved</a></p>
			</div>
			<!-- /.pull-left -->
		</div>
		<!-- /.container -->
	</section>
	<!-- footer-bottom -->

	<!--Scroll to top-->
	<div class="scroll-to-top scroll-to-target" data-target=".main-header"><span class="icon flaticon-arrows"></span>
	</div>


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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRvBPo3-t31YFk588DpMYS6EqKf-oGBSI"></script>
	<!-- gmap.js -->
	<script src="assets/gmap.js"></script>
	<!-- mixit up -->
	<script src="assets/jquery.mixitup.min.js"></script>
	<script src="assets/jquery.fitvids.js"></script>
	<script src="assets/bootstrap-select.min.js"></script>

	<!-- revolution slider js -->
	<script src="assets/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script src="assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

	<!-- fancy box -->
	<script src="assets/fancyapps-fancyBox/source/jquery.fancybox.pack.js"></script>
	<script src="assets/Polyglot-Language-Switcher-master/js/jquery.polyglot.language.switcher.js"></script>
	<script src="assets/nouislider/nouislider.js"></script>
	<script src="assets/bootstrap-touch-spin/jquery.bootstrap-touchspin.js"></script>
	<script src="assets/SmoothScroll.js"></script>

	<script src="assets/jquery-appear/jquery.appear.js"></script>
	<script src="assets/jquery.countTo.js"></script>
	<!-- theme custom js  -->
	<script id="map-script" src="js/default-map.js"></script>
	<script src="js/custom.js"></script>




<!-- JavaScript file links -->
<script src="js1/jquery-3.1.1.min.js"></script>      <!-- Jquery -->
<script src="assets1/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="js1/bootstrap.min.js"></script>  <!-- bootstrap 3.0 -->
<script src="assets1/slick-1.6.0/slick.min.js"></script> <!-- slick slider -->
<script src="assets1/chosen-1.6.2/chosen.jquery.min.js"></script> <!-- chosen - for select dropdowns -->
<script src="js1/isotope.min.js"></script> <!-- isotope-->
<script src="js1/wNumb.js"></script> <!-- price formatting -->
<script src="js1/nouislider.min.js"></script> <!-- price slider -->
<script src="assets1/html5lightbox/html5lightbox.js"></script> <!-- lightbox -->
<script src="js1/global.js"></script>


</body>
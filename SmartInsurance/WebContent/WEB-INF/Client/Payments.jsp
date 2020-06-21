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
  <title>Smart Insurance</title>

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
    //ArrayList<String[]> UpcomingPayments=GetClientInfo.getUpcomingPayments(SessionID);
    %>
    <input id="PhoneNo" required type="hidden" placeholder="" value="<%=info[3]%>" class="form-control">
    <section class="subheader">
      <div class="container">
        <h1>Payments</h1>
        <div class="breadcrumb right">Home <i class="fa fa-angle-right"></i> <a href="#" class="current">Payments</a></div>
        <div class="clear"></div>
      </div>
    </section>

    <section class="module my-properties" style="background:#e7eef4;">
      <div class="container">

    	<div class="row">
    		<div class="col-lg-3 col-md-3 sidebar-left">
    			<div class="widget member-card">
    				<div class="member-card-header">
    					<br><h3><%=info[0]%></h3>
    					<p><i class="fa fa-envelope icon"></i><%=info[1]%></p>
    				</div>
    				<jsp:include page="clientSideMenu.jsp">
    				 <jsp:param name="active" value="Payments"/>
    				</jsp:include>
    				
    				
    			</div>
    		</div>

    		<div class="col-lg-9 col-md-9">
    		<h3>Approved Requests</h3><br>
    			<table class="my-properties-list">
    			  <thead id="ApprovedRequestFirst">
                     
                   </thead>
    			      <tbody id="RequestsTable">
                                        </tbody>      
    			</table>
    			<br>
    		</div>
    		<br>
    		<div class="col-lg-9 col-md-9">
    		<h3>Installments</h3><br>
    			<table class="my-properties-list">
    			  <thead id="InstallmentFirst">
                                            
                                        </thead>
                                        <tbody id="InstallmentsTable">
                                           


                                        </tbody>  
    			</table>

    			
    		</div>
    		<!-- end col -->
    	</div><!-- end row -->

      </div><!-- end container -->
    </section>


  <jsp:include page="../../Footer.jsp"/>
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
<script src="cJS/ClientPayments.js"></script>







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

<!-- Mirrored from nightshiftcreative.co/static/homely/user-my-properties.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 15 Mar 2020 02:01:55 GMT -->
</html>

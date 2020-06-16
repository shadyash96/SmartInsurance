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
    ArrayList<String[]> InsuredItems=GetClientInfo.getClaimList(SessionID);
    %>
     <section class="subheader">
    <div class="container">
      <h1>Claim request</h1>
      <div class="breadcrumb right">Home <i class="fa fa-angle-right"></i> <a href="#" class="current">Claim Request</a></div>
      <div class="clear"></div>
    </div>
  </section>

  <section class="module property-submit" style="background:#e7eef4;">>
    <div class="container">

      <div class="row">
      <div class="col-lg-10 col-lg-offset-1">

      <form class="multi-page-form" action="clientMakeClaim" method="post">

        <div class="center">
          <div class="form-nav">
            <div class="form-nav-item completed"><span><i class="fa fa-check"></i></span><br/> Basic Info</div>
            <div class="form-nav-item"><span>2</span><br/> Documents</div>
            <div class="form-nav-item"><span>3</span><br/> Claim Value</div>
            <div class="clear"></div>
          </div>
        </div>

        <div class="multi-page-form-content active">

          <span class="button button-icon small right form-next"><i class="fa fa-angle-right"></i> Next</span>

          <table class="property-submit-title">
            <tr>
              <td><span class="property-submit-num">1</span></td>
              <td>
                <h4>Basic Info</h4>
              </td>
            </tr>
          </table>

              <div class="row">
                <div class="col-lg-6 col-md-6">

                </div>

              </div>

              <div class="row">

                <div class="col-lg-4 col-md-4">

                </div>
                <div class="col-lg-4 col-md-4">

                </div>
              </div>

              <div class="row">
                <div class="col-lg-6 col-md-6">

                </div>
                <div class="col-lg-6 col-md-6">

                </div>
              </div>
<!-- 0_Category, 1_Details, 2_Insurance ID-->   
              <div class="form-block border">
                    <label>Select an insured item</label>
                    <select id="Items" onchange="SelectionChange()" name="property-type" class="border">
                      <%for (int i=0;i<InsuredItems.size();i++){ %>
                      <option><%=InsuredItems.get(i)[0]+" > "+ InsuredItems.get(i)[1]%></option>
                      <%} %>
                    </select>
                    <%if (InsuredItems.size()<1) {%>
                    <h5>You don't have any insured items.</h5>
                    <%} %>
              </div>
<br>
              <div class="form-block">
                <label>Incident Description *</label>
                <textarea class="border" name="description" required></textarea>
              </div>
               <div style="visibility:hidden; width:1px;" class="form-block border">
                    <select id="InsuranceID" name="InsuranceID" style="height:1px;" name="ItemID" class="border">
                      <%for (int i=0;i<InsuredItems.size();i++){ %>
                      <option><%=InsuredItems.get(i)[2]%></option>
                      <%} %>
                    </select>
              </div>
              <script type="text/javascript">
              function SelectionChange(){
            	  document.getElementById("InsuranceID").selectedIndex=document.getElementById("Items").selectedIndex;
              }</script>

              <span class="button button-icon small right form-next"><i class="fa fa-angle-right"></i> Next</span>
              <div class="clear"></div>

        </div><!-- end basic info -->

        <div class="multi-page-form-content">

          <span class="button button-icon small right form-next"><i class="fa fa-angle-right"></i> Next</span>
          <span class="button button-icon small right form-prev"><i class="fa fa-angle-left"></i> Previous</span>

          <table class="property-submit-title">
            <tr>
              <td><span class="property-submit-num">2</span></td>
              <td>
                <h4>Documents</h4>
                <p>Please upload all related documents to a Google Drive folder and insert the link in the field below.</p>
              </td>
            </tr>
          </table>

          <div class="form-block">
            <label>Documents Link</label>
            <input class="border required" type="URL" name="DocumentsLink" />
          </div>
          <br/>

          

          <span class="button button-icon small right form-next"><i class="fa fa-angle-right"></i> Next</span>
          <span class="button button-icon small right form-prev"><i class="fa fa-angle-left"></i> Previous</span>
          <div class="clear"></div>
        </div><!-- end property images -->

       

        

        <div class="multi-page-form-content" id="owner-info">

          <span class="button button-icon small right form-prev"><i class="fa fa-angle-left"></i> Previous</span>

          <table class="property-submit-title">
            <tr>
              <td><span class="property-submit-num">3</span></td>
              <td>
                <h4>Claim Value</h4>
              </td>
            </tr>
          </table>


          <div class="form-block">
            <label>Claim Value*</label>
            <input required class="border required" type="number" name="ClaimValue" />
          </div>
          <br>

          <div class="center"><button type="submit" class="button button-icon large alt"><i class="fa fa-angle-right"></i> Submit Claim</button></div>
          <div class="clear"></div>
        </div><!-- end agent info -->

      </form>

    </div><!-- end col -->
    </div><!-- end row -->

    </div><!-- end container -->
  </section>




	<!-- Footer top -->
	<jsp:include page="Footer.jsp"/>
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
     <!-- Jquery -->
<script src="assets1/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="js1/bootstrap.min.js"></script>  <!-- bootstrap 3.0 -->
<script src="assets1/slick-1.6.0/slick.min.js"></script> <!-- slick slider -->
<script src="assets1/chosen-1.6.2/chosen.jquery.min.js"></script> <!-- chosen - for select dropdowns -->
<script src="js1/isotope.min.js"></script> <!-- isotope-->
<script src="js1/wNumb.js"></script> <!-- price formatting -->
<script src="js1/nouislider.min.js"></script> <!-- price slider -->
<!-- lightbox -->
<script src="js1/global.js"></script>


</body>

<!-- Mirrored from nightshiftcreative.co/static/homely/user-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 15 Mar 2020 02:01:56 GMT -->
</html>
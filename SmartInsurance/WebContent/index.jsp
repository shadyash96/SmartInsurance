<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.ByteArrayInputStream"%>
<%@ page import="connection.DatabaseConnection"%>

<!DOCTYPE html>
<html lang="en">




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
<script src="cJS/index.js?v=6"></script>

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


			<jsp:include page="header.jsp">
    				 <jsp:param name="active" value="index"/>
    				</jsp:include>
		<%
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
String nationalID="";
if (JSessionID!=null){
	Connection c= DatabaseConnection.getConnection();
	PreparedStatement ps=c.prepareStatement("select Type, Client_ID from Accounts where SessionID=?");
	ps.setString(1, JSessionID);
	ResultSet rs= ps.executeQuery();
	if (rs.next()){
		login=rs.getString(1);
		if (login.equals("Client")){
		ResultSet rss=c.prepareStatement("Select Identification_no from Clients where Client_ID="+rs.getInt(2)).executeQuery();	
		if (rss.next())
			nationalID=rss.getString(1);
		}
	}
	c.close();
}
%>
		<section class="rev_slider_wrapper ">
			<div id="slider1" class="rev_slider" data-version="5.0">
				<ul>
					<li data-transition="slidingoverlayleft"><img
						src="images/slider/1.png" alt="" width="1920" height="705"
						data-bgposition="top center" data-bgfit="cover"
						data-bgrepeat="no-repeat" data-bgparallax="1">
						<div class="tp-caption sfl tp-resizeme factory-caption-h1"
							data-x="right" data-hoffset="30" data-y="top" data-voffset="150"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							Take care of your family.<br /> Protect your family.
						</div>
						<div class="tp-caption sfl tp-resizeme factory-caption-p"
							data-x="right" data-hoffset="40" data-y="top" data-voffset="300"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							Plan ahead to help protect your family. <br />Life insurance
							helps provide some financial security.
						</div>
						<div class="tp-caption sfl tp-resizeme factory-caption-p"
							data-x="right" data-hoffset="437" data-y="top" data-voffset="400"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							<a href="#section1" class="thm-btn">Calculate premium</a>
						</div>
						<div class="tp-caption sfl tp-resizeme factory-caption-p"
							data-x="right" data-hoffset="240" data-y="top" data-voffset="400"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							<a style="cursor:pointer;" onclick="redirect('MakeClaim','Client')" class="thm-btn thm-tran-bg">Make
								a claim</a>
						</div></li>
					<li data-transition="slidingoverlayleft"><img
						src="images/slider/2.png" alt="" width="1920" height="705"
						data-bgposition="top center" data-bgfit="cover"
						data-bgrepeat="no-repeat" data-bgparallax="2">

						<div class="tp-caption sfl tp-resizeme factory-caption-h1"
							data-x="left" data-hoffset="0" data-y="top" data-voffset="210"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							Insurances do matter<br>Quality and Best Service
						</div>
						<div class="tp-caption sfl tp-resizeme factory-caption-p"
							data-x="left" data-hoffset="0" data-y="top" data-voffset="375"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							Insurance best-in-class products and services <br /> help
							provide innovative protection
						</div>
						<div class="tp-caption sfl tp-resizeme factory-caption-p"
							data-x="left" data-hoffset="-29" data-y="top" data-voffset="475 "
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							<a href="#section1" class="thm-btn">Calculate premium</a>
						</div>
						<div class="tp-caption sfl tp-resizeme factory-caption-p"
							data-x="left" data-hoffset="190" data-y="top" data-voffset="475"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							<a style="cursor:pointer;" onclick="redirect('MakeClaim','Client')" class="thm-btn thm-tran-bg">Make a
								claim</a>
						</div></li>
					<li data-transition="slidingoverlayleft"><img
						src="images/slider/3.png" alt="" width="1920" height="705"
						data-bgposition="top center" data-bgfit="cover"
						data-bgrepeat="no-repeat" data-bgparallax="2">

						<div
							class="tp-caption sfl tp-resizeme factory-caption-h1 text-center"
							data-x="center" data-hoffset="0" data-y="top" data-voffset="210"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							Life insurances for <br>Your Family
						</div>
						<div
							class="tp-caption sfl tp-resizeme factory-caption-p text-center"
							data-x="center" data-hoffset="0" data-y="top" data-voffset="375"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							Insurance best-in-class products and services <br /> help
							provide innovative protection.
						</div>
						<div
							class="tp-caption sfl tp-resizeme factory-caption-p text-center"
							data-x="center" data-hoffset="-110" data-y="top"
							data-voffset="475" data-whitespace="nowrap"
							data-transform_idle="o:1;" data-transform_in="o:0"
							data-transform_out="o:0" data-start="500">
							<a href="#section1" class="thm-btn">Calculate Premium</a>
						</div>
						<div
							class="tp-caption sfl tp-resizeme factory-caption-p text-center"
							data-x="center" data-hoffset="94" data-y="top" data-voffset="475"
							data-whitespace="nowrap" data-transform_idle="o:1;"
							data-transform_in="o:0" data-transform_out="o:0" data-start="500">
							<a style="cursor:pointer;" onclick="redirect('MakeClaim','Client')" class="thm-btn thm-tran-bg">Make a
								claim</a>
						</div></li>
				</ul>
			</div>
		</section>





		<section class="our-services">
			<div class="container">
				<div class="section-title">
					<div class="row">
						<div class="col-md-4 col-sm-5 col-xs-12">
							<div class="title-section text-left">
								<p>Best Service</p>
								<h2>Insurance Coverage</h2>
							</div>
						</div>
						<div class="col-md-8 col-sm-7 col-xs-12 font-20">
							<p>When you truly love your family, your assets or your
								business, you protect them as best you can.We operate globally
								and locally, according to our customers’ needs.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-sm-6">
						<div class="single-our-service">
							<figure class="img-box">
								<a href="#"><img src="images/service/auto-insurance.png"
									alt="Awesome Image" /></a>
							</figure>
							<a href="#">
								<h4>Auto Insurance</h4>
							</a>
							<p>Auto insurance gives you quality protection at a great
								price. Every policy comes with the support of a knowledgeable
								and friendly Allstate agent.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="single-our-service">
							<figure class="img-box">
								<a href="#"><img src="images/service/home-insurance.png"
									alt="Awesome Image" /></a>
							</figure>
							<a href="#">
								<h4>Home Insurance</h4>
							</a>
							<p>Protect your home inside and out with a homeowners
								insurance policy from Insurance.Put it in Good Hands.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="single-our-service">
							<figure class="img-box">
								<a href="#"><img src="images/service/life-insurance.png"
									alt="Awesome Image" /></a>
							</figure>
							<a href="#">
								<h4>Get Life Insurance</h4>
							</a>
							<p>Plan ahead to help protect your family. Life insurance
								helps provide some financial security, so there's a way to help
								your family cover mortgage.</p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="separet"></div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="single-our-service">
							<figure class="img-box">
								<a href="#"><img src="images/service/bike-insurance.png"
									alt="Awesome Image" /></a>
							</figure>
							<a href="#">
								<h4>Bike Insurance</h4>
							</a>
							<p>Whether you're enjoying a long summer time ride, or have
								your bike stored away for the winter, an Insurance motorcycle
								insurance policy can help protect you and your motorcycle.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="single-our-service">
							<figure class="img-box">
								<a href="#"><img src="images/service/boat-insurance.png"
									alt="Awesome Image" /></a>
							</figure>
							<a href="#">
								<h4>Boat Insurance</h4>
							</a>
							<p>Even if you're not required to have boat insurance, it's
								important to protect your boat and your crew from harm. You can
								get that dependable coverage from Insurance at a surprisingly
								affordable price.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="single-our-service">
							<figure class="img-box">
								<a href="#"><img src="images/service/business-insurance.png"
									alt="Awesome Image" /></a>
							</figure>
							<a href="#">
								<h4>Business Insurance</h4>
							</a>
							<p>As a small business owner, you face a variety of unique
								challenges and circumstances. Having secure, personalized
								business insurance can offer invaluable protection and peace of
								mind.</p>
						</div>
					</div>

				</div>
			</div>
		</section>


		<section id="section1" class="contact-section"
			style="background: url(images/background/contact.png);">
			<div class="container">

				<div class="row">
					<div class="col-md-6">
						<div class="section-title">
							<h2>Calculate Premium!</h2>
						</div>
						<!--<p><span>For Insurance: </span> For Insurance inquiry fill our short feedback form or you can also send us an email and we’ll get in touch shortly, or Troll Free Number - (+91) 00-700-1234.</p> -->
						<p>
							<span>Note: </span> Your details are kept strictly confidential
							as per our Company Privacy Policy.
						</p>
					</div>

					<div
						class="column form-column col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<!--form-box-->
						<div class="form-box default-form">
							<div class="default-form">
								<form id="form" class="home-contact-form  select-form" action="InsuranceRequest" method="post" onsubmit="return validateForm();">
									<div class="row clearfix">
									<%if (nationalID.length()>3){ %>
										<div class="form-group col-md-12 col-sm-12 col-xs-12">
										<label style="color: #fff;">National ID</label>
											<input type="text" readonly name="national_id" value="<%=nationalID %>"
												placeholder="National Id">
										</div>
										<%} %>
										<div id="divCont"
											class="form-group col-md-12 col-sm-12 col-xs-12">
											<div class="g-input f1 mb-30">
											<label style="color: #fff;">Product categories</label>
												<select id="Categories" name="Categories"
													onchange="CategoryChange();"
													class="text-capitalize selectpicker" data-style="g-select"
													data-width="100%">
												</select>
											</div>
										</div>
										<div class="form-group col-md-12 col-sm-12 col-xs-12">
											<label class="row" style="color: #fff;">Condition </label>
											<div class="form-group">
												<div class="col-sm-3">
													<label class="radio-inline" style="color: #fff;"> <input
														name="condition" id="condition" value="new" type="radio"
														checked onchange="ConditionChange('new');" />New
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline" style="color: #fff;"> <input
														name="condition" id="condition" value="used" type="radio"
														onchange="ConditionChange('used');" />Used
													</label>
												</div>
											</div>
										</div>
										<div id="UsedCont"></div>
										<div id="UsedCalculateButton"
											class="form-group col-md-6 col-sm-6 col-xs-12"
											style="display: none;">
											<button class="thm-btn" style="height:77px;" type="button" onclick="getPrice();">Calculate Price</button>
										</div>
										<div class="form-group col-md-6 col-sm-6 col-xs-12">
										<label style="color: #fff;">Product Price</label>
											<input readonly type="number" id="ProductPrice" name="ProductPrice"
												placeholder="Product Current Price"
												onchange="PriceChange();">
										</div>


										<div class="form-group col-md-6 col-sm-6 col-xs-12">
										<label style="color: #fff;">Coverage Percentage</label>
											<input id="CoveragePercentage" name="CoveragePercentage" type="number"
												placeholder="Coverage Percentage" value="">
										</div>

										<div class="form-group col-md-6 col-sm-6 col-xs-12">
										<label style="color: #fff;">Insurance Duration</label>
											<input id="InsuranceDuration" name="InsuranceDuration" type="number"
												placeholder="Insurance Duration in Months">
										</div>

										<div class="form-group col-md-12 col-sm-12 col-xs-12">
											<label class="row" style="color: #fff;">Payment Type:</label>
											<div class="form-group">
												<div class="col-sm-3">
													<label class="radio-inline" style="color: #fff;"> <input
														name="PaymentType" id="PaymentType" value="cash"
														onchange="InstallmentChange();" type="radio" checked />Cash
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline" style="color: #fff;"> <input
														name="PaymentType" id="PaymentType" value="installment"
														onchange="InstallmentChange();" type="radio" />Installment
													</label>
												</div>
											</div>
										</div>
										<div id="InstallmentCont" style="display: none;">
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
											<label style="color: #fff;">Installment Downpayment</label>
												<input id="InstallmentDownpayment" name="InstallmentDownpayment" type="number"
													placeholder="Installment Downpayment">
											</div>
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
											<label style="color: #fff;">Installment Duration</label>
												<input id="InstallmentDuration" name="InstallmentDuration" type="number"
													placeholder="Installment Duration in Months">
											</div>
										</div>
										<input type="hidden" id="NewPriceMode" name="NewPriceMode">
										<input type="hidden" id="UsedPriceMode" name="UsedPriceMode">
										<input type="hidden" id="rate" name="rate"> 
										<input type="hidden" id="DownpaymentPerc" name="DownpaymentPerc">
										<input type="hidden" id="InitialPremium">
										<input type="hidden" id="Inst_Interest_Month"
											name="Inst_Interest_Month">
										<div class="form-group col-md-6 col-sm-6 col-xs-12">
											<button type="button" class="thm-btn"
												onclick="CalculatePremium();">Calculate Premium</button>
										</div>
										<div class="form-group col-md-6 col-sm-6 col-xs-12">
											<input id="PremiumValue" name="PremiumValue" type="text" value="" placeholder="Premium Quotation" readonly>
										</div>
										<%if (login.equals("Client")) {%>
										<button type="submit" id="SubmitRequestBut" class="thm-btn sub">Submit Request</button>
										<%}%>
										
									</div>
								</form>
								<%if (!login.equals("Client")) {%>
										<h5 style="color:white;">Login to submit an insurance request</h5>
										<%}%>
						
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!--
	<section class="our-team">
		<div class="container">
			<div class="section-title">
				<div class="row">
					<div class="col-md-4 col-sm-5 col-xs-12">
						<div class="title-section text-left">
							<p>Best Team</p>
							<h2>Insurance Agent</h2>
						</div>
					</div>
					<div class="col-md-8 col-sm-7 col-xs-12 font-20">
						<p>Our multi-faceted, insurance services team is made up of over 150 experts<br> that can complement both your in-house teams and spearhead your query at all levels.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="single-team-member">
						<figure class="img-box">
							<a href="#"><img src="images/team/img-team-2.jpg" alt=""></a>
						</figure>
						<h4>John Harris</h4>
						<a href="#">
							<p class="position">CEO & Founder</p>
						</a>
						<ul class="list-inline social">
							<li>
								<a href="#"><i class="fa fa-facebook"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-twitter"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-skype"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="single-team-member">
						<figure class="img-box">
							<a href="#"><img src="images/team/img-team-1.jpg" alt=""></a>
						</figure>
						<h4>John Connor</h4>
						<a href="#">
							<p class="position">Agent</p>
						</a>
						<ul class="list-inline social">
							<li>
								<a href="#"><i class="fa fa-facebook"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-twitter"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-skype"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="single-team-member">
						<figure class="img-box">
							<a href="#"><img src="images/team/img-team-3.jpg" alt=""></a>
						</figure>
						<h4>Natalie Williams</h4>
						<a href="#">
							<p class="position">Agent</p>
						</a>
						<ul class="list-inline social">
							<li>
								<a href="#"><i class="fa fa-facebook"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-twitter"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-skype"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="single-team-member">
						<figure class="img-box">
							<a href="#"><img src="images/team/img-team-4.jpg" alt=""></a>
						</figure>
						<h4>Mark Thornton</h4>
						<a href="#">
							<p class="position">Agent</p>
						</a>
						<ul class="list-inline social">
							<li>
								<a href="#"><i class="fa fa-facebook"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-twitter"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-skype"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="single-team-member">
						<figure class="img-box">
							<a href="#"><img src="images/team/img-team-5.jpg" alt=""></a>
						</figure>
						<h4>Jennifer Healy</h4>
						<a href="#">
							<p class="position">Agent</p>
						</a>
						<ul class="list-inline social">
							<li>
								<a href="#"><i class="fa fa-facebook"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-twitter"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-skype"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="single-team-member">
						<figure class="img-box">
							<a href="#"><img src="images/team/img-team-6.jpg" alt=""></a>
						</figure>
						<h4>Marie Collins</h4>
						<a href="#">
							<p class="position">Agent</p>
						</a>
						<ul class="list-inline social">
							<li>
								<a href="#"><i class="fa fa-facebook"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-twitter"></i></a>
							</li>

							<li>
								<a href="#"><i class="fa fa-skype"></i></a>
							</li>


							<li>
								<a href="#"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
				</div>


			</div>
		</div>
	</section>
    -->



		<!--<section class="image-bg-wrapper counting-wrapper" style="background-image:url('images/about-us-image-bg.jpg');">

		<div class="container mt-15">

			<div class="row">

				<div class="col-md-10 col-md-offset-1">

					<div class="row">

						<div class="col-xs-6 col-sm-6 col-md-3">

							<div class="counting-item">

								<div class="counting-number h1"><span class="counter" data-decimal-delimiter="," data-thousand-delimiter="," data-value="987"></span></div>

								Satisfied Customers

							</div>

						</div>

						<div class="col-xs-6 col-sm-6 col-md-3">

							<div class="counting-item">

								<div class="counting-number h1"><span class="counter" data-decimal-delimiter="," data-thousand-delimiter="," data-value="6"></span></div>

								Professional Agents

							</div>

						</div>

						<div class="col-xs-6 col-sm-6 col-md-3">

							<div class="counting-item">

								<div class="counting-number h1"><span class="counter" data-decimal-delimiter="," data-thousand-delimiter="," data-value="6"></span></div>

								Insurances in our offer

							</div>

						</div>

						<div class="col-xs-6 col-sm-6 col-md-3">

							<div class="counting-item">

								<div class="counting-number h1"><span class="counter" data-decimal-delimiter="," data-thousand-delimiter="," data-value="10"></span></div>

								Years of experience

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

	</section> -->


		<!--	<section class="testimonials-section">
		<div class="container">
			<div class="section-title">
				<div class="row">
					<div class="col-md-4 col-sm-5 col-xs-12">
						<div class="title-section text-left">
							<p>Best Review</p>
							<h2>Clients Testimonials</h2>
						</div>
					</div>
					<div class="col-md-8 col-sm-7 col-xs-12 font-20">
						<p>We help interesting companies create and bonding long time relationship and <br> services through long lasting and mutually rewarding relationships.</p>
					</div>
				</div>
			</div>


			<div class="testimonials-slider column-carousel three-column">


				<article class="slide-item">
					<div class="quote"><span class="fa fa-quote-right"></span></div>
					<div class="author">
						<div class="img-box">
							<a href="#"><img src="images/resource/t1.png" alt=""></a>
						</div>
						<h4>John Doe</h4>
						<a href="#">
							<p>CEO, HamilTon</p>
						</a>
					</div>

					<div class="slide-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat vitae neque eu eleifend.Nulla pharetra bibendum magna at hendrerit. Nam sed ligula placerat.</p>
					</div>
				</article>


				<article class="slide-item">
					<div class="quote"><span class="fa fa-quote-right"></span></div>
					<div class="author">
						<div class="img-box">
							<a href="#"><img src="images/resource/t2.png" alt=""></a>
						</div>
						<h4>Stephanie Gomez</h4>
						<a href="#">
							<p>CTO, Bikon</p>
						</a>
					</div>

					<div class="slide-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat vitae neque eu eleifend.Nulla pharetra bibendum magna at hendrerit. Nam sed ligula placerat.</p>
					</div>
				</article>


				<article class="slide-item">
					<div class="quote"><span class="fa fa-quote-right"></span></div>
					<div class="author">
						<div class="img-box">
							<a href="#"><img src="images/resource/t3.png" alt=""></a>
						</div>
						<h4>Clinton Doe</h4>
						<a href="#">
							<p>Project Manager, Kick</p>
						</a>
					</div>

					<div class="slide-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat vitae neque eu eleifend.Nulla pharetra bibendum magna at hendrerit. Nam sed ligula placerat.</p>
					</div>
				</article>

				<article class="slide-item">
					<div class="quote"><span class="fa fa-quote-right"></span></div>
					<div class="author">
						<div class="img-box">
							<a href="#"><img src="images/resource/t1.png" alt=""></a>
						</div>
						<h4>Mark Vou</h4>
						<a href="#">
							<p>Team Lead, Shelter</p>
						</a>
					</div>

					<div class="slide-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat vitae neque eu eleifend.Nulla pharetra bibendum magna at hendrerit. Nam sed ligula placerat.</p>
					</div>
				</article>


				<article class="slide-item">
					<div class="quote"><span class="fa fa-quote-right"></span></div>
					<div class="author">
						<div class="img-box">
							<a href="#"><img src="images/resource/t2.png" alt=""></a>
						</div>
						<h4>Stephanie Doe</h4>
						<a href="#">
							<p>CTO, Biko</p>
						</a>
					</div>

					<div class="slide-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat vitae neque eu eleifend.Nulla pharetra bibendum magna at hendrerit. Nam sed ligula placerat.</p>
					</div>
				</article>


				<article class="slide-item">
					<div class="quote"><span class="fa fa-quote-right"></span></div>
					<div class="author">
						<div class="img-box">
							<a href="#"><img src="images/resource/t3.png" alt=""></a>
						</div>
						<h4>Clinton Josh</h4>
						<a href="#">
							<p>FEA Org.</p>
						</a>
					</div>

					<div class="slide-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat vitae neque eu eleifend.Nulla pharetra bibendum magna at hendrerit. Nam sed ligula placerat.</p>
					</div>
				</article>

				<article class="slide-item">
					<div class="quote"><span class="fa fa-quote-right"></span></div>
					<div class="author">
						<div class="img-box">
							<a href="#"><img src="images/resource/t1.png" alt=""></a>
						</div>
						<h4>Mark Doe</h4>
						<a href="#">
							<p>Programmer, CEFALO</p>
						</a>
					</div>

					<div class="slide-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat vitae neque eu eleifend.Nulla pharetra bibendum magna at hendrerit. Nam sed ligula placerat.</p>
					</div>
				</article>


				<article class="slide-item">
					<div class="quote"><span class="fa fa-quote-right"></span></div>
					<div class="author">
						<div class="img-box">
							<a href="#"><img src="images/resource/t2.png" alt=""></a>
						</div>
						<h4>Stephanie Hasan</h4>
						<a href="#">
							<p>Relish</p>
						</a>
					</div>

					<div class="slide-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat vitae neque eu eleifend.Nulla pharetra bibendum magna at hendrerit. Nam sed ligula placerat.</p>
					</div>
				</article>


				<article class="slide-item">
					<div class="quote"><span class="fa fa-quote-right"></span></div>
					<div class="author">
						<div class="img-box">
							<a href="#"><img src="images/resource/t3.png" alt=""></a>
						</div>
						<h4>Simon Gomez</h4>
						<a href="#">
							<p>NewsCread</p>
						</a>
					</div>

					<div class="slide-text">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat vitae neque eu eleifend.Nulla pharetra bibendum magna at hendrerit. Nam sed ligula placerat.</p>
					</div>
				</article>


			</div>

		</div>
	</section> -->


		<!--	<section class="clients-section">
		<div class="container">
			<div class="client-carousel owl-carousel owl-theme">
				<div class="item">
					<img src="images/clients/1.png" alt="Insurance Image" />
				</div>
				<div class="item">
					<img src="images/clients/2.png" alt="Insurance Image" />
				</div>
				<div class="item">
					<img src="images/clients/3.png" alt="Insurance Image" />
				</div>
				<div class="item">
					<img src="images/clients/4.png" alt="Insurance Image" />
				</div>
				<div class="item">
					<img src="images/clients/5.png" alt="Insurance Image" />
				</div>
			</div>
		</div>
	</section> -->

		<section class="news">
			<div class="container">
				<div class="section-title">
					<div class="row">
						<div class="col-md-4 col-sm-5 col-xs-12">
							<div class="title-section text-left">
								<p>News Feed</p>
								<h2>Latest news</h2>
							</div>
						</div>
						<div class="col-md-8 col-sm-7 col-xs-12 font-20">
							<p>The Insurance Corporation is the largest publicly held
								personal lines property and casualty insurer in America, serving
								more than 16 million households nationwide.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="blogList_single_post clear_fix wow fadeInUp"
							style="visibility: visible; animation-name: fadeInUp;">
							<div class="img_holder">
								<img src="images/blog/blog1.jpg" alt="News"
									class="img-responsive">
							</div>

							<div class="post">
								<div class="news-date">August 20, 2017</div>
								<div class="text">
									<p class="author">
										<a href="#">by John Doe</a>
									</p>
									<h4>
										<a href="blog-details.html">Life Insurance for the Stages
											of Your Life</a>
									</h4>
									<p>Plan ahead to help protect your family. Life insurance
										helps provide some financial security, so there's a way to
										help your family.</p>
									<div class="link">
										<a href="#" class="tran3s">Ream More...</a>
									</div>

								</div>

							</div>

						</div>

					</div>
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="blogList_single_post clear_fix wow fadeInUp"
							style="visibility: visible; animation-name: fadeInUp;">
							<div class="img_holder">
								<img src="images/blog/blog2.jpg" alt="News"
									class="img-responsive">
							</div>

							<div class="post">
								<div class="news-date">August 25, 2017</div>
								<div class="text">
									<p class="author">
										<a href="#">by Simon Gomez</a>
									</p>
									<h4>
										<a href="blog-details.html">Matching Life Insurance to
											Your Needs</a>
									</h4>
									<p>Plan ahead to help protect your family. Life insurance
										helps provide some financial security, so there's a way to
										help your family.</p>
									<div class="link">
										<a href="#" class="tran3s">Ream More...</a>
									</div>

								</div>

							</div>

						</div>

					</div>
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="blogList_single_post clear_fix wow fadeInUp"
							style="visibility: visible; animation-name: fadeInUp;">
							<div class="img_holder">
								<img src="images/blog/blog3.jpg" alt="News"
									class="img-responsive">
							</div>

							<div class="post">
								<div class="news-date">September 20, 2017</div>
								<div class="text">
									<p class="author">
										<a href="#">by John Terry</a>
									</p>
									<h4>
										<a href="blog-details.html">Understanding the types of
											life insurance</a>
									</h4>
									<p>Plan ahead to help protect your family. Life insurance
										helps provide some financial security, so there's a way to
										help your family.</p>
									<div class="link">
										<a href="#" class="tran3s">Ream More...</a>
									</div>

								</div>

							</div>

						</div>

					</div>

				</div>
			</div>
		</section>


		<!-- Footer top -->
		<jsp:include page="Footer.jsp"/>
		<!-- footer-bottom -->

		<!--Scroll to top-->
		<div class="scroll-to-top scroll-to-target" data-target=".main-header">
			<span class="icon flaticon-arrows"></span>
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
	<!-- mixit up -->
	<script src="assets/wow.js"></script>
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

	<script type="text/javascript"
		src="assets/counter/jquery.countimator.js"></script>
	<script type="text/javascript"
		src="assets/counter/jquery.countimator.wheel.js"></script>

	<!-- theme custom js  -->
	<script id="map-script" src="js/default-map.js"></script>
	<script src="js/custom.js"></script>

	<script type="text/javascript">
		$(".counter").countimator();
	</script>



</body>



<!-- Mirrored from iglyphic.com/themes/html/html_renter/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 11 Mar 2020 23:25:51 GMT -->
</html>
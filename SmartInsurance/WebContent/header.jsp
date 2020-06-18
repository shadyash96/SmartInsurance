<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.ByteArrayInputStream"%>
<%@ page import="connection.DatabaseConnection"%>
<!DOCTYPE html>
<html>
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
if (JSessionID!=null){
	Connection c= DatabaseConnection.getConnection();
	PreparedStatement ps=c.prepareStatement("select Type from Accounts where SessionID=?");
	ps.setString(1, JSessionID);
	ResultSet rs= ps.executeQuery();
	if (rs.next()){
		login=rs.getString(1);
	}
	c.close();
}
%>
<!-- Start header top -->
<header class="main-header">
	<div class="header-top">
		<div class="container">
			<!--Top Left-->
			<div class="top-left pull-left">
				<ul class="links-nav clearfix">
					<li><a href="#">Smart Insurance , the best you can get!</a></li>
				</ul>
			</div>

			<!--Top Right-->
			<div class="top-right pull-right">
				<ul class="links-nav clearfix">
				<%if (!login.equals("null")){ %>
					<li><a href="Logout">Logout</a></li><%} 
					else {%>
					<!-- <li><a href="clientLogin-Register.jsp">Login/Register</a></li> -->
					<%} %>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="header-upper">
		<div class="container">
			<div class="clearfix">

				<div class="pull-left logo-outer">
					<div class="logo">
						<a href="index.jsp"><img src="images/logo/logo.png"
							alt="Renter" title="Insurance Company"></a>
					</div>
				</div>

				<!--	<div class="pull-right upper-right clearfix">


						<div class="upper-column info-box">
							<div class="icon-box"><span class="icon-location-pin"></span></div>
							Address : <span class="light-text">26 sheikh zayed, <br>cairo, EG</span>
						</div>


						<div class="upper-column info-box">
							<div class="icon-box"><span class="icon-geography"></span></div>
							Call Us : <span class="light-text">+ (12) 123 - 5567123</span> <br>Mail Us : <span class="light-text">SMART@insurance.com</span>

						</div>


						<div class="upper-column info-box">
							<div class="icon-box"><span class="icon-chronometer-outline"></span></div>
							Office Time : <span class="light-text">Monday to <br>Sunday 09:00 - 20:00</span>
						</div>


					</div> -->

			</div>
		</div>
	</div>

</header>
<!-- End header top -->
<%String active=request.getParameter("active"); 
if (active==null)
active=" ";%>
<!-- Start nav menu -->
<section class="mainmenu-wrapper stricky">
	<div class="container">
		<nav class="mainmenu-holder pull-left">
			<div class="nav-header">
				<ul class="navigation">
					<li class="<%=active.equalsIgnoreCase("index")?"active":""%>"><a href="index.jsp">Home</a></li>
					<li class="<%=active.equalsIgnoreCase("about")?"active":""%>"><a href="about.jsp">About</a>
						</li>
					<li class="dropdown"><a style="cursor:pointer;">Client
							Portal</a>
						<ul class="submenu">
						<% if (login.equals("Client")){%>
							<li><a style="cursor:pointer;" onclick="redirect('clientProfile','Client')">User Info</a></li>
							<li><a style="cursor:pointer;" onclick="redirect('insuredItems','Client')">Insured Items</a></li>
							<li><a style="cursor:pointer;" onclick="redirect('Payments','Client')">Payments</a></li>
							<li><a style="cursor:pointer;" onclick="redirect('MakeClaim','Client')">Claim Request</a></li>
							<%}
						else{%>
						<li><a href="ClientLogin.jsp">Login/Register</a></li>
						<%} %>
						</ul></li>
					<li class="dropdown"><a style="cursor:pointer;">Insurer Portal</a>
						<ul class="submenu">
						<% if (login.equals("Insurer")){%>
							<li><a href="#" onclick="redirect('InsurerDashboard','Insurer')">Portal</a></li>
								<%}
						else{%>
						<li><a href="InsurerLogin.jsp">Login/Register</a></li>
						<%} %>
						</ul></li>
					<!--	<li class="dropdown">
							<a href="blog.html">Blog</a>
							<ul class="submenu">
								<li><a href="blog-Standard.html">Blog Standard</a></li>
								<li><a href="blog-list-sidebar.html">Blog With Sidebar</a></li>
								<li><a href="blog-grid.html">Blog Grid</a></li>
								<li><a href="blog-details.html">Blog Single</a></li>
							</ul>
						</li> -->
					<!--	<li class="dropdown">
							<a href="shop.html">Shop</a>
							<ul class="submenu">
								<li><a href="shop.html">Shop With Sidebar</a></li>
								<li><a href="shop-single.html">Product Detail</a></li>
								<li><a href="shop-cart.html">Cart Page</a></li>
								<li><a href="checkout.html">Checkout Page</a></li>
								<li><a href="account.html">My Account</a></li>
							</ul>
						</li> -->
					
				</ul>
			</div>
			<div class="nav-footer hidden-lg">
				<ul>
					<li><button class="menu-expander">
							<i class="fa fa-list-ul"></i>
						</button></li>
				</ul>
			</div>
		</nav>
		<div class="get-appt pull-right">
			<a href="#section1" class="appt-btn theme-btn">Calculate Premium!</a>
		</div>
		<!--<div class="search-box pull-right">
				<form action="#" class="clearfix">
					<input type="text" placeholder="Search">
					<button><i class="fa fa-search"></i></button>
				</form>

			</div> -->
	</div>
</section>
<!-- End nav menu -->
</html>
<script src="cJS/Redirect.js"></script>
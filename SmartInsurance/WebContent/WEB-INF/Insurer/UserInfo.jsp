<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.ByteArrayInputStream"%>
<%@ page import="connection.DatabaseConnection"%>

<!doctype html>

<html class="no-js" lang="">
<%String ClientID="";
ClientID=request.getParameter("ClientID");
String Name="",ID="",Email="",Address="",Phone="";
Connection c=DatabaseConnection.getConnection();
if (ClientID!=null){
	PreparedStatement ps=c.prepareStatement("Select Name, Identification_no, Email, Address, Phone_No from Clients where Client_ID=?");
	ps.setInt(1,Integer.parseInt(ClientID));
	ResultSet rs=ps.executeQuery();
	rs.next();
	Name=rs.getString(1);
	ID=rs.getString(2);
	Email=rs.getString(3);
	Address=rs.getString(4);
	Phone=rs.getString(5);
}
c.close();%>
<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/account-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:54 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AKKHOR | Account Setting</title>
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
    <!-- Animate CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/animate.min.css">
    <!-- Select 2 CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/select2.min.css">
    <!-- Date Picker CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/datepicker.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="insurerCSS/style.css">
    <!-- Modernize js -->
    <script src="insurerCSS/js2/modernizr-3.6.0.min.js"></script>
</head>

<body>
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <div id="wrapper" class="wrapper bg-ash">
      <!-- Header Menu Area Start Here -->
       
          <jsp:include page="InsurerSideMenu.jsp">
    				 <jsp:param name="active" value="UserInfo"/>
    				</jsp:include>
    		
          <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Clients</h3>
                    <ul>
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>Clients</li>
                        
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- Account Settings Area Start Here -->
                <div class="row">

                   <div class="container">
                                      <div class="row menu-page">



                                        </div>




                                   <div>
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Mobile Number*</label>
                                          <input id="PhoneNo" required type="number" value="<%=Phone %>" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-12 form-group mg-t-8">
                                        <button id="ClientInfoSubmit" type="submit" onclick="getClientInfo()" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Submit</button>
                                      </div>

                                    </div>

                                    </div>
                    <div class="col-8-xxxl col-xl-7">
                        <div class="card account-settings-box">
                            <div class="card-body">
                                <div class="heading-layout1 mg-b-20">
                                    <div class="item-title">
                                        <h3>Client Details</h3>
                                    </div>
                                   
                                </div>
                                <div class="user-details-box">
                                    <div class="item-content">
                                        <div class="info-table table-responsive">
                                            <table class="table text-nowrap">
                                                <tbody>
                                                    <tr>
                                                        <td>Name:</td>
                                                        <td class="font-medium text-dark-medium"><%=Name %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>ID no:</td>
                                                        <td class="font-medium text-dark-medium"><%=ID%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>E-mail:</td>
                                                        <td class="font-medium text-dark-medium"><%=Email %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Address:</td>
                                                        <td class="font-medium text-dark-medium"><%=Address %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Phone:</td>
                                                        <td class="font-medium text-dark-medium"><%=Phone %></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Account Settings Area End Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a href="#">PsdBosS</a></div>
                </footer>
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
    <!-- Scroll Up Js -->
    <script src="insurerCSS/js2/jquery.scrollUp.min.js"></script>
    <!-- Select 2 Js -->
    <script src="insurerCSS/js2/select2.min.js"></script>
    <!-- Date Picker Js -->
    <script src="insurerCSS/js2/datepicker.min.js"></script>
    <!-- Custom Js -->
    <script src="insurerCSS/js2/main.js"></script>
    <script src="cJS/UserInfo.js"></script>
</body>
<style>input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}</style>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/account-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:57 GMT -->
</html>
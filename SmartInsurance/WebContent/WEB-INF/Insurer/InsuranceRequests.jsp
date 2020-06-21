<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="connection.DatabaseConnection"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="insurer.GetInfo"%>
<!doctype html>
<html class="no-js" lang="">

<%
//int count=0;
ArrayList<String[]> Requests=GetInfo.getInsuranceRequests();
//0_Category, 1_Details, 2_ItemValue, 3_Coverage, 4_Duration, 5_Payment Method, 
		//6_Installment Duration, 7_Downpayment, 8_Condition, 9_Status, 10_Request_ID, 11_Premium Value, 12_Client_ID
%>
<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:52 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Smart Insurance</title>
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
    <!-- Data Table CSS -->
    <link rel="stylesheet" href="insurerCSS/css2/jquery.dataTables.min.css">
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
    <jsp:include page="InsurerSideMenu.jsp">
    				 <jsp:param name="active" value="InsuranceRequests"/>
    				</jsp:include>
          <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Insurance Requests</h3>
                    <ul>
                        <li>
                            <a href="index2.html">Home</a>
                        </li>
                        <li>Insurance requests</li>
                    </ul>
                </div>
                <!-- Breadcubs Area End Here -->
                <!-- All Subjects Area Start Here -->
                <div class="row">
                    <div class="col-4-xxxl col-12">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Insurance Requests</h3>
                                    </div>
                                </div>
                                <form action="ManageInsuranceRequests" method="post" class="new-added-form">
                                    <div class="container">
                                      <div class="row menu-page">



                                        </div>




                                   <div id="threeCarDiv" class="desc">
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Request ID *</label>
                                          <input required name="RequestID" type="number" placeholder="#" class="form-control">
                                      </div>
                                      <div class="col-12 form-group mg-t-8">
                                        <button type="submit" name="fetch" value="Approve" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Approve</button>
                                        <button type="submit" name="fetch" value="Decline" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Decline</button>
                                      </div>
                                    </div>
                                    <h4 style="color:blue">${Message}</h4>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-8-xxxl col-12">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Insurance Requests</h3>
                                    </div>
                                </div>
                                
                                <div class="table-responsive">
                                    <table class="table display data-table text-nowrap">
                                        <thead>
                                            <tr>

                                                <th>ID </th>
                                                <th>Client ID</th>
                                                <th>Item Details</th>
                                                <th>Item Value</th>
                                                <th>Coverage %</th>
                                                <th>Duration</th>
                                                <th>Payment Method</th>
                                                <th>Premium Value</th>
                                                
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%for (int i=0;i<Requests.size();i++){ %>
                                            <tr>

                                                <td style="vertical-align: middle;"><%=Requests.get(i)[10] %></td>
                                                <td style="vertical-align: middle;"><a style="cursor:pointer; color:blue;" onclick="UserRedirect('<%=Requests.get(i)[12] %>')"><%=Requests.get(i)[12] %></a></td>
                                                <td style="vertical-align: middle;"><%=Requests.get(i)[0] %> > <%=Requests.get(i)[1] %></td>
                                                <td style="vertical-align: middle;"><%=Requests.get(i)[2] %></td>
                                                <td style="vertical-align: middle;"><%=Requests.get(i)[3] %>%</td>
                                                <td style="vertical-align: middle;"><%=Requests.get(i)[4] %> Months</td>
                                                <td style="vertical-align: middle;"><%=Requests.get(i)[5]%>
                                                <%=(Requests.get(i)[5].equalsIgnoreCase("Installment")?"<br>Duration: "+Requests.get(i)[6]+" Months<br>Downpayment: "+Requests.get(i)[7]:"") %></td>
                                                <td style="vertical-align: middle;"><%=Requests.get(i)[11] %> EGP</td>
                                                
                                            </tr>
                                           <%} %>
                                        </tbody>
                                    </table>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                </div>
                <!-- All Subjects Area End Here -->
            </div>
        </div>
        <!-- Page Area End Here -->
    
    <!-- jquery-->
    <script src="insurerCSS/js2/jquery-3.3.1.min.js"></script>
    <!-- Plugins js -->
    <script src="insurerCSS/js2/plugins.js"></script>
    <!-- Popper js -->
    <script src="insurerCSS/js2/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="insurerCSS/js2/bootstrap.min.js"></script>
    <!-- Select 2 Js -->
    <script src="insurerCSS/js2/select2.min.js"></script>
    <!-- Scroll Up Js -->
    <script src="insurerCSS/js2/jquery.scrollUp.min.js"></script>
    <!-- Data Table Js -->
    <script src="insurerCSS/js2/jquery.dataTables.min.js"></script>
    <!-- Custom Js -->
    <script src="insurerCSS/js2/main.js"></script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:53 GMT -->
</html>
    
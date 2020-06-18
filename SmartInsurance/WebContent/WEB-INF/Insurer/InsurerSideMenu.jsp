 <%String active=request.getParameter("active");%>
 <%@ page import="connection.DatabaseConnection"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<link rel="stylesheet" href="font3/flaticon.css">

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
String email;
int master=0;
PreparedStatement ps=c.prepareStatement("select Email, Master from accounts where SessionID=?;");
ps.setString(1,JSessionID);
ResultSet rs=ps.executeQuery();
rs.next();
email=rs.getString(1);
master=rs.getInt(2);
c.close(); %>
 <!-- Header Menu Area Start Here -->
        <div class="navbar navbar-expand-md header-menu-one bg-light">
            <div class="nav-bar-header-one">
                <div class="header-logo">
                    <a href="index.jsp">
                        <img src="insurerCSS/img2/logo1.png" alt="logo">
                    </a>
                </div>
                 <div class="toggle-button sidebar-toggle">
                    <button type="button" class="item-link">
                        <span class="btn-icon-wrap">
                            <span></span>
                            <span></span>
                            <span></span>
                        </span>
                    </button>
                </div>
            </div>
            <div class="d-md-none mobile-nav-bar">
               <button class="navbar-toggler pulse-animation" type="button" data-toggle="collapse" data-target="#mobile-navbar" aria-expanded="false">
                    <i class="far fa-arrow-alt-circle-down"></i>
                </button>
                <button type="button" class="navbar-toggler sidebar-toggle-mobile">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
            <div class="header-main-menu collapse navbar-collapse" id="mobile-navbar">
                <ul class="navbar-nav">
                    <li class="navbar-item header-search-bar">
                        <div class="input-group stylish-input-group">
                            <span class="input-group-addon">
                                <button type="submit">
                                    <span class="flaticon-search" aria-hidden="true"></span>
                                </button>
                            </span>
                            <input type="text" class="form-control" placeholder="Find Something . . .">
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="navbar-item dropdown header-admin">
                        <a class="navbar-nav-link dropdown-toggle" style="cursor:pointer;" role="button" data-toggle="dropdown"
                            aria-expanded="false">
                            <div class="admin-title">
                                <h5 class="item-title"><%=email %></h5>
                                <span>Admin</span>
                            </div>
                            <div class="admin-img">
                                <img src="insurerCSS/img2/figure/admin.jpg" alt="Admin">
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <div class="item-header">
                                <h6 class="item-title"><%=email %></h6>
                            </div>
                            <div class="item-content">
                                <ul class="settings-list">
                                    <li><a href="Logout"><i class="flaticon-turn-off"></i>Log Out</a></li>
                                    
                                </ul>
                            </div>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
        <!-- Header Menu Area End Here -->
        <div class="dashboard-page-one">
            <!-- Sidebar Area Start Here -->
            <div class="sidebar-main sidebar-menu-one sidebar-expand-md sidebar-color">
               <div class="mobile-sidebar-header d-md-none">
                    <div class="header-logo">
                        <a href="index.jsp" ><img src="insurerCSS/img2/logo1.png" alt="logo"></a>
                    </div>
               </div>
                <div class="sidebar-menu-content">
                    <ul class="nav nav-sidebar-menu sidebar-toggle-view">
                        <li class="nav-item ">
                            <a style="cursor:pointer;" onclick="redirect('InsurerDashboard','Insurer')" class="nav-link <%=(active.equals("Dashboard")?"menu-active":"")%>"><i class="flaticon-dashboard"></i><span <%=(active.equals("Dashboard")?"class=\"menu-active\"":"")%>>Dashboard</span></a>
                            </li>
                            <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('ManageCategories','Insurer')" class="nav-link <%=(active.equals("ManageCategories")?"menu-active":"")%>"><i
                                    class="flaticon-car"></i><span <%=(active.equals("ManageCategories")?"class=\"menu-active\"":"")%>>Manage Categories</span></a>
                        </li>
                    
                        
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('InsurerManageItems','Insurer')" class="nav-link <%=(active.equals("ManageItems")?"menu-active":"")%>"><i
                                    class="flaticon-open-book"></i><span <%=(active.equals("ManageItems")?"class=\"menu-active\"":"")%>>Manage Items</span></a>
                        </li>
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('UserInfo','Insurer')"  class="nav-link <%=(active.equals("UserInfo")?"menu-active":"")%>"><i
                                    class="flaticon-multiple-users-silhouette"></i><span <%=(active.equals("UserInfo")?"class=\"menu-active\"":"")%>>User Info</span></a>
                        </li>
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('ConfigureRates','Insurer')" class="nav-link <%=(active.equals("ConfigureRates")?"menu-active":"")%>"><i class="flaticon-interest-rate"></i>
                            <span <%=(active.equals("ConfigureRates")?"class=\"menu-active\"":"")%>>Configure Rates</span></a>
                        </li>
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('ManagePayments','Insurer')" class="nav-link <%=(active.equals("ManagePayments")?"menu-active":"")%>"><i
                                    class="flaticon-open-book"></i><span <%=(active.equals("ManagePayments")?"class=\"menu-active\"":"")%>>Manage Payments</span></a>
                        </li>
                        <li class="nav-item">
                        
                            <a style="cursor:pointer;" onclick="redirect('InsuranceRequests','Insurer')" class="nav-link <%=(active.equals("InsuranceRequests")?"menu-active":"")%>"><i
                                    class="flaticon-request"></i><span <%=(active.equals("InsuranceRequests")?"class=\"menu-active\"":"")%>>Insurance Requests</span></a>
                        </li>
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('ManageClaims','Insurer')" class="nav-link <%=(active.equals("ManageClaims")?"menu-active":"")%>"><i
                                    class="flaticon-notification"></i><span <%=(active.equals("ManageClaims")?"class=\"menu-active\"":"")%>>Claim Requests</span></a>
                        </li>
                        <%if (master==1){ %>
                         <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('AutoPriceUpdate','Insurer')" class="nav-link <%=(active.equals("AutoPriceUpdate")?"menu-active":"")%>"><i
                                    class="flaticon-financial"></i><span <%=(active.equals("AutoPriceUpdate")?"class=\"menu-active\"":"")%>>Auto Price Update</span></a>
                        </li>
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('CreateInsurerAccount','Insurer')" class="nav-link <%=(active.equals("CreateInsurerAccount")?"menu-active":"")%>"><i
                                    class="flaticon-bus-side-view"></i><span <%=(active.equals("CreateInsurerAccount")?"class=\"menu-active\"":"")%>>Create Insurer Account</span></a>
                        </li>
                       <%} %>
                    </ul>
                </div>
            </div>
            <!-- Sidebar Area End Here -->
            <script src="cJS/Redirect.js"></script>
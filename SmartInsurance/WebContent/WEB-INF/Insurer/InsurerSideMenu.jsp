 <%String active=request.getParameter("active");%>
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
                                <h5 class="item-title">Ahmed Zakaria</h5>
                                <span>Admin</span>
                            </div>
                            <div class="admin-img">
                                <img src="insurerCSS/img2/figure/admin.jpg" alt="Admin">
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <div class="item-header">
                                <h6 class="item-title">Ahmed Zakaria</h6>
                            </div>
                            <div class="item-content">
                                <ul class="settings-list">
                                    <li><a style="cursor:pointer;"><i class="flaticon-user"></i>My Profile</a></li>
                                    <li><a style="cursor:pointer;"><i class="flaticon-list"></i>Task</a></li>
                                    <li><a style="cursor:pointer;"><i class="flaticon-gear-loading"></i>Account Settings</a></li>
                                    <li><a href="login.html"><i class="flaticon-turn-off"></i>Log Out</a></li>
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
                                    class="flaticon-open-book"></i><span <%=(active.equals("ManageCategories")?"class=\"menu-active\"":"")%>>Manage Categories</span></a>
                        </li>
                    
                        
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('InsurerManageItems','Insurer')" class="nav-link <%=(active.equals("ManageItems")?"menu-active":"")%>"><i
                                    class="flaticon-open-book"></i><span <%=(active.equals("ManageItems")?"class=\"menu-active\"":"")%>>Manage Items</span></a>
                        </li>
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('ConfigureRates','Insurer')" class="nav-link <%=(active.equals("ConfigureRates")?"menu-active":"")%>"><i class="flaticon-calendar"></i>
                            <span <%=(active.equals("ConfigureRates")?"class=\"menu-active\"":"")%>>Configure Rates</span></a>
                        </li>
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('ManagePayments','Insurer')" class="nav-link <%=(active.equals("ManagePayments")?"menu-active":"")%>"><i
                                    class="flaticon-open-book"></i><span <%=(active.equals("ManagePayments")?"class=\"menu-active\"":"")%>>Manage Payments</span></a>
                        </li>
                        <li class="nav-item">
                        
                            <a style="cursor:pointer;" onclick="redirect('InsuranceRequests','Insurer')" class="nav-link <%=(active.equals("InsuranceRequests")?"menu-active":"")%>"><i
                                    class="flaticon-checklist"></i><span <%=(active.equals("InsuranceRequests")?"class=\"menu-active\"":"")%>>Insurance Requests</span></a>
                        </li>
                        <li class="nav-item">
                            <a style="cursor:pointer;" onclick="redirect('ManageClaims','Insurer')" class="nav-link <%=(active.equals("ManageClaims")?"menu-active":"")%>"><i
                                    class="flaticon-bus-side-view"></i><span <%=(active.equals("ManageClaims")?"class=\"menu-active\"":"")%>>Claim Requests</span></a>
                        </li>

                       
                    </ul>
                </div>
            </div>
            <!-- Sidebar Area End Here -->
            <script src="cJS/Redirect.js"></script>
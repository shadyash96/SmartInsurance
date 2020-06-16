<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:52 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AKKHOR | All Subjects</title>
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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
    $(document).ready(function() {
    $("div.desc").hide();
    $("input[name$='cars']").click(function() {
        var test = $(this).val();
        $("div.desc").hide();
        $("#" + test).show();
    });
});
</script>
</head>

<body>
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <div id="wrapper" class="wrapper bg-ash">
      <!-- Header Menu Area Start Here -->
       <jsp:include page="InsurerSideMenu.jsp">
    				 <jsp:param name="active" value="CreateInsurerAccount"/>
    				</jsp:include>
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Insurance Requests</h3>
                    <ul>
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>Generate Token</li>
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
                                        <h3>Generate Insurer Account Token</h3>
                                    </div>
                                </div>
                                <div class="new-added-form">
                                    <div class="container">
                                      <div class="row menu-page">
                                        </div>
                                   <div>
                                      <div class="col-12 form-group mg-t-8">
                                        <button id="ClientInfoSubmit"  onclick="GenerateToken()" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Generate Token</button>
                                      </div>
                                      Token: <br>
                                      <h4 id="Token"></h4>
                                      <h5 id="Message"></h5>
                                    </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    

                </div>
                <!-- All Subjects Area End Here -->
                <footer class="footer-wrap-layout1">
                    <div class="copyright">© Copyrights <a href="#">akkhor</a> 2019. All rights reserved. Designed by <a
                            href="#">PsdBosS</a></div>
                </footer>
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
    <script src="cJS/CreateAccountToken.js"></script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:53 GMT -->
</html>

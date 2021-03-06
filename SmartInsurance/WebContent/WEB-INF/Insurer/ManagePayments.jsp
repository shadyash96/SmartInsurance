<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="">


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
    				 <jsp:param name="active" value="ManagePayments"/>
    				</jsp:include>
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
                                <div class="new-added-form">
                                    <div class="container">
                                      <div class="row menu-page">



                                        </div>




                                   <div>
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Mobile Number*</label>
                                          <input id="PhoneNo" required type="number" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-12 form-group mg-t-8">
                                        <button id="ClientInfoSubmit" type="submit" onclick="getClientInfo()" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Submit</button>
                                      </div>
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Name</label>
                                          <input readonly type="text" id="ClientName" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>National ID *</label>
                                          <input readonly type="number" id="ClientNational" placeholder="" class="form-control">
                                      </div>
                                    </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-8-xxxl col-12">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Approved Requests</h3>
                                    </div>
                                    <div class="dropdown">
                                        <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                                            aria-expanded="false">...</a>


                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table display data-table text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>Request ID</th>
                                                <th>Item details </th>
                                                <th>Condition</th>
                                                <th>Premium Value</th>
                                                <th>Payment type</th>
                                                <th>Need to be Paid</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="RequestsTable">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-8-xxxl col-12">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Installments</h3>
                                    </div>
                                    <div class="dropdown">
                                        <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                                            aria-expanded="false">...</a>


                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table display data-table text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>Installment ID </th>
                                                <th>Item</th>
                                                <th>Inst. date</th>
                                                <th>Value</th>
                                            </tr>
                                        </thead>
                                        <tbody id="InstallmentsTable">
                                           


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4-xxxl col-12">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Payment Type</h3>
                                    </div>
                                    <div class="dropdown">
                                        <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                                            aria-expanded="false">...</a>

                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-times text-orange-red"></i>Close</a>
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-cogs text-dark-pastel-green"></i>Edit</a>
                                            <a class="dropdown-item" href="#"><i
                                                    class="fas fa-redo-alt text-orange-peel"></i>Refresh</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="new-added-form">
                                    <div class="container">
                                      <div class="row menu-page">
                                      <div class="col-sm-6">
                                        <label class="radio_wrap"  data-radio="radio_1" style="color: #000000;">
                                            <input  type="radio"  name="cars"  value="twoCarDiv" />Initial Payment
                                          </label>
                                        </div>
                                          <div class="col-sm-6">
                                            <label class="radio_wrap" name="cars" data-radio="radio_2" style="color: #000000;">
                                              <input type="radio"  name="cars"  value="threeCarDiv"  />Installment
                                            </label>
                                          </div>

                                        </div>
                                        <div id="twoCarDiv" class="desc" >

                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Request ID *</label>
                                          <input id="RequestID" type="number" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Value</label>
                                          <input id="InitialValue" readonly type="number" placeholder="" class="form-control">
                                      </div>


                                        <div class="col-12 form-group mg-t-8">
                                            <button type="submit" id="InitialSubmit" onclick="MakeInitialPayment()" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Activate Insurance</button>

                                        </div>
                                      </div>

                                      <div id="threeCarDiv" class="desc">
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Installment ID *</label>
                                          <input id="InstallmentID" type="text" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Value *</label>
                                          <input readonly id="InsallmentValue" type="text" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-12 form-group mg-t-8">
                                          <button id="InstallmentSubmit" onclick="MakeInstallmentPayment()" type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Submit </button>

                                      </div>
                                      </div>
                                    <h4 style="color:red" id="Message"></h4>
                                    </div>
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
    <script src="cJS/ManagePayments.js"></script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:53 GMT -->
</html>

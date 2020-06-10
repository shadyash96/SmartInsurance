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
$( document ).ready(function(){
     hideAll();
     $('#SelName').on('input', function(){
          let num = $(this).val();
          let divs = $('.myDivs');
          hideAll();
          if(num){
               for(let i = 0; i < divs.length; i++){
                    let div = divs[i];
                    if(i+1 <= num)
                         $(div).show();
               }
          }
     });
     function hideAll(){
          let divs = $('.myDivs');
          for(let i = 0; i < divs.length; i++){
               let div = divs[i];
               $(div).hide();
          }
     }
});
$( document ).ready(function(){
     hideAll();
     $('#SelName2').on('input', function(){
          let num = $(this).val();
          let divs = $('.myDivs2');
          hideAll();
          if(num){
               for(let i = 0; i < divs.length; i++){
                    let div = divs[i];
                    if(i+1 <= num)
                         $(div).show();
               }
          }
     });
     function hideAll(){
          let divs = $('.myDivs2');
          for(let i = 0; i < divs.length; i++){
               let div = divs[i];
               $(div).hide();
          }
     }
});
</script>
<style>
            table tr{
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:hover{background-color: #ddd;}
        </style>
</head>

<body>
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <div id="wrapper" class="wrapper bg-ash">
     <jsp:include page="InsurerSideMenu.jsp">
    				 <jsp:param name="active" value="ManageCategories"/>
    				</jsp:include>
     
                 <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Manage Category</h3>
                    <ul>
                        <li>
                            <a href="index2.html">Home</a>
                        </li>
                        <li>Manage Category</li>
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
                                        <h3>Manage Categories</h3>
                                    </div>
                                </div>
                                <div class="new-added-form">
                                    <div class="container">
                                      <div class="row menu-page">
                                      <div class="col-sm-6">
                                        <label class="radio_wrap"  data-radio="radio_1" style="color: #000000;">
                                            <input  type="radio"  name="cars"  value="twoCarDiv" />Add
                                          </label>
                                        </div>
                                          <div class="col-sm-6">
                                            <label class="radio_wrap" name="cars" data-radio="radio_2" style="color: #000000;">
                                              <input type="radio"  name="cars"  value="threeCarDiv"  />Edit
                                            </label>
                                          </div>
                                        </div>
                                        <form action="ManageCategories" method="post">
                                        <div id="twoCarDiv" class="desc" >
                                          <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                              <label>Category Name *</label>
                                              <input name="CategoryName" required type="text" placeholder="Enter Category Name" class="form-control">
                                          </div>
                                      <div class="col-4-xxxl col-lg-4 col-4 form-group">
                                          <label>Rate *</label>
                                          <input name="Rate" required step="any" type="number" placeholder="%" class="form-control">
                                      </div>
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>How many Subcategories? *</label>
                                          <input type="number" required min="1" max="5" placeholder="Enter Number of SubCategories" class="form-control" id="SelName" name="SubNum">
                                      </div>
                                      <div class="container">
                                        <div class="row">
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group myDivs" id="image1">
                                          <label>SubCategory Name 1:*</label>
                                          <input name="Sub1" type="text" placeholder="Ex: 'Brand'" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group myDivs" id="image2">
                                          <label>SubCategory Name 2:*</label>
                                          <input name="Sub2" type="text" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group myDivs" id="image3">
                                          <label>SubCategory Name 3:*</label>
                                          <input name="Sub3" type="text" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group myDivs" id="image4">
                                          <label>SubCategory Name 4:*</label>
                                          <input name="Sub4" type="text" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group myDivs" id="image5">
                                          <label>SubCategory Name 5:*</label>
                                          <input name="Sub5" type="text" placeholder="" class="form-control">
                                      </div>
                                    </div>
                                    </div>


                                        <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                            <label>Used Fields Number *</label>
                                            <input name="UsedNum" type="number" min="0" max="5" placeholder="Enter Number of Used fields" class="form-control" id="SelName2">
                                        </div>
                                        <div class="container myDivs2">
                                          <div class="row">
                                        <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                            <label>Field Name 1:</label>
                                            <input name="Used1" type="text" placeholder="" class="form-control">
                                        </div>
                                        <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                          <label>Field Type</label>
                                          <select name="Used1Type" class="select2">
                                              <option>Text</option>
                                              <option>Number</option>
                                          </select>
                                      </div>
                                      </div>
                                    </div>
                                    <div class="container myDivs2">
                                      <div class="row">
                                    <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                        <label>Field Name 2:</label>
                                        <input name="Used2" type="text" placeholder="" class="form-control">
                                    </div>
                                    <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                      <label>Field Type</label>
                                      <select name="Used2Type" class="select2">
                                          <option>Text</option>
                                          <option>Number</option>
                                      </select>
                                  </div>
                                  </div>
                                </div>
                                <div class="container myDivs2">
                                  <div class="row">
                                <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                    <label>Field Name 3:</label>
                                    <input name="Used3" type="text" placeholder="" class="form-control">
                                </div>
                                <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                  <label>Field Type</label>
                                  <select name="Used3Type" class="select2">
                                      <option>Text</option>
                                      <option>Number</option>
                                  </select>
                              </div>
                              </div>
                            </div>
                            <div class="container myDivs2">
                              <div class="row">
                            <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                <label>Field Name 4:</label>
                                <input name="Used4" type="text" placeholder="" class="form-control">
                            </div>
                            <div class="col-6-xxxl col-lg-6 col-6 form-group">
                              <label>Field Type</label>
                              <select name="Used4Type" class="select2">
                                  <option>Text</option>
                                  <option>Number</option>
                              </select>
                          </div>
                          </div>
                        </div>
                        <div class="container myDivs2">
                          <div class="row">
                        <div class="col-6-xxxl col-lg-6 col-6 form-group">
                            <label>Field Name 5:</label>
                            <input name="Used5" type="text" placeholder="" class="form-control">
                        </div>
                        <div class="col-6-xxxl col-lg-6 col-6 form-group">
                          <label>Field Type</label>
                          <select name="Used5Type" class="select2">
                              <option>Text</option>
                              <option>Number</option>
                          </select>
                      </div>
                      </div>
                    </div>
                    <div class="container">
                      <div class="row">
                    <div class="col-6-xxxl col-lg-6 col-6 form-group">
                        <label>Minimum Insurance months*</label>
                        <input name="MinimumInsurMonths" required min="1" type="number" placeholder="#" class="form-control">
                    </div>
                    <div class="col-6-xxxl col-lg-6 col-6 form-group">
                        <label>Max insurance months*</label>
                        <input name="MaximumInsurMonths" required type="number" placeholder="#" class="form-control">
                    </div>
                    <div class="col-6-xxxl col-lg-6 col-6 form-group">
                        <label>Min coverage</label>
                        <input name="MinCoverage" type="number" placeholder="#" class="form-control">
                    </div>
                    <div class="col-6-xxxl col-lg-6 col-6 form-group">
                        <label>Max coverage*</label>
                        <input name="MaxCoverage" type="number" placeholder="#" class="form-control">
                    </div>
                    <div class="col-6-xxxl col-lg-6 col-6 form-group">
                        <label>Min installment months*</label>
                        <input name="MinInstMonths" type="number" placeholder="#" class="form-control">
                    </div>
                    <div class="col-6-xxxl col-lg-6 col-6 form-group">
                        <label>Max installment months*</label>
                        <input name="MaxInstMonths" required type="number" placeholder="Enter 0 to Disable" class="form-control">
                    </div>
                     <div class="col-6-xxxl col-lg-6 col-6 form-group">
                        <label>Installment minimum downpayment</label>
                        <input type="number" step="any" name="InstallmentDownpayment" placeholder="%" class="form-control">
                    </div>
                    <div class="col-6-xxxl col-lg-6 col-6 form-group">
                        <label>Installment interest per month</label>
                        <input type="number" name="InstallmentInterest" placeholder="Enter 0 to Disable" class="form-control">
                    </div>
                  </div>
                  </div>


                                        <div class="col-12 form-group mg-t-8">
                                            <button type="submit" name="fetch" value="AddCategory" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Add Category</button>
                                            <button type="reset" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Reset</button>

                                        </div>
                                      </div>
</form>
                              <form action="ManageCategories" method="post">
                                      <div id="threeCarDiv" class="desc">
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                              <label>Category Name *</label>
                                              <select name="CategoryName" id="Categories" required  class="form-control" onchange="getConfigs()"></select>
                                          </div>
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Rate *</label>
                                          <input name="Rate" id="Rate" type="text" placeholder="" class="form-control">
                                      </div>
                                      <div class="container">
                                        <div class="row">
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                          <label>Min insurance months*</label>
                                          <input value="" name="MinimumInsurMonths" id="MinimumInsurMonths" type="number" placeholder="#" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                          <label>Max insurance months*</label>
                                          <input name="MaximumInsurMonths" id="MaximumInsurMonths" type="number" placeholder="#" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                          <label>Min coverage</label>
                                          <input name="MinCoverage" id="MinCoverage" type="number" placeholder="%" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                          <label>Max coverage*</label>
                                          <input name="MaxCoverage" id="MaxCoverage" type="number" placeholder="#" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                          <label>Min installment months*</label>
                                          <input name="MinInstMonths" id="MinInstMonths" type="number" placeholder="#" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                          <label>Max installment</label>
                                          <input name="MaxInstMonths" id="MaxInstMonths" type="number" placeholder="Enter 0 to Disable" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                          <label>Installment minimum downpayment</label>
                                          <input type="number" step="any" name="InstallmentDownpayment" placeholder="%" class="form-control">
                                      </div>
                                      <div class="col-6-xxxl col-lg-6 col-6 form-group">
                                          <label>Installment interest per month</label>
                                          <input name="InstallmentInterest" id="InstallmentInterest" type="number" step="any" placeholder="Enter 0 to Disable" class="form-control">
                                      </div>
                                    </div>
                                    </div>
                                      <div class="col-12 form-group mg-t-8">
                                        <button type="submit" name="fetch" value="EditCategory" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Edit Category</button>
                                        <button type="reset" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Reset</button>
                                      </div>
                                    </div>
                             </form>
                                    </div>
                                </div>
                                <h4 style="color:blue">${Message}</h4>
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
    </div>
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
    <script src="cJS/ManageCategories.js?v=2"></script>

      <script>

              var table = document.getElementById('table');

              /*for(var i = 1; i < table.rows.length; i++)
              {
                  table.rows[i].onclick = function()
                  {
                       //rIndex = this.rowIndex;
                       document.getElementById("fname").value = this.cells[0].innerHTML;
                  };
              }*/

       </script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:53 GMT -->
</html>

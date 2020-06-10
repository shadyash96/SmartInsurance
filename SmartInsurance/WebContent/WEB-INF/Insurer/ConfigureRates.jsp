<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="connection.DatabaseConnection"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.ArrayList"%>
<!doctype html>
<html class="no-js" lang="">
<%Connection c= DatabaseConnection.getConnection();
ArrayList<String[]> RateRules=new ArrayList<String[]>();
//int count=0;

PreparedStatement ps=c.prepareStatement("Select * from RateRules");
ResultSet rs= ps.executeQuery();
while (rs.next()){
	String[] temp=new String[5];
	temp[0]=String.valueOf(rs.getInt(1));
	temp[1]=rs.getString(2);
	temp[2]=rs.getString(3);
	temp[3]=String.valueOf(rs.getString(4));
	temp[4]=String.valueOf(rs.getFloat(5));
	RateRules.add(temp);
}
c.close();%>

<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:52 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Smart Insurance</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="img2/favicon.png">
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
    				 <jsp:param name="active" value="ConfigureRates"/>
    				</jsp:include>
          <!-- Sidebar Area End Here -->
            <div class="dashboard-content-one">
                <!-- Breadcubs Area Start Here -->
                <div class="breadcrumbs-area">
                    <h3>Configure Rates</h3>
                    <ul>
                        <li>
                            <a href="index2.html">Home</a>
                        </li>
                        <li>Configure Rates</li>
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
                                        <h3>Configure Rates</h3>
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

                                    <div class="container">
                                      <div class="row menu-page">
                                      <div class="col-sm-6">
                                        <label class="radio_wrap"  data-radio="radio_1" style="color: #000000;">
                                            <input  type="radio"  name="cars"  value="twoCarDiv" />Add Rule
                                          </label>
                                        </div>
                                          <div class="col-sm-6">
                                            <label class="radio_wrap" name="cars" data-radio="radio_2" style="color: #000000;">
                                              <input type="radio"  name="cars"  value="threeCarDiv"  />Delete Rule
                                            </label>
                                          </div>

                                        </div>
                                         <form action="InsurerRateRules" method="post" class="new-added-form">
                                        <div id="twoCarDiv" class="desc" >
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Category *</label>
                                          <select name="Categories" id="Categories" class="select2" onchange="getConfigs();">
                                          </select>
                                      </div>
                                      <input name="fetch" type="hidden" value="AddRule">
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Rate *</label>
                                          <input id="Rate" readonly type="text" placeholder="" class="form-control">
                                      </div>
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Type*</label>
                                          <select name="Type" class="select2">
                                              <option>Duration</option>
                                              <option>Coverage Percentage</option>
                                          </select>
                                      </div>
                                        <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                            <label>If less than  *</label>
                                            <input required name="LessThan" type="number" placeholder="" class="form-control">
                                        </div>
                                        <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                            <label>Add Rate *</label>
                                            <div style="display:flex;"><input min="0" step="any" required name="AddRate"type="number" placeholder="" class="form-control">%
                                        </div></div>

                                        <div class="col-12 form-group mg-t-8">
                                            <button type="submit" class="btn-fill-lg btn-gradient-yellow btn-hover-bluedark">Add Rule</button>

                                        </div>
                                      </div>
                                      </form>
                                      <form action="InsurerRateRules" method="post">
                                      <div id="threeCarDiv" class="desc">
                                      <div class="col-12-xxxl col-lg-12 col-12 form-group">
                                          <label>Rule Id *</label>
                                          <input required type="number" name="RuleID" placeholder="" class="form-control"id="fname">
                                      </div>
                                      <input type="hidden" name="fetch" value="DeleteRule">
                                      <div class="col-12 form-group mg-t-8">
                                          <button type="submit" class="btn-fill-lg bg-blue-dark btn-hover-yellow">Delete</button>
                                      </div>
                                    </div>
 </form>
 <h4 style="color:blue;">${Message}</h4>
                                    </div>
                               
                            </div>
                        </div>
                    </div>
                    <div class="col-8-xxxl col-12">
                        <div class="card height-auto">
                            <div class="card-body">
                                <div class="heading-layout1">
                                    <div class="item-title">
                                        <h3>Configure rates</h3>
                                    </div>
                                   
                                </div>
                               
                                <div class="table-responsive">
                                    <table class="table display data-table text-nowrap" id="table">
                                        <thead>
                                            <tr>
                                                <th>
                                                    Rule ID
                                                </th>
                                                <th>Category</th>
                                                <th>Type</th>
                                                <th>Less than</th>
                                                <th>Increase</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%for (int i=0;i<RateRules.size();i++){ %>
                                            <tr>
                                                <td><%=RateRules.get(i)[0] %></td>
                                                <td><%=RateRules.get(i)[1] %></td>
                                                <td><%=RateRules.get(i)[2] %></td>
                                                <td><%=RateRules.get(i)[3] %></td>
                                                <td><%=RateRules.get(i)[4] %></td>
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
    <script src="cJS/ConfigureRates.js"></script>
    

      <script>

              var table = document.getElementById('table');

              for(var i = 1; i < table.rows.length; i++)
              {
                  table.rows[i].onclick = function()
                  {
                       //rIndex = this.rowIndex;
                       document.getElementById("fname").value = this.cells[0].innerHTML;
                  };
              }

       </script>

</body>


<!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-subject.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 24 May 2020 18:54:53 GMT -->
</html>

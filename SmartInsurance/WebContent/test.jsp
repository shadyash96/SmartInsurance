<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.nio.charset.Charset"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.ByteArrayInputStream"%>
<%@ page import="java.util.*"%>
<%@ page import="org.sqlite.*"%>
<%@ page import="java.io.File"%>
<%@ page import="connection.DatabaseConnection"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.net.SocketException"%>
<%@ page import="java.util.concurrent.Executors"%>
<%@ page import="database.AutoUpdateCars"%>



<!DOCTYPE html>
<html>
<head>
<!-- jQuery js -->
<script src="assets/jquery/jquery-2.1.4.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="test.jsp">test</a>
	<%
Connection c;

	c=DatabaseConnection.getConnection();
	



//Connection conn = null;

//Class.forName("org.sqlite.JDBC");
	//String url = "jdbc:sqlite:/Users/Shady/eclipse-new/SmartInsurance/WebContent/Database.sql";
	//String url = "jdbc:sqlite::resource:Database.sql";
	//System.out.println(request.getContextPath());
    // create a connection to the database
    //conn = DriverManager.getConnection(url);
    //out.println(conn.toString().indexOf("sqlite")!=-1?"true":"false");
    System.out.println("Connection to SQLite has been established.");
 %>
	<%PreparedStatement ps = c.prepareStatement("select * from Clients",ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
 ResultSet rs;

	 rs=ps.executeQuery();




		
		while (rs.next()){
			out.println(rs.getString(1));
		}
		rs.close();
		ps.close();
		c.close();%>

	<button onclick="test()">Update Database 1</button>


</body>
<script>
function test(){
	 $.ajax({
		 url : 'CallCarUpdate',
         type : 'POST',
         success : function() {
             alert("Car Prices Are Being Updated Every 6 hours");
         }
     });
}
</script>
</html>
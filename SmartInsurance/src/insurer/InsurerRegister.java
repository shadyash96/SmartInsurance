package insurer;

import java.io.IOException;
import java.net.SocketException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DatabaseConnection;

/**
 * Servlet implementation class InsurerRegister
 */
@WebServlet("/InsurerRegister")
public class InsurerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsurerRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("InsurerLogin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection c = DatabaseConnection.getConnection();
			String fetch=request.getParameter("fetch");
			if (fetch.equalsIgnoreCase("CreateToken")) {
				String token=request.getParameter("token");
				//System.out.println(token);
				PreparedStatement ps=c.prepareStatement("delete Token where DATEADD(minute,10,date)<getdate(); insert into Token (Token, Type) values (?,'Insurer');");
				ps.setString(1, token);
				ps.execute();
			}
			else if (fetch.equalsIgnoreCase("Register")) {
				String token=request.getParameter("Token").toLowerCase();
				c.prepareStatement("delete Token where DATEADD(minute,10,date)<getdate();").execute();
				PreparedStatement ps=c.prepareStatement("if exists (select * from Token where Token=? and Type='Insurer') select 'Exists' else select 'Doesnt'");
				ps.setString(1, token);
				ResultSet rs=ps.executeQuery();
				rs.next();
				if (rs.getString(1).equalsIgnoreCase("Exists")) {
					String email= request.getParameter("email");
					String NationalID= request.getParameter("NationalID");
					String password= request.getParameter("password");
					String name= request.getParameter("name");
					String phoneNo= request.getParameter("phoneNo");
					String address= request.getParameter("address");
					int InsurerID;
					PreparedStatement pss=c.prepareStatement("if exists (select Email from Accounts where Email=?) "+
							"select 0 else if exists (select * from Clients where Identification_no=?) "+
							"select 1 else if exists (select * from Insurers where Identification_no=?) "+
							"select 1 else if exists (select * from Clients where Phone_No=?) select 2 "+
							"else if exists (select * from Insurers where Phone_No=?) select 2 "+
							"else select 3");
							pss.setString(1, email);
							pss.setString(2, NationalID);
							pss.setString(3, NationalID);
							pss.setString(4, phoneNo);
							pss.setString(5, phoneNo);
							ResultSet rss = pss.executeQuery();
							if(rss.next()) {
								if (rss.getInt(1)==0) {
									request.setAttribute("Error", "Email Already Exists");
									request.getRequestDispatcher("InsurerLogin.jsp").forward(request, response);
								}
								else if (rss.getInt(1)==1) {
									request.setAttribute("Error", "National ID Already Exists");
									request.getRequestDispatcher("InsurerLogin.jsp").forward(request, response);
								}
								else if (rss.getInt(1)==2) {
									request.setAttribute("Error", "Phone Number already exists");
									request.getRequestDispatcher("InsurerLogin.jsp").forward(request, response);
								}
								else
								{
									ps=c.prepareStatement("insert into Insurers (Name, Address, Phone_No, Identification_no, Email) output Inserted.Insurer_ID values (?,?,?,?,?)");
									ps.setString(1, name);
									ps.setString(2, address);
									ps.setString(3, phoneNo);
									ps.setString(4, NationalID);
									ps.setString(5, email);
									rs=ps.executeQuery();
									rs.next();
									InsurerID=rs.getInt(1);
									pss=c.prepareStatement("insert into Accounts (Email, Password, Type, Insurer_ID) values (?,?,'Insurer',?); delete Token where Token='"+token+"';");
									pss.setString(1, email);
									pss.setString(2, password);
									//pss.setString(3, SessionID);
									pss.setInt(3, InsurerID);
									pss.execute();
									request.setAttribute("Error", "You can now login to your account");
									request.getRequestDispatcher("InsurerLogin.jsp").forward(request, response);
								}
				}
				}
				else {
					request.setAttribute("Error", "Token doesn't exist or expired.");
					request.getRequestDispatcher("InsurerLogin.jsp").forward(request, response);
				}
			}
			c.close();
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

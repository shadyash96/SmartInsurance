package client;

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
 * Servlet implementation class clientRegister
 */
@WebServlet("/clientRegister")
public class clientRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public clientRegister() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("ClientLogin.jsp").forward(request, response);
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//email - NationalID - password - name - phoneNo - address
		String email= request.getParameter("email");
		String NationalID= request.getParameter("NationalID");
		String password= request.getParameter("password");
		String name= request.getParameter("name");
		String phoneNo= request.getParameter("phoneNo");
		String address= request.getParameter("address");
		String SessionID=request.getSession().getId();
		int ClientID;
		try {
			Connection c=DatabaseConnection.getConnection();
			//if exists(select username from cus_accounts where username=?)  select 0 else insert into cus_accounts (Name, Email, Address, Phone, Region, Username, Password) output inserted.Cus_ID values (?,?,?,?,?,?,?);
			PreparedStatement ps=c.prepareStatement("if exists (select Email from Accounts where Email=?) select 0 else insert into Clients (Name, Address, Phone_No, Identification_no, Email) output Inserted.Client_ID values (?,?,?,?,?);");
			ps.setString(1, email);
			ps.setString(2, name);
			ps.setString(3, address);
			ps.setString(4, phoneNo);
			ps.setString(5, NationalID);
			ps.setString(6, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
			if (rs.getInt(1)==0) {
				request.setAttribute("Error", "Email Already Exists");
				request.getRequestDispatcher("clientLogin-Register.jsp").forward(request, response);
			}
			else
			{
				ClientID=rs.getInt(1);
				PreparedStatement pss=c.prepareStatement("insert into Accounts (Email, Password, Type, Client_ID) values (?,?,'Client',?);");
				pss.setString(1, email);
				pss.setString(2, password);
				//pss.setString(3, SessionID);
				pss.setInt(3, ClientID);
				pss.execute();
				request.getRequestDispatcher("ClientLogin.jsp").forward(request, response);
			}
			}
			
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(email+"::"+NationalID+"::"+password+"::"+name+"::"+phoneNo+"::"+address);
	}

}

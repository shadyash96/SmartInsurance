package client;

import java.io.IOException;
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
 * Servlet implementation class clientChangeInfo
 */
@WebServlet("/clientChangeInfo")
public class clientChangeInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public clientChangeInfo() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection c = DatabaseConnection.getConnection();
			String SessionID = request.getSession().getId();
			String Address=request.getParameter("address");
			String Phone=request.getParameter("phone");
			String Password=request.getParameter("new_pass");
			//String PasswordConfirm=request.getParameter("new_pass_confirm");
			if (Password.length()>3) {
			PreparedStatement ps = c.prepareStatement("BEGIN "
					+ "update Accounts set Accounts.Password =? where Accounts.SessionID =?; "
					+ "update CLients set Clients.Address=?, Clients.Phone_No=? from Clients join Accounts on Accounts.Client_ID = Clients.Client_ID where Accounts.SessionID =?; "
					+ "END");
			ps.setString(1, Password);
			ps.setString(2, SessionID);
			ps.setString(3, Address);
			ps.setString(4, Phone);
			ps.setString(5, SessionID);
			ps.execute();
			}
			else {
				PreparedStatement ps = c.prepareStatement("BEGIN "
						+ "update CLients set Clients.Address=?, Clients.Phone_No=? from Clients join Accounts on Accounts.Client_ID = Clients.Client_ID where Accounts.SessionID =?; "
						+ "END");
				ps.setString(1, Address);
				ps.setString(2, Phone);
				ps.setString(3, SessionID);
				ps.execute();
			}
			
			request.setAttribute("message", "Info Changed Successfully");
			request.getRequestDispatcher("WEB-INF/Client/clientProfile.jsp").forward(request, response);
			c.close();

		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
	}

}

package client;

import java.io.IOException;
import java.net.SocketException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DatabaseConnection;

/**
 * Servlet implementation class clientMakeClaim
 */
@WebServlet("/clientMakeClaim")
public class clientMakeClaim extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public clientMakeClaim() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int InsuranceID = Integer.parseInt(request.getParameter("InsuranceID"));
		String Description = request.getParameter("description");
		String Documents = request.getParameter("DocumentsLink");
		int ClaimValue = Integer.parseInt(request.getParameter("ClaimValue"));

		try {
			Connection c = DatabaseConnection.getConnection();
			PreparedStatement ps = c.prepareStatement("insert into ClaimRequest (Insurance_ID, Description, Claim_Value, Documents, Status) values (?,?,?,?,'Pending')");
			ps.setInt(1, InsuranceID);
			ps.setString(2, Description);
			ps.setInt(3, ClaimValue);
			ps.setString(4, Documents);
			ps.execute();
			response.sendRedirect("claimRedirect.jsp");
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

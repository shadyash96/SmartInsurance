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
 * Servlet implementation class ManageClaims
 */
@WebServlet("/ManageClaims")
public class ManageClaims extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageClaims() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/Insurer/ManageClaims.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection c = DatabaseConnection.getConnection();
			String fetch=request.getParameter("fetch");
			int RequestID=Integer.parseInt(request.getParameter("RequestID"));
			PreparedStatement pss=c.prepareStatement("if not exists (select * from ClaimRequest where ID=?) select 'Doesnt' else select 'Does';");
			pss.setInt(1, RequestID);
			ResultSet rs=pss.executeQuery();
			rs.next();
			if (rs.getString(1).equals("Doesnt")) {
				c.close();
				request.setAttribute("Message", "Request ID Doesn't Exist");
				request.getRequestDispatcher("WEB-INF/Insurer/ManageClaims.jsp").forward(request, response);
				return;
			}
			if (fetch.equals("Approve")) {
				PreparedStatement ps=c.prepareStatement("update ClaimRequest set Status='Approved' where ID=?");
				ps.setInt(1, RequestID);
				ps.execute();	
			}
			else if (fetch.equals("Decline")) {
				String RejectionReason=request.getParameter("RejectionReason");
				if (RejectionReason==null || RejectionReason.length()<5) {
					c.close();
					request.setAttribute("Message", "Please enter a reason for rejection.");
					request.getRequestDispatcher("WEB-INF/Insurer/ManageClaims.jsp").forward(request, response);
				}
				PreparedStatement ps=c.prepareStatement("update ClaimRequest set Status='Declined', RejectionReason=? where ID=?");
				ps.setString(1, RejectionReason);
				ps.setInt(2, RequestID);
				ps.execute();	
				
			}
			c.close();
			request.getRequestDispatcher("WEB-INF/Insurer/ManageClaims.jsp").forward(request, response);
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

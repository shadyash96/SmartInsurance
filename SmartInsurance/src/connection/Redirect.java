package connection;

import java.io.IOException;
import java.net.SocketException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Redirect
 */
@WebServlet("/Redirect")
public class Redirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Redirect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String SessionID=request.getSession().getId();
			Connection c=DatabaseConnection.getConnection();
			ResultSet rs=c.prepareStatement("if Exists (select * from accounts where SessionID='"+SessionID+"') select Type from Accounts where SessionID='"+SessionID+"' else select 'Doesnt'").executeQuery();
			rs.next();
			if (rs.getString(1).equals("Insurer"))
				request.getRequestDispatcher("WEB-INF/Insurer/InsurerDashboard.jsp").forward(request, response);
			else if (rs.getString(1).equals("Client"))
				request.getRequestDispatcher("WEB-INF/Client/insuranceRequests.jsp").forward(request, response);
			else
				response.sendRedirect("index.jsp");
			c.close();
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Type=request.getParameter("type");
		String SessionID=request.getSession().getId();
		String page=request.getParameter("page");

		try {
		Connection c=DatabaseConnection.getConnection();
		ResultSet rs=c.prepareStatement("if Exists (select * from accounts where SessionID='"+SessionID+"' and Type='"+Type+"') select 'Exists' else select 'Doesnt'").executeQuery();
		rs.next();
		if (rs.getString(1).equals("Exists"))
			request.getRequestDispatcher("WEB-INF/"+Type+"/"+page+".jsp").forward(request, response);
		else
			response.sendRedirect("index.jsp");
		c.close();
	} catch (ClassNotFoundException | SocketException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}

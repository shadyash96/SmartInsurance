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
 * Servlet implementation class Login
 */
@WebServlet("/clientLogin")
public class clientLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public clientLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("ClientLogin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection c=DatabaseConnection.getConnection();
			String email= request.getParameter("email");
			String password= request.getParameter("password");
			String SessionID=request.getSession().getId();
			PreparedStatement pss=c.prepareStatement("if exists (select * from Accounts where Email=?) begin if exists (select * from Accounts where Email=? and Password=?) select 'GO' else select 'WrongPassword' end else select 'UserDoesntExist'");
			pss.setString(1, email);
			pss.setString(2, email);
			pss.setString(3, password);
			ResultSet rs=pss.executeQuery();
			rs.next();
			if(rs.getString(1).equals("WrongPassword")) {
				request.setAttribute("login_error", "Wrong Password");
				request.getRequestDispatcher("ClientLogin.jsp").forward(request, response);
				c.close();
				return;
			}
			else if(rs.getString(1).equals("UserDoesntExist")) {
				request.setAttribute("login_error", "Email Doesn't Exist");
				request.getRequestDispatcher("ClientLogin.jsp").forward(request, response);
				c.close();
				return;
			}
			else {
				c.prepareStatement("update Accounts set SessionID=' ' where SessionID='"+SessionID+"'");
			PreparedStatement ps=c.prepareStatement("update Accounts set SessionID=? where Email=? and Password=?");
			ps.setString(1, SessionID);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.execute();}
			c.close();
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
	}

}

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
 * Servlet implementation class InsurerLogin
 */
@WebServlet("/InsurerLogin")
public class InsurerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsurerLogin() {
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
			ResultSet rs=c.prepareStatement("if Exists (select * from accounts where SessionID='"+SessionID+"' and Type='Insurer') select 'Exists' else select 'Doesnt'").executeQuery();
			rs.next();
			if (rs.getString(1).equals("Exists"))
				request.getRequestDispatcher("WEB-INF/Insurer/InsurerDashboard.jsp").forward(request, response);
			else
				request.getRequestDispatcher("index.jsp").forward(request, response);
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
				try {
					Connection c=DatabaseConnection.getConnection();
					String email= request.getParameter("email");
					System.out.println(email);
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
						request.getRequestDispatcher("InsurerLogin.jsp").forward(request, response);
						c.close();
						return;
					}
					else if(rs.getString(1).equals("UserDoesntExist")) {
						request.setAttribute("login_error", "Email Doesn't Exist");
						request.getRequestDispatcher("InsurerLogin.jsp").forward(request, response);
						c.close();
						return;
					}
					else {
					PreparedStatement ps=c.prepareStatement("update Accounts set SessionID=' ' where SessionID=?; update Accounts set SessionID=? where Email=? and Password=?");
					ps.setString(1, SessionID);
					ps.setString(2, SessionID);
					ps.setString(3, email);
					ps.setString(4, password);
					ps.execute();}
					c.close();
					request.getRequestDispatcher("WEB-INF/Insurer/InsurerDashboard.jsp").forward(request, response);
				} catch (SQLException | ClassNotFoundException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				}
			}

		}

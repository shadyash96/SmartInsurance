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
 * Servlet implementation class InsurerRateRules
 */
@WebServlet("/InsurerRateRules")
public class InsurerRateRules extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsurerRateRules() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/Insurer/ConfigureRates.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection c = DatabaseConnection.getConnection();
			String fetch=request.getParameter("fetch");
			if (fetch.equals("AddRule")) {
				String Category=request.getParameter("Categories");
				String Type=(request.getParameter("Type").equals("Duration")?"Duration":"Percentage");
				int LessThan=(int)(Float.parseFloat(request.getParameter("LessThan")));
				float AddRate=Float.parseFloat(request.getParameter("AddRate"));
				PreparedStatement ps = c.prepareStatement("if exists (select * from RateRules where Category=? and Type=? and Less_Than=?) select 'Exists' "+
				"else insert into RateRules (Category,Type,Less_Than,Rate_Increase) values (?,?,?,?); select 'Added';");
				ps.setString(1, Category);
				ps.setString(2, Type);
				ps.setInt(3, LessThan);
				ps.setString(4, Category);
				ps.setString(5, Type);
				ps.setInt(6, LessThan);
				ps.setFloat(7, AddRate);
				ResultSet rs = ps.executeQuery();
				rs.next();
				if (rs.getString(1).equals("Exists")) {
					request.setAttribute("Message", "Rule already exists");
					request.getRequestDispatcher("WEB-INF/Insurer/ConfigureRates.jsp").forward(request, response);
				}
				else {
					request.setAttribute("Message", "Rule Added Successfully");
					request.getRequestDispatcher("WEB-INF/Insurer/ConfigureRates.jsp").forward(request, response);
				}
			}
			else if (fetch.equals("DeleteRule")) {
				int RuleID=Integer.parseInt(request.getParameter("RuleID"));
				PreparedStatement ps = c.prepareStatement("if not exists (select * from RateRules where ID=?) select 'Doesnt' else select 'Exists'; delete RateRules where ID=?;");
				ps.setInt(1, RuleID);
				ps.setInt(2, RuleID);
				ResultSet rs=ps.executeQuery();
				rs.next();
				if (rs.getString(1).equals("Doesnt")) {
					request.setAttribute("Message", "Rule ID Doesn't Exist");
					request.getRequestDispatcher("WEB-INF/Insurer/ConfigureRates.jsp").forward(request, response);
				}
				else {
					request.setAttribute("Message", "Rule Deleted Successfully");
					request.getRequestDispatcher("WEB-INF/Insurer/ConfigureRates.jsp").forward(request, response);
				}
			}
			c.close();
			
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

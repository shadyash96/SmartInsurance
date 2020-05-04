package fetch;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class GetConfigs
 */
@WebServlet("/GetConfigs")
public class GetConfigs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetConfigs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String Category=request.getParameter("SelectedCategory");
		//String fetch=request.getParameter("fetch");
		try {
			Connection c=DatabaseConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("SELECT Min_Insur_Months, Max_Insur_Months, Min_Insur_Coverage, Max_Insur_Coverage, Min_Inst_Months, Max_Inst_Months, Inst_Downpayment, Rate, NewPriceMode, UsedPriceMode FROM Configurations where Category=?;");
			ps.setString(1, Category);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				for (int i=1;i<=10;i++)
					out.write(rs.getString(i)+":");
			}
			c.close();
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

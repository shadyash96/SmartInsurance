package fetch;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class GetUsedField
 */
@WebServlet("/GetUsedField")
public class GetUsedField extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUsedField() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String Category=request.getParameter("SelectedCategory");
		try {
			int flag=0;
			Connection c=DatabaseConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("SELECT FieldName, FieldType FROM UsedFields where CategoryName=?;");
			ps.setString(1, Category);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if (flag==0) {
					out.write(rs.getString(1)+":"+rs.getString(2));
					flag++;
				}
				else
					out.write("::"+rs.getString(1)+":"+rs.getString(2));
			}
			c.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

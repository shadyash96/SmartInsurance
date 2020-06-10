package insurer;

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
 * Servlet implementation class ManageItems
 */
@WebServlet("/ManageItems")
public class ManageItems extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageItems() {
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
		PrintWriter out = response.getWriter();
		try {
			Connection c = DatabaseConnection.getConnection();
			String fetch = request.getParameter("fetch");
			String Category = request.getParameter("SelectedCategory");
			if (fetch.equals("addItem")) {
				int SubCount = Integer.parseInt(request.getParameter("SubCount"));
				String Fields = "Price";
				String Values = "";
				Values += request.getParameter("price");
				for (int i = 1; i <= SubCount; i++) {
					Fields += "," + request.getParameter("Sub" + i + "Name");
					Values += ",\'" + request.getParameter("SelectedSub" + i) + "\'";

				}

				String whereStat = "";
				for (int i = 1; i <= SubCount; i++) {
					if (i == 1)
						whereStat += request.getParameter("Sub" + i + "Name") + "='"
								+ request.getParameter("SelectedSub" + i) + "'";
					else {
						if (request.getParameter("SelectedSub" + i).equals("null"))
							whereStat += " and " + request.getParameter("Sub" + i + "Name") + " is "
									+ request.getParameter("SelectedSub" + i);
						else
							whereStat += " and " + request.getParameter("Sub" + i + "Name") + "='"
									+ request.getParameter("SelectedSub" + i) + "'";
					}
				}

				PreparedStatement ps = c.prepareStatement("if exists (select * from products_" + Category + " where "
						+ whereStat + ") select 9 else insert into products_" + Category + " (" + Fields + ") values ("
						+ Values + "); select 1;");
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					if (rs.getInt(1) == 9) {
						out.write("Item Already Exists");
						c.close();
						return;
					} else
						out.write("Item Added Successfully");
				}
				c.close();
			}

			if (fetch.equals("removeItem")) {
				int SubCount = Integer.parseInt(request.getParameter("SubCount"));
				String whereStat = "";
				for (int i = 1; i <= SubCount; i++) {
					if (i == 1)
						whereStat += request.getParameter("Sub" + i + "Name") + "='"
								+ request.getParameter("SelectedSub" + i) + "'";
					else {
						if (request.getParameter("SelectedSub" + i).equals("null"))
							whereStat += " and " + request.getParameter("Sub" + i + "Name") + " is "
									+ request.getParameter("SelectedSub" + i);
						else
							whereStat += " and " + request.getParameter("Sub" + i + "Name") + "='"
									+ request.getParameter("SelectedSub" + i) + "'";
					}
				}

				PreparedStatement ps = c.prepareStatement("delete products_" + Category + " where " + whereStat);
				ps.execute();
				out.write("Item Removed");
				c.close();
			}
			
			if (fetch.equals("changePrice")) {
				int SubCount = Integer.parseInt(request.getParameter("SubCount"));
				String whereStat = "";
				for (int i = 1; i <= SubCount; i++) {
					if (i == 1)
						whereStat += request.getParameter("Sub" + i + "Name") + "='"
								+ request.getParameter("SelectedSub" + i) + "'";
					else {
						if (request.getParameter("SelectedSub" + i).equals("null"))
							whereStat += " and " + request.getParameter("Sub" + i + "Name") + " is "
									+ request.getParameter("SelectedSub" + i);
						else
							whereStat += " and " + request.getParameter("Sub" + i + "Name") + "='"
									+ request.getParameter("SelectedSub" + i) + "'";
					}
				}
				
				
				PreparedStatement ps =c.prepareStatement("update products_"+Category+" set Price=? where "+whereStat);
				ps.setInt(1, Integer.parseInt(request.getParameter("price")));
				ps.execute();
				out.write("Price Changed");
				c.close();
				}

		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

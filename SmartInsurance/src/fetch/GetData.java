package fetch;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connection.DatabaseConnection;

/**
 * Servlet implementation class GetData
 */
@WebServlet("/GetData")
public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetData() {
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
		try {
			PrintWriter out=response.getWriter();
			String fetch=request.getParameter("fetch");
			Connection c=DatabaseConnection.getConnection();
		if (fetch.equals("Categories")) {
			PreparedStatement ps=c.prepareStatement("Select Category from Configurations;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				out.write(rs.getString(1)+",");
				}
			}
		if (fetch.equals("Subs")) {//fetch sub categories
			String Category=request.getParameter("SelectedCategory");
			PreparedStatement ps=c.prepareStatement("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='products_"+Category+"' and ORDINAL_POSITION > 3 order by ORDINAL_POSITION asc;");
			ResultSet rs = ps.executeQuery();
			int flag=0;
			while (rs.next()) {
				if (flag==0) {
					out.write(rs.getString(1));
					PreparedStatement pss=c.prepareStatement("SELECT distinct "+rs.getString(1)+" FROM products_"+Category+"");
					ResultSet rss = pss.executeQuery();
					while (rss.next())
						out.write(":"+rss.getString(1));	
					flag++;
				}
				else {
					out.write("::"+rs.getString(1));
				}
				}
			
		}
		
		if (fetch.split("_")[0].equals("Sub")) {
			String Category=request.getParameter("SelectedCategory");
			int count=Integer.parseInt(fetch.split("_")[1]);
			ArrayList<String> SubName= new ArrayList<String>();
			ArrayList<String> SubValue = new ArrayList<String>();
			String whereStat="";
			for (int i=0;i<count;i++) {// get all sub categories names and values
				SubName.add(request.getParameter("Sub"+(i+1)+"Name"));
				SubValue.add(request.getParameter("SelectedSub"+(i+1)));
			}
			SubName.add(request.getParameter("Sub"+(count+1)+"Name")); //get last sub category name
			for (int i=0;i<SubValue.size();i++) {
				if (i==0)
					whereStat+=SubName.get(i)+"='"+SubValue.get(i)+"' ";
				else
					whereStat+="and "+SubName.get(i)+"='"+SubValue.get(i)+"' ";
			}
			PreparedStatement ps=c.prepareStatement("SELECT distinct "+SubName.get(count)+" FROM products_"+Category+" where "+whereStat+";");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				out.write(rs.getString(1)+",");
				}
		}
		
		c.close();
		}
	 catch (SQLException | ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}}

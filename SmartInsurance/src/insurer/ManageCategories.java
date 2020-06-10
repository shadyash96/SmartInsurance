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
 * Servlet implementation class ManageCategories
 */
@WebServlet("/ManageCategories")
public class ManageCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageCategories() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("ManageCategories.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String Category=request.getParameter("CategoryName");
			Connection c = DatabaseConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("if exists (select * from Configurations where Category=?) select 'Exists' else select 'Doesnt'");
			ps.setString(1, Category);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String CategoryStatus=rs.getString(1);
			String fetch=request.getParameter("fetch");
			if (fetch.contentEquals("AddCategory")) {
				if (CategoryStatus.equals("Exists")) {
					request.setAttribute("Message", "Category already exists");
					request.getRequestDispatcher("ManageCategories.jsp").forward(request, response);
					c.close();
					return;
				}
				else {
					String statement="item_ID int IDENTITY(1, 1) PRIMARY KEY, URL nvarchar(200), Price int";
					int SubCount=Integer.parseInt(request.getParameter("SubNum"));
					for (int i=1;i<=SubCount;i++) {
						statement+=", "+request.getParameter("Sub"+i)+" nvarchar(30)";
					}
					ps=c.prepareStatement("create table products_"+Category+" ("+statement+")");
					ps.execute();
					float Rate=Float.parseFloat(request.getParameter("Rate"));
					int MinInsurMonths=Integer.parseInt(request.getParameter("MinimumInsurMonths"));
					int MaxInsurMonths=Integer.parseInt(request.getParameter("MaximumInsurMonths"));
					int MinCoverage=Integer.parseInt(request.getParameter("MinCoverage"));
					int MaxCoverage=Integer.parseInt(request.getParameter("MaxCoverage"));
					int MinInstMonths=Integer.parseInt(request.getParameter("MinInstMonths"));
					int MaxInstMonths=Integer.parseInt(request.getParameter("MaxInstMonths"));
					float InstallmentInterest=Float.parseFloat(request.getParameter("InstallmentInterest"));
					float InstallmentDownpayment=Float.parseFloat(request.getParameter("InstallmentDownpayment"));
					ps=c.prepareStatement("insert into Configurations values (?,?,?,?,?,?,?,?,?,?,?,?)");
					//1_Category, 2_min insur months, 3_max insur months, 4_min insur coverage, 5_max coverage
					//6_min inst months, 7_max inst months, 8_inst downpayment, 9_Rate, 10_new price mode
					//11_Used price mode, 12_installment interest
					ps.setString(1, Category);
					ps.setInt(2, MinInsurMonths);
					ps.setInt(3, MaxInsurMonths);
					ps.setInt(4, MinCoverage);
					ps.setInt(5, MaxCoverage);
					ps.setInt(6, MinInstMonths);
					ps.setInt(7, MaxInstMonths);
					ps.setFloat(8, InstallmentDownpayment);
					ps.setFloat(9, Rate);
					ps.setString(10, "auto");
					ps.setString(11,"manual");
					ps.setFloat(12, InstallmentInterest);
					ps.execute();
					// 5lsna configurations
					// create used fields
					int UsedNum=Integer.parseInt(request.getParameter("UsedNum"));
					ps=c.prepareStatement("insert into UsedFields values (?,?,?);");
					for (int i=1;i<=UsedNum;i++) {
						ps.setString(1, Category);
						ps.setString(2, request.getParameter("Used"+i));
						ps.setString(3, request.getParameter("Used"+i+"Type").equals("Number")?"int":"text");
						ps.addBatch();
					}
					ps.executeBatch();
				}
				request.setAttribute("Message", "Category Added Successfully");
				request.getRequestDispatcher("ManageCategories.jsp").forward(request, response);
			}
			else if (fetch.contentEquals("EditCategory")) {
				float Rate=Float.parseFloat(request.getParameter("Rate"));
				int MinInsurMonths=Integer.parseInt(request.getParameter("MinimumInsurMonths"));
				int MaxInsurMonths=Integer.parseInt(request.getParameter("MaximumInsurMonths"));
				int MinCoverage=Integer.parseInt(request.getParameter("MinCoverage"));
				int MaxCoverage=Integer.parseInt(request.getParameter("MaxCoverage"));
				int MinInstMonths=Integer.parseInt(request.getParameter("MinInstMonths"));
				int MaxInstMonths=Integer.parseInt(request.getParameter("MaxInstMonths"));
				float InstallmentInterest=Float.parseFloat(request.getParameter("InstallmentInterest"));
				float InstallmentDownpayment=Float.parseFloat(request.getParameter("InstallmentDownpayment"));
				PreparedStatement pss=c.prepareStatement("Update Configurations set Min_Insur_Months=?, Max_Insur_Months=?, "+
				"Min_Insur_Coverage=?, Max_Insur_Coverage=?, Min_Inst_Months=?, Max_Inst_Months=?, "+
				"Rate=?, Inst_interest_month=?, Inst_Downpayment=? where Category=?");
				pss.setInt(1, MinInsurMonths);
				pss.setInt(2, MaxInsurMonths);
				pss.setInt(3, MinCoverage);
				pss.setInt(4, MaxCoverage);
				pss.setInt(5, MinInstMonths);
				pss.setInt(6, MaxInstMonths);
				pss.setFloat(7, Rate);
				pss.setFloat(8, InstallmentInterest);
				pss.setFloat(9, InstallmentDownpayment);
				pss.setString(10, Category);
				pss.execute();
				request.setAttribute("Message", "Category Edited Successfully");
				request.getRequestDispatcher("ManageCategories.jsp").forward(request, response);
			}
			c.close();
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

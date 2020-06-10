package client;

import java.io.IOException;
import java.net.SocketException;
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
 * Servlet implementation class InsuranceRequest
 */
@WebServlet("/InsuranceRequest")
public class InsuranceRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsuranceRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/Client/insuranceRequests.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Categories - hat el categories names - condition {new used} - ProductPrice - CoveragePercentage
		// InsuranceDuration - PaymentType {cash installment} - InstallmentDownpayment
		// InstallmentDuration - PremiumValue
		String Category=request.getParameter("Categories");
		int item_ID, client_ID;
		String Condition=request.getParameter("condition");
		String ProductPrice=request.getParameter("ProductPrice");
		String CoveragePercentage=request.getParameter("CoveragePercentage");
		String InsuranceDuration=request.getParameter("InsuranceDuration");
		String PaymentType=request.getParameter("PaymentType");
		String InstallmentDownpayment=request.getParameter("InstallmentDownpayment");
		if (InstallmentDownpayment.length()<1)
			InstallmentDownpayment="0";
		String InstallmentDuration=request.getParameter("InstallmentDuration");
		String PremiumValue=request.getParameter("PremiumValue");
		
		try {
			Connection c=DatabaseConnection.getConnection();
			item_ID=getItemID(c, request, Category);
			client_ID=getClientID(c,request.getSession().getId());
			PreparedStatement ps=c.prepareStatement("insert into InsuranceRequest (Client_ID, Category,Item_ID, ItemValue, Coverage, Duration, Condition, Payment_Method, Installment_Duration, Downpayment, Status, PremiumValue) values (?, ?,?, ?, ?, ?, ?, ?, ?, ?, 'Pending',?)");
			//1_Client_ID, 2_Category, 3_Item_ID, 4_ItemValue, 5_Coverage, 6_Duration, 
			//7_Condition, 8_Payment_Method, 9_Installment_Duration, 10_Downpayment
			ps.setInt(1, client_ID);
			ps.setString(2, Category);
			ps.setInt(3, item_ID);
			ps.setInt(4, Integer.parseInt(ProductPrice));
			ps.setInt(5, Integer.parseInt(CoveragePercentage));
			ps.setInt(6, Integer.parseInt(InsuranceDuration));
			ps.setString(7, Condition);
			ps.setString(8, PaymentType);
			if (PaymentType.equals("installment")) {
				ps.setInt(9, Integer.parseInt(InstallmentDuration));
				ps.setInt(10,Integer.parseInt(InstallmentDownpayment));
			}
			else {
				ps.setNull(9, java.sql.Types.INTEGER);
				ps.setNull(10, java.sql.Types.INTEGER);
			}
			ps.setInt(11, Integer.parseInt(PremiumValue.split(" ")[0]));
			ps.execute();
			c.close();
			request.getRequestDispatcher("WEB-INF/Client/insuranceRequests.jsp").forward(request, response);
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	int getItemID(Connection c, HttpServletRequest request, String Category) throws SQLException {
		int item_ID = 0;
	    //String subCategoriesNames[] = {},subCategoriesValues[]= {};
		ArrayList<String> subCategoriesNames = new ArrayList<String>(),subCategoriesValues = new ArrayList<String>();
		PreparedStatement ps=c.prepareStatement("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='products_"+Category+"' and ORDINAL_POSITION > 3 order by ORDINAL_POSITION asc;");
		ResultSet rs=ps.executeQuery();
		int count=0;
		// to get sub categories names and values////
		while (rs.next()) {
			//subCategoriesNames[count]=rs.getString(1);
			subCategoriesNames.add(rs.getString(1));
			//subCategoriesValues[count]=request.getParameter(subCategoriesNames[count]);
			subCategoriesValues.add(request.getParameter(subCategoriesNames.get(count)));
			count++;
		}
		//to get Item ID
		String whereStat=" ";
		for (int i=0;i<subCategoriesNames.size();i++) {
			if (i==0)
				whereStat+=subCategoriesNames.get(i)+"='"+subCategoriesValues.get(i)+"' ";
			else
				whereStat+="and "+subCategoriesNames.get(i)+"='"+subCategoriesValues.get(i)+"' ";
		}
		//System.out.println(whereStat);
		ps=c.prepareStatement("select top(1) item_ID from products_"+Category+" where "+whereStat);
		rs=ps.executeQuery();
		if (rs.next())
			item_ID=rs.getInt(1);
		//////////////// got the item id///////////////
		return item_ID;
		}
	
	int getClientID(Connection c, String SessionID) throws SQLException {
		int client_ID=0;
		PreparedStatement ps=c.prepareStatement("SELECT Client_ID from Accounts where SessionID=?");
		ps.setString(1, SessionID);
		ResultSet rs=ps.executeQuery();
		if (rs.next())
			client_ID=rs.getInt(1);
		return client_ID;
		//String SessionID=request.getSession().getId();
	}

}

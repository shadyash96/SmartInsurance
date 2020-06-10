package insurer;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.SocketException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DatabaseConnection;

/**
 * Servlet implementation class MakePayments
 */
@WebServlet("/MakePayments")
public class MakePayments extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MakePayments() {
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
		// Date date;Calendar.getInstance();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String fetch = request.getParameter("fetch");
		try {
			Connection c = DatabaseConnection.getConnection();
			if (fetch.equals("InitialPayment")) {
				String Category, PaymentType;
				int ClientID, ItemID, Price, PremiumValue, Coverage, Duration, InstallmentDuration,
						InstallmentDownPayment;
				int RequestID = Integer.parseInt(request.getParameter("RequestID"));
				PreparedStatement ps = c.prepareStatement("Select * from InsuranceRequest where Request_ID=?");
				ps.setInt(1, RequestID);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					ClientID = rs.getInt(2);
					ItemID = rs.getInt(3);
					Price = rs.getInt(4);
					Coverage = rs.getInt(5);
					Duration = rs.getInt(6);
					PaymentType = rs.getString(7);
					InstallmentDuration = rs.getInt(8);
					InstallmentDownPayment = rs.getInt(9);
					Category = rs.getString(10);
					PremiumValue = rs.getInt(13);
					c.prepareStatement("Delete InsuranceRequest where Request_ID=" + RequestID).execute();
					PreparedStatement pss = c.prepareStatement(
							"insert into InsuredItems (Client_ID, Item_ID, StartDate, EndDate, Price, Premium_Value, Coverage_Percentage, Category) "
									+ " output inserted.Insurance_ID values (?, ?, getdate(), DATEADD(MONTH , " + Duration+ ", getDate()),?, ?, ?, ?)");
					pss.setInt(1, ClientID);
					pss.setInt(2, ItemID);
					pss.setInt(3, Price);
					pss.setInt(4, PremiumValue);
					pss.setInt(5, Coverage);
					pss.setString(6, Category);
					ResultSet rss=pss.executeQuery();
					rss.next();
					int newID=rss.getInt(1);
					if (PaymentType.equals("Cash")) {
						pss=c.prepareStatement("insert into Transactions (Insurance_ID, Type, Payment) values (?,?,?)");
						pss.setInt(1, newID);
						pss.setString(2, "Cash");
						pss.setInt(3, PremiumValue);
						pss.execute();
					}
					else if (PaymentType.equals("Installment")) {
						PreparedStatement pss2=c.prepareStatement("insert into Transactions (Insurance_ID, Type, Payment) values (?,?,?)");
						pss2.setInt(1, newID);
						pss2.setString(2, "Downpayment");
						pss2.setInt(3, InstallmentDownPayment);
						pss2.execute();
						int PaymentPerMonth=(PremiumValue-InstallmentDownPayment)/InstallmentDuration;
						for (int i=1;i<=InstallmentDuration;i++) {
							pss2=c.prepareStatement("insert into installments (Status, Insurance_ID, Payment_Date, Payment_Value) "+
						"values ('Pending',?, DATEADD(MONTH , " + i +", getDate()), ?)");
							pss2.setInt(1, newID);
							pss2.setInt(2, PaymentPerMonth);
							pss2.execute();
						}
					}
					out.write("Item Is Now Insured.");
				}
				else
					out.write("Request ID Doesn't Exist");
			}
			else if (fetch.equals("InstallmentPayment")) {
				int Payment, InsuranceID;
				int InstallmentID = Integer.parseInt(request.getParameter("InstallmentID"));
				PreparedStatement ps = c.prepareStatement("update Installments set Status='Paid' output inserted.Insurance_ID, inserted.Payment_Value where Installment_ID =?");
				ps.setInt(1, InstallmentID);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					InsuranceID=rs.getInt(1);
					Payment=rs.getInt(2);
					
					PreparedStatement pss=c.prepareStatement("insert into Transactions (Insurance_ID, Type, Payment, Installment_ID) values (?,?,?,?)");
					pss.setInt(1, InsuranceID);
					pss.setString(2, "Installment");
					pss.setInt(3, Payment);
					pss.setInt(4, InstallmentID);
					pss.execute();
					out.write("Installment Paid Successfully.");
				}
				else
					out.write("Installment ID Doesn't Exist");
			}
			c.close();
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package insurer;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.SocketException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DatabaseConnection;

/**
 * Servlet implementation class ManagePayments
 */
@WebServlet("/ManagePayments")
public class ManagePayments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagePayments() {
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
		String fetch=request.getParameter("fetch");
		try {
			Connection c=DatabaseConnection.getConnection();
			if (fetch.equals("getClientInfo")) {
				String PhoneNo=request.getParameter("PhoneNo");
				int ClientID;
				String Name, NationalID;
				String InsuranceRequests= "", Installments="";
				PreparedStatement ps=c.prepareStatement("Select Client_ID,Name,Identification_no from Clients where Phone_No=?");
				ps.setString(1, PhoneNo);
				ResultSet rs=ps.executeQuery();
				if(!rs.next()) {
					out.write("Phone Number Doesn't Exist");
					return;}
				ClientID=rs.getInt(1);
				Name=rs.getString(2);
				NationalID=rs.getString(3);
				
				
				/////////////// GET INSURANCE REQUESTS/////////////////////////////
				String Category;
				int ItemID;
				ps=c.prepareStatement("select ins.Category, ins.Item_ID ,ins.ItemValue, ins.Coverage, ins.Duration, ins.Payment_Method, ins.Installment_Duration, ins.Downpayment, ins.Condition, ins.Status, ins.Request_ID, PremiumValue, Client_ID from InsuranceRequest ins where ins.Status='Approved' and Client_ID=?;");
				ps.setInt(1, ClientID);
				rs = ps.executeQuery();
				int count=0;
				while (rs.next()) {
					if (count>0)
						InsuranceRequests+=":";
					count++;
					String Details="";
					Category=rs.getString(1);
					ItemID=rs.getInt(2);
					PreparedStatement pss=c.prepareStatement("Select (Select COUNT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='products_"+Category+"'),* from products_"+Category+" where Item_ID=?;");
					pss.setInt(1, ItemID);
					ResultSet rss=pss.executeQuery();
					if (rss.next()) {
						for (int i=5;i<=rss.getInt(1)+1;i++) {
							if (i==5)
								Details+=rss.getString(i);
							else
								Details+=" "+rss.getString(i);
						}
					}
					//1_Category, 2_ins.Item_ID ,3_ins.ItemValue, 4_ins.Coverage, 5_ins.Duration, 
					//6_ins.Payment_Method, 
					//7_ins.Installment_Duration, 8_ins.Downpayment, 9_ins.Condition, 10_Status
					//11_Request_ID, 12_Premium Value
					InsuranceRequests+=rs.getString(1)+","+Details+","+String.valueOf(rs.getInt(3))+
							","+String.valueOf(rs.getInt(4))+","+String.valueOf(rs.getInt(5))+
							","+rs.getString(6)+","+String.valueOf(rs.getInt(7))+","+String.valueOf(rs.getInt(8))+
							","+rs.getString(9)+","+rs.getString(10)+","+String.valueOf(rs.getInt(11))+
							","+String.valueOf(rs.getInt(12))+","+String.valueOf(rs.getInt(13));
					//0_Category, 1_Details, 2_ItemValue, 3_Coverage, 4_Duration, 5_Payment Method, 
					//6_Installment Duration, 7_Downpayment, 8_Condition, 9_Status, 10_Request_ID, 11_Premium Value, 12_Client_ID
				}
				///////////////////////END GET INSURANCE REQUESTS////////////////////////////////
				
				//////////////////////Begin Get Installments ///////////////////////////////////
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String Category1;
				int ItemID1;
				PreparedStatement ps1=c.prepareStatement("select Installment_ID, Installments.Status, Installments.Insurance_ID, Installments.Payment_Date, Installments.Payment_Value, InsuredItems.Category, InsuredItems.Item_ID from Installments join InsuredItems on Installments.Insurance_ID =InsuredItems.Insurance_ID where Installments.Status='Pending' and Client_ID=?");
				ps1.setInt(1, ClientID);
				ResultSet rs1=ps1.executeQuery();
				count=0;
				while (rs1.next()) {
					String Details="";
					Category1=rs1.getString(6);
					ItemID1=rs1.getInt(7);
					if(count>0)
						Installments+=":";
					count++;
					PreparedStatement pss=c.prepareStatement("Select (Select COUNT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='products_"+Category1+"'),* from products_"+Category1+" where Item_ID=?;");
					pss.setInt(1, ItemID1);
					ResultSet rss=pss.executeQuery();
					if (rss.next()) {
						for (int i=5;i<=rss.getInt(1)+1;i++) {
							if (i==5)
								Details+=rss.getString(i);
							else
								Details+=" "+rss.getString(i);
						}
					}
					Installments+=String.valueOf(rs1.getInt(1))+","+rs1.getString(2)+","+String.valueOf(rs1.getInt(3))+
							","+formatter.format(rs1.getDate(4))+","+String.valueOf(rs1.getInt(5))+","+Category1+","+Details;
					//0_Installment_ID, 1_Status, 2_InsuranceID, 3_Payment Date, 4_Payment Value, ,5_Category, 6_Item Details
				}
				out.write(ClientID+","+Name+","+NationalID+"//"+InsuranceRequests+"//"+Installments);
				// Split "/"
				//[0] split "," INFO 0_Client, 1_Name, 2_National ID
				//[1] InsuranceRequests  Split ":" //0_Category, 1_Details, 2_ItemValue, 3_Coverage, 4_Duration, 5_Payment Method, 
				//6_Installment Duration, 7_Downpayment, 8_Condition, 9_Status, 10_Request_ID, 11_Premium Value, 12_Client_ID
				//[2] Installments split ":" //0_Installment_ID, 1_Status, 2_InsuranceID, 3_Payment Date, 4_Payment Value, 5_Item Details
			}
			
			
			////////////// Get Initial Payment Value////////////////////////////
			else if (fetch.equals("getInitialPayment")) {
				if (request.getParameter("RequestID").length()<1)
					return;
				int RequestID=Integer.parseInt(request.getParameter("RequestID"));
				PreparedStatement ps=c.prepareStatement("Select Payment_Method, Downpayment, PremiumValue from InsuranceRequest where Request_ID=?");
				ps.setInt(1, RequestID);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					if (rs.getString(1).equalsIgnoreCase("Cash")) 
						out.write(String.valueOf(rs.getInt(3)));
					else
						out.write(String.valueOf(rs.getInt(2)));
				}
				else
					out.write("Request ID Doesn't Exist");
					
			}
			else if (fetch.equals("getInstallmentPayment")) {
				int InstallmentID=Integer.parseInt(request.getParameter("InstallmentID"));
				PreparedStatement ps=c.prepareStatement("Select Payment_Value from Installments where Installment_ID=?");
				ps.setInt(1, InstallmentID);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					out.write(String.valueOf(rs.getInt(1)));
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

package insurer;

import java.net.SocketException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import connection.DatabaseConnection;

public class GetInfo {
	static public ArrayList<String[]> getInsuranceRequests() throws ClassNotFoundException, SocketException {

		String Category;
		int ItemID;
		ArrayList<String[]> Requests = new ArrayList<String[]>();
		
		try {
			Connection c = DatabaseConnection.getConnection();
			//System.out.println("tesg1");
			PreparedStatement ps=c.prepareStatement("select ins.Category, ins.Item_ID ,ins.ItemValue, ins.Coverage, ins.Duration, ins.Payment_Method, ins.Installment_Duration, ins.Downpayment, ins.Condition, ins.Status, ins.Request_ID, PremiumValue, Client_ID from InsuranceRequest ins where ins.Status='Pending';");
			ResultSet rs = ps.executeQuery();
			//int count=0;
			while (rs.next()) {
				String Details="";
				String[] temp=new String[13];
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
				temp[0]=rs.getString(1);
				temp[1]=Details;
				temp[2]=String.valueOf(rs.getInt(3));
				temp[3]=String.valueOf(rs.getInt(4));
				temp[4]=String.valueOf(rs.getInt(5));
				temp[5]=rs.getString(6);
				temp[6]=String.valueOf(rs.getInt(7));
				temp[7]=String.valueOf(rs.getInt(8));
				temp[8]=rs.getString(9);
				temp[9]=rs.getString(10);
				temp[10]=String.valueOf(rs.getInt(11));
				temp[11]=String.valueOf(rs.getInt(12));
				temp[12]=String.valueOf(rs.getInt(13));
				//count++;
				Requests.add(temp);
			}
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		//0_Category, 1_Details, 2_ItemValue, 3_Coverage, 4_Duration, 5_Payment Method, 
		//6_Installment Duration, 7_Downpayment, 8_Condition, 9_Status, 10_Request_ID, 11_Premium Value, 12_Client_ID
		
		return Requests;
		
	}
	
	static public ArrayList<String[]> getClaimRequests() throws ClassNotFoundException, SocketException {

		String Category;
		int ItemID;
		ArrayList<String[]> Requests = new ArrayList<String[]>();
		
		try {
			Connection c = DatabaseConnection.getConnection();
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			PreparedStatement ps=c.prepareStatement("select ins.Category, ins.Item_ID ,ins.Price, ins.Coverage_Percentage, ins.Client_ID, Description, Documents,Claim_Value, [Date], ClaimRequest.ID from ClaimRequest join InsuredItems ins on ClaimRequest.Insurance_ID = ins.Insurance_ID where ClaimRequest.Status='Pending'");
			ResultSet rs = ps.executeQuery();
			//int count=0;
			while (rs.next()) {
				String Details="";
				String[] temp=new String[13];
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
				//1_Category, 2_Item_ID ,3_Price, 4_CoveragePercentage, 5_Client_ID, 
				//6_Description, 7_Documents, 8_Claim_Value, 9_[Date]
				temp[0]=rs.getString(1);
				temp[1]=Details;
				temp[2]=String.valueOf(rs.getInt(3));
				temp[3]=String.valueOf(rs.getInt(4));
				temp[4]=String.valueOf(rs.getInt(5));
				temp[5]=rs.getString(6);
				temp[6]=rs.getString(7);
				temp[7]=String.valueOf(rs.getInt(8));
				temp[8]=formatter.format(rs.getDate(9));
				temp[9]=String.valueOf(rs.getInt(10));
				Requests.add(temp);
			}
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		//0_Category, 1_Details, 2_ItemValue, 3_Coverage, 4_ClientID, 5_Incident Desc, 
		//6_Documents, Claim Value, 8_Date, 9_ClaimID
		return Requests;
		
	}
}

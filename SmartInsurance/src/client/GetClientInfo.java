package client;

import java.net.SocketException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date; 
import java.text.SimpleDateFormat; 

import javax.servlet.http.Cookie;

import connection.DatabaseConnection;



public class GetClientInfo {
	static public String getSessionID(Cookie[] AllCookies) {
		 String JSessionID=null;
			Cookie JSession=null;
			if( AllCookies != null ) {  
		        for (int i = 0; i < AllCookies.length; i++) {
		           if(AllCookies[i].getName().equals("JSESSIONID")) {
		        	  JSession=AllCookies[i];
		           }	               
		        }}
			if (JSession!=null)
		 JSessionID=JSession.getValue();
		return JSessionID;
		
	}
	static public String[] getBasics(String SessionID) throws ClassNotFoundException, SocketException {

		String[] account= new String[5];
		try {
			Connection c = DatabaseConnection.getConnection();
			//System.out.println("tesg1");
			PreparedStatement ps=c.prepareStatement("select Clients.Name, Accounts.Email, Address, Phone_No, Identification_no from Accounts join dbo.Clients on Accounts.Client_ID=Clients.Client_ID where SessionID=?;");
			ps.setString(1, SessionID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				account[0]=rs.getString(1);
				account[1]=rs.getString(2);
				account[2]=rs.getString(3);
				account[3]=rs.getString(4);
				account[4]=rs.getString(5);
			}
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		//0_Name, 1_Email, 2_Address, 3_Phone_No, 4_Identification_no
		return account;
		
	}
	
	static public ArrayList<String[]> getInsuranceRequests(String SessionID) throws ClassNotFoundException, SocketException {

		String Category;
		int ItemID;
		ArrayList<String[]> Requests = new ArrayList<String[]>();
		
		try {
			Connection c = DatabaseConnection.getConnection();
			//System.out.println("tesg1");
			PreparedStatement ps=c.prepareStatement("select ins.Category, ins.Item_ID ,ins.ItemValue, ins.Coverage, ins.Duration, ins.Payment_Method, ins.Installment_Duration, ins.Downpayment, ins.Condition, ins.Status, ins.Request_ID, PremiumValue from InsuranceRequest ins join Accounts on ins.Client_ID =Accounts.Client_ID where SessionID=?;");
			ps.setString(1, SessionID);
			ResultSet rs = ps.executeQuery();
			//int count=0;
			while (rs.next()) {
				String Details="";
				String[] temp=new String[12];
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
				//count++;
				Requests.add(temp);
			}
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		//0_Category, 1_Details, 2_ItemValue, 3_Coverage, 4_Duration, 5_Payment Method, 
		//6_Installment Duration, 7_Downpayment, 8_Condition, 9_Status, 10_Request_ID, 11_Premium Value
		
		return Requests;
		
	}
	
	
	static public ArrayList<String[]> getInsuredItems(String SessionID) throws ClassNotFoundException, SocketException {

		String Category;
		int ItemID;
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		// String strDate= formatter.format(date);
		ArrayList<String[]> InsuredItems = new ArrayList<String[]>();
		
		try {
			Connection c = DatabaseConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("select ins.Category, ins.Item_ID, ins.Price, ins.Premium_Value, ins.Coverage_Percentage,ins.StartDate, ins.EndDate, (select GetDate()) from InsuredItems ins join Accounts on ins.Client_ID =Accounts.Client_ID where SessionID=?;");
			ps.setString(1, SessionID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Date EndDate, CurrentDate;
				String Details="";
				String[] temp=new String[12];
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
				//1_Category, 2_Item_ID, 3_Price, 4_Premium_Value, 5_Coverage_Percentage,
				//6_StartDate, 7_EndDate, 8_CurrentDate
				temp[0]=rs.getString(1);
				temp[1]=Details;
				temp[2]=String.valueOf(rs.getInt(3));
				temp[3]=String.valueOf(rs.getInt(4));
				temp[4]=String.valueOf(rs.getInt(5));
				temp[5]=formatter.format(rs.getDate(6));
				EndDate=rs.getDate(7);
				temp[6]=formatter.format(rs.getDate(7));
				CurrentDate=rs.getDate(8);
				temp[7]=(CurrentDate.compareTo(EndDate)<0?"Covered":"Expired");
				InsuredItems.add(temp);
			}
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		//0_Category, 1_Details, 2_ItemValue, 3_PremiumValue, 4_Coverage, 5_StartDate, 6_EndDate, 
		//7_Status		
		return InsuredItems;
		
	}
	
	static public ArrayList<String[]> getUpcomingPayments(String SessionID) throws ClassNotFoundException, SocketException {

		String Category;
		int ItemID;
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		ArrayList<String[]> Payments = new ArrayList<String[]>();
		
		try {
			Connection c = DatabaseConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("Select TOP(7) InsuredItems.Category, InsuredItems.Item_ID, Installments.Payment_Date, Installments.Payment_Value from Installments join InsuredItems on Installments.Insurance_ID =InsuredItems.Insurance_ID join Accounts on Accounts.Client_ID=InsuredItems.Client_ID where Accounts.SessionID=? and Status='Pending' and GETDATE()<Payment_Date order by Payment_Date asc ");
			ps.setString(1, SessionID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String Details="";
				String[] temp=new String[12];
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
				//1_Category, 2_Item_ID, 3_Payment_Date, 4_Payment_Value
				temp[0]=rs.getString(1);
				temp[1]=Details;
				temp[2]=formatter.format(rs.getDate(3));
				temp[3]=String.valueOf(rs.getInt(4));
				Payments.add(temp);
			}
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		//0_Category, 1_Details, 2_Payment_Date, 3_PaymentValue
		return Payments;
		
	}
	
	static public ArrayList<String[]> getClaimList(String SessionID) throws ClassNotFoundException, SocketException {

		String Category;
		int ItemID;
		// String strDate= formatter.format(date);
		ArrayList<String[]> InsuredItems = new ArrayList<String[]>();
		
		try {
			Connection c = DatabaseConnection.getConnection();
			PreparedStatement ps=c.prepareStatement("select ins.Category, ins.Item_ID, ins.Insurance_ID from InsuredItems ins join Accounts on ins.Client_ID =Accounts.Client_ID where SessionID=?;");
			ps.setString(1, SessionID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String Details="";
				String[] temp=new String[12];
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
				//1_Category, 2_Item_ID, 3_Insurance_ID,
				temp[0]=rs.getString(1);
				temp[1]=Details;
				temp[2]=String.valueOf(rs.getInt(3));
				InsuredItems.add(temp);
			}
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		//0_Category, 1_Details, 2_Insurance ID
		return InsuredItems;
		
	}
}

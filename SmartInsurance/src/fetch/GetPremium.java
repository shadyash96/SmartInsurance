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
 * Servlet implementation class GetPremium
 */
@WebServlet("/GetPremium")
public class GetPremium extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetPremium() {
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
		// SelectedCategory, Price, CoveragePercentage, InsuranceDuration, PaymentType,
		// InstallmentDownpayment, InstallmentDuration
		PrintWriter out = response.getWriter();
		String Category = request.getParameter("SelectedCategory");
		String Price = request.getParameter("Price");
		String CoveragePercentage = request.getParameter("CoveragePercentage");
		String InsuranceDuration = request.getParameter("InsuranceDuration");
		String PaymentType = request.getParameter("PaymentType");
		String InstallmentDownpayment = request.getParameter("InstallmentDownpayment");
		String InstallmentDuration = request.getParameter("InstallmentDuration");
		float installment_interest;
		try {
			Connection c = DatabaseConnection.getConnection();
			PreparedStatement ps = c.prepareStatement("SELECT Rate, Inst_interest_month FROM Configurations where Category=?;");
			ps.setString(1, Category);
			ResultSet rs = ps.executeQuery();
			rs.next();
			float Rate = rs.getFloat(1);
			installment_interest = rs.getFloat(2);
			ps = c.prepareStatement(
					"select Less_Than, Rate_Increase from RateRules where Category=? and Type='Duration' order by Less_Than asc;");
			ps.setString(1, Category);
			rs = ps.executeQuery();
			while (rs.next()) {
				if (Integer.parseInt(InsuranceDuration) < rs.getInt(1)) {
					Rate += rs.getFloat(2);
					break;
				}
			}
			ps = c.prepareStatement(
					"select Less_Than, Rate_Increase from RateRules where Category=? and Type='Percentage' order by Less_Than asc;");
			ps.setString(1, Category);
			rs = ps.executeQuery();
			while (rs.next()) {
				if (Integer.parseInt(CoveragePercentage) < rs.getInt(1)) {
					Rate += rs.getFloat(2);
					break;
				}
			}
			float premium;
			premium=(Float.parseFloat(Price)*(Rate/100));
			//System.out.println((int)premium);
			if (PaymentType.equals("cash")) {
				out.write(String.valueOf(premium));
			}
			else if (PaymentType.equals("installment")) {
				int downpayment;
				if (InstallmentDownpayment.length()<1)
					downpayment=0;
				else
					downpayment=Integer.parseInt(InstallmentDownpayment);
				premium-=downpayment;
				premium+=(premium*Integer.parseInt(InstallmentDuration)*(installment_interest/100));
				int perMonth=(int) Math.ceil(premium/Integer.parseInt(InstallmentDuration));
				out.write(String.valueOf(perMonth));
			}

			c.close();
		} catch (ClassNotFoundException | SocketException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

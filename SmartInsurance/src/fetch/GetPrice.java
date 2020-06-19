package fetch;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.SocketException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DatabaseConnection;
import weka.classifiers.Classifier;
import weka.core.Instances;

/**
 * Servlet implementation class GetPrice
 */
@WebServlet("/GetPrice")
public class GetPrice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPrice() {
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
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		//String fetch=request.getParameter("fetch");
		String Condition=request.getParameter("Condition");
		try {
			Connection c=DatabaseConnection.getConnection();
			// if (fetch.equals("base")) {
			String Category = request.getParameter("SelectedCategory");
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
			if (Condition.equals("new")) {
				PreparedStatement ps = c
						.prepareStatement("Select avg(Price) from products_" + Category + " where " + whereStat + ";");
				ResultSet rs = ps.executeQuery();
				while (rs.next())
					if (rs.getString(1) != null)
					out.write(String.valueOf(rs.getInt(1)));
			}
			if (Condition.equals("used")) {
				int UsedCount = Integer.parseInt(request.getParameter("UsedCount"));

				try {
					ServletContext context = getServletContext();
					URL resourceUrl = context.getResource("/WEB-INF/Cars_mL.model");
					URL headerUrl = context.getResource("/WEB-INF/Cars_header.arff");
					Classifier cls = (Classifier) weka.core.SerializationHelper.read(resourceUrl.getFile());
					BufferedReader header = new BufferedReader(new FileReader(headerUrl.getFile()));
					StringBuilder everything = new StringBuilder();
					String line;
					while ((line = header.readLine()) != null) {
						everything.append(line + "\n");
					}
					everything.append("?");
					for (int i=1;i<=SubCount;i++)
						everything.append(","+request.getParameter("SelectedSub" + i));
					for (int i=1;i<=UsedCount;i++)
						everything.append(","+request.getParameter("SelectedUsedField" + i));
					//,"+brand+","+model+","+mileage+","+year);
					//Instances unlabeled;
					Instances unlabeled = new Instances(new BufferedReader(new StringReader(everything.toString())));
					unlabeled.setClassIndex(0);
					for (int i = 0; i < unlabeled.numInstances(); i++) {
						double clsLabel = cls.classifyInstance(unlabeled.instance(i));
						//out.write(Math.round(clsLabel));
						out.write(Long.toString(Math.round(clsLabel)));
						// System.out.println("---predicted value: " +
						// unlabeled.classAttribute().value((int)clsLabel));
					}
					c.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					out.write("Cant use AI on this product due to limitations in dataset. Enter the price manually");
					//e.printStackTrace();
				}
			}

			// }
			c.close();
		} catch (ClassNotFoundException | SQLException | SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

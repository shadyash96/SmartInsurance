package testing;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import testing.TestaddCars;

public class TestaddCars {
   static ScheduledFuture<?> result;

   static void test() throws ClassNotFoundException, SQLException, IOException {
      if (result != null) {
         result.cancel(true);
      }

      ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
      //result = scheduler.scheduleWithFixedDelay(new (), 0L, 60L, TimeUnit.MINUTES);
   }

   static Runnable renew() throws ClassNotFoundException, SQLException, IOException {
      DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
      Date date = new Date();
      System.out.println(dateFormat.format(date));
      Connection conn = null;
      Class.forName("org.sqlite.JDBC");
      String url = "jdbc:sqlite:/Users/Shady/eclipse-new/SmartInsurance/WebContent/SmartInsurance";
      conn = DriverManager.getConnection(url);
      String[] brands = new String[]{"geely", "chevrolet", "volks-wagen", "bmw", "mercedes"};
      ArrayList<String[]> allCars = new ArrayList();

      for(int i = 0; i < brands.length; ++i) {
         allCars.addAll(getCars("https://eg.hatla2ee.com/en/car/price/" + brands[i]));
      }

      conn.createStatement().execute("delete from TestCars;");
      PreparedStatement ps = conn.prepareStatement("insert into TestCars values (?,?,?,?,?)");

      for(int i = 0; i < allCars.size(); ++i) {
         ps.setString(1, ((String[])allCars.get(i))[0]);
         ps.setString(2, ((String[])allCars.get(i))[1]);
         ps.setString(3, ((String[])allCars.get(i))[2]);
         ps.setInt(4, Integer.parseInt(((String[])allCars.get(i))[3]));
         ps.setString(5, dateFormat.format(date));
         ps.addBatch();
      }

      ps.executeBatch();
      return null;
   }

   static ArrayList<String[]> getCars(String url) throws IOException {
      ArrayList<String[]> Cars = new ArrayList();
      Document doc = Jsoup.connect(url).get();
      Elements ALL = doc.select("div.nPricesModel_item");

      for(int i = 0; i < ALL.size(); ++i) {
         String[] model = ((Element)ALL.get(i)).select("div.nPricesModel_item_name a").html().split(" ");
         Elements contents = ((Element)ALL.get(i)).select("div.nPricesModel_item_body");

         for(int j = 0; j < contents.select("a").size(); ++j) {
            String fullMod = "";

            for(int m = 1; m < model.length; ++m) {
               fullMod = fullMod + model[m];
            }

            String[] temp = new String[]{model[0], fullMod, ((Element)contents.select("a").get(j)).html(), ((Element)contents.select("td.price").get(j)).html().split(" ")[0].replace(",", "")};
            Cars.add(temp);
         }
      }

      return Cars;
   }
}

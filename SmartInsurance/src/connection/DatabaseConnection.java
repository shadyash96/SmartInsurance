package connection;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.beans.PropertyVetoException;
import java.net.SocketException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
   private static ComboPooledDataSource cpds = new ComboPooledDataSource();

   static {
      try {
         cpds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         cpds.setJdbcUrl("jdbc:sqlserver://msa-insurance.database.windows.net:1433;database=InsuranceDB");
         cpds.setUser("shady");
         cpds.setPassword("Insurance12");
         cpds.setMaxIdleTime(600);
         cpds.setUnreturnedConnectionTimeout(60);
         cpds.setAcquireRetryAttempts(1);
         cpds.setPrivilegeSpawnedThreads(true);
         cpds.setContextClassLoaderSource("library");
      } catch (PropertyVetoException var1) {
         var1.printStackTrace();
      }

   }

   public static Connection getConnection() throws ClassNotFoundException, SocketException, SQLException {
      try {
         Connection c = cpds.getConnection();
         Statement stmt = c.createStatement();
         stmt.executeQuery("SELECT 1");
         return c;
      } catch (SQLException var3) {
         Connection conn = null;
         Class.forName("org.sqlite.JDBC");
         String url = "jdbc:sqlite::resource:Database.sql";
         conn = DriverManager.getConnection(url);
         return conn;
      }
   }

   public static void DestroyConnection() throws SQLException {
      cpds.close();
   }

   private DatabaseConnection() {
   }
}

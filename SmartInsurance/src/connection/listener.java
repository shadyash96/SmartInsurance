package connection;

import java.sql.SQLException;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class listener implements ServletContextListener, ServletContextAttributeListener {
   public void attributeAdded(ServletContextAttributeEvent scab) {
   }

   public void attributeRemoved(ServletContextAttributeEvent scab) {
   }

   public void contextDestroyed(ServletContextEvent sce) {
      try {
         DatabaseConnection.DestroyConnection();
      } catch (SQLException var3) {
         var3.printStackTrace();
      }

   }

   public void attributeReplaced(ServletContextAttributeEvent scab) {
   }

   public void contextInitialized(ServletContextEvent sce) {
   }
}

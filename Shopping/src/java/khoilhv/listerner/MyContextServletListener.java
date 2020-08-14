/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoilhv.listerner;

import java.io.IOException;
import java.io.InputStream;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author Infinity
 */
public class MyContextServletListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
       InputStream resource1 = sce.getServletContext().getResourceAsStream("/WEB-INF/siteMap.properties");
        ServletContext context = sce.getServletContext();
        try{
            ResourceBundle siteMap = new PropertyResourceBundle(resource1);
            context.setAttribute("SITE_MAP", siteMap);
        } catch (IOException ex) {
            System.out.println("error at MyContextServletListener" + ex.getMessage());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {       
    }
}

package com.ipartek.formacion.controller.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import com.ipartek.formacion.controller.backoffice.MigracionController;

/**
 * Application Lifecycle Listener implementation class log4jListener
 *
 */
@WebListener
public class log4jListener implements ServletContextListener {
	
	private final static Logger LOG = Logger.getLogger(MigracionController.class);

    /**
     * Default constructor. 
     */
    public log4jListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
    	LOG.info("TERMINA LA APLICACION");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	
		BasicConfigurator.configure();
		LOG.info("Arranca aplicacion y carga SERVLETS");
    }
	
}

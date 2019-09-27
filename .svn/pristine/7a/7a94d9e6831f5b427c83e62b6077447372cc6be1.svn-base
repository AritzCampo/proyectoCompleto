package com.ipartek.formacion.controller.listener;

import java.util.ArrayList;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Application Lifecycle Listener implementation class UsuariosLogeadosListener
 *
 */
@WebListener
public class UsuariosLogeadosListener implements HttpSessionListener, HttpSessionAttributeListener {

	
	public static ArrayList<Usuario> usuariosLogeados = new ArrayList<Usuario>();
	
	
	
    /**
     * Default constructor. 
     */
    public UsuariosLogeadosListener() {
       
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // session creada
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent event)  { 
        
    	System.out.println("attributeAdded " + event.getName() );
    	
    	if ( "usuario".equals(event.getName()) ) {
    		usuariosLogeados.add( (Usuario)event.getValue());
    	}
    	
    	
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent event)  { 
         
    	System.out.println("attributeRemoved " + event.getName() );
    	
    	if ( "usuario".equals(event.getName()) ) {
    		usuariosLogeados.remove( (Usuario)event.getValue());
    	}
    	
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent event)  { 
       
    }
	
}

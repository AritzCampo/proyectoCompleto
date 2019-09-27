package com.ipartek.formacion.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletControlador1
 */
@WebServlet("/controlador1")
public class ServletControlador1 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html");		
		
		// dar una respuesta a traves de la response		
		PrintWriter out = response.getWriter();		
		out.print("<h1>Respuesta desde ServletControlador1</h1>");
		out.print("<h2>Parametros</h2>");
		out.print("<ul>");
			Enumeration<String> eParamas = request.getParameterNames();
			while ( eParamas.hasMoreElements() ) {				
				String paramName = eParamas.nextElement();
				String paramValue = request.getParameter(paramName);
				out.print("<li>" + paramName + " <b>"+ paramValue +"</b></li>");					
			 }			
		out.print("</ul>");
		
		out.print("<h2>Cabecera</h2>");
		out.print("<ul>");
			Enumeration<String> eHeaders = request.getHeaderNames();
			while ( eHeaders.hasMoreElements() ) {				
				String paramName = eHeaders.nextElement();
				String paramValue = request.getHeader(paramName);
				if ( "user-agent".equalsIgnoreCase(paramName) ) {	
					out.print("<li style=\"background-color:yellow;\">" + paramName + " <b>"+ paramValue +"</b></li>");
				}else {
					out.print("<li>" + paramName + " <b>"+ paramValue +"</b></li>");
				}	
			 }			
		out.print("</ul>");
		
		// mirar version http y mas cosas
		
		// todos los datos de la cabecera
		//request.getParameterMap()
		
		// todos los parametros que envie el usuario
		
		
		
		out.flush();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// tenemos el GET y POST que hacen lo mismo
		doGet(request, response);
	}

}

package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.controller.pojo.Alert;

/**
 * Servlet implementation class ListadoNombresController
 */
@WebServlet("/nombres")
public class ListadoNombresController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static ArrayList<String> lista;
       
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("1º peticion de un cliente");
		lista = new ArrayList<String>();
	    lista.add("Manolo");
	    lista.add("Hermenegilda");
	    lista.add("Ursiciano");
	    lista.add("Agapito");		
	}

	public void destroy() {
		System.out.println("Al parar el servidor");
	}
   
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Antes de servir GET o POST");
		super.service(request, response);
		System.out.println("Despues de servir GET o POST");
		
	}
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String buscar = request.getParameter("buscar");
		
		if ( buscar != null && !buscar.trim().isEmpty() ) {
			
			ArrayList<String> listaFiltrada = new ArrayList<String>();
			for (String nombre : lista) {			
				if ( nombre.toLowerCase().contains(buscar.toLowerCase())) {
					listaFiltrada.add(nombre);
				}
			}	
			
			request.setAttribute("nombres", listaFiltrada );
		}else {
			request.setAttribute("nombres", lista);	
		}
		
		
		request.setAttribute("mensaje", null);
		request.setAttribute("buscar", buscar);
		
		
		request.getRequestDispatcher("ejemplos/nombres.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String nombreNuevo = request.getParameter("nombre");
		Alert mensaje = new Alert("danger", "Nombre no valido"); 
		
		if ( nombreNuevo != null ) {
		
			nombreNuevo = nombreNuevo.trim();
			
			if ( "".equalsIgnoreCase(nombreNuevo)) {
				mensaje = new Alert("warning", "Nombre no valido, intentalo de nuevo");
			}else {
				lista.add(nombreNuevo);			
				mensaje = new Alert("success", "Nombre creado con exito");
			}				
		
		}	
		
		request.setAttribute("mensaje", mensaje);
		request.setAttribute("nombres", lista);
		request.getRequestDispatcher("ejemplos/nombres.jsp").forward(request, response);
	}

}

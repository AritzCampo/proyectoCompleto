package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.controller.pojo.Alert;

/**
 * Servlet implementation class CalculadoraController
 */
@WebServlet("/calcular")
public class CalculadoraController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public static final  String[][] OPERACIONES = new String[][] {
		{ "1", "sumar" },
	    { "2", "restar"},
	    { "3", "multiplicar"},
	    { "4", "dividir"}
	};
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		String op = request.getParameter("op");
		float resultado = 0;
		
		
		//validar y parsear parametros
		try {
			float n1 = Float.parseFloat( num1.trim().replaceAll(",", ".") );
			float n2 = Float.parseFloat( num2.trim().replaceAll(",", ".") );
			
			
			switch (op) {
			case "1": // TODO mirar luego desde array
				resultado = n1 + n2;
				break;
			case "2": // TODO mirar luego desde array
				resultado = n1 - n2;
				break;
			case "3": // TODO mirar luego desde array
				resultado = n1 * n2;
				break;
			case "4": // TODO mirar luego desde array
				if ( n2 != 0 ) {
					resultado = n1 / n2;
				}else {
					request.setAttribute("mensaje", new Alert("warning", "No se puede dividir por cero"));
				}	
				break;	
	
			default:
				request.setAttribute("mensaje", new Alert("warning", "Por favor selecciona una opcion"));
				break;
			}
			
		}catch (Exception e) {
			
			request.setAttribute("mensaje", new Alert("danger", "Por favor escribe numeros"));
			
		}finally {
		
			request.setAttribute("resultado", resultado);
			request.setAttribute("op", op);
			request.setAttribute("num1", num1);
			request.setAttribute("num2", num2);			
			
			request.getRequestDispatcher("ejemplos/calculadora.jsp").forward(request, response);
			
		}	
		
		
		
		
	}
	
	

}

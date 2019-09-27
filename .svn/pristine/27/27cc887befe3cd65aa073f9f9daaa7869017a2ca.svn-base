package com.ipartek.formacion.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.pdfbox.pdmodel.PDDocument;

/**
 * Servlet implementation class ContentTypeController
 */
@WebServlet("/servlet3")
public class ContentTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		
		String tipo =  request.getParameter("p");
		String responseContent = "";
		
		switch (tipo) {
		case "1":
			response.setContentType("text/plain");
			responseContent = "perro buba, raza boxer, <p>No rendenriza HTML porque le hemos dicho que es texto plano</p>";
			break;
		case "2":
			response.setContentType("text/html");
			responseContent = "<h1>perro buba</h1><p>raza boxer</p><p>Si rendenriza HTML porque le hemos dicho que es texto en html</p>";
			break;
		case "3":
			response.setContentType("application/json");
			responseContent += " { ";
			responseContent += " \"nombre\": \"buba\", ";
			responseContent += " \"raza\": \"boxer\" ";
			responseContent += " } ";
			break;
			
		case "4":
			response.setContentType("application/pdf");
			
			/* TODO
				PDDocument document = new PDDocument();			
				document.close();			
				ByteArrayOutputStream baos = GeneratePdf.getPdfFile(cities);
		        baos.writeTo(out);
	        */
			
			
		default:
			response.setContentType("text/plain");
			break;
		}
		
		
		
		PrintWriter out = response.getWriter();
		out.print(responseContent);		
		out.flush();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}

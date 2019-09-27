package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Validation;
import javax.validation.Validator;

public abstract class ControladorCrud extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public static String view = "";

	public static final String OP_LISTAR = "0";
	public static final String OP_GUARDAR = "23";
	public static final String OP_BUSCAR = "8";
	public static final String OP_MOSTRAR_FORMULARIO = "4";
	public static final String OP_ELIMINAR = "2";
	
	
	private Validator validator;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		validator = Validation.buildDefaultValidatorFactory().getValidator();
	}
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("op");
		if (op == null) {
			op = OP_LISTAR;
		}

		switch (op) {
		case OP_MOSTRAR_FORMULARIO:
			mostrarFormulario(request, response);
			break;

		case OP_BUSCAR:
			buscar(request, response);
			break;

		case OP_GUARDAR:
			guardar(request, response);
			break;

		case OP_ELIMINAR:
			eliminar(request, response);
			break;

		default:
			listar(request, response);
			break;
		}

		request.getRequestDispatcher(view).forward(request, response);
	}


	protected abstract void listar(HttpServletRequest request, HttpServletResponse response);


	protected abstract void eliminar(HttpServletRequest request, HttpServletResponse response);


	protected abstract void guardar(HttpServletRequest request, HttpServletResponse response);


	protected abstract void buscar(HttpServletRequest request, HttpServletResponse response) ;


	protected abstract void mostrarFormulario(HttpServletRequest request, HttpServletResponse response);

	
}

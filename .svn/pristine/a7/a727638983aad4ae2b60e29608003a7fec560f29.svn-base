package com.ipartek.formacion.controller.backoffice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

import com.ipartek.formacion.controller.ControladorCrud;
import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.CategoriaDAO;
import com.ipartek.formacion.model.pojo.Categoria;

/**
 * Servlet implementation class CategoriaController
 */
@WebServlet("/backoffice/categoria")
public class CategoriaController extends ControladorCrud {

	private static final long serialVersionUID = 1L;

	public static final String VIEW_INDEX = "categoria/index.jsp";
	public static final String VIEW_FORM = "categoria/formulario.jsp";;

	private static CategoriaDAO categoriaDAO;
	private Validator validator;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);

		categoriaDAO = CategoriaDAO.getInstance();
		validator = Validation.buildDefaultValidatorFactory().getValidator();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void listar(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<Categoria> lista = categoriaDAO.getAll();
		;
		request.setAttribute("categorias", lista);
		view = VIEW_INDEX;

	}

	@Override
	protected void guardar(HttpServletRequest request, HttpServletResponse response) {
		int idCategoria = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");

		Categoria c = new Categoria();
		c.setId(idCategoria);
		c.setNombre(nombre);

		Set<ConstraintViolation<Categoria>> violations = validator.validate(c);
		if (violations.isEmpty()) {

			try {

				if (c.getId() == -1) {
					categoriaDAO.crear(c);
					idCategoria = c.getId();
					request.setAttribute("mensaje", new Alert("success", "Registro creado con exito"));
				} else {
					categoriaDAO.modificar(c);
					request.setAttribute("mensaje", new Alert("success", "Registro modificado con exito"));
				}

			} catch (Exception e) {

				request.setAttribute("mensaje", new Alert("danger", "Tenemos un problema, el codigo ya existe"));
			}

		} else { // hay violaciones de las validaciones

			String mensaje = "";

			for (ConstraintViolation<Categoria> violation : violations) {
				mensaje += violation.getPropertyPath() + ": " + violation.getMessage() + "<br>";
			}
			request.setAttribute("mensaje", new Alert("warning", mensaje));
		}

		request.setAttribute("categoria", c);

		view = VIEW_FORM;

	}

	@Override
	protected void buscar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	@Override
	protected void mostrarFormulario(HttpServletRequest request, HttpServletResponse response) {

		Categoria categoria = new Categoria();
		request.setAttribute("categoria", categoria);

		view = VIEW_FORM;

	}

	@Override
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		if (categoriaDAO.delete(id)) {
			request.setAttribute("mensaje", new Alert("success", "Registro Eliminado"));
		} else {
			request.setAttribute("mensaje", new Alert("danger", "ERROR, no se pudo eliminar"));
		}

		listar(request, response);

	}

	@Override
	protected void detalle(HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		Categoria c = categoriaDAO.getById(id);

		request.setAttribute("categoria", c);

		view = VIEW_FORM;

	}

}

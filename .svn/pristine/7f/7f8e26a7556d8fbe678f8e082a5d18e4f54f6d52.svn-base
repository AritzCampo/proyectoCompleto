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
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.RolDAO;
import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.pojo.Rol;
import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Servlet implementation class RolController
 */
@WebServlet("/backoffice/rol")
public class RolController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public static final String VIEW_INDEX = "rol/index.jsp";
	public static final String VIEW_FORM = "rol/formulario.jsp";
	public static final String VIEW_PUBLIC = "/";

	public static String view = VIEW_INDEX;

	public static final String OP_LISTAR = "0";
	public static final String OP_GUARDAR = "23";
	public static final String OP_BUSCAR = "8";
	public static final String OP_NUEVO = "4";
	public static final String OP_ELIMINAR = "hfd3";
	public static final String OP_DETALLE = "13";

	private static final RolDAO rolDAO = RolDAO.getInstance();
	

	private Validator validator;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		validator = Validation.buildDefaultValidatorFactory().getValidator();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		if (usuario.getRol().getId() == Rol.ROL_ADMINISTRADOR) {
			String op = request.getParameter("op");
			if (op == null) {
				op = OP_LISTAR;
			}

			/*switch (op) {
			case OP_DETALLE:
				detalle(request, response);
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

			case OP_NUEVO:
				nuevo(request, response);
				break;

			default:
				listar(request, response);
				break;
			}*/
			listar(request, response);
			request.getRequestDispatcher(view).forward(request, response);
		} else {
			request.getRequestDispatcher(VIEW_PUBLIC).forward(request, response);
		}
	}

/*	private void nuevo(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("usuarioEditar", new Rol());
		view = VIEW_FORM;
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) {

		String nombreBuscar = request.getParameter("nombreBuscar");
		request.setAttribute("usuarios", rolDAO.getAllByNombre(nombreBuscar));
		view = VIEW_INDEX;
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {

		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		if (rolDAO.delete(id)) {
			request.setAttribute("mensaje", new Alert("success", "Registro Eliminado"));
		} else {
			request.setAttribute("mensaje", new Alert("danger", "ERROR, no se pudo eliminar"));
		}

		listar(request, response);

	}

	private void guardar(HttpServletRequest request, HttpServletResponse response) {

		String sid = request.getParameter("id");
		String nombre = request.getParameter("nombre");
		String contrasenya = request.getParameter("contrasenya");

		Rol u = new Rol();
		u.setId(Integer.parseInt(sid));
		u.setNombre(nombre);
		u.setContrasenya(contrasenya);

		Set<ConstraintViolation<Rol>> violations = validator.validate(u);
		if (violations.isEmpty()) {

			try {

				if (u.getId() == -1) {
					rolDAO.crear(u);
				} else {
					rolDAO.modificar(u);
				}
				request.setAttribute("mensaje", new Alert("success", "Registro creado con exito"));

			} catch (Exception e) {

				request.setAttribute("mensaje", new Alert("danger", "Tenemos un problema, el codigo ya existe"));
			}

		} else { // hay violaciones de las validaciones

			String mensaje = "";

			for (ConstraintViolation<Rol> violation : violations) {
				mensaje += violation.getPropertyPath() + ": " + violation.getMessage() + "<br>";
			}
			request.setAttribute("mensaje", new Alert("warning", mensaje));
		}
		listar(request, response);

	}
	
	private void detalle(HttpServletRequest request, HttpServletResponse response) {

		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		Rol u = rolDAO.getById(id);
		request.setAttribute("usuarioEditar", u);
		
		request.setAttribute("roles", rolDAO.getAll());
		
		view = VIEW_FORM;

	}
*/
	private void listar(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("roles", rolDAO.getAll());
		view = VIEW_INDEX;

	}

	

}

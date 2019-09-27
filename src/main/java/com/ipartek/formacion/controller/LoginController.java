package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.pojo.Rol;
import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nombre = request.getParameter("nombre");
		String contrasenya = request.getParameter("contrasenya");

		Usuario usuario = usuarioDAO.existe(nombre, contrasenya);

		if (usuario != null) {

			HttpSession session = request.getSession();
			// session.setMaxInactiveInterval( 60 * 5 ); // 5 min

			// preguntar si esta dado de baja
			if (usuario.getFechaEliminacion() != null) {

				request.setAttribute("mensaje", new Alert("danger", "Lo sentimos pero se le ha dado de baja"));
				request.getRequestDispatcher("login.jsp").forward(request, response);

			} else {

				session.setAttribute("usuario", usuario);

				request.setAttribute("mensaje", new Alert("success", "Ongi Etorri " + usuario.getNombre()));

				String callback = (String) session.getAttribute("callback");

				if (callback == null) {

					if (usuario.getRol().getId() == Rol.ROL_ADMINISTRADOR) {

						response.sendRedirect("backoffice/inicio");
					} else {

						response.sendRedirect("frontoffice/inicio");
					}

				} else {
					session.removeAttribute("callback");
					response.sendRedirect(callback);
				}

			} // end: preguntar si esta dado de baja

		} else {

			request.setAttribute("mensaje", new Alert("danger", "credenciales no correctas"));
			request.getRequestDispatcher("login.jsp").forward(request, response);

		}

	}

}

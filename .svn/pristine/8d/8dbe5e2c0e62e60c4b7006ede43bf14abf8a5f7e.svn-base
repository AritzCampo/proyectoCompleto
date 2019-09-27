package com.ipartek.formacion.controller.backoffice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Rol;
import com.ipartek.formacion.model.pojo.Usuario;
import com.ipartek.formacion.model.pojo.Video;

/**
 * Servlet implementation class BackofficeController
 */
@WebServlet("/backoffice/inicio")
public class BackofficeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final VideoDAO videoDAO = VideoDAO.getInstance();
	private static final UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();

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

		ArrayList<Video> videos = videoDAO.getAll();
		ArrayList<Usuario> usuarios = usuarioDAO.getAll();

		request.setAttribute("numeroVideos", videos.size());
		request.setAttribute("numeroUsuarios", usuarios.size());

		// Comprobar el rol
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		if (usuario.getRol().getId() == Rol.ROL_ADMINISTRADOR) {
			// request interna
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			// String url = request.getContextPath();
			response.sendRedirect("../frontoffice/inicio");
		}

	}

}

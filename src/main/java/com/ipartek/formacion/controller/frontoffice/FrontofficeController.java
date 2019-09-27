package com.ipartek.formacion.controller.frontoffice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Usuario;
import com.ipartek.formacion.model.pojo.Video;

/**
 * Servlet implementation class FrontofficeController
 */
@WebServlet("/frontoffice/inicio")
public class FrontofficeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final VideoDAO videoDAO = VideoDAO.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontofficeController() {
		super();
		// TODO Auto-generated constructor stub
	}

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
		HttpSession session = request.getSession();
		Usuario usuario = new Usuario();
		usuario = (Usuario) session.getAttribute("usuario");
		int likes = 0;

		if (usuario != null) {
			ArrayList<Video> videos = videoDAO.getAllById(usuario.getId());
			
			for (int i = 0; i < videos.size(); i++) {
				likes += videos.get(i).getLikes();
			}

			request.setAttribute("numeroVideos", videos.size());
			request.setAttribute("likes", likes);

			// request interna
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			request.setAttribute("mensaje", new Alert("danger", "credenciales no correctas"));
			request.getRequestDispatcher("../login.jsp").forward(request, response);
		}

	}

}

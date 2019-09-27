package com.ipartek.formacion.controller.publico;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.CategoriaDAO;
import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Usuario;
import com.ipartek.formacion.model.pojo.Video;

/**
 * Servlet implementation class PublicController
 */
@WebServlet("/public/inicio")
public class PublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final VideoDAO videoDAO = VideoDAO.getInstance();
	public static final String VIEW_INDEX = "index.jsp";
	public static final String VIEW_FORM = "../formulario_publico.jsp";
	public static final String VIEW_FORM_AJENO = "youtube/formulario_ajeno.jsp";
	public static String view = VIEW_INDEX;

	public static final String OP_LISTAR = "0";
	public static final String OP_GUARDAR = "23";
	public static final String OP_NUEVO = "4";
	public static final String OP_ELIMINAR = "hfd3";
	public static final String OP_DETALLE = "13";


	private static UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();
	private static CategoriaDAO categoriaDAO = CategoriaDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublicController() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String buscador =  request.getParameter("buscador");
		int opcion = Integer.parseInt(request.getParameter("opcionBuscar"));
		
		ArrayList<Video> videosInicialNombre = videoDAO.getAllFiltro(buscador, true);
		ArrayList<Video> videosInicialUsuario = videoDAO.getAllFiltro(buscador, false);
		
		
		
		if (opcion==1) {
			if (videosInicialNombre.isEmpty())  {
				request.setAttribute("mensaje", new Alert("warning", "No hay resultados que coicidan con la búsqueda de título."));
			}
			request.setAttribute("videosInicial", videosInicialNombre);
		}else {
			if (videosInicialUsuario.isEmpty())  {
				request.setAttribute("mensaje", new Alert("warning", "No hay resultados que coicidan con la búsqueda de usuario."));
			}
			request.setAttribute("videosInicial", videosInicialUsuario);
		}
		
		request.getRequestDispatcher("../index.jsp").forward(request, response);
		
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("videosInicial", videoDAO.getAllVisible(true));
		String op = request.getParameter("op");
		if (op != null) {
		if(op.equalsIgnoreCase(OP_DETALLE)) {
			detalle(request, response);
			request.getRequestDispatcher(view).forward(request, response);
		}
		}else {
		String path = request.getContextPath() + "/index.jsp";
		request.getRequestDispatcher("../index.jsp").forward(request, response);
		}
		
	}
	private void detalle(HttpServletRequest request, HttpServletResponse response) {

		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		Video v = videoDAO.getById(id);
		
		
		request.setAttribute("video", v);

		request.setAttribute("usuarios", usuarioDAO.getAll());
		request.setAttribute("categorias", categoriaDAO.getAll());

		HttpSession session = request.getSession();
		
		Usuario u = (Usuario) session.getAttribute("usuario");
		
	
			view = VIEW_FORM;
	
	}

}

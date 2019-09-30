package com.ipartek.formacion.controller.backoffice;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import com.ipartek.formacion.model.dao.RolDAO;
import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.pojo.Rol;
import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Servlet implementation class MigracionController
 */
@WebServlet("/backoffice/migracion")
public class MigracionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String view = "migracion/index.jsp";
	private static final UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();
	private static final RolDAO rolDAO = RolDAO.getInstance();
	private int leidas = 0;
	private int insertadas = 0;
	private int error = 0;

	private final static Logger LOG = Logger.getLogger(MigracionController.class);
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BasicConfigurator.configure();
		Usuario usuario = new Usuario();
		ArrayList<Rol> listaRol = new ArrayList<Rol>();
		//ArrayList<Usuario> listaUsuario = new ArrayList<Usuario>();
		File fichero = new File("C:\\1713\\eclipse-workspace\\proyectoCompleto\\personas.txt");

		FileReader fr = null;
		BufferedReader br = null;
		String[] usuarioArray;
		String[] usuarioInsert = new String[3];
		listaRol = rolDAO.getAll();
		listaRol.contains(usuarioInsert[2]);
		long tiempoInicio = System.currentTimeMillis();
		try {
			// Apertura del fichero y creacion de BufferedReader para poder
			// hacer una lectura comoda (disponer del metodo readLine()).

			fr = new FileReader(fichero);
			br = new BufferedReader(fr);

			// Lectura del fichero
			String linea;
			while ((linea = br.readLine()) != null) {
				leidas++;
				// separamos la linea
				usuarioArray = linea.split(",");
				if (usuarioArray.length == 7) {
					// preparamos un array con datos validos para insertar
					usuarioInsert[0] = usuarioArray[0] + " " + usuarioArray[1] + " " + usuarioArray[2];
					usuarioInsert[1] = usuarioArray[5];
					usuarioInsert[2] = usuarioArray[6];
					// creamos el objeto usuario
					usuario.setNombre(usuarioInsert[0]);
					usuario.setContrasenya(usuarioInsert[1]);
					// traducimos el rol a numero
					//usuario.setRol(new Rol(rolDAO.buscarNombreRol(usuarioInsert[2]), usuarioInsert[2]));
					// añadimos usuario al arraylist
					//listaUsuario.add(usuario);
					try {
					usuarioDAO.crear(usuario);
					insertadas++;
					LOG.info("LINEA INSERTADA");
					} catch (Exception e) {
						e.printStackTrace();
						LOG.warn("linea error **********" + linea);
					}
				}
			}
			/*Iterator<Usuario> it = listaUsuario.iterator();
			while (it.hasNext()) {
				try {
				usuarioDAO.crear(it.next());
				insertadas++;
				} catch (Exception e) {
					e.printStackTrace();	
				}
			*/
			//error = leidas - insertadas;
		} catch (Exception e) {
			e.printStackTrace();
			error++;
		} finally {
			// En el finally cerramos el fichero, para asegurarnos
			// que se cierra tanto si todo va bien como si salta
			// una excepcion.
			try {
				if (null != fr) {
					fr.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		error = leidas - insertadas;
		long tiempoFin = System.currentTimeMillis();
		request.setAttribute("leidas", leidas);
		request.setAttribute("insertadas", insertadas);
		request.setAttribute("error", error);
		request.setAttribute("tiempo", ((tiempoFin -tiempoInicio)/1000)/60);
		LOG.info("*******************");
		LOG.info("MIGRACION TERMINADA");
		
		LOG.info("leidas : " + leidas);
		LOG.info("insertadas : " + insertadas);
		LOG.info("erroneas : " + error);
		LOG.info("leidas : " + leidas);
		LOG.info("*******************");

		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

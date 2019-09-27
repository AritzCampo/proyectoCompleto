package com.ipartek.formacion.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ipartek.formacion.model.ConnectionManager;
import com.ipartek.formacion.model.pojo.Rol;
import com.ipartek.formacion.model.pojo.Usuario;

public class UsuarioDAO {

	private static UsuarioDAO INSTANCE = null;
	
	private static final String SQL_GET_ALL = "{ CALL getAll() }";
	private static final String SQL_GET_BY_ID = "{ CALL getAllById(?) }";
	private static final String SQL_GET_ALL_BY_NOMBRE = "{ CALL getAllByNombre(?) }";
	private static final String SQL_EXISTE = "{ CALL usuarioExiste(?,?) }";
	private static final String SQL_INSERT = "{ CALL crear(?,?) }";
	private static final String SQL_UPDATE = "{ CALL modificar(?,?,?) }";
	// private static final String SQL_DELETE = "DELETE FROM usuario WHERE id = ?;";
	private static final String SQL_DELETE_LOGICO = "{ CALL deleteId(?) }";
	private static final String SQL_RESUMEN_USUARIOS = "{ CALL getResumen() }";

	private UsuarioDAO() {
		super();
	}

	public static synchronized UsuarioDAO getInstance() {

		if (INSTANCE == null) {
			INSTANCE = new UsuarioDAO();
		}

		return INSTANCE;

	}

	/**
	 * Compruab si existe el usuario en la base datos, lo busca por su nombre y
	 * conetrsenya
	 * 
	 * @param nombre
	 * @param contrasenya
	 * @return Usuario con datos si existe, null en caso de no existir
	 */
	public Usuario existe(String nombre, String contrasenya) {

		Usuario usuario = null;		

		try (Connection con = ConnectionManager.getConnection(); CallableStatement cst = con.prepareCall(SQL_EXISTE);) {

			// sustituir ? por parametros
			cst.setString(1, nombre);
			cst.setString(2, contrasenya);

			// ejecutar sentencia SQL y obtener Resultado
			try (ResultSet rs = cst.executeQuery()) {

				if (rs.next()) {
					usuario = mapper(rs);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return usuario;
	}

	public ArrayList<Usuario> getAll() {

		ArrayList<Usuario> lista = new ArrayList<Usuario>();

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(SQL_GET_ALL);
				ResultSet rs = cst.executeQuery()) {

			while (rs.next()) {
				/*
				 * Usuario u = new Usuario(); u.setId(rs.getInt("id"));
				 * u.setNombre(rs.getString("nombre"));
				 * u.setContrasenya(rs.getString("contrasenya")); lista.add(u);
				 */
				lista.add(mapper(rs));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}
	
	public ArrayList<Usuario> getResumen() {
		
		//SELECT id, nombre, rol, fecha_creacion, fecha_eliminacion, videos FROM v2019.resumen_usuarios;

		ArrayList<Usuario> lista = new ArrayList<Usuario>();

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(SQL_RESUMEN_USUARIOS); 
				ResultSet rs = cst.executeQuery()) {

			while (rs.next()) {
				/*
				 * Usuario u = new Usuario(); u.setId(rs.getInt("id"));
				 * u.setNombre(rs.getString("nombre"));
				 * u.setContrasenya(rs.getString("contrasenya")); lista.add(u);
				 */
				lista.add(mapper(rs));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}

	public ArrayList<Usuario> getAllByNombre(String nombre) {
		ArrayList<Usuario> lista = new ArrayList<Usuario>();

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(SQL_GET_ALL_BY_NOMBRE); ) {

			cst.setString(1, "%" + nombre + "%");

			try (ResultSet rs = cst.executeQuery()) {

				while (rs.next()) {
					lista.add(mapper(rs));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}

	public Usuario getById(int id) {
		Usuario resul = new Usuario();

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(SQL_GET_BY_ID);) {

			cst.setInt(1, id);

			try (ResultSet rs = cst.executeQuery()) {
				if (rs.next()) {
					resul = mapper(rs);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resul;
	}

	public boolean delete(int id) {
		boolean resultado = false;

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(SQL_DELETE_LOGICO);) {

			cst.setInt(1, id);

			int affetedRows = cst.executeUpdate();
			if (affetedRows == 1) {
				resultado = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultado;
	}

	public boolean modificar(Usuario pojo) throws Exception {
		boolean resultado = false;
		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(SQL_UPDATE);) {
            
			cst.setInt(1, pojo.getId());
			cst.setString(2, pojo.getNombre());
			cst.setString(3, pojo.getContrasenya());
			

			int affectedRows = cst.executeUpdate();
			if (affectedRows == 1) {
				resultado = true;
			}

		}
		return resultado;
	}

	public Usuario crear(Usuario pojo) throws Exception {

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(SQL_INSERT);) {

			cst.setString(1, pojo.getNombre());
			cst.setString(2, pojo.getContrasenya());

			int affectedRows = cst.executeUpdate();
			if (affectedRows == 1) {
				// conseguimos el ID que acabamos de crear
				ResultSet rs = cst.getGeneratedKeys();
				if (rs.next()) {
					pojo.setId(rs.getInt(1));
				}

			}

		}

		return pojo;
	}

	private Usuario mapper(ResultSet rs) throws SQLException {
		
		Usuario u = new Usuario();
		u.setId(rs.getInt("id"));
		u.setNombre(rs.getString("nombre"));
		u.setContrasenya(rs.getString("contrasenya"));
		u.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
		u.setFechaEliminacion(rs.getTimestamp("fecha_eliminacion"));
		
		Rol rol = new Rol();
		rol.setId( rs.getInt("id_rol"));
		rol.setNombre( rs.getString("nombre_rol"));
		u.setRol(rol);
		u.setTotalVideos(rs.getInt("total_videos"));
		
		return u;
	}

}















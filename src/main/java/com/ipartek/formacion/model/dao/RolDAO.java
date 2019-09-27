package com.ipartek.formacion.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ipartek.formacion.model.ConnectionManager;
import com.ipartek.formacion.model.pojo.Rol;
import com.ipartek.formacion.model.pojo.Usuario;

public class RolDAO {

	private static RolDAO INSTANCE = null;

	private static final String SQL_GET_ALL = "{ CALL rolGetAll() }";
	private static final String SQL_INSERT = "{ CALL rolInsert(?,?) }";
	private static final String SQL_DELETE = "{ CALL rolDelete(?) }";
	private static final String SQL_UPDATE = "{ CALL rolUpdate(?,?) }";
	private static final String SQL_GET_ROL_BY_NOMBRE = "{ CALL rolGetNombre(?) }";

	/*
	 * private static final String SQL_GET_BY_ID =
	 * "SELECT id,nombre,contrasenya FROM usuario WHERE id = ?;"; private static
	 * final String SQL_GET_ALL_BY_NOMBRE =
	 * "SELECT id,nombre,contrasenya FROM usuario WHERE nombre LIKE ? ORDER BY nombre ASC LIMIT 500;"
	 * ; private static final String SQL_INSERT =
	 * "INSERT INTO usuario ( nombre, contrasenya) VALUES ( ? , ?);"; private static
	 * final String SQL_UPDATE =
	 * "UPDATE usuario SET nombre= ?, contrasenya= ? WHERE id = ?;"; private static
	 * final String SQL_DELETE = "DELETE FROM usuario WHERE id = ?;";
	 */

	private RolDAO() {
		super();
	}

	public static synchronized RolDAO getInstance() {

		if (INSTANCE == null) {
			INSTANCE = new RolDAO();
		}

		return INSTANCE;

	}

	public ArrayList<Rol> getAll() {

		ArrayList<Rol> lista = new ArrayList<Rol>();

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(SQL_GET_ALL);
				ResultSet rs = cst.executeQuery();) {

			while (rs.next()) {
				lista.add(mapper(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}

	public boolean delete(int id) {
		boolean resultado = false;

		try (Connection con = ConnectionManager.getConnection(); CallableStatement cst = con.prepareCall(SQL_DELETE);) {

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

	public Rol crear(Rol pojo) throws Exception {

		String runSP = "{ CALL rolCreateNew(?) }";

		try (Connection con = ConnectionManager.getConnection(); CallableStatement cst = con.prepareCall(runSP)) {

			cst.setString(1, pojo.getNombre());
			cst.registerOutParameter(2, java.sql.Types.INTEGER);

			int affectedRows = cst.executeUpdate();

			if (affectedRows == 1) {

				pojo.setId(cst.getInt(2));
			}
		}
		return pojo;
	}

	public int buscarNombreRol(String nombre) throws Exception {

		
        int idRol=0;
		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(SQL_GET_ROL_BY_NOMBRE);
				ResultSet rs = cst.executeQuery();) {
			cst.setString(1, nombre);    
			while (rs.next()) {
				idRol = rs.getInt(1);
			}


			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idRol;
	}

	public boolean modificar(Rol pojo) throws Exception {
		boolean resultado = false;
		try (Connection con = ConnectionManager.getConnection(); CallableStatement cst = con.prepareCall(SQL_UPDATE)) {

			cst.setString(1, pojo.getNombre());
			cst.setInt(2, pojo.getId());

			int affectedRows = cst.executeUpdate();
			if (affectedRows == 1) {
				resultado = true;
			}

		}
		return resultado;
	}

	private Rol mapper(ResultSet rs) throws SQLException {
		Rol r = new Rol();
		r.setId(rs.getInt("id"));
		r.setNombre(rs.getString("nombre"));
		return r;
	}

}

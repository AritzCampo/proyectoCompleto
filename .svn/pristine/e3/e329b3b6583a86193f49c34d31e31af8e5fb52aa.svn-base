package com.ipartek.formacion.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ipartek.formacion.model.ConnectionManager;

public class LikesDAO {

	private static LikesDAO INSTANCE = null;

	private static final String SQL_INSERT = "INSERT INTO likes ( usuario_id, video_id ) VALUES ( ?, ? );";
	private static final String SQL_EXISTE = "SELECT * FROM likes WHERE usuario_id = ? AND video_id = ? ;";
	private static final String SQL_DELETE = "DELETE FROM likes WHERE usuario_id = ? AND video_id = ? ;";

	private LikesDAO() {
		super();
	}

	public static synchronized LikesDAO getInstance() {

		if (INSTANCE == null) {
			INSTANCE = new LikesDAO();
		}
		return INSTANCE;

	}

	public boolean existe(int usuario_id, int video_id) {

		boolean encontrado = false;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pst = con.prepareStatement(SQL_EXISTE);) {

			// sustituir ? por parametros
			pst.setInt(1, usuario_id);
			pst.setInt(2, video_id);

			// ejecutar sentencia SQL y obtener Resultado
			try (ResultSet rs = pst.executeQuery()) {

				if (rs.next()) {
					encontrado = true;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return encontrado;
	}

	public boolean crear(int idUsuario, int idVideo) throws Exception {

		boolean resultado = false;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pst = con.prepareStatement(SQL_INSERT)) {

			pst.setInt(1, idUsuario);
			pst.setInt(2, idVideo);

			int affectedRows = pst.executeUpdate();
			if (affectedRows == 1) {
				resultado = true;
			}
		}

		return resultado;
	}

	public boolean delete(int idUsuario, int idVideo) {
		boolean resultado = false;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pst = con.prepareStatement(SQL_DELETE);) {

			pst.setInt(1, idUsuario);
			pst.setInt(2, idVideo);

			int affetedRows = pst.executeUpdate();
			if (affetedRows == 1) {
				resultado = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultado;
	}

}

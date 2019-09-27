package com.ipartek.formacion.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ipartek.formacion.model.ConnectionManager;
import com.ipartek.formacion.model.pojo.Categoria;

public class CategoriaDAO {

	private static CategoriaDAO INSTANCE = null;

	private CategoriaDAO() {
		super();
	}

	public static synchronized CategoriaDAO getInstance() {

		if (INSTANCE == null) {
			INSTANCE = new CategoriaDAO();
		}

		return INSTANCE;

	}

	public ArrayList<Categoria> getAll() {

		ArrayList<Categoria> lista = new ArrayList<Categoria>();

		String runSP = "{ call categoria_get_All() }";

		try (Connection con = ConnectionManager.getConnection();
				Statement statement = con.createStatement();
				CallableStatement callableStatement = con.prepareCall(runSP)) {

			ResultSet rs = callableStatement.executeQuery();

			while (rs.next()) {
				lista.add(mapper(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}

	public Categoria getById(int id) {

		Categoria categoria = new Categoria();

		String runSP = "{ call categoria_get_by_Id( ? ) }";

		try (Connection con = ConnectionManager.getConnection();
				Statement statement = con.createStatement();
				CallableStatement callableStatement = con.prepareCall(runSP)) {

			callableStatement.setInt(1, id);

			try (ResultSet rs = callableStatement.executeQuery()) {
				if (rs.next()) {
					categoria = mapper(rs);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categoria;
	}

	public boolean delete(int id) {
		boolean resultado = false;

		String runSP = "{ call categoria_delete( ? ) }";

		try (Connection con = ConnectionManager.getConnection();
				Statement statement = con.createStatement();
				CallableStatement callableStatement = con.prepareCall(runSP)) {

			callableStatement.setInt(1, id);

			int affetedRows = callableStatement.executeUpdate();
			if (affetedRows == 1) {
				resultado = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultado;
	}

	public boolean modificar(Categoria pojo) throws Exception {
		boolean resultado = false;

		String runSP = "{ call categoria_update( ?, ? ) }";

		try (Connection con = ConnectionManager.getConnection();
				Statement statement = con.createStatement();
				CallableStatement callableStatement = con.prepareCall(runSP)) {

			callableStatement.setInt(1, pojo.getId());
			callableStatement.setString(2, pojo.getNombre());

			int affectedRows = callableStatement.executeUpdate();
			if (affectedRows == 1) {
				resultado = true;
			}

		}
		return resultado;
	}

	public Categoria crear(Categoria pojo) throws Exception {

		String runSP = "{ call categoria_create( ?, ? ) }";

		try (Connection con = ConnectionManager.getConnection();
				Statement statement = con.createStatement();
				CallableStatement callableStatement = con.prepareCall(runSP)) {

			callableStatement.setString(1, pojo.getNombre());
			callableStatement.registerOutParameter(2, java.sql.Types.INTEGER);

			callableStatement.executeUpdate();

			pojo.setId(callableStatement.getInt(2));

		}

		return pojo;

	}

	private Categoria mapper(ResultSet rs) throws SQLException {
		Categoria c = new Categoria();
		c.setId(rs.getInt("id"));
		c.setNombre(rs.getString("nombre"));
		return c;
	}

}

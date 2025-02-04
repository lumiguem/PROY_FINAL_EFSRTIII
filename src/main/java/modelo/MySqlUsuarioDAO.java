package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entidades.Usuario;
import interfaces.UsuarioDAO;
import util.MySqlConexion;

public class MySqlUsuarioDAO implements UsuarioDAO {

	@Override
	public Usuario validarLogin(String cel, String pwd) {
		Usuario user = null;
		Connection cn = null; 
		PreparedStatement psm = null;
		ResultSet rs = null;
		
		try {
			cn = MySqlConexion.getConexion();
			String sql = "call usp_validaLogin(?,?)";
			psm = cn.prepareCall(sql);
			psm.setString(1, cel);
			psm.setString(2, pwd);
			rs = psm.executeQuery();
			if(rs.next()) {
				user = new Usuario();
				user.setIdUsuario(rs.getInt("idUsuario"));
				user.setNomUsuario(rs.getString("nomUsuario"));
				user.setApeUsuario(rs.getString("apeUsuario"));
				user.setCelUsuario(rs.getString("celUsuario"));
				user.setPasUsuario(rs.getString("pasUsuario"));
				user.setSaldo(rs.getDouble("saldo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs != null) rs.close();
				if(psm !=null) psm.close();
				if(cn!=null) cn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
					}
		return user;
	}
		

	
	public Usuario obtenerUsuario(String cel) {
		
		Usuario user = null;
		Connection cn = null; 
		PreparedStatement psm = null;
		ResultSet rs = null;
		
		try {
			cn = MySqlConexion.getConexion();
			String sql = "call usp_obtenerUsuario(?)";
			psm = cn.prepareCall(sql);
			psm.setString(1, cel);
			rs = psm.executeQuery();
			if(rs.next()) {
				user = new Usuario();
				user.setIdUsuario(rs.getInt("idUsuario"));
				user.setNomUsuario(rs.getString("nomUsuario"));
				user.setApeUsuario(rs.getString("apeUsuario"));
				user.setCelUsuario(rs.getString("celUsuario"));
				user.setPasUsuario(rs.getString("pasUsuario"));
				user.setSaldo(rs.getDouble("saldo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs != null) rs.close();
				if(psm !=null) psm.close();
				if(cn!=null) cn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
					}
		
		return user;
	}



	@Override
	public Usuario obtenerUsuario(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void modificarUsuario(int id, String nombre, String apellido, String celular, String password, double saldo) {
	    Usuario user = null;
	    Connection cn = null;
	    PreparedStatement psm = null;

	    try {
	        cn = MySqlConexion.getConexion();
	        String sql = "call usp_modificarUsuario(?,?,?,?,?,?)";
	        psm = cn.prepareCall(sql);
	        psm.setInt(1, id);
	        psm.setString(2, nombre);
	        psm.setString(3, apellido);
	        psm.setString(4, celular);
	        psm.setString(5, password);
	        psm.setDouble(6, saldo);
	        int rowsAffected = psm.executeUpdate();

	        if (rowsAffected > 0) {
	            user = new Usuario();
	            user.setIdUsuario(id);
	            user.setNomUsuario(nombre);
	            user.setApeUsuario(apellido);
	            user.setCelUsuario(celular);
	            user.setPasUsuario(password);
	            user.setSaldo(saldo);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (psm != null) psm.close();
	            if (cn != null) cn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	}



	
	
}

	

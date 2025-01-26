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
		

	@Override
	public Usuario obtenerUsuario(int cod) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

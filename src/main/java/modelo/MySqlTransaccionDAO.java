package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import entidades.Transaccion;
import interfaces.TransaccionDAO;
import util.MySqlConexion;

public class MySqlTransaccionDAO implements TransaccionDAO {

	@Override
	public int registrarTransaccion(Transaccion transaccion) {
		int value = 0;
		Connection cn = null;
		PreparedStatement psm=null;
		
		try {
			cn=MySqlConexion.getConexion();
			String sql = "call usp_registrarTransaccion(?, ?, ?, ?)";
			psm = cn.prepareCall(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	@Override
	public List<Transaccion> listarTransacciones() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Transaccion obtenerTransaccion(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int editarTransaccion(Transaccion transaccion) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminarTransaccion(int id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}

package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidades.Cuenta;
import interfaces.CuentaDAO;
import util.MySqlConexion;

public class MySqlCuentaDAO implements CuentaDAO{
	


	@Override
	public int registrarCuenta(Cuenta cuenta) {
		int value = 0;
		Connection cn = null;
		PreparedStatement psm = null;
		
		try {
			cn = MySqlConexion.getConexion();
			String sql = "call usp_registrarCuenta(?, ?, ?)";
			psm = cn.prepareCall(sql);
			psm.setInt(1, cuenta.getNroCuenta());
			psm.setInt(2, cuenta.getIdUsuario());
			psm.setDouble(3, cuenta.getSaldoCuenta());
			value = psm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return value;
	}

	@Override
	public List<Cuenta> listarCuentas() {
		List<Cuenta> listaCuentas = new ArrayList<Cuenta>();
		Connection cn = null;
		PreparedStatement psm = null;
		ResultSet rs = null;
		
		try {
			cn = MySqlConexion.getConexion();
			String sql = "Select * from cuentas";
			psm = cn.prepareStatement(sql);
			rs = psm.executeQuery();
			
			while(rs.next()) {
				Cuenta cuenta = new Cuenta();
				cuenta.setIdCuenta(rs.getInt("idCuenta"));
				cuenta.setNroCuenta(rs.getInt("nroCuenta"));
				cuenta.setIdUsuario(rs.getInt("idUsuario"));
				cuenta.setSaldoCuenta(rs.getDouble("saldoCuenta"));
				listaCuentas.add(cuenta);			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(psm != null) psm.close();
				if(cn != null) cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return listaCuentas;
	}

	@Override
	public Cuenta obtenerCuenta(int id) {
		Cuenta cuenta = null;
		Connection cn = null; 
		PreparedStatement psm = null;
		ResultSet rs = null;
		
		try {
			cn = MySqlConexion.getConexion();
			String sql = "Select * from cuentas where idUsuario=?";
			psm = cn.prepareStatement(sql);
			psm.setInt(1, id);
			rs = psm.executeQuery();
			if(rs.next()) {
				cuenta = new Cuenta();
				cuenta.setIdCuenta(rs.getInt("idCuenta"));
				cuenta.setNroCuenta(rs.getInt("nroCuenta"));
				cuenta.setIdUsuario(rs.getInt("idUsuario"));
				cuenta.setSaldoCuenta(rs.getDouble("saldoCuenta"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)rs.close();
				if(psm !=null) psm.close();
				if(cn != null)cn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		return cuenta;
	}

	@Override
	public int editarCuenta(Cuenta cuenta) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminarCuenta(int id) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}

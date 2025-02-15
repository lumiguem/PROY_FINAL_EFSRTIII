package dao;

import interfaces.CuentaDAO;
import interfaces.ReporteTransaccionDAO;
import interfaces.UsuarioDAO;
import modelo.MySqlCuentaDAO;
import modelo.MySqlReporteTransaccionDAO;
import modelo.MySqlUsuarioDAO;

public class SQLServerDAOFactory extends DAOFactory{
	@Override
	public UsuarioDAO getUsuario() {
		return new MySqlUsuarioDAO();
	}
	
	@Override
	public CuentaDAO getCuenta() {
		return new MySqlCuentaDAO();
	}
	
	@Override
	public ReporteTransaccionDAO getReporteTransaccion() {
		return new MySqlReporteTransaccionDAO();
	}
}

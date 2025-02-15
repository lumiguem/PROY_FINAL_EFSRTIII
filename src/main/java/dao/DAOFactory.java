package dao;

import interfaces.CuentaDAO;
import interfaces.ReporteTransaccionDAO;
import interfaces.UsuarioDAO;

public abstract class DAOFactory {
	public static final int MYSQL = 1;
	public static final int SQLSERVER = 2;
	public static final int ORACLE = 3;
	
	public abstract UsuarioDAO getUsuario();
	public abstract CuentaDAO getCuenta();
	public abstract ReporteTransaccionDAO getReporteTransaccion();
	
	
	public static DAOFactory getDaoFactory(int tipo) {
				
		switch(tipo) {
		case MYSQL:
			return new MySqlDAOFactory();
		case SQLSERVER: 
			return new SQLServerDAOFactory();
		case ORACLE:
			return new OracleDAOFactory();
		default:
			return null;
		}
	}



}

package dao;

import interfaces.CuentaDAO;
import interfaces.UsuarioDAO;
import modelo.MySqlCuentaDAO;
import modelo.MySqlUsuarioDAO;

public class MySqlDAOFactory extends DAOFactory {
	
	@Override
	public UsuarioDAO getUsuario() {
		return new MySqlUsuarioDAO();
	}

	@Override
	public CuentaDAO getCuenta() {
		return new MySqlCuentaDAO();
	}

}

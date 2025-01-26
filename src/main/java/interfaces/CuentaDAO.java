package interfaces;

import java.util.List;

import entidades.Cuenta;

public interface CuentaDAO {
	
	public int registrarCuenta (Cuenta cuenta);
	
	public List<Cuenta> listarCuentas();
	
	public Cuenta obtenerCuenta (int id);
	
	public int editarCuenta(Cuenta cuenta);
	
	public int eliminarCuenta(int id);

}

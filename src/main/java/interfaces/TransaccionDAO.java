package interfaces;

import java.util.List;

import entidades.Transaccion;

public interface TransaccionDAO {
	
	public int registrarTransaccion (Transaccion transaccion);
	
	public List<Transaccion> listarTransacciones();
	
	public Transaccion obtenerTransaccion (int id);
	
	public int editarTransaccion(Transaccion transaccion);
	
	public int eliminarTransaccion (int id);

	void modificarUsuarioTran(int id, double montoTran);

}

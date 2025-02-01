package interfaces;

import java.util.List;

import entidades.ReporteTransaccion;

public interface ReporteTransaccionDAO {

	public List<ReporteTransaccion> listarMovimientos(int id);
}

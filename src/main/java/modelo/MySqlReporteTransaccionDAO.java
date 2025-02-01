package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidades.ReporteTransaccion;
import interfaces.ReporteTransaccionDAO;
import util.MySqlConexion;

public class MySqlReporteTransaccionDAO implements ReporteTransaccionDAO {
	
	@Override
	public List<ReporteTransaccion> listarMovimientos(int id) {
		
		List<ReporteTransaccion> listaReportesTransaccion = new ArrayList<ReporteTransaccion>();
		Connection cnx = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			cnx = MySqlConexion.getConexion();
			
			String sql = "call ObtenerMovimientos(?)";
			ps = cnx.prepareCall(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				
				ReporteTransaccion rp = new ReporteTransaccion();
				
				rp.setFecTrans(rs.getDate("fecTrans"));
				rp.setNombre(rs.getString("nombreUsuario"));
				rp.setMonto(rs.getDouble("saldo_movimiento"));
				
				listaReportesTransaccion.add(rp);
				
				System.out.println("Listado de reportes de transacciones completada.");
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (cnx != null) cnx.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return listaReportesTransaccion;		
	}
}

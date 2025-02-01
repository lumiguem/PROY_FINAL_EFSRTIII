package entidades;

import java.util.Date;

public class ReporteTransaccion {
	
	private Date fecTrans;
	private String nombre;
	private double monto;
	
	public ReporteTransaccion() {
		super();
	}

	public ReporteTransaccion(Date fecTrans, String nombre, double monto) {
		super();
		this.fecTrans = fecTrans;
		this.nombre = nombre;
		this.monto = monto;
	}

	public Date getFecTrans() {
		return fecTrans;
	}

	public void setFecTrans(Date fecTrans) {
		this.fecTrans = fecTrans;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}
	
	
}

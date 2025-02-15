package entidades;

import java.time.LocalDateTime;

public class ReporteTransaccion {
	
	private LocalDateTime fecTrans;
	private String nombre;
	private double monto;
	
	public ReporteTransaccion() {
		super();
	}

	public ReporteTransaccion(LocalDateTime fecTrans, String nombre, double monto) {
		super();
		this.fecTrans = fecTrans;
		this.nombre = nombre;
		this.monto = monto;
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

	public LocalDateTime getFecTrans() {
		return fecTrans;
	}

	public void setFecTrans(LocalDateTime fecTrans) {
		this.fecTrans = fecTrans;
	}
}

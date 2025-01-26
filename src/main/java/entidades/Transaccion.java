package entidades;

import java.util.Date;

public class Transaccion {
	private int idTransaccion, idOrigen, idDestino;
	private double monto;
	private Date fecTrans;
	
	public int getIdTransaccion() {
		return idTransaccion;
	}
	public void setIdTransaccion(int idTransaccion) {
		this.idTransaccion = idTransaccion;
	}
	public int getIdOrigen() {
		return idOrigen;
	}
	public void setIdOrigen(int idOrigen) {
		this.idOrigen = idOrigen;
	}
	public int getIdDestino() {
		return idDestino;
	}
	public void setIdDestino(int idDestino) {
		this.idDestino = idDestino;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public Date getFecTrans() {
		return fecTrans;
	}
	public void setFecTrans(Date fecTrans) {
		this.fecTrans = fecTrans;
	}

}

package entidades;

public class Transaccion {
	private int idTransaccion, idOrigen, idDestino;
	private double monto;
	
	public Transaccion(int idTransaccion2, int idOrigen2, int idDestino2, double monto2) {
		this.idTransaccion = idTransaccion2;
        this.idOrigen = idOrigen2;
        this.idDestino = idDestino2;
        this.monto = monto2;
	}
	
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
}

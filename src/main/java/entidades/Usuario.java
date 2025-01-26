package entidades;

public class Usuario {
	private int idUsuario;
	private String nomUsuario, apeUsuario, celUsuario, pasUsuario;
	private double saldo;
	
	
	public double getSaldo() {
		return saldo;
	}
	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getPasUsuario() {
		return pasUsuario;
	}
	public void setPasUsuario(String pasUsuario) {
		this.pasUsuario = pasUsuario;
	}
	public String getNomUsuario() {
		return nomUsuario;
	}
	public void setNomUsuario(String nomUsuario) {
		this.nomUsuario = nomUsuario;
	}
	public String getApeUsuario() {
		return apeUsuario;
	}
	public void setApeUsuario(String apeUsuario) {
		this.apeUsuario = apeUsuario;
	}
	public String getCelUsuario() {
		return celUsuario;
	}
	public void setCelUsuario(String celUsuario) {
		this.celUsuario = celUsuario;
	}
	
	

}

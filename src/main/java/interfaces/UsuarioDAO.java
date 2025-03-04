package interfaces;

import entidades.Usuario;

public interface UsuarioDAO {
	public Usuario validarLogin(String cel, String pwd);
	public Usuario obtenerUsuario(int id);
	Usuario obtenerUsuario(String cel);
	public void modificarUsuario(int id, String nombre, String apellido, String celular, String password, double saldo);
	
	
}

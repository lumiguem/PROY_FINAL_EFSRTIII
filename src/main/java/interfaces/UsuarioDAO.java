package interfaces;

import entidades.Usuario;

public interface UsuarioDAO {
	public Usuario validarLogin(String cel, String pwd);
	public Usuario obtenerUsuario(int id);
	
}

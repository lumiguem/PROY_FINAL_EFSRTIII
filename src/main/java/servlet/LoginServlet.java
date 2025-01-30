package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOFactory;
import entidades.Usuario;
import interfaces.UsuarioDAO;
import util.Constantes;
import util.SessionProject;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String opcion = request.getParameter("opc");
			if(opcion.equals("login")) {
				String celular = request.getParameter("txtCelular");
				String password = request.getParameter("txtClave");
				
				DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
				
				UsuarioDAO dao = daoFactory.getUsuario();
				
				Usuario usu = dao.validarLogin(celular, password);
				
				if(usu != null) {
					SessionProject sessionProject = new SessionProject();
					sessionProject.saveSessionTimeOut(request, 300);
					sessionProject.saveSessionInt(request, Constantes.IDUSUARIO, usu.getIdUsuario());
					sessionProject.saveSessionString(request, Constantes.NAME, usu.getNomUsuario());
					sessionProject.saveSessionString(request, Constantes.LASTNAME, usu.getApeUsuario());
					sessionProject.saveSessionString(request, Constantes.CELULAR, usu.getCelUsuario());
					sessionProject.saveSessionString(request, Constantes.PASSWORD, usu.getPasUsuario());
					sessionProject.saveSessionDouble(request, Constantes.SALDO, usu.getSaldo());
					response.sendRedirect("main.jsp");
				}  else {
					request.setAttribute("mensaje", "Usuario y/o Contraseña es incorrecta");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				
				}
			} else if(opcion.equals("logout")) {
				SessionProject sessionProject = new SessionProject();
				sessionProject.invalidateSession(request);
				response.sendRedirect("login.jsp");
											
			}
			
			
	}

}

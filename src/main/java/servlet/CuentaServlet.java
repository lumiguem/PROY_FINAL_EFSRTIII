package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOFactory;
import entidades.Cuenta;
import interfaces.CuentaDAO;

/**
 * Servlet implementation class CuentaServlet
 */
@WebServlet("/CuentaServlet")
public class CuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuentaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo = request.getParameter("tipo");
		switch(tipo) {
		case "list" : listCuenta(request,response); break;
		case "info" : detalleCuenta(request,response) ; break;
		default:
			request.setAttribute("mensaje", "Ocurrió un problema");
			request.getRequestDispatcher("regCuenta.jsp").forward(request, response);
		}
	}

	private void detalleCuenta(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		int idCuenta = Integer.parseInt(request.getParameter("id"));
		
		DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		
		CuentaDAO dao = daoFactory.getCuenta();
		
		Cuenta cuenta = dao.obtenerCuenta(idCuenta);
		
		request.setAttribute("cuentaData", cuenta);
		request.getRequestDispatcher("main.jsp").forward(request, response);
		
	}

	private void listCuenta(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}

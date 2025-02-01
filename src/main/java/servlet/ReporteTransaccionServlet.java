package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAOFactory;
import entidades.ReporteTransaccion;
import interfaces.ReporteTransaccionDAO;
import util.Constantes;

@WebServlet("/ReporteTransaccionServlet")
public class ReporteTransaccionServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public ReporteTransaccionServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
			
		switch (action) {
			case "list":
				listarMovimientos(request, response);
				break;
			default:
		}
	}
	
	protected void listarMovimientos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		
		ReporteTransaccionDAO dao = daoFactory.getReporteTransaccion();
		
		HttpSession session = request.getSession();
		int idUs = (int) session.getAttribute("idusur");
		
		List<ReporteTransaccion> lista = dao.listarMovimientos(idUs);
		
		request.setAttribute("listMovimiento", lista);
		request.getRequestDispatcher("reportes.jsp").forward(request, response);
		
		System.out.println(lista);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

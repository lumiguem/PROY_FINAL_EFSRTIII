package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Transaccion;
import interfaces.TransaccionDAO;
import modelo.MySqlTransaccionDAO;
import util.Constantes;
import util.MySqlConexion;
import util.SessionProject;

@WebServlet("/TransaccionServlet")
public class TransaccionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idTransaccion = Integer.parseInt(request.getParameter("idTransaccion"));
        int idOrigen = Integer.parseInt(request.getParameter("idOrigen"));
        HttpSession sessionProject = request.getSession();
        int idDestino = (int) sessionProject.getAttribute("codigoDestinatario");
        double montoTran = Double.parseDouble(request.getParameter("monto"));
        Date fecTrans = new Date();

        Transaccion transaccion = new Transaccion(idTransaccion, idOrigen, idDestino, montoTran);
        TransaccionDAO transaccionDAO = new MySqlTransaccionDAO();
       

        Connection cn = null;
        try {
            cn = MySqlConexion.getConexion();
            cn.setAutoCommit(false); // Iniciar la transacción

            transaccionDAO.registrarTransaccion(transaccion); //int resultado =
            transaccionDAO.modificarUsuarioTran(idOrigen, (-1) * montoTran);
            transaccionDAO.modificarUsuarioTran(idDestino, montoTran);

            double montoAntiguo = (double) sessionProject.getAttribute("saldo");
            double montoActual = montoAntiguo - montoTran;
            sessionProject.setAttribute("saldo", montoActual);
            sessionProject.setAttribute("montoTransferido", montoTran);
            
            SessionProject sessionProject1 = new SessionProject();
            sessionProject1.removeSessionAttribute(request, Constantes.SALDO);
            sessionProject1.saveSessionDouble(request, Constantes.SALDO, montoActual);
            
            cn.commit(); // Confirmar la transacción
            
            String usuarioDestinatario = (String) sessionProject.getAttribute("usuarioDestinatario");

            if (usuarioDestinatario == null) {
             usuarioDestinatario = transaccionDAO.obtenerNombreUsuario(idDestino);
             sessionProject.setAttribute("usuarioDestinatario", usuarioDestinatario);
            }
            
            
            sessionProject.setAttribute("fechaTransaccion", fecTrans);
            response.sendRedirect("transConfirmada.jsp");

        } catch (Exception e) {
            if (cn != null) {
                try {
                    cn.rollback(); // Revertir la transacción en caso de error
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
    }
    
}

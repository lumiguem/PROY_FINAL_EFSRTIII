package servlet;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidades.Transaccion;
import interfaces.TransaccionDAO;
import modelo.MySqlTransaccionDAO;

@WebServlet("/TransaccionServlet")
public class TransaccionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	int idTransaccion=Integer.parseInt(request.getParameter("idTransaccion"));
        int idOrigen = Integer.parseInt(request.getParameter("idOrigen"));
        int idDestino = Integer.parseInt(request.getParameter("codigoDestinatario"));
        double monto = Double.parseDouble(request.getParameter("monto"));
        Date fecTrans = new Date(); 

        Transaccion transaccion = new Transaccion(idTransaccion,idOrigen,idDestino,monto,fecTrans);

        // Registrando a transação usando a função do modelo
        TransaccionDAO transaccionDAO = new MySqlTransaccionDAO();
        int resultado = transaccionDAO.registrarTransaccion(transaccion);

        // Verificando o resultado da transação e redirecionando conforme necessário
        if (resultado == 1) {
            // Transação registrada com sucesso
            response.sendRedirect("transferencia.jsp");
        } else {
            // Falha ao registrar a transação
            response.sendRedirect("error.jsp");
        }
    }
}

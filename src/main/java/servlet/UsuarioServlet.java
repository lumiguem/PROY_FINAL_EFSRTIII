package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Usuario;
import modelo.MySqlUsuarioDAO;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String celular = request.getParameter("celular");
        MySqlUsuarioDAO usuarioDAO = new MySqlUsuarioDAO();
        Usuario usuario = usuarioDAO.obtenerUsuario(celular);

        if (usuario != null) {
            HttpSession sessionProject = request.getSession();
            String nombreCompleto = usuario.getNomUsuario() + " " + usuario.getApeUsuario();
            sessionProject.setAttribute("codigoDestinatario",usuario.getIdUsuario());
            sessionProject.setAttribute("usuarioDestinatario", nombreCompleto);
            response.sendRedirect("buscarUsuario.jsp"); // Redirige al JSP del usuario
        } else {
            request.setAttribute("mensaje", "Usuario no encontrado");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

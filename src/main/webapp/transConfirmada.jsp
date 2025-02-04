<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transferencia Confirmada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #004d40;
            margin: 0;
            color: #ffffff;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #00332c;
        }
        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }
        .card {
            background: #ffffff;
            color: #004d40;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }
        .btn-primary {
            background-color: #00796b;
            border-color: #00796b;
            font-size: 1rem;
            padding: 0.75rem;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            color: white;
            text-decoration: none;
        }
        .btn-primary:hover {
            background-color: #004d40;
        }
        footer {
          
            color: #white;
            text-align: center;
            padding: 1rem 0;
            font-size: 0.9rem;
        }
        label {
            font-weight: bold;
        }
        h1 {
            color: #004d40;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center">

    <div class="container">
        <div class="card">
            <h2>Transferencia Confirmada</h2>
            <p>¡La transferencia se ha realizado con éxito!</p>
            
            <%
                HttpSession sessionProject = request.getSession(false);
                if (sessionProject != null) {
                    Integer idTransaccion = (Integer) session.getAttribute("idTransaccion");
                    Double montoTransferido = (Double) sessionProject.getAttribute("montoTransferido");
                    String usuarioDestino = (String) sessionProject.getAttribute("usuarioDestinatario");
                    Date fechaTransaccion = (Date) sessionProject.getAttribute("fechaTransaccion");
                    
                    DecimalFormat df = new DecimalFormat("#,##0.00");                    
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    String fechaFormateada = fechaTransaccion != null ? sdf.format(fechaTransaccion) : "No disponible";
            %>
                <p><strong>Destinatario:</strong> <%= usuarioDestino %></p>
                <p><strong>Monto Transferido:</strong> S/.<%= df.format(montoTransferido) %></p>
                <p><strong>Fecha y Hora:</strong> <%= fechaFormateada %></p>
            <%	
            session.removeAttribute("usuarioDestinatario");
                }
            %>

            <a href="main.jsp" class="btn btn-primary w-100">Volver al menú anterior</a>
        </div>
    </div>

    <footer>
        <small>&copy; 2025 Gestión de Cuentas. Todos los derechos reservados.</small>
    </footer>

</body>
</html>

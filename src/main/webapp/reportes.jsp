<!DOCTYPE html>
<%@page import="entidades.ReporteTransaccion"%>
<%@page import="java.util.List"%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Información de la Cuenta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #004d40;
            color: #ffffff;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #00332c;
            padding: 1rem 2rem;
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .btn-logout {
            background-color: #ff5722;
            border-color: #ff5722;
            color: white;
            display: flex;
            align-items: center;
            gap: 5px;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            border-radius: 8px;
        }
        .btn-logout:hover {
            background-color: #e64a19;
            border-color: #e64a19;
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
            max-width: 450px;
            text-align: center;
        }
        .btn-boton {
            background-color: #00796b;
            border-color: #00796b;
            font-size: 1rem;
            padding: 0.75rem;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            color:white;
        }
        .btn-boton:hover {
            background-color: #005a4f;
            color: white !important;
        }
        footer {
            background-color: #f8f9fa;
            color: #004d40;
            text-align: center;
            padding: 1rem 0;
            font-size: 0.9rem;
        }
        .form-control {
            text-align: center;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Banco Seguro</a>
            <a href="cerrarSesionServlet" class="btn btn-logout">
                <i class='bx bx-door-open'></i> Cerrar Sesión
            </a>
        </div>
    </nav>

     <div class="container">
        <div class="card">
			<h1 class="m-3">Movimientos</h1>
			<hr>
			<table class="table table-sm align-middle display" id="tablaPacientes">
				<thead class="table-info">
					<tr>
						<th scope="col" class="text-start">Fecha</th>
						<th scope="col" class="text-start">Nombre</th>
						<th scope="col" class="text-start">Monto</th>
					</tr>
				</thead>
				<tbody>
					<%		
						List<ReporteTransaccion> listaReporteTransaccion = (List<ReporteTransaccion>)request.getAttribute("listMovimiento");
						
						if (listaReporteTransaccion != null) {
							
							for (ReporteTransaccion item: listaReporteTransaccion) {
								%>
									<tr>
										<td class="text-start"><%=item.getFecTrans()%></td>
										<td class="text-start"><%=item.getNombre() %></td>
										<td class="text-start">S/. <%=item.getMonto() %></td>
									</tr>
								<%
							}
						}
					%>
				</tbody>
			</table>
		</div>
    </div>

    <footer>
        <small>&copy; 2025 Gestión de Cuentas. Todos los derechos reservados.</small>
    </footer>
</body>
</html>
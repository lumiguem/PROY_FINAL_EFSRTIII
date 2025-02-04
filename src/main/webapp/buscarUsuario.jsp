<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Destinatario</title>
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
            max-width: 400px;
            text-align: center;
        }
        .btn-info {
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
        .btn-info:hover {
            background-color: #004d40;
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
        label {
            font-weight: bold;
            margin-bottom: 0.5rem;
        }
        h2 {
            color: #004d40;
        }
    </style>
    <script>
        function validateForm() {
            var celular = document.forms["searchForm"]["celular"].value;
            if (celular == "") {
                alert("Número de celular del destinatario está vacío");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

    <div class="container">
        <div class="card">
            <h2>Buscar Destinatario</h2>
            <form name="searchForm" action="UsuarioServlet" method="post" onsubmit="return validateForm()">
                <div class="mb-3">	
                    <input type="text" id="celular" name="celular" class="form-control" placeholder="Inserte número de celular">
                </div>
                <button type="submit" class="btn btn-info w-100 mb-3">Buscar</button>
                <div class="mb-3">
                    <label for="nombreDestinatario" class="form-label">Nombre del destinatario:</label>
                    <input type="text" id="nombreDestinatario" class="form-control" placeholder="${usuarioDestinatario}" disabled>
                </div>
                <a href="transferencia.jsp" class="btn btn-info w-100">Confirmar destinatario</a>
            </form>
        </div>
    </div>

    <footer>
        <small>&copy; 2025 Gestión de Cuentas. Todos los derechos reservados.</small>
    </footer>

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" 
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>

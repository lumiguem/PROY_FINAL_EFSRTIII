<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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
        }
        .navbar {
            background-color: #004d40;
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
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
        }
        .btn-primary {
            background-color: #004d40;
            border-color: #004d40;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-primary:hover {
            background-color: #00332c;
            transform: scale(1.05);
        }
        footer {
            background-color: #f8f9fa;
            color: #004d40;
            text-align: center;
            padding: 1rem 0;
        }
        .form-control {
            text-align: center;
        }
    </style>
</head>
<body>

	<div>
	
	<form action="TransaccionServlet" method="POST">
		<label>ID Transferencia</label><br>
		<input class="form-control" type="text" name="idTransaccion" value="1" >
		<label>Emisor</label><br>
		<input class="form-control" type="text" name="idOrigen" value="1111" >
		<br><br>
		<label>Código del destinatario</label><br>
		<input class="form-control" name= "codigoDestinatario" type="number">
		<br><br>
		<label>Ingrese el monto</label><br>
		<input class="form-control" type="number" name="monto" step="0.01">
		<br><br>
		<label>Valor actual en su cuenta</label><br>
		<input class="form-control" type="number" value="1500" disabled>
		<br><br>
		<button type="submit" class="btn btn-info w-100">Transferir</button>
		<a href="main.jsp" class="btn btn-info w-100">Volver al menú anterior</a>
	</form>
	</div>
</body>

<footer>
        <small>&copy; 2025 Gestión de Cuentas. Todos los derechos reservados.</small>
    </footer>

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" 
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const saldoInput = document.getElementById('txtSaldo');
            const toggleButton = document.getElementById('toggleSaldoBtn');

            // Saldo real (simulado, reemplazar "${saldo}" con el valor dinámico en tu entorno)
            const saldoReal = "S/. ${saldo}";
            const saldoOculto = "******";

            let isHidden = true; // Estado inicial del saldo

            toggleButton.addEventListener('click', () => {
                if (isHidden) {
                    saldoInput.value = saldoReal;
                    toggleButton.textContent = "Ocultar Saldo";
                } else {
                    saldoInput.value = saldoOculto;
                    toggleButton.textContent = "Mostrar Saldo";
                }
                isHidden = !isHidden; // Cambiar el estado
            });
        });
    </script>
</html>
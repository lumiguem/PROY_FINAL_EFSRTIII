<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Login</title>
<style>
    body       {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #004d40; /* Verde oscuro */
        margin: 0;
        color: #ffffff; /* Texto blanco para contraste */
    }
    .form-container {
        background: #ffffff; /* Fondo blanco para el formulario */
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 400px;
        color: #004d40; /* Texto verde oscuro */
    }
    .form-container img {
        margin-bottom: 1rem;
    }
    .btn-primary {
        background-color: #004d40; /* Botón verde oscuro */
        border-color: #004d40;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }
    .btn-primary:hover {
        background-color: #00332c; /* Más oscuro al pasar el cursor */
        transform: scale(1.05);
    }
    .alert {
        margin-top: 1rem;
    }
    .keypad {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 0.5rem;
        margin-top: 1rem;
    }
    .keypad button {
        padding: 1rem;
        font-size: 1rem;
        background-color: #66bb6a;
        color: #004d40;
        border: none;
    }
    .keypad button:hover {
        background-color: #00332c;
        color:#ffffff;
    }
    a {
        color: #004d40; /* Color verde oscuro para el enlace */
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
        color: #00332c;
    }
    
        #txtClave {
        border: none; /* Sin borde */
        outline: none; /* Sin contorno al enfocar */
        background-color: #f9f9f9; /* Fondo ligeramente gris */
        color: #004d40; /* Texto en verde oscuro */
        padding: 0.5rem;
        cursor: default; /* Cursor de solo lectura */
    }
    #txtClave:focus {
        outline: none; /* Sin contorno al enfocar */
    }
</style>
</head>
<body>
    <% String error = (String)request.getAttribute("mensaje"); %>
    <div class="form-container">
        <form action="LoginServlet?opc=login" method="post">            
            <div class="text-center">
                <img src="images/logo.png" height="80" width="80" alt="Icono de usuario">

                
                <h2 class="h4">Iniciar Sesión</h2>
            </div>
            <div class="mb-3">
                <label for="txtCelular" class="form-label">Celular</label>
                <input type="text" id="txtCelular" name="txtCelular" class="form-control" placeholder="Ingrese nro. Celular" required>
            </div>
            <div class="mb-3">
                <label for="txtClave" class="form-label">Digita tu clave	</label>
                <input type="password" id="txtClave" name="txtClave" class="form-control" readonly required>
                <div class="keypad">
                    <% for (int i = 1; i <= 9; i++) { %>
                        <button type="button" class="btn" onclick="addToPassword('<%= i %>')"><%= i %></button>
                    <% } %>
                    <button type="button" class="btn" onclick="clearPassword()">C</button>
                    <button type="button" class="btn" onclick="addToPassword('0')">0</button>
                    <button type="button" class="btn" onclick="deleteLast()">X</button>
                </div>
            </div>
            <button type="submit" class="btn btn-primary w-100">Ingresar</button>
            <% if (error != null) { %>
                <div class="alert alert-danger text-center" role="alert">
                    <em><%= error %></em>
                </div>
            <% } %>
            <div class="text-center mt-3">
                <a href="#">Crear usuario</a>
            </div>
        </form>            
    </div>
    
<script>
    const passwordField = document.getElementById('txtClave');

    function addToPassword(value) {
        passwordField.value += value;
    }

    function clearPassword() {
        passwordField.value = '';
    }

    function deleteLast() {
        passwordField.value = passwordField.value.slice(0, -1);
    }
</script>

<script src="https://code.jquery.com/jquery-latest.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>

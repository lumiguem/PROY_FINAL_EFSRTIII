<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buscar Destinatario</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #004d40;
        margin: 0;
        color: #ffffff;
        font-family: Arial, sans-serif;
    }
    .card {
        background: #ffffff;
        color: #004d40;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 400px;
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
    <div class="card">
        <h2 class="text-center">Buscar Destinatario</h2>
        <form name="searchForm" action="UsuarioServlet" method="post" onsubmit="return validateForm()">
            <div class="mb-3">
                <label for="celular" class="form-label">Buscar destinatario:</label>
                <input type="text" id="celular" name="celular" class="form-control" placeholder="Inserte número de celular">
            </div>
            <button type="submit" class="btn btn-primary w-100 mb-3">Buscar</button>
            <div class="mb-3">
                <label for="nombreDestinatario" class="form-label">Nombre del destinatario:</label>
                <input type="text" id="nombreDestinatario" class="form-control" placeholder="${usuarioDestinatario}" disabled>
            </div>
            <a href="transferencia.jsp" class="btn btn-primary w-100">Confirmar destinatario</a>
        </form>
    </div>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" 
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>

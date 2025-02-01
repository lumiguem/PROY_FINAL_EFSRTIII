<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transferencia Confirmada</title>
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
        text-align: center;
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
</head>
<body>
    <div class="card">
        <h1>Transferencia Confirmada</h1>
        <p>¡La transferencia se ha realizado con éxito!</p>
        <a href="main.jsp" class="btn btn-primary w-100">Volver al menú anterior</a>
    </div>
</body>
</html>

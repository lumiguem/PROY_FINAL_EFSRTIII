<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="UsuarioServlet" method="post">
			<label>Buscar destinatario:</label>
			<br>
			<input placeholder="Inserte número de celular" name="celular">
			<button>Buscar</button>
			<br><br>
			<label>Nombre del destinatario:</label>
			<br>
			<input placeholder="${usuarioDestinatario}" disabled>
			<br>
			<a href="transferencia.jsp" type="submit" class="btn btn-primary w-100">Confirmar destinatario</a>
			
		</form>
	</div>
</body>
</html>
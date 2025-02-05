<%@page import="entidades.ReporteTransaccion"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>Text</p>
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
<%-- 										<td class="text-start"><%=item.getEstadoPaciente() == 2 ? "Activo" : "No activo"%></td> --%>
									</tr>
								<%
							}
						}
					%>
				</tbody>
			</table>
</body>
</html>
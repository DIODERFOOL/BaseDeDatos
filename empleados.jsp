<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Empleados</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/empleados.css" rel="stylesheet">
</head>
<body>
	<header>
		<h1>Corporativo Integral López Asociados, S.C.</h1>
	</header>
	
	<div id="wrapper">

		<div id="clientes">
			<p>Lista clientes</p>
			<div class="floatingTable">
			<table border="1" id="clientesTable1">
				<tr>
					<th>Nombre</th>
					<th>Contacto</th>
				</tr>
				<c:forEach items="${requestScope.clientList}" var="us">
	  				<tr>
						<td>
        			<c:out value="${us.name}" />
      				<br/>
						</td>
						<td>
        			<c:out value="${us.contact}" />
      				<br/>
						</td>
					</tr>
  				</c:forEach>
			</table>
			</div>
			<div class="floatingTable">
			<table border="1" id="clientesTable2">
				<tr>
					<th>Usuario Responsable</th>
				</tr>
				<c:forEach items="${requestScope.usernameList}" var="us2">
	  				<tr>
						<td>
        			<c:out value="${us2}" />
      				<br/>
						</td>
					</tr>
  				</c:forEach>
			</table>
			</div>
		</div>

		<div id="empleados">
			<p>Juicios</p>
			<div class="floatingTable">
			<table border="1">
				<tr>
					<th>Locacion</th>
					<th>Fecha</th>
				</tr>
				<c:forEach items="${requestScope.trialList}" var="tr">
	  				<tr>
						<td>
        			<c:out value="${tr.location}" />
      				<br/>
						</td>
						<td>
        			<c:out value="${tr.trialDate}" />
      				<br/>
						</td>
					</tr>
  				</c:forEach>
			</table>
			</div>
			<div class="floatingTable">
			<table border="1">
				<tr>
					<th>Cliente</th>
				</tr>
				<c:forEach items="${requestScope.clientNamesList}" var="tr2">
	  				<tr>
						<td>
        			<c:out value="${tr2}" />
      				<br/>
						</td>
					</tr>
  				</c:forEach>
			</table>
			</div>

		</div>

		<div id="juicios">
			<p>Empleados</p>
		</div>

	</div>
</body>
</html>
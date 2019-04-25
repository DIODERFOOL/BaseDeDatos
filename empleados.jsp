<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Empleados</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/empleados.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
	<script type="text/javascript" src="js/jQuery.js"></script>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

</head>
<body>
	<header>
		<h1 id="headerAdmin">Corporativo Integral López Asociados, S.C.</h1>
	</header>
	
	<div id="wrapper">
		
		<div id="clientes">
			<h3>CLIENTES</h3>
			<div class="table100 ver1 m-b-110 floatingTable">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Nombre</th>
									<th class="cell100 column2">Contacto</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${requestScope.clientList}" var="us">
	  							<tr class="row100 body">
									<td class="cell100 column1"><c:out value="${us.name}" /></td>
									<td class="cell100 column1"><c:out value="${us.contact}" /></td>
								</tr>
  								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			
			<div class="table100 ver3 m-b-110 floatingTable">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Usuario Responsable</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${requestScope.usernameList}" var="us2">
	  							<tr class="row100 body">
									<td class="cell100 column1"><c:out value="${us2}"/></td>
								</tr>
  								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			<!--<a id="button" class="lowButt" href="verCliente.html">Ver</a>-->
		</div>

		<div id="juicios">
			<h3>JUICIOS</h3>
			<div class="table100 ver2 m-b-110 floatingTable2">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Locacion</th>
									<th class="cell100 column2">Fecha</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${requestScope.trialList}" var="tr">
	  							<tr class="row100 body">
									<td class="cell100 column1"><c:out value="${tr.location}" /></td>
									<td class="cell100 column1"><c:out value="${tr.trialDate}" /></td>
								</tr>
  								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			
			<div class="table100 ver2 m-b-110 floatingTable2">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Cliente</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${requestScope.clientNamesList}" var="tr2">
	  							<tr class="row100 body">
									<td class="cell100 column1"><c:out value="${tr2}" /></td>
								</tr>
  								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			<!--<a id="button" class="lowButt" href="verCliente.html">Ver</a>-->
		</div>
	</div>
</body>
</html>
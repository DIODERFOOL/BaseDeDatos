<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Empleados</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <script type="text/javascript" src="js/jQuery.js"></script>
	<link href="css/admins.css" rel="stylesheet">
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
		<a href="./AdminRefresh"><img src="img/left_Arrow.png" id="backArrow"></a>
	</header>

	<div id="empleadosVer">
			<h3>EMPLEADOS</h3>
			<div class="table100 ver3 m-b-110 floatingTable3">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Fecha de Admisión</th>
									<th class="cell100 column2">Rol en la Compañía</th>
									<th class="cell100 column2">Nombre del Empleado</th>
									<th class="cell100 column2">Salario</th>
									<th class="cell100 column2">Código de Contrato</th>
									<th class="cell100 column2">Finiquito</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${requestScope.employeeList}" var="em">
	  							<tr class="row100 body">
									<td class="cell100 column1"><c:out value="${em.admissionDate}" /></td>
									<td class="cell100 column1"><c:out value="${em.companyRole}" /></td>
									<td class="cell100 column1"><c:out value="${em.name}" /></td>
									<td class="cell100 column1"><c:out value="${em.salary}" /></td>
									<td class="cell100 column1"><c:out value="${em.contractCode}" /></td>
									<td class="cell100 column1"><c:out value="${em.settlement}" /></td>
								</tr>
  								</c:forEach>
  								<td class="cell100 column1"><input type="submit" value="Eliminar" class="botonE"></td>
								<td class="cell100 column1"><input type="submit" value="Modificar" class="botonE"></td>
							</tbody>
						</table>
					</div>
				</div>

<!--
			<div class="table100 ver2 m-b-110 floatingTable3">
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
								<c:forEach items="${requestScope.clientNamesList2}" var="em2">
	  							<tr class="row100 body">
									<td class="cell100 column1"><c:out value="${em2}" /></td>
								</tr>
  								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			<div class="table100 ver2 m-b-110 floatingTable3">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Fecha del Juicio</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${requestScope.trialList2}" var="em3">
	  							<tr class="row100 body">
									<td class="cell100 column1"><c:out value="${em3}" /></td>
								</tr>
  								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
-->
			<!-- <a id="button" class="lowButt" href="verCliente.html">Ver</a> -->
		</div>
</body>
</html>








<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Homepage - CILA</title>
	<meta charset="UTF-8">
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/admins.css" rel="stylesheet">
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
<body onload="startTime()" charset="UTF-8">
	<header>
		<h1 id="headerAdmin">Corporativo Integral López Asociados, S.C.</h1>
		<a href="./"><img src="img/logOut.png" id="logOutButt"></a>
	</header>

	<div id="wrapper">

		<div id="leftMenu">
			<div id="clockSpace">
				<!--<img src="img/blank-avatar.jpg" id="avatar">-->
				<p>Bienvenido!</p><p>Son las:</p><p class="timeText"></p><p>del</p><p class="dateText"></p>

				<!-- <p id="clock"></p> -->
			</div>
			<div class="leftMenuTable">
				<ul id="uls">
					<a href="register.html"><li>Crear Usuario</li></a>
					<a href="clientes.html"><li>Crear Cliente</li></a>
					<a href="regJuicio.html"><li>Crear Juicio</li></a>
					<a href="regLawsuit.html"><li>Crear Demanda</li></a>
					<a href="regArchivo.html"><li>Crear Archivo</li></a>
					<a href="registerEmployee.html"><li>Crear Empleado</li></a>
					<!--<form method="post" action="./dropDownClient"> <input type="submit" name="regJuicio" value="Crear Juicio"> </form>-->
				</ul>
			</div>
		</div>

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
			<a id="button" class="lowButt" href="./ShowClients">Ver</a>
		</div>

		<div id="juicios">
			<h3>JUICIOS</h3>
			<div class="table100 ver2 m-b-110 floatingTable2">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Locación</th>
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
			<a id="button" class="lowButt" href="./ShowTrial">Ver</a>
		</div>

		<div id="empleados">
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
			<a id="button" class="lowButt2" href="./ShowEmployee">Ver</a>
		</div>

	</div>
</body>
<script>
	currentTime();

	function currentTime(){
		var today = new Date();
		var date = today.getDate() + ' de ' + today.toLocaleString('es-us', { month: 'long' }) + ' del ' + today.getFullYear();
		var time = checkTime(today.getHours()) + ":" + checkTime(today.getMinutes()) + ":" + checkTime(today.getSeconds());
		$('.dateText').html(date);
		$('.timeText').html(time);
		var t = setTimeout(currentTime, 500);
	}

	function checkTime(i) {
	  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
	  return i;
	}


</script>
</html>

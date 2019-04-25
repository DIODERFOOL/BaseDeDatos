<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Homepage - CILA</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/admins.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
	<script type="text/javascript" src="js/jQuery.js"></script>
</head>
<body>
	<header>
		<h1>Corporativo Integral López Asociados, S.C.</h1>
	</header>
	
	<div id="wrapper">

		<div id="leftMenu">
			<div id="clockSpace">
				<!--<img src="img/blank-avatar.jpg" id="avatar">-->
				<br><p>Bienvenido!</p><p>Son las:</p><p class="timeText"></p><p>del</p><p class="dateText"></p>

				<!--<p id="clock"></p>-->
			</div>
			<div class="leftMenuTable">
				<ul id="uls">
					<a href="registerEmployee.html"><li>Crear Empleado</li></a>
					<a href="clientes.html"><li>Crear Cliente</li></a>
					<a href="regJuicio.html"><li>Crear Juicio</li></a>
					<a href="pruebasBD.html"><li>Crear Demanda</li></a>
					<a href="regArchivo.jsp"><li>Crear Archivo</li></a>
					<!--<form method="post" action="./dropDownClient"> <input type="submit" name="regJuicio" value="Crear Juicio"> </form>-->
				</ul>
			</div>
		</div>

		<div id="clientes">
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
			<a id="button" class="lowButt" href="verCliente.html">Ver</a>
		</div>

		<div id="juicios">
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
			<a id="button" class="lowButt" href="verCliente.html">Ver</a>
		</div>

		<div id="empleados">
			<div class="floatingTable">
			<table border="1">
				<tr>
					<th>Fecha de Admision</th>
					<th>Rol en la Compania</th>
					<th>Nombre del Empleado</th>
					<th>Salario</th>
					<th>Código de Contrato</th>
					<th>Finiquito</th>
				</tr>
				<c:forEach items="${requestScope.employeeList}" var="em">
	  				<tr>
						<td>
        			<c:out value="${em.admissionDate}" />
      				<br/>
						</td>
						<td>
        			<c:out value="${em.companyRole}" />
      				<br/>
						</td>
						<td>
        			<c:out value="${em.name}" />
      				<br/>
						</td>
						<td>
        			<c:out value="${em.salary}" />
      				<br/>
						</td>
						<td>
        			<c:out value="${em.contractCode}" />
      				<br/>
						</td>
						<td>
        			<c:out value="${em.settlement}" />
      				<br/>
						</td>
					</tr>
  				</c:forEach>
			</table>
			</div>
			<div class="floatingTable">
			<table border="1">
				<tr>
					<th>Compañía Cliente</th>
				</tr>
				<c:forEach items="${requestScope.clientNamesList2}" var="em2">
	  				<tr>
						<td>
        			<c:out value="${em2}" />
      				<br/>
						</td>
					</tr>
  				</c:forEach>
			</table>
			</div>
			<div class="floatingTable">
			<table border="1">
				<tr>
					<th>Fecha del Juicio</th>
				</tr>
				<c:forEach items="${requestScope.trialList2}" var="em3">
	  				<tr>
						<td>
        			<c:out value="${em3}" />
      				<br/>
						</td>
					</tr>
  				</c:forEach>
			</table>
			</div>
			<a id="button" class="lowButt2" href="verCliente.html">Ver</a>
		</div>

	</div>
</body>
<script>
	currentTime();
	
	function currentTime(){
		var today = new Date();
		var date = today.getDate() + ' de ' + today.toLocaleString('es-us', { month: 'long' }) + ' del ' + today.getFullYear();
		var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
		$('.dateText').html(date);
		$('.timeText').html(time);
	}
	
</script>
</html>

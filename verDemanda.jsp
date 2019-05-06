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

	<div id="demandaVer">
			<h3>DEMANDAS</h3>
			<div class="table100 ver2 m-b-110 floatingTable2">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Nombre</th>
									<th class="cell100 column2">Reclamo</th>
									<th class="cell100 column2">Dirección de la Demanda</th>
									<th class="cell100 column2">Locación del Juicio Asociado</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${requestScope.lawsuitList}" var="lw">
	  							<tr class="row100 body">
									<td class="cell100 column1"><c:out value="${lw.name}" /></td>
									<td class="cell100 column1"><c:out value="${lw.affair}" /></td>
									<td class="cell100 column1"><c:out value="${lw.address}" /></td>
									<td class="cell100 column1"><c:out value="${lw.trialLocation}" /></td>
								</tr>
  								</c:forEach>
  								<td class="cell100 column1"><input type="submit" value="Eliminar" class="botonD"></td>
								<td class="cell100 column1"><input type="submit" value="Modificar" class="botonMD"></td>
							</tbody>
						</table>
					</div>
				</div>
		</div>

		<form class="formD" action="./DeleteEmployee" method="get">
			<input type="text" name="idToDelete" placeholder="ID a Eliminar">
			<input type="submit">
			<a class="cancel">Cancel</a>
		</form>

		<form class="formMD" action="./ModifyEmployee" method="get">
			<input type="text" name="idToModify" placeholder="ID a Modificar">
			<input type="date" name="dateToModify" placeholder="Fecha">
			<input type="text" name="roleToModify" placeholder="Rol">
			<input type="text" name="nameToModify" placeholder="Nombre">
			<input type="text" name="salaryToModify" placeholder="Salario">
			<input type="text" name="contractToModify" placeholder="Número de Contrato">
			<input type="text" name="settlementToModify" placeholder="Finiquito">
			<input type="submit">
			<a class="cancel">Cancel</a>
		</form>

</body>

<script>
	
	$('.botonD').on('click', function(){
    	$('.formD').fadeIn().css('display','block');
        
                
    });

    $('.cancel').on('click', function(){
                 //Validation
        $('.formD').fadeOut().css('display','none');
                
    });



	$('.botonMD').on('click', function(){
                 //Validation
        $('.formMD').fadeIn().css('display','block');
                
    });

    $('.cancel').on('click', function(){
                 //Validation
        $('.formMD').fadeOut().css('display','none');
                
    });

</script>

</html>








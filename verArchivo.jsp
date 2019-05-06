<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Archivos</title>
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

	<div id="archivoVer">
			<h3>ARCHIVOS</h3>
			<div class="table100 ver2 m-b-110 floatingTable2">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">ID</th>
									<th class="cell100 column2">Nombre</th>
									<th class="cell100 column2">Fecha de Creación</th>
									<th class="cell100 column2">Demanda Asociada</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${requestScope.fileList}" var="fl">
	  							<tr class="row100 body">
	  								<td class="cell100 column1"><c:out value="${fl.idFile}" /></td>
									<td class="cell100 column1"><c:out value="${fl.name}" /></td>
									<td class="cell100 column1"><c:out value="${fl.creationDate}" /></td>
									<td class="cell100 column1"><c:out value="${fl.lawsuitName}" /></td>
								</tr>
  								</c:forEach>
  								<td class="cell100 column1"><input type="submit" value="Eliminar" class="botonA"></td>
								<td class="cell100 column1"><input type="submit" value="Modificar" class="botonMA"></td>
							</tbody>
						</table>
					</div>
				</div>
		</div>

		<form class="formA" action="./DeleteFile" method="get">
			<input type="text" name="idToDelete" placeholder="ID a Eliminar">
			<input type="submit">
			<a class="cancel">Cancel</a>
		</form>

		<form class="formMA" action="./ModifyFile" method="get">
			<input type="text" name="idToModify" placeholder="ID a Modificar">
			<input type="text" name="nameToModify" placeholder="Nombre">
			<input type="date" name="dateToModify" placeholder="Fecha">
			<input type="submit">
			<a class="cancel">Cancel</a>
		</form>

</body>

<script>
	
	$('.botonA').on('click', function(){
    	$('.formA').fadeIn().css('display','block');
        
                
    });

    $('.cancel').on('click', function(){
                 //Validation
        $('.formA').fadeOut().css('display','none');
                
    });



	$('.botonMA').on('click', function(){
                 //Validation
        $('.formMA').fadeIn().css('display','block');
                
    });

    $('.cancel').on('click', function(){
                 //Validation
        $('.formMA').fadeOut().css('display','none');
                
    });

</script>

</html>








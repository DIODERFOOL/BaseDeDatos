<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Clientes</title>
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

	<div id="clientesVer">
			<h3>CLIENTES</h3>
			<div class="table100 ver1 m-b-110 floatingTable">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">ID</th>
									<th class="cell100 column1">Nombre</th>
									<th class="cell100 column1">Contacto</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll" method="post">
							<table>
								<tbody>
									<c:forEach items="${requestScope.clientListShow}" var="us">
		  							<tr class="row100 body">
		  								<!-- <form action="./DeleteClient"   method="post"> -->
											<td class="cell100 column1" name="perro"><c:out value="${us.companyID}" /></td>
											<td class="cell100 column1"><c:out value="${us.name}" /></td>
											<td class="cell100 column1"><c:out value="${us.contact}" /></td>
											
										<!-- </form> -->
									</tr>
	  								</c:forEach>
	  								<td class="cell100 column1"><input type="submit" value="Eliminar" class="botonC"></td>
									<td class="cell100 column1"><input type="submit" value="Modificar" class="botonMC"></td>
								</tbody>
							</table>
					</div>
				</div>

			<div class="table100 ver3 m-b-110 floatingTable" method="get">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Usuario Responsable</th>
									<th class="cell100 column1"></th>
									<!-- <th class="cell100 column1"></th> -->
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${requestScope.usernameListShow}" var="us2">
	  							<tr class="row100 body">
									<td class="cell100 column1"><c:out value="${us2}"/></td>
								</tr>
  								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
		</div>

		<form class="form" action="./DeleteClient" method="get">
			<input type="text" name="idToDelete" placeholder="ID a Eliminar">
			<input type="submit">
		</form>

</body>

<script>
	
	$('.botonC').on('click', function(){
                 //Validation
        $('.form').fadeIn().css('display','block');
                
    });


</script>




</html>
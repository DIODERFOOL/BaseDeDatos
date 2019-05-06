<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Creación Clientes</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/regstyle2.css">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
</head>
<body>
	<header>
		<h1>Corporativo Integral López Asociados, S.C.</h1>
        <a href="./AdminRefresh"><img src="img/left_Arrow.png" id="backArrow"></a>
	</header>

    <section id="start">
        <form id="form" action="./RegisterClient" method="post">
        	<p>Crear Clientes</p>
            <input type="text" required placeholder="Nombre" class="inp" name="ClientName" id="addName">
            <input type="text" required placeholder="Contacto" class="inp" name="ClientContact" id="addContacto">
						<select class="inp" name="fkUser" id="addForma">
							<c:forEach items="${requestScope.userList}" var="us">
	            	<option value=" <c:out value="${us.name}" /> "> <c:out value="${us.name}" /> </option>
							</c:forEach>
	          </select>
            <!-- <input type="text" placeholder="Forma Jurídica" class="inp" id="addForma"> -->
            <input type="submit" value="Crear Cliente" id="button">
        </form>
    	<div class="reg-error"></div>
    </section>
</body>
</html>

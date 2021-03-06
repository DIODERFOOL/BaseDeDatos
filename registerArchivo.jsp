<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creación Archivos</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
    <link href="css/regstyle2.css" rel ="stylesheet">
</head>
<body>
    <header>
        <h1>Corporativo Integral López Asociados, S.C.</h1>
        <a href="./AdminRefresh"><img src="img/left_Arrow.png" id="backArrow"></a>
    </header>

    <section id="start">
        <form id="form" action="./RegisterFile" method="post">
            <p>Crear Archivo</p>
            <input type="text" required placeholder="Nombre" class="inp" name="addName" id="addName">
            <input type="date" class="inp" name="addContacto" id="addContacto">
			<select class="inp" name="fkLawsuit" id="addForma">
							<c:forEach items="${requestScope.lawsuitList}" var="lw">
	            	<option value=" <c:out value="${lw.name}" /> "> <c:out value="${lw.name}" /> </option>
							</c:forEach>
	        </select>
            <input type="submit" value="Registrar" id="button">
        </form>
        <div class="reg-error"></div>
    </section>
</body>
</html>

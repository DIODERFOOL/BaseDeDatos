<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
    <link href="css/regstyle2.css" rel ="stylesheet">
</head>
<body>
    <header>
        <h1>Corporativo Integral López Asociados, S.C.</h1>
        <a href="./AdminRefresh"><img src="img/left_Arrow.png" id="backArrow"></a>
    </header>

    <section id="start">
        <form id="form" action="./CreateTrial" method="post">
            <p>Crear Jucio</p>
            <input type="text" required placeholder="Lugar" class="inp" name="addAddress" id="addAddress">
            <input type="date" class="inp" name="addDate" id="addDate">
            <select class="inp" name="fkUser" id="addForma">
  						<c:forEach items="${requestScope.clientList}" var="us">
  	            <option value=" <c:out value="${us.name}" /> "> <c:out value="${us.name}" /> </option>
  						</c:forEach>
  	         </select>
            <!-- <input type="text" placeholder="Forma Jurídica" class="inp" id="addForma"> -->
            <input type="submit" value="Registrar" id="button">
        </form>
        <div class="reg-error"></div>
    </section>
</body>
</html>

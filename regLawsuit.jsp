<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Demandas</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
    <link href="css/regstyle2.css" rel ="stylesheet">
</head>
<body>
    <header>
        <h1>Corporativo Integral López Asociados, S.C.</h1>
        <a href="./AdminRefresh"><img src="img/left_Arrow.png" id="backArrow"></a>
    </header>

    <section id="start">
        <form id="form" action="./RegisterLawsuit" method="post">
            <p>Crear Demanda</p>
            <input type="text" required placeholder="Nombre" name="sName" class="inp" id="addName">
            <input type="text" required placeholder="Reclamo" name="sReclamo" class="inp" id="addAffair">
            <input type="text" placeholder="Dirección de la demana" name="sDireccion" class="inp" id="addForma">
            <select class="inp" name="fkUser" id="addForma">
    					<c:forEach items="${requestScope.trialList}" var="us">
    	           <option value=" <c:out value="${us.location}" /> "> <c:out value="${us.location}" /> </option>
    					</c:forEach>
    	      </select>
            <input type="submit" value="Crear Demanda" id="button">
        </form>
        <div class="reg-error"></div>
    </section>
</body>
</html>

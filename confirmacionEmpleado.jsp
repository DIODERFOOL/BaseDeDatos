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
        <div id="forTables">
            <table id="tableIDK">
                <tr>
                    <th>Nombre</th>
                    <th>Salario</th>
                    <th>Rol</th>
                    <th>Fecha de ingreso</th>
                    <th>Codigo de contrato</th>
                </tr>
                <c:forEach items="${requestScope.employeeList}" var="us">
                  <tr>
                    <td>
                      <c:out value="${us.name}" />
                    </td>
                    <td>
                      <c:out value="${us.salary}" />
                    </td>
                    <td>
                      <c:out value="${us.companyRole}" />
                    </td>
                    <td>
                      <c:out value="${us.admissionDate}" />
                    </td>
                    <td>
                      <c:out value="${us.contractCode}" />
                    </td>
                  </tr>
                </c:forEach>
            </table>
            <div id="divButts">
                <a href="registerEmployee.html" class="lowButt3">Crear Nuevo</a>
                <a href="./AdminRefresh" class="lowButt3">Regresar</a>
            </div>
        </div>

    </section>
</body>
</html>

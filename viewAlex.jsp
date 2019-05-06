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
        <a href="admins.jsp"><img src="img/left_Arrow.png" id="backArrow"></a>
    </header>

    <section id="start">
        <div id="forTables">
            <table id="tableIDK" align="center">
                <tr>
                    <th>name</th>
                    <th>Username</th>
                    <th>Rol</th>
                </tr>
                <c:forEach items="${requestScope.userList}" var="us">
                  <tr>
                    <td>
                      <c:out value="${us.name}" />
                    </td>
                    <td>
                      <c:out value="${us.username}" />
                    </td>
                    <td>
                      <c:out value="${us.role}" />
                    </td>
                  </tr>
                </c:forEach>
            </table>
            <div id="divButts">
                <a href="register.html" class="lowButt3">Crear Nuevo</a>
                <a href="./AdminRefresh" class="lowButt3">Regresar</a>
            </div>

        </div>
    </section>
</body>
</html>

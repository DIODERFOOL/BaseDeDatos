<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
    <link href="css/regstyle2.css" rel ="stylesheet">
    <script type="text/javascript" src="js/jQuery.js"></script>

</head>
<body>
    <header>
        <h1>Corporativo Integral López Asociados, S.C.</h1>
    </header>

    <section id="start">
       <div id="center">
            <h2>Error</h2>

            <h3>Hubo un error al procesar tu solicitud. Intenta: </h3>
            <ul id="pasos">
                <li>Asegúrate de meter exclusivamente números en los campos numéricos, como "salario".</li>
                <li>Borrar todos los elementos asociados a un cliente antes de eliminar un cliente.</li>
            </ul>

            <br>
            <br>
            <br>
            <br>

            <a id="button" class="lowButt" href="./RefreshServlet">Regresar</a>

        </div>
    </section>
</body>
</html>

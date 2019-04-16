<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Pruebas Conexión BD</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/regstyle1.css" rel ="stylesheet">
</head>
<body>
	<header>
		<h1>Corporativo Integral López Asociados, S.C.</h1>
	</header>

    <section id="start">
    	<p>Nombre: <c:out value="${requestScope.nombre}"/></p>
        <p>Contacto: <c:out value="${requestScope.contacto}"/></p>
        <p>Forma: <c:out value="${requestScope.forma}"/></p>
    	<div class="reg-error"></div>
    </section>
</body>
</html>
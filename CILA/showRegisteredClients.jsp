<!DOCTYPE HTML>

<%@ tablib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Registered Clients list [FOR DEBUGGING ONLY]</title>
</head>
<body>

<table border="1">
	<tr>
			<th>Name</th>
			<th>Contact</th>
	</tr>
  <c:forEach items="${requestScope.clientList}" var="us">
	  <tr>
			<td>
		        <c:out value="${us.name}" />
		      	<br />
			</td>
			<td>
		        <c:out value="${us.contact}" />
		      	<br />
			</td>
		</tr>
  </c:forEach>
</table>
<br />
<a href="./index.html">Back</a>
</body>
</html>
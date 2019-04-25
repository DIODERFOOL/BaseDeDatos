<!DOCTYPE HTML>

<%@ tablib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Registered Lawsuit list [FOR DEBUGGING ONLY]</title>
</head>
<body>

<table border="1">
	<tr>
			<th>Name</th>
			<th>affair</th>
			<th>adress</th>
	</tr>
  <c:forEach items="${requestScope.lawsuitList}" var="us">
	  <tr>
			<td>
		        <c:out value="${us.name}" />
		      	<br />
			</td>
			<td>
		        <c:out value="${us.affair}" />
		      	<br />
			</td>
			<td>
				<c:out value="${us.adress"} />
			</td>
		</tr>
  </c:forEach>
</table>
<br />
<a href="./index.html">Back</a>
</body>
</html>
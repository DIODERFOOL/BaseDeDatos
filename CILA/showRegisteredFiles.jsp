<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Registered Files list [FOR demostration purposes at the moment ONLY]</title>
</head>
<body>

<table border="1">
	<tr>
			<th>Name</th>
			<th>Date of Creation</th>
	</tr>
  <c:forEach items="${requestScope.fileList}" var="us">
	  <tr>
			<td>
        <c:out value="${us.name}" />
      	<br />
			</td>
			<td>
        <c:out value="${us.date}" />
      	<br />
			</td>
		</tr>
  </c:forEach>
</table>
<br />
<a href="./admins.html">Back</a>
</body>
</html>

<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Registered Users list [FOR DEBUGGING ONLY]</title>
</head>
<body>

<table border="1">
	<tr>
			<th>Name</th>
			<th>Username</th>
			<th>Password lululul</th>
	</tr>
  <c:forEach items="${requestScope.userList}" var="us">
	  <tr>
			<td>
        <c:out value="${us.name}" />
      	<br />
			</td>
			<td>
        <c:out value="${us.username}" />
      	<br />
			</td>
			<td>
        <c:out value="${us.password}" />
      	<br />
			</td>
		</tr>
  </c:forEach>
</table>
<br />
<a href="./index.html">Back</a>
</body>
</html>

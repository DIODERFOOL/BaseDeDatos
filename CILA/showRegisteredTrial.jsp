<!DOCTYPE HTML>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Registered Files list [FOR demostration purposes at the moment ONLY]</title>
</head>
<body>

<table border="1">
	<tr>
			<th>Address</th>
			<th>Date</th>
	</tr>
  <c:forEach items="${requestScope.trialList}" var="us">
	  <tr>
			<td>
        <c:out value="${us.address}" />
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

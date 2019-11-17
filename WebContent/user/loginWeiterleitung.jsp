<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 ">
<title>Login</title>
</head>
<body>

<c:choose> 
	<c:when test="${kunde.admin == 0}"> 
	<h2>
		<b>Das Login war erfolgreich!</b><b>Hallo ${kunde.vorname}${kunde.name}!</b>
	</h2>
	</c:when>

	<c:when test="${kunde.admin == 1}">

		<h2>Herzlich Willkommen Admin ${Kunde.admin}!</h2>
		<br> <b>Hier zur Adminverwaltung</b>

		<form style="display: inline" action="AdminVerwaltung.jsp"
		method="get">
		<button>Zur Verwaltung der Webseiteninhalte</button>

		</form>

	</c:when>
</c:choose>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 ">
<base href="${pageContext.request.requestURI}"/>
<title>Login</title>
</head>
<body>
	<%--CODE BEARBEITEN!!! WIE BEI T.!! --%>
	<c:choose>
		<c:when test="${login.admin == 0}">
			<h2>
				<b>Login war erfolgreich!</b><b>Hallo ${login.vorname}
					${login.nachname} !</b> <a href="profilansehen.jsp">Ihr
					Profil</a>
			</h2>
		</c:when>

		<c:when test="${login.admin == 1}">

			<h2>Herzlich Willkommen Admin ${login.vorname} ${login.nachname}
				!</h2>
			<br>
			<b>Hier zur Adminverwaltung</b>

			<form style="display: inline" action="../admin/adminpage.jsp">
				<button>Zur Verwaltung der Webseiteninhalte</button>

			</form>

		</c:when>
	</c:choose>

</body>
</html>
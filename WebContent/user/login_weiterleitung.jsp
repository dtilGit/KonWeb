<%-- Veronika Tschemodanov + David Häusler --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="de">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" href="../css/style.css" type="text/css">

<title>Login</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>
	<c:choose>
		<c:when test="${login.admin == 0}">
			<h1>Login war erfolgreich!</h1>
			<h2>
				Hallo ${login.vorname}
				<%--änderung davor: profilansehen.jsp --%>
				${login.nachname}!
			</h2>

			<form action="../ProfilAnsehen" method="post">
				<button type="submit">Ihr Profil</button>
			</form>
			<%--a href="../ProfilAnsehen"> --%>

		</c:when>

		<c:when test="${login.admin == 1}">
			<h1>Login war erfolgreich!</h1>
			<h2>Herzlich Willkommen ${login.vorname} ${login.nachname}! Du
				wurdest als Admin eingeloggt!</h2>
			<br>

			<form style="display: inline" action="../PreloadAdminpage"
				method="post" enctype="multipart/form-data">
				<button>Zur Verwaltung der Webseiteninhalte</button>
			</form>

		</c:when>
	</c:choose>
	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-UTF-8)">
<title>Ihr Profil</title>
</head>

<body>

<h1>Ihr Profil</h1>
	<%--Überprüfung, ob angemeldet oder nicht, ist nicht notwendig, da diese bereits in der Navigation vorhanden ist 
SPÄTER NOCHMAL ÜBERPRÜFEN, OB ÜBER DIE URL DER AUFRUF EINES NUTZERS MÖGLICH IST, ODER EINE ÜBERPRÜFUNG NOTWENDIIG IST--%>

	<c:choose>
		<c:when test="${login.status == 0}">
			<h2>
				<b>Um Ihr Profil ansehen zu können, müssten Sie angemeldet sein!
				</b> <a href="/tods/user/login.jsp"> Zum LOGIN</a>
			</h2>
		</c:when>

		<c:when test="${login.status == 1}">
			<p>Geschlecht: ${login.geschlecht}</p>
			<p>Titel: ${login.titel}</p>
			<p>Nachname: ${login.nachname}</p>
			<p>Vorname: ${login.vorname}</p>
			<p>E-Mail: ${login.email}</p>
			<p>Strasse: ${login.strasse}</p>
			<p>Hausnummer: ${login.hausnummer}</p>
			<p>Postleitzahl: ${login.postleitzahl}</p>
			<p>Ort: ${login.ort}</p>
			<p>Land: ${login.land}</p>

			<form style="display: inline" action="/tods/user/profilbearbeiten.jsp">
				<button>Profil bearbeiten</button>

			</form>

		</c:when>
	</c:choose>

</body>
</html>
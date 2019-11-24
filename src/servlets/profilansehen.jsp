<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-UTF-8)">
<base href="${pageContext.request.requestURI}"/>
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
				</b> <a href="login.jsp"> Zum LOGIN</a>
			</h2>
		</c:when>

		<c:when test="${login.status == 1}">
			<p>Geschlecht: ${profillesen.geschlecht}</p>
			<p>Titel: ${profillesen.titel}</p>
			<p>Nachname: ${profillesen.nachname}</p>
			<p>Vorname: ${profillesen.vorname}</p>
			<p>E-Mail: ${profillesen.email}</p>
			<p>Strasse: ${profillesen.strasse}</p>
			<p>Hausnummer: ${profillesen.hausnummer}</p>
			<p>Postleitzahl: ${profillesen.postleitzahl}</p>
			<p>Ort: ${profillesen.ort}</p>
			<p>Land: ${profillesen.land}</p>

			<form style="display: inline" action="profilbearbeiten.jsp">
				<button>Profil bearbeiten</button>

			</form>

		</c:when>
	</c:choose>

</body>
</html>
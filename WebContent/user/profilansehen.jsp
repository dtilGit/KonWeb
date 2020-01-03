<%-- Veronika Tschemodanov --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="fehlerausgabe.jsp"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="de">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" href="../css/style.css" type="text/css">

<title>Ihr Profil</title>
</head>

<body>
	<%@ include file="../jspf/header.jspf"%>
	<h1>Ihr Profil</h1>
	<%--Überprüfung, ob angemeldet oder nicht, ist nicht notwendig, da diese bereits in der Navigation vorhanden ist 
SPÄTER NOCHMAL ÜBERPRÜFEN, OB ÜBER DIE URL DER AUFRUF EINES NUTZERS MÖGLICH IST, ODER EINE ÜBERPRÜFUNG NOTWENDIIG IST--%>

	<c:choose>
		<c:when test="${empty sessionScope.login}">
			<h2>
				<b>Um Ihr Profil ansehen zu können, müssten Sie angemeldet sein!
				</b> <a href="login.jsp"> Zum LOGIN</a>
			</h2>
		</c:when>

		<c:when test="${not empty sessionScope.login}">
			<p>Geschlecht: ${login.geschlecht}</p>
			<p>Titel: ${login.titel}</p>
			<p>Nachname: ${login.nachname}</p>
			<p>Vorname: ${login.vorname}</p>
			<p>Strasse: ${login.strasse}</p>
			<p>Hausnummer: ${login.hausnummer}</p>
			<p>Postleitzahl: ${login.postleitzahl}</p>
			<p>Ort: ${login.ort}</p>
			<p>Land: ${login.land}</p>

			<form style="display: inline" action="profilbearbeiten.jsp">
				<button>Profil bearbeiten</button>

			</form>

			<form style="display: inline" action="../AccountLoeschen" method="post">
				<button>Account löschen</button>
			</form>
			
			<form style="display: inline" action="../LogoutServlet">
				<button>Logout</button>
			</form>

		</c:when>
	</c:choose>
	<%@ include file="/../jspf/footer.jspf"%>
</body>
</html>
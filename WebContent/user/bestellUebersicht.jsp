
<%-- Veronika Tschemodanov --%>
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
<title>Bestellübersicht</title>
</head>

<body>
	<%@ include file="../jspf/header.jspf"%>
	<h1>Deine Bestellung</h1>

	<h2>Allgemeine Daten</h2>
	<table>
		<thead>
			<tr>
				<th>Anzahl aller Artikel</th>
				<th>Gesamtbetrag(€)</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${wk_groesse}</td>
				<td>${ges_preis}€</td>
			</tr>
		</tbody>
	</table>

	<h2>Deine Lieferadresse:</h2>
	<table>
		<thead>
			<tr>
				<th>Strasse, Hausnummer</th>
				<th>Postleitzahl</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${login.strasse},${login.hausnummer}</td>
				<td>${login.postleitzahl}</td>
			</tr>
		</tbody>
	</table>



	<%@ include file="../jspf/footer.jspf"%>
</body>

</html>
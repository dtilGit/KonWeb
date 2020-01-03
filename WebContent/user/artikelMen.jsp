<%--Veronika Tschemodanov --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />

<title>Männer Artikel</title>
</head>
<body>
<%@ include file="../jspf/header.jspf"%>
	<h1>Männer Artikel</h1>

	<c:forEach var="kategorieMen" items="${anzeige.kategorie}">


		<form id="suche" action="../ArtikelLadenMen" method="POST">
			<button type="submit" id="artikelAnzeigen_1">${kategorieMen.kategoriebezeichnung}</button>
			<input name="kategorie_id" type="hidden"
				value="${kategorieMen.kategorie_id }"></input>
		</form>


	</c:forEach>

	<table>
		<!-- 	id="artikelAnzeigen" -->
	<thead>
		<tr>
			<th>Artikelbezeichnung</th>
			<th>Preis(€)</th>
			<th>Bild</th>
			<th></th>
		</tr>
	</thead>
	
		<c:forEach var="artikelkategorie" items="${anzeige.artikel}">
			<tr>
				<td>${artikelkategorie.artikelbezeichnung}</td>
				<td>${artikelkategorie.preis}</td>
				<td><img
					src="../BildLaden?artikel_id=${artikelkategorie.artikel_id}"
					class="bild" alt="bild_laden" width="200" height="250"></td>
				<td id="add-cart">
					<form action="../ZumWarenkorbHinzufuegen" method="get">
						<button name="warenkorbButton">zum Warenkorb hinzufügen</button>
						<input type="hidden" name="art_id"
							value="${artikelkategorie.artikel_id}" /> <input type="hidden"
							name="artikelbezeichnung"
							value="${artikelkategorie.artikelbezeichnung}" /> <input
							type="hidden" name="preis" value="${artikelkategorie.preis}" />
					</form>
				</td>
			</tr>

		</c:forEach>
	</table>

<%@ include file="../jspf/footer.jspf"%>
</body>
</html>

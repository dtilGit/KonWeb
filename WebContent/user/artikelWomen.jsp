<%--Veronika Tschemodanov --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />

<script type="text/javascript" src="../js/script.js"></script>

<title>Frauen Artikel</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>
	<h1>Frauen Artikel</h1>
	<%--Zuerst die Kategorien anzeigen, dann die jeweilgien Artikel --%>

	<c:forEach var="artikelkategorie" items="${anzeige.artikel}">
		<p>test</p>
		<tr>
			<td>${artikelkategorie.kategorie_id}</td>
			<td>${artikelkategorie.artikelbezeichnung}</td>
			<td>${artikelkategorie.preis}</td>
			<td><img
				src="../BildLaden?artikel_id=${artikelkategorie.artikel_id}"
				width="200" height="200" alt="bild_laden"></td>
			<td>
				<form action="../ZumWarenkorbHinzufuegen" method="get">
					<button name="warenkorbButton">zum Warenkorb hinzufügen</button>
					<input type="hidden" name="art_id"
						value="${artikelkategorie.artikel_id}" />
				</form>
			</td>
		</tr>
	</c:forEach>


	<c:forEach var="kategorieWomen" items="${anzeige.kategorie}">

		<form id="suche" action="../Suche" method="POST">
			<button type="submit" id="artikelAnzeigen_1">${kategorieWomen.kategoriebezeichnung}</button>
			<input name="kategorie_id" type="hidden"
				value="${kategorieWomen.kategorie_id }"></input>
		</form>
<!-- 					onClick="document.getElementById('artikelAnzeigen').style.display='inline';"> -->
<!-- 				<table id="artikelAnzeigen" style="display: none"> -->

		<table id="artikelAnzeigen">
			<thead>
				<tr>
					<th>Artikelbezeichnung</th>
					<th>Preis(€)</th>
					<!--<th>Bild</th> -->
				</tr>
			</thead>
		</table>
	</c:forEach>
	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
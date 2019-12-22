<%--Veronika Tschemodanov --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<base href="${pageContext.request.requestURI}" />
<script type="text/javascript" src="../js/script.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Frauen Artikel</title>
</head>
<body>
	<h1>Frauen Artikel</h1>
	<%--Zuerst die Kategorien anzeigen, dann die jeweilgien Artikel --%>

	<c:forEach var="kategorieWomen" items="${anzeige.kategorie}">

		
		<button type="button" id="artikelAnzeigen_1" >${kategorieWomen.kategoriebezeichnung}</button>
		
									<!-- 			onClick="document.getElementById('artikelAnzeigen').style.display='inline';"> -->
									<!-- 		<table id="artikelAnzeigen" style="display: none"> -->
		
		<table id="artikelAnzeigen" style="display: none">
			<thead>
				<tr>
					<th>Artikelbezeichnung</th>
					<th>Preis(€)</th>
					<!--<th>Bild</th> -->
				</tr>
			</thead>

			<tbody>
				<c:forEach var="artikelkategorie" items="${anzeige.artikel}">
					<c:choose>
						<c:when
							test="${artikelkategorie.kategorie_id == kategorieWomen.kategorie_id}">
							<tr>
								<td>${artikelkategorie.kategorie_id}</td>
								<td>${artikelkategorie.artikelbezeichnung}</td>
								<td>${artikelkategorie.preis}</td>
								<td><img src="../BildLaden?artikel_id=${artikelkategorie.artikel_id}" width="200" height="200" alt="bild_laden"></td> 
								<td> <form action="../ZumWarenkorbHinzufuegen" method="get"> 
									<button name="warenkorbButton">zum Warenkorb hinzufügen</button>
									<input type="hidden" name="art_id" value="${artikelkategorie.artikel_id}" />
									</form></td>
							</tr>
						</c:when>
									<%-- 						<c:otherwise> Keine Artikel unter dieser Kategorie vorhanden! </c:otherwise> --%>
					</c:choose>
				</c:forEach>

			</tbody>

		</table>
	</c:forEach>

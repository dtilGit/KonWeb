<%--Veronika Tschemodanov --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../jspf/header.jspf"%>

<title>Männer Artikel</title>
</head>
<body>
	<h1>Männer Artikel</h1>
	<%--Zuerst die Kategorien anzeigen, dann die jeweilgien Artikel --%>

	<c:forEach var="kategorieMen" items="${anzeige.kategorie}">

		<!--  Änderung: Onklick funktioniert nur wenn IDs in button und table unterschiedlich sind!! -->
		<button type="button" id="artikelAnzeigen_1">${kategorieMen.kategoriebezeichnung}</button>
		<!-- 			onClick="document.getElementById('artikelAnzeigen').style.display='inline';"> -->
		<!-- 		<table id="artikelAnzeigen" style="display: none"> -->
		<table id="artikelAnzeigen">
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
							test="${artikelkategorie.kategorie_id == kategorieMen.kategorie_id}">
							<tr>
								<td>${artikelkategorie.kategorie_id}</td>
								<td>${artikelkategorie.artikelbezeichnung}</td>
								<td>${artikelkategorie.preis}</td>
								<td> <form action="../ZumWarenkorbHinzufuegen" method="get"> 
									<button name="warenkorbButton">zum Warenkorb hinzufügen</button>
									<input type="hidden" name="art_id" value="${artikelkategorie.artikel_id}" />
									</form></td>
								
								<td><img src="../BildLaden?artikel_id=${artikelkategorie.artikel_id}" alt="bild_laden" ></td>
								
							</tr>
						</c:when>
						<%-- 						<c:otherwise> Keine Artikel unter dieser Kategorie vorhanden! </c:otherwise> --%>
					</c:choose>
				</c:forEach>

			</tbody>

		</table>
	</c:forEach>




	<%-- 		<c:forEach var="artikelkategorie" items="${anzeige.artikel}"> --%>

	<%-- 			<td>${artikelkategorie.artikelbezeichnung}</td> --%>
	<%-- 			<td>${artikelkategorie.preis}€</td> --%>
	<%-- 	</c:forEach> --%>


 <%@ include file="/../jspf/footer.jspf" %>
</body>
</html>


<!-- <form action="/KategorienLadenMen" method="get">  -->
<%-- 			<td> <button type="submit" >${kategorieMen.kategoriebezeichnung}</button></td>  --%>
<%-- 			<c:forEach var="artikelkategorie" items="${anzeige.ArtikelKategorie }">   --%>
<%-- 				<td>${artikelkategorie.artikelbezeichnung}</td>   --%>
<%-- 				<td>${artikelkategorie.preis)Euro}</td> --%>
<!-- 				<td><img  -->
<%--  					src="../BildLaden?artikel_id=${kategorieMen.artikel_id}"  --%>
<!--  					alt="Artikelbild"></td> -->
<!--  				<td>  -->


<%-- 	</c:forEach>  --%>
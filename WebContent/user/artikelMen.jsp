<%--Veronika Tschemodanov --%>
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
<link rel="stylesheet" type="text/css" href="../css/style.css" />

<title>Männer Artikel</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>
	<h1>Männer Artikel</h1>

	<c:forEach var="kategorieMen" items="${anzeige.kategorie}">


		<form class="kategorie" action="../ArtikelLadenMen" method="POST">
			<button type="submit">${kategorieMen.kategoriebezeichnung}</button>
			<input name="kategorie_id" type="hidden"
				value="${kategorieMen.kategorie_id }">
		</form>


	</c:forEach>

	<table>

		<c:forEach var="artikelkategorie" items="${anzeige.artikel}">
			<thead>
				<tr>
					<th>Bild</th>
					<th>Artikelbezeichnung</th>
					<th>Preis(€)</th>
					<th></th>
				</tr>
			</thead>
			<tr>
				<td><img
					src="../BildLaden?artikel_id=${artikelkategorie.artikel_id}"
					class="bild" alt="bild_laden" width="200" height="250"></td>
				<!-- artikelkategorie ist hier der name var aus foreach und .artikel_id die Variable aus der DB  -->
				<td>${artikelkategorie.artikelbezeichnung}</td>
				<td>${artikelkategorie.preis}</td>
				<td class="add-cart">
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

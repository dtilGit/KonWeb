<%--Veronika Tschemodanov --%>
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

<title>Suchergebnis</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>


	<c:choose>
		<c:when test="${art == null || empty art}">
			<h1>Kein Suchergebnis bei Ihrer Sucheingabe.</h1>
		</c:when>
		<c:otherwise>
			<h1>Folgende Artikel wurden zu deiner Suchanfrage gefunden:</h1>
			<table>
				<thead>
					<tr>
						<th>Artikel</th>
						<th>Artikelbezeichnung</th>
						<th>Preis(€)</th>
						<th></th>
						<!--<th>Bild</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="suche" items="${art}" varStatus="status">
						<tr id="seperation">
							<td><img class="bild"
								src="../BildLaden?artikel_id=${suche.artikel_id}"
								alt="Artikelbild"></td>
							<td>${suche.artikelbezeichnung}</td>
							<td>${suche.preis}€</td>
							<td id="add-cart">
								<form action="../ZumWarenkorbHinzufuegen" method="get">
									<button name="warenkorbButton">zum Warenkorb
										hinzufügen</button>
									<input type="hidden" name="art_id" value="${suche.artikel_id}" />
									<input type="hidden" name="artikelbezeichnung"
										value="${suche.artikelbezeichnung}" /> <input
										type="hidden" name="preis" value="${suche.preis}" />
								</form>
							</td>

						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>

	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
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


<title>Warenkorb</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">

</head>


<section>

	<h1>Ihr Warenkorb</h1>
	<c:choose>
		<c:when test="${empty warenkorbB.wk_groesse}">
			<p>Es befinden sich noch keine Artikel im Warenkorb. empty</p>
		</c:when>
		<c:when test="${not empty warenkorbB.wk_groesse}">
			<div class="markenbereich">
				<table>
					<tr>
						<th>Bild</th>
						<th>Bezeichnung</th>
						<th>Preis</th>
						<th>Menge</th>
						<th>Wert</th>
						<c:forEach items="${warenkorbB.warenkorbList}" var="wk_List">
							<tr>
								<th><img
									src="../BildLaden?artikel_id=${wk_List.wk_artikel.artikel_id}"
									width="200" height="200" alt="artikelBildWK"></th>
								<th>${wk_List.wk_artikel.artikelbezeichnung}</th>
								<th>${wk_List.wk_artikel.preis}€</th>
								<td><form method="get" action="../WarenkorbGroesse">
										<input type="hidden" name="art_id" value="${wk_List.wk_artikel.artikel_id}">
										<!--<input type="hidden" name="groesse" value="${wk_List.wk_size}">-->
										<input type="number" min="0" max="15" name="menge"
											value="${wk_List.wk_art_anzahl}">
										<button type="submit">Menge ändern</button>
									</form></td>
								<td>${wk_List.wk_art_preis}€</td>
							</tr>
						</c:forEach>
					</tr>
				</table>
			</div>
			<div id="ges_preis">
				<c:choose>

					<c:when test="${empty sessionScope.login}">
						<p> Login erforderlich!</p>
					</c:when>
					<c:when test="${not empty sessionScope.login }">
						<h2>Zur Kasse</h2>
						<form id="myForm" method="post" action="../BestellenServlet">
								<button id="bestellenButton" type="submit">Bestellen</button>
							</form>
						</c:when>
				</c:choose>
				<p> Gesamtbetrag: ${warenkorbB.ges_preis}€</p></div>
		</c:when>
		<c:when test="${warenkobB == NULL}">
			<p>Es befinden sich noch keine Artikel im Warenkorb.</p>
		</c:when>
	</c:choose>



	<div class="markenbereich"></div>

	<div class="markenbereich"></div>
</section>



<%@ include file="../jspf/footer.jspf"%>

</body>
</html>
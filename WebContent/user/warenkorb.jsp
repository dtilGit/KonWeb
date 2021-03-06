<%--David Häusler + Veronika Tschemodanov--%>
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


<title>Warenkorb</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">

</head>

<%@ include file="../jspf/header.jspf"%>
<section>

	<h1>Ihr Warenkorb</h1>
	<c:choose>
		<c:when test="${empty warenkorbB.wk_groesse}">
			<p>Es befinden sich keine Artikel im Warenkorb!</p>
		</c:when>
		<c:when test="${not empty warenkorbB.wk_groesse}">
			<div class="markenbereich">
				<table>
					<thead>
						<tr>
							<th>Bild</th>
							<th>Bezeichnung</th>
							<th>Preis</th>
							<th>Menge</th>
							<th>Wert</th>
						</tr>
					</thead>
					<c:forEach items="${warenkorbB.warenkorbList}" var="wk_List">

						<tr class="seperation">
							<c:choose>
								<c:when test="${wk_List.wk_art_anzahl == 0}">

								</c:when>
								<c:otherwise>

									<td><img
										src="../BildLaden?artikel_id=${wk_List.wk_artikel.artikel_id}"
										class="bild" width="200" height="200" alt="artikelBildWK"></td>
									<td>${wk_List.wk_artikel.artikelbezeichnung}</td>
									<td>${wk_List.wk_artikel.preis}€</td>
									<td><form method="get" action="../WarenkorbArtikelAnzahl">
											<input type="hidden" name="art_id"
												value="${wk_List.wk_artikel.artikel_id}">
											<!--<input type="hidden" name="groesse" value="${wk_List.wk_size}">-->
											<input type="number" min="0" max="15" name="menge"
												value="${wk_List.wk_art_anzahl}">
											<button type="submit">Artikelmenge aktualisieren</button>
										</form></td>
									<td>${wk_List.wk_art_preis}€</td>
								</c:otherwise>
							</c:choose>
						</tr>

					</c:forEach>

				</table>
			</div>
			<div id="ges_preis">
				<c:choose>

					<c:when test="${empty sessionScope.login}">
						<h2>Um die Artikel letztendlich zu bestellen ist ein Login
							erforderlich!</h2>
					</c:when>
					<c:when
						test="${not empty sessionScope.login && not empty sessionScope.warenkorbB}">
						<div id="lieferanten">
							<fieldset>
								<legend>Mit welchem Anbieter soll ihr Paket versendet
									werden:</legend>
								<p>
									Hermes <input type="radio" name="lieferant" id="hermes"
										value="Hermes" required> DHL <input type="radio"
										name="lieferant" id="dhl" value="DHL" required>
								</p>
							</fieldset>
						</div>
						<form id="myForm" method="get" action="../BestellenServlet">
							<button id="bestellenButton" type="submit">Verbindlich
								bestellen!</button>
						</form>
					</c:when>
				</c:choose>
				<%-- 				<p>Gesamtbetrag: ${warenkorbB.ges_preis}€</p> --%>
			</div>
		</c:when>
		<%-- 		<c:when test="${warenkorbB == NULL}"> --%>
		<c:when test="${empty sessionScope.warenkorbB }">
			<p>Es befinden sich keine Artikel im Warenkorb.</p>

		</c:when>
	</c:choose>



	<div class="markenbereich"></div>

	<div class="markenbereich"></div>
</section>
<aside>

	<div class="cart-actions">

		<div class="bestelluebersicht">
			<h2>Bestellübersicht:</h2>


			<table style="width: 100%">

				<tr>
					<td>Produkte</td>
					<td>${warenkorbB.wk_groesse}</td>
				</tr>

				<tr>
					<td>Zwischenbetrag</td>
					<td>${warenkorbB.ges_preis}€</td>
				</tr>

				<c:choose>
					<c:when test="${warenkorbB.ges_preis < 60}">
						<tr>
							<td>Lieferung</td>
							<td>3.99€</td>
						</tr>
						<tr>
							<td>Gesamtbetrag</td>
							<td>${warenkorbB.preis}€</td>
						</tr>
					</c:when>

					<c:when test="${warenkorbB.ges_preis >= 60}">
						<tr>
							<td>Lieferung</td>
							<td>0.00€</td>
						</tr>
						<tr>
							<td>Gesamtbetrag</td>
							<td>${warenkorbB.ges_preis}€</td>
						</tr>
					</c:when>
				</c:choose>

			</table>

		</div>
		<!-- 		<div> -->
		<!-- 			<form> -->
		<!-- 				<button type="submit" action="../BestellenServlet" method="get " -->
		<!-- 					value="Zur Kasse">Zur Kasse</button> -->
		<!-- 			</form> -->
		<!-- 		</div> -->
	</div>

</aside>


<%@ include file="../jspf/footer.jspf"%>

</body>
</html>
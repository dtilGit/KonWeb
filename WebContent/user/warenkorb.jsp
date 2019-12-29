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


<title>Warenkorb</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">

</head>


<section>

	<h1>Ihr Warenkorb</h1>
	<c:choose>
		<c:when test="${empty warenkobB.wk_groesse}">
			<p>Es befinden sich noch keine Artikel im Warenkorb.</p>
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
									src="../BildLaden?artikel_id=${warenkorbList.wk_artikel.artikel_id}"
									width="200" height="200" alt="artikelBildWK"></th>
								<th>${warenkorbList.wk_artikel.artikel_bezeichnung}</th>
								<th>${warenkorbList.wk_artikel.preis}€</th>
								<td><form method="post" action="../WarenkorbGroesse">
										<input type="hidden" name="artikel_id" value="${warenkorbList.wk_artikel.artikel_id}">
										<input type="hidden" name="groesse" value="${warenkorbList.wk_size}">
										<input type="number" min="0" max="15" name="menge"
											value="${warenkorbList.wk_art_anzahl}">
										<button type="submit">Menge ändern</button>
									</form></td>
								<td>${warenkorbList.wk_size}</td>
								<td>${warenkorbList.wk_art_preis}</td>
							</tr>
						</c:forEach>
					</tr>
				</table>
			</div>
			<div id="ges_preis">
				<c:choose>

					<c:when test="${empty sessionScope.kunde}">
						<p> Login erforderlich!</p>
					</c:when>
					<c:when test="${not empty sessionScope.kunde }">
						<h2>Zur Kasse</h2>
						<form id="myForm" method="post" action="../BestellenServlet">
								<button id="bestellenButton" type="submit">Bestellen</button>
							</form>
						</c:when>
				</c:choose>
				<p> Gesamtbetrag: ${warenkorbB.ges_preis}</p></div>
		</c:when>
		<c:when test="${warenkobB == NULL}">
			<p>Es befinden sich noch keine Artikel im Warenkorb.</p>
		</c:when>
	</c:choose>



	<div class="markenbereich"></div>

	<div class="markenbereich"></div>
</section>



<footer>
	<div id="servicehotline">
		<p>
			Du hast ein Problem?<br> Unsere Service Hotline 24/7 kostenlos
			für dich erreichbar:
		</p>
		<p>09131/123987654</p>
	</div>

	<div id="impressumlink">
		<p>anderweitig Kontakt findest du im:
		<p>
			<a href="impressum.html">Impressum</a>
	</div>

</footer>

</body>
</html>
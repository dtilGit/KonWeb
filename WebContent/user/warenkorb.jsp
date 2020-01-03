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

<body>
	<%@ include file="../jspf/header.jspf"%>
	<section>
		<h1>
			Folgende Artikel hast du in deinem Warenkorb: <span> n Artikel
			</span>
		</h1>
		<div class="markenbereich">
			Bild / Artikelbeschreibung / Marke / Preis / Menge
			<!-- Mengenangabe neben dem Schuh mit Drop Down Liste -->
		</div>

		<div class="markenbereich"></div>

		<div class="markenbereich"></div>
	</section>

	<aside>

		<div class="cart-actions">
			<div class="to-payment">
				<form class="payment-checkouts">
					<button class="to-cash" type="submit" value="Zur Kasse">
						Zur Kasse</button>
				</form>
			</div>
			<div class="bestelluebersicht">
				<h1>Bestellübersicht:</h1>


				<table style="width: 100%">

					<tr>
						<td>Produkte (Anzahl)</td>
					</tr>

					<tr>
						<td>Gesamtpreis</td>
						<td>49,95€</td>
					</tr>

					<tr>
						<td>Lieferung</td>
						<td>3,99€</td>
					</tr>

				</table>

			</div>
		</div>

	</aside>

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
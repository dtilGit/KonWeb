<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<base href="${pageContext.request.requestURI}" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Warenkorb</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">

</head>

<!-- <header> -->
<!-- <!--header in jeder Seite gleich: Herren / Damen / Hot Sales /Suchfkt--> -->
<!-- <div id="mainLogo"> -->
<!-- 	<a href="homepage.html"><img id="logo" src="../img/tods_bestcaps_logo.jpg" alt= "Logo"></a> -->
<!-- </div> -->


<!-- <div id="navi"> -->
<!-- 	<ul> -->
<!-- 		<li>Männer -->
<!-- 			<ul> -->
<!-- 				<li><a href="man_beanies.html">Beanies</a></li> -->
<!-- 				<li><a href="man_caps.html">Caps</a></li> -->
<!-- 			</ul> -->
<!-- 		</li> -->
<!-- 		<li>Frauen -->
<!-- 			<ul> -->
<!-- 				<li><a href="woman_beanies.html">Beanies</a></li> -->
<!-- 				<li><a href="woman_caps.html">Caps</a></li> -->
<!-- 			</ul> -->
<!-- 		</li> -->
<!-- 		<li>Hot Sales</li> -->
<!-- 	</ul> -->
<!-- </div> -->


<!-- <div id="suche"> -->
<!-- <br> -->
<!-- <label for="suchleiste"></label> -->
<!-- <input type="search" id="suchleiste" placeholder="Suche"> -->
<!-- </div> -->


	
<!-- <div> -->
<!-- <a href="login.html"><img id="meinkonto" src="../img/mein_konto.png" alt= "meinKontoLogo"></a> -->
<!-- </div> -->

<!-- <div> -->
<!-- <a href="warenkorb.html"><img id="warenkorb" src="../img/warenkorb.png" alt= "warenkorbLogo"></a> -->
<!-- </div> -->


<!-- </header> -->

<section>
<h1>Folgende Artikel hast du in deinem Warenkorb: <span> n Artikel </span></h1>
<div class="markenbereich">
Bild / Artikelbeschreibung / Marke / Preis / Menge
<!-- Mengenangabe neben dem Schuh mit Drop Down Liste -->
</div>

<div class="markenbereich">

</div>

<div class="markenbereich">

</div>
</section>

<aside>
	
	<div class="cart-actions">
		<div class="to-payment">
			<form class="payment-checkouts">
					<button class="to-cash" type="submit" value="Zur Kasse">
						Zur Kasse
					</button>
			</form>
		</div>
		<div class="bestelluebersicht">
			<h1>Bestellübersicht:</h1>
	
	
			<table style="width:100%">
			 			
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
<div id= "servicehotline">
<p>Du hast ein Problem?<br> Unsere Service Hotline 24/7 kostenlos für dich erreichbar:</p>
<p>09131/123987654</p>
</div>

<div id="impressumlink">
<p>anderweitig Kontakt findest du im:<p>
<a href="impressum.html">Impressum</a>
</div>

</footer>

</body>
</html>
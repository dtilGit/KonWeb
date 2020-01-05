<%--David Häusler --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%--lib für Session Unterscheidung --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!-- <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> muss glaube ich ins Stylesheet hab noch nicht ganz rausgefunden wie es die Schrift ändert  -->

<!-- <script type="text/javascript" src="js/script.js"></script> -->
<script type="text/javascript" src="js/cookies.js"></script>
<title>TOD's Best Caps in Town</title>
</head>
<body>
	<!-- 	David Häusler -->
	<header>
		<!--header in jeder Seite gleich: Herren / Damen / Hot Sales /Suchfkt-->
		<div id="mainlogo">
			<a href="index.jsp"><img id="logo"
				src="img/tods_bestcaps_logo.jpg" alt="Logo"></a>
		</div>



		<div class="men">
			<form action="KatLadenMen" method="get" enctype="multipart/form-data">
				<button class="nav dropbtn" type="submit">Männer</button>
			</form>

			<!-- 			<button class="dropdown-content">Beanies</button> -->
			<!-- 							<button class="dropdown-content">Caps</button> -->
		</div>




		<div class="woman">
			<form action="KatLadenWomen" method="get"
				enctype="multipart/form-data">
				<button class="nav dropbtn" type="submit">Frauen</button>
			</form>

			<!-- 	<div class="dropdown-content"> -->
			<!-- 		<a href="user/woman_beanies.html">Beanies</a> <a -->
			<!-- 			href="user/woman_caps.html">Caps</a> -->
		</div>

		<div id="suche">
			<br> <label for="suchleiste"></label>
			<form action="SucheServlet" method="get">
				<input type="search" name="artikelbezeichnung" id="suchleiste"
					placeholder="Suche deinen Liebling...">
			</form>
		</div>


		<div class="warenkorb">
			<a href="user/warenkorb.jsp"><img class="icon"
				src="img/warenkorb.png" alt="warenkorbLogo"></a>
		</div>

		<c:choose>
			<c:when test="${empty sessionScope.login}">
				<div class="dropdown-navi">
					<!-- 					<form style="display: inline" action="login.jsp" method="get"> -->
					<!-- 				enctype="multipart/form-data"> -->
					<button class="profil">
						<img class="icon" src="img/mein_konto.png" alt="meinKontoLogo">
					</button>
					<!-- 					</form> -->
					<div class="dropdown-content">
						<a href=user/login.jsp>Login</a> <a href=user/registrierung.jsp>Registrierung</a>
					</div>
				</div>
			</c:when>
			<c:when test="${not empty sessionScope.login}">
				<div class="dropdown-navi">


					<button class="profil">
						<img class="icon" src="img/mein_konto.png" alt="meinKontoLogo">
					</button>

					<div class="dropdown-content">
						<a href=user/profilansehen.jsp>Ihr Profil</a> <a
							href=LogoutServlet>Logout</a>
					</div>
				</div>
			</c:when>
		</c:choose>

	</header>


	<div id="slider">
		<figure>

			<img alt="slidercap1" src="img/capbanner.jpg">
			<img alt="slidercap2" src="img/capbanner-2.jpg">
			<img alt="slidercap3" src="img/capbanner-3.jpg">
			<img alt="slidercap4" src="img/capbanner-4.jpg">

		</figure>
	</div>

	<section>

		<div class="spalten">

			<h1>Das sind wir!</h1>
			<div class="spalte-1">Seit 20 Jahren gehen wir, die
				Geschäftsführer von TODsBestCaps, unserer Leidenschaft nach und
				vertreiben weltweit unsere Kopfbedeckungen!</div>

			<div class="spalte-2">Qualität und Service stehen bei uns an
				oberster Stelle! Aus diesem Grund sind wir auch seit 5 Jahren
				Marktführer im Cap Segment. Doch wir sind noch lange nicht satt!
				Jeden Tag suchen wir nach den neuesten Mützen Trends und geben sie
				hier für EUCH zum Besten.</div>

			<div class="spalte-3">
				Noch nicht überzeugt? Dann überzeug dich selbst und durchstöber
				unseren Onlineshop, wir haben für Jedermann (und Frau :)) etwas im
				Angebot!
				<p>
					Schau doch mal auf die <a href="KatLadenMen">Artikel für Männer</a>!
				</p>
				<p>
					Oder natürlich die <a href="KatLadenWomen">für Frauen</a> :)
				</p>
			</div>
		</div>

	</section>



	<aside>
		<h1>Achtung</h1>

		<h3>Versandoptionen:</h3>
		<div>Wir liefern unsere Pakete mit Hermes und DHL.</div>

		<h3>Lieferbedingungen:</h3>
		<div>Sie können ab einem Einkaufswert von 60€ Versankostenfrei
			bestellen.</div>

	</aside>





	<div class="footer">
		<footer>
			<div class="footer-left">
				<h1>TOD's BestCaps</h1>
				<p>Unser Service 24/7:</p>

				<a href="tel:09131123987654"> <img class="small-icon" alt="telefon"
					src="img/telefon.png"> 09131/123987654
				</a> <br /> <a
					href="mailto:info@todsbestcaps.de?subject=eine%20Mail%20an%20Team%20TOD's%20BestCap">
					<img class="small-icon"  alt="mail" src="img/mail.png">
					info@todsbestcaps.de
				</a>
			</div>


			<div class="footer-right">
				<div id="impressumlink">
					<a href="user/impressum.jsp">Impressum</a>
				</div>

			</div>

		</footer>
	</div>
</body>
</html>
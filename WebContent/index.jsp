<%--David Häusler --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page errorPage="../fehlerausgabe.jsp"%> --%>

<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!-- <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> muss glaube ich ins Stylesheet hab noch nicht ganz rausgefunden wie es die Schrift ändert  -->

<title>TOD's Best Caps in Town</title>
</head>
<body>
	<!-- David Häusler -->
	<header>
		<!--header in jeder Seite gleich: Herren / Damen / Hot Sales /Suchfkt-->
		<div id="mainlogo">
			<a href="homepage.html"><img id="logo"
				src="img/tods_bestcaps_logo.jpg" alt="Logo"></a>
		</div>


		<div class="dropdown-navi men">
			<form action="KategorienLadenMen" method="get"
				enctype="multipart/form-data">
				<button type="submit" class="dropbtn">Männer</button>
			</form>
			<!-- <button class="dropdown-content">Beanies</button> -->
			<!-- 				<button>Caps</button> -->
		</div>



		<div class="dropdown-navi woman">
			<button class="dropbtn">Frauen</button>
			<!-- 	<div class="dropdown-content"> -->
			<!-- 		<a href="user/woman_beanies.html">Beanies</a> <a -->
			<!-- 			href="user/woman_caps.html">Caps</a> -->
		</div>




		<!-- 			<ul> -->
		<!-- 				<li>Männer -->
		<!-- 					<ul> -->
		<!-- 						<li><a href="user/man_beanies.html">Beanies</a></li> -->
		<!-- 						<li><a href="user/man_caps.html">Caps</a></li> -->
		<!-- 					</ul> -->
		<!-- 				</li> -->
		<!-- 				<li>Frauen -->
		<!-- 					<ul> -->
		<!-- 						<li><a href="user/woman_beanies.html">Beanies</a></li> -->
		<!-- 						<li><a href="user/woman_caps.html">Caps</a></li> -->
		<!-- 					</ul> -->
		<!-- 				</li> -->
		<!-- 				<li>Hot Sales</li> -->
		<!-- 			</ul> -->




		<div id="suche">
			<br> <label for="suchleiste"></label>
			<form action="SucheServlet" method="get">
				<input type="search" name="artikelbezeichnung" id="suchleiste"
					placeholder="Suche nach Lieblingsartikel...">
			</form>
		</div>



		<div>
			<a href="login.html"><img id="meinkonto" src="img/mein_konto.png"
				alt="meinKontoLogo"></a>
		</div>

		<div>
			<a href="warenkorb.html"><img id="warenkorb"
				src="img/warenkorb.png" alt="warenkorbLogo"></a>
		</div>


	</header>



	<div id="flexarea">
		<section>
			<div class="intro">
				<p>Seit 20 Jahren gehen wir, die Geschäftsführer von
					TODsBestCaps, unserer Leidenschaft nach und vertreiben weltweit
					unsere Kopfbedeckungen</p>
				<p>Qualität und Service stehen bei uns an oberster Stelle! Aus
					diesem Grund sind wir auch seit 5 Jahren Marktführer im Cap Segment</p>
				<p>Doch wir sind noch lange nicht satt! Jeden Tag suchen wir
					nach den neuesten Mützen Trends und geben sie hier für EUCH zum
					Besten.</p>
				Noch nicht überzeugt? Dann überzeug dich selbst und durchstöber
				unsere Webpage, wir haben für Jedermann (und Frau :)) etwas im
				Angebot<br>
			</div>

			<div id="modelbilderrechts">
				<figure>
					<a href="man_caps.html"><img src="img/cap_modelman.jpg"
						alt="CapMann" width="100px"></a>
					<figcaption>
						<a href="man_caps.html">Männer Caps</a>
					</figcaption>
				</figure>
				<figure>
					<a href="woman_caps.html"><img src="img/cap_modelwoman.jpg"
						alt="CapFrau" width="100px"></a>
					<figcaption>
						<a href="woman_caps.html">Frauen Caps</a>
					</figcaption>
				</figure>
			</div>

			<div id="modelbilderlinks">
				<figure>
					<a href="man_beanies.html"><img src="img/beanie_modelman.jpg"
						alt="BeanieMan" width="100px"></a>
					<figcaption>
						<a href="man_beanies.html">Männer Beanies</a>
					</figcaption>
				</figure>
				<figure>
					<a href="woman_beanies.html"><img
						src="img/beanie_modelwoman.jpg" alt="BeanieFrau" width="100px"></a>
					<figcaption>
						<a href="woman_beanies.html">Frauen Beanies</a>
					</figcaption>
				</figure>
			</div>
		</section>

		<aside>
			Brandheiße Angebote findest unter
			<figure>
				<a href="hotsales.html"><img src="img/fire.jpg" alt="Fire"
					width="200px"></a>
				<figcaption>
					<a href="user/hotsales.html">HotSales</a>
				</figcaption>
			</figure>
		</aside>
	</div>
	<div class="footer">
		<footer>
			<div id="servicehotline">

				<h1>TOD's BestCap</h1>
				<p>
					Du hast ein Problem?<br>Unsere Service Hotline 24/7 kostenlos
					für dich erreichbar:
				</p>
				<a href="tel:09131123987654">09131/123987654</a>
			</div>

			<div id="impressumlink">
				<a href="user/impressum.jsp">Impressum</a>
			</div>
			</br>

		</footer>
	</div>
</body>
</html>
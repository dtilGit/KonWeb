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

<!-- <script type="text/javascript" src="js/script.js"></script> -->

<title>TOD's Best Caps in Town</title>
</head>
<body>
	<!-- David Häusler -->
	<header>
		<!--header in jeder Seite gleich: Herren / Damen / Hot Sales /Suchfkt-->
		<div id="mainlogo">
			<a href="index.jsp"><img id="logo"
				src="img/tods_bestcaps_logo.jpg" alt="Logo"></a>
		</div>


		<div class="dropdown-navi men">
			<form action="KatLadenMen" method="get"
				enctype="multipart/form-data">
				<button id="nav" type="submit" class="dropbtn">Männer</button>
			</form>

			<!-- <button class="dropdown-content">Beanies</button> -->
			<!-- 				<button>Caps</button> -->
		</div>



		<div class="dropdown-navi woman">
			<form action="KatLadenWomen" method="get"
				enctype="multipart/form-data">
				<button id="nav" type="submit" class="dropbtn">Frauen</button>
			</form>

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
					placeholder="Suche deinen Liebling...">
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


    <div id="slider">
        <figure>

            <img src="img/capbanner.jpg">
            <img src="img/capbanner-2.jpg">
            <img src="img/capbanner-3.jpg">
            <img src="img/capbanner-4.jpg">

        </figure>
    </div>

	
	

	
<section>
	
	<div class="spalten">
	
	<h1>Das sind wir!</h1>
		<div class="spalte-1">
			Seit 20 Jahren gehen wir, die Geschäftsführer von TODsBestCaps, unserer Leidenschaft nach und vertreiben weltweit unsere Kopfbedeckungen
		</div>		
					
		<div class="spalte-2">
			Qualität und Service stehen bei uns an oberster Stelle! Aus diesem Grund sind wir auch seit 5 Jahren Marktführer im Cap Segment
			Doch wir sind noch lange nicht satt! Jeden Tag suchen wir nach den neuesten Mützen Trends und geben sie hier für EUCH zum Besten.
		</div>

		<div class="spalte-3">
			Noch nicht überzeugt? Dann überzeug dich selbst und durchstöber unsere Webpage, wir haben für Jedermann (und Frau :)) etwas im Angebot
		</div>
	</div>
	
</section>



		<aside>
			<h1>Achtung</h1>
			
			<h3>Versandoptionen:</h3>
			<div>Wir liefern unsere Pakete mit hermes und DHL.</div>
						
			<h3>Lieferbedingungen:</h3>
			<div>Sie können ab einem Einkaufswert von 60€ Versankostenfrei bestellen.</div>
			
		</aside>
	
	
	
	
	
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
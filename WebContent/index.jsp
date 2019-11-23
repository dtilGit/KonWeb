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
<link rel="stylesheet" type="text/css" href="/tods/css/style.css" />
<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- muss glaube ich ins Stylesheet hab noch nicht ganz rausgefunden wie es die Schrift ändert  -->

<title>TOD's Best Caps in Town</title>
</head>
<body>
	<%@ include file="/jspf/header.jspf"%>

	<div id="flexarea">
		<section>
		<div class="intro">
			<p>Seit 20 Jahren gehen wir, die Geschäftsführer von
				TODsBestCaps, unserer Leidenschaft nach und vertreiben weltweit
				unsere Kopfbedeckungen</p>
			<p>Qualität und Service stehen bei uns an oberster Stelle! Aus
				diesem Grund sind wir auch seit 5 Jahren Marktführer im Cap Segment</p>
			<p>Doch wir sind noch lange nicht satt! Jeden Tag suchen wir nach
				den neuesten Mützen Trends und geben sie hier für EUCH zum Besten.</p>
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
	<%@ include file="/jspf/footer.jspf"%>
</body>
</html>
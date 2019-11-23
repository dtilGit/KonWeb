<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<!-- Basis für reltive Verweise festlegen,  -->
<base href="${pageContext.request.requestURI}"/>
<title>Registrierung</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<%--<header>
<!--header in jeder Seite gleich: Herren / Damen / Hot Sales /Suchfkt-->
<div id="mainLogo">
	<a href="homepage.html"><img id="logo" src="../img/tods_bestcaps_logo.jpg" alt= "Logo"></a>
</div>


<div id="navi">
	<ul>
		<li>MÃ¤nner
			<ul>
				<li><a href="man_beanies.html">Beanies</a></li>
				<li><a href="man_caps.html">Caps</a></li>
			</ul>
		</li>
		<li>Frauen
			<ul>
				<li><a href="woman_beanies.html">Beanies</a></li>
				<li><a href="woman_caps.html">Caps</a></li>
			</ul>
		</li>
		<li>Hot Sales</li>
	</ul>
</div>


<div id="suche">
<br>
<label for="suchleiste"></label>
<input type="search" id="suchleiste" placeholder="Suche">
</div>

	
<div id="navi_login">
	<ul>
		<li> <img id="meinkonto" src="../img/mein_konto.png" alt= "meinKontoLogo">
			<ul>
				<li> <a href="login.html"> Login </a></li>
				<li> <a href="registrierung.html"> Registrierung </a> </li>
			</ul>
		</li>
	</ul>
</div>

<div>
<a href="warenkorb.html"><img id="warenkorb" src="../img/warenkorb.png" alt= "warenkorbLogo"></a>
</div>

</header>--%>

<head>
<meta charset="UTF-8">
<title> Registrierung erfolgt</title>
</head>

<body>
	<h1> Registrierung ist erfolgt!</h1>
	<h2> Hallo ! Du hast dich erfolgreich bei Tods registriert. Viel Spaß beim Shoppen!</h2>
	
	<p> Hier geht's zur Anmeldung >> <a href="/user/login.jsp"> LOGIN </a> 
	
	<footer>
<div id= "servicehotline">
<p>Du hast ein Problem?<br> Unsere Service Hotline 24/7 kostenlos fÃ¼r dich erreichbar:</p>
<p>09131/123987654</p>
</div>

<div id="impressumlink">
<p>anderweitig Kontakt findest du im:<p>
<a href="impressum.html">Impressum</a>
</div>

</footer>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="fehlerausgabe.jsp"%>

<!DOCTYPE html>
<html lang="de">

<head>
<meta charset="UTF-8">
<title>Login</title> //
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
	<%--<header>

<div id="mainLogo">
	<a href="homepage.html"><img id="logo" src="../img/tods_bestcaps_logo.jpg" alt= "Logo"></a>
</div>

<div id="navi">
	<ul>
		<li>Männer
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

	<h1>Login</h1>
	<section>


		<form action="/tods/Loginservlet" method="post" id="login">
			<div id="registr">

				<label for="email"> E-Mail </label> <input type="email" name="email"
					id="email" size="25" maxlength="30" placeholder="Deine E-Mail"
					required> <label for="passwort"> Passwort </label> <input
					type="password" name="passwort" id="passwort" size="25"
					maxlength="40" placeholder="Dein Passwort" required>
			</div>
			<div id="anmelden">
				<button type="submit" id="anmelden">Anmelden</button>
			</div>
		</form>
		<p>
			Noch nicht registriert? Zur Registrierung <a href="registrierung.jsp">
				hier</a>
		</p>

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
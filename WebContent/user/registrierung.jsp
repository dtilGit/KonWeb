<%-- Veronika Tschemodanov --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/../jspf/header.jspf"%>

<title>Registrierung</title>
</head>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<%-- <header>
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

		<section>
		<form action="../RegistrServlet" id="registrierung" method="post">
		<h1>Registrierung</h1>
		
		<div id="registr">
				<p> <label for="geschlecht"></label>
					<label for="geschlecht">Herr</label>
						 <input type="radio" name="geschlecht" id="Herr" value="Herr" required> 
					<label for="anrede">Frau</label>
						 <input type="radio" name="geschlecht" id="Frau" value="Frau" required> 
				</p>
				
					<p><label for="titel">Titel:</label> 
						<select name="titel" id="titel">
									<option value="">Kein Titel</option>
									<option value="Dr.">Dr.</option>
									<option value="Prof.">Prof.</option>
									<option value="ProfDr.">Prof. Dr.</option> 
						</select></p>
				
						
					<label for="nachname">Nachname</label>  
					<input type="text" id="nachname" name="nachname" size="25" maxlength="40" placeholder="Mustermann" required>
				
					<label for="vorname">Vorname</label>  
					<input type="text" id="vorname" name="vorname" size="25" maxlength="40" placeholder="Max" required>
				
					<label for="email">E-Mail</label>  
					<input type="email" id="email" name="email" size="25" maxlength="40" placeholder="max.mustermann@web.de" required>
				
				<label for="passwort">Passwort</label> <input type="password"
						name="passwort" id="passwort" size="25" maxlength="40"
						title="10 Zeichen, GroÃ- und Kleinbuchstaben, Zahlen"
						pattern="(?=.*\) (?=.*[a-z]) (?=.*[A-Z]).(10,)" required>
				
					<label for="strasse">Strasse</label>  
					<input type="text" id="strasse" name="strasse" size="30" maxlength="40" >
					<label for="hausnummer"> Hausnummer</label>
					<input type=text id="hausnummer" name="hausnummer" size="5" maxlength="10">
					
					<label for="postleitzahl">Postleitzahl</label>  
					<input type="text" id="postleitzahl" size="5" minlength="5" maxlength="5" name="postleitzahl" >
	
					<label for="ort">Ort</label>
					<input type="text" id="ort" name="ort" size="30" maxlength="40" >
		
					<label for="land">Land</label>
					<input type="text" id="land" name="land" size="30" maxlength="40" >
		
				</div>
				
				<div id="registr_button">
				<!--  wozu braucht man die ID?  -->
				<p> <button type="submit" name="registr_button" id="registr_button"> Registrierung abschliessen</button> </p>
				<!-- <p>	<button type="reset" id="registr_button_reset"> Zurücksetzen</button> </p>-->
				</div>
			</form>
				
	</section>
	
 <%@ include file="/../jspf/footer.jspf" %>
</body>
</html>
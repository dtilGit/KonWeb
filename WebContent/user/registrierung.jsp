<%-- Veronika Tschemodanov --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="de">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" href="../css/style.css" type="text/css">
<script type="text/javascript" src="../js/checkregform.js"></script>
<title>Registrierung</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>

		<h1>Registrierung</h1>

		<div id="registr">
			<form action="../RegistrServlet" id="regform" method="post"
				enctype="multipart/form-data">
				<fieldset>
					<p>
						Herr <input type="radio" name="geschlecht" id="malereg"
							value="Herr" required> Frau <input type="radio"
							name="geschlecht" id="femalereg" value="Frau" required>
					</p>

					<p>
						<label for="titelreg">Titel:</label> <select name="titel"
							id="titelreg">
							<option value="">Kein Titel</option>
							<option value="Dr.">Dr.</option>
							<option value="Prof.">Prof.</option>
							<option value="Prof. Dr.">Prof. Dr.</option>
						</select>
					</p>

					<p>
						<label for="nachnamereg">Nachname: </label> <input type="text"
							id="nachnamereg" name="nachname" size="25" maxlength="40"
							placeholder="Mustermann" required> <label id="pruefnn"></label>
					</p>
					<p>
						<label for="vornamereg">Vorname: </label> <input type="text"
							id="vornamereg" name="vorname" size="25" maxlength="40"
							placeholder="Max" required>
					</p>
					<p>
						<label for="emailreg">E-Mail: </label> <input type="text"
							<%--eigentlich mail--%>
							id="emailreg" name="email"
							size="25" maxlength="40" placeholder="max.mustermann@web.de"
							required>
					</p>
					<p>
						<label for="pwreg">Passwort*: </label> 
						<input type="password"
							name="passwort" id="pwreg" size="25" maxlength="40"
							placeholder="Das Passwort muss min. einen Groß- und Kleinbuchstaben enthalten sowie eine Zahl! Zudem soll es aus min. 6 und max. 10 Zeichen bestehen. Zeichen wie: _!$%^&@#* sind erlaubt."
							pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*[\d])[\w!$%^&@#*]{6,10}"
							required>

					</p>
					<p>
						<label for="pwreg2">Passwort wiederholen*:</label>
					<input type="password" name="passwort2" id="pwreg2" size="25"
						maxlength="40"
						placeholder="Das Passwort muss min. einen Groß- und Kleinbuchstaben enthalten sowie eine Zahl! Zudem soll es aus min. 6 und max. 10 Zeichen bestehen. Zeichen wie: _!$%^&@#* sind erlaubt."
						pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*[\d])[\w!$%^&@#*]{6,10}"
						required>
					</p>
					<p>

						<label for="strassereg">Strasse:</label> <input type="text"
							id="strassereg" name="strasse" size="30" maxlength="40"
							placeholder="Angabe ihres Straßennamens ohne Nummer" required>
					</p>
					<p>
						<label for="hausnrreg"> Hausnummer:</label> <input type="text"
							id="hausnrreg" name="hausnummer" size="5" maxlength="10"
							placeholder="lediglich ihre Hausnummer " required>

					</p>
					<p>
						<!--Bei Nummer min- und maxlenght, sowie size nicht erlaubt; haben diese irgendwelche Auswirkungen auf die Funktionalität von JS?? -->
						<label for="plzreg">Postleitzahl:</label> <input type="text"
							id="plzreg" size="5" maxlength="5" name="postleitzahl"
							placeholder="5-stellige PLZ" required>
					</p>
					<p>

						<label for="ortreg">Ort:</label> <input type="text" id="ortreg"
							name="ort" size="30" maxlength="40" placeholder="Ihr Wohnort"
							required>
					</p>
					<p>
						<label for="landreg">Land:</label> <input type="text" id="landreg"
							name="land" size="30" maxlength="40"
							placeholder="Land ihres Wohnsitzes" required>

					</p>
					<p>
						<label for="profilBild"> Profilbild hochladen:</label> <input
							type="file" name="profilBild" id="profilBild" accept="image/*"
							required> <label for="profilBild"></label>
					</p>
					<div id="pwvorgabe"> * Das Passwort muss min. einen Groß- und Kleinbuchstaben enthalten sowie eine Zahl! Zudem soll es aus min. 6 und max. 10 Zeichen bestehen. Zeichen wie: _!$%^&@#* sind erlaubt.</div>
				</fieldset>
				<div>
					<p>
						<button type="submit" name="registr_button" id="registr_button">
							<!-- 						onclick="pruefereg()" -->
							Registrierung abschliessen
						</button>
					</p>
					<!-- <p>	<button type="reset" id="registr_button_reset"> Zurücksetzen</button> </p>-->

				</div>
			</form>
		</div>

	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
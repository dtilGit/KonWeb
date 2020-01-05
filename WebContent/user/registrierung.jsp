<%-- Veronika Tschemodanov --%>
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

<title>Registrierung</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>
	<section>
		<form action="../RegistrServlet" id="registrierung" method="post" enctype="multipart/form-data">
			<h1>Registrierung</h1>

			<div id="registr">
				<fieldset>

					<p>
						<label for="malereg">Herr</label> <input type="radio"
							name="geschlecht" id="malereg" value="Herr" required> <label
							for="femalereg">Frau</label> <input type="radio" name="geschlecht"
							id="femalereg" value="Frau" required>
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
							placeholder="Mustermann" required>
					</p>
					<p>
						<label for="vornamereg">Vorname: </label> <input type="text"
							id="vornamereg" name="vorname" size="25" maxlength="40"
							placeholder="Max" required>
					</p>
					<p>
						<label for="emailreg">E-Mail: </label> <input type="email"
							id="emailreg" name="email" size="25" maxlength="40"
							placeholder="max.mustermann@web.de" required>
					</p>
					<p>
						<label for="pwreg">Passwort: </label> <input type="password"
							name="passwort" id="pwreg" size="25" maxlength="40"
							placeholder="10 Zeichen, Groß- und Kleinbuchstaben, Zahlen"
							pattern="(?=.*\) (?=.*[a-z]) (?=.*[A-Z]).(10,)" required>
					</p>
					<p>
						<label for="strassereg">Strasse:</label> <input type="text"
							id="strassereg" name="strasse" size="30" maxlength="40">
					</p>
					<p>
						<label for="hausnrreg"> Hausnummer:</label> <input type=text
							id="hausnrreg" name="hausnummer" size="5" maxlength="10">
					</p>
					<p>
						<label for="plzreg">Postleitzahl:</label> <input type="text"
							id="plzreg" size="5" minlength="5" maxlength="5"
							name="postleitzahl">
					</p>
					<p>
						<label for="ortreg">Ort:</label> <input type="text" id="ortreg"
							name="ort" size="30" maxlength="40">
					</p>
					<p>
						<label for="landreg">Land:</label> <input type="text" id="landreg"
							name="land" size="30" maxlength="40">
					</p>
					<p>
						<label for="profilBild"> Profilbild hochladen</label>
						<input type="file" name="profilBild" id="profilBild" accept="image/*">
						<label for="profilBild"></label>
					</p>
				</fieldset>
			</div>


			<div>
				<!--  wozu braucht man die ID?  -->
				<p>
					<button type="submit" name="registr_button" id="registr_button">
						Registrierung abschliessen</button>
				</p>
				<!-- <p>	<button type="reset" id="registr_button_reset"> Zurücksetzen</button> </p>-->
			</div>
		</form>

	</section>

	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
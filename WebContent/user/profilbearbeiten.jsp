<%-- David Häusler --%>
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
<script type="text/javascript" src="../js/profilbild.js"></script>
<script type="text/javascript" src="../js/profiledit.js"></script>

<title>Profildaten bearbeiten</title>
</head>

<body>
	<%@ include file="../jspf/header.jspf"%>
	<h1>Profildaten bearbeiten</h1>

	<p>
	<h2>Deine aktuellen Daten</h2>
	</p>
	<p>
		<img src="../ProfilbildLaden?kunde_id=${login.id}" class="bild"
			alt="bild_laden" width="200" height="250">
	</p>
	<p>Geschlecht: ${login.geschlecht}</p>
	<p>Titel: ${login.titel}</p>
	<p>Nachname: ${login.nachname}</p>
	<p>Vorname: ${login.vorname}</p>
	<%--<p>E-Mail: ${login.email}</p> --%>
	<p>Strasse: ${login.strasse}</p>
	<p>Hausnummer: ${login.hausnummer}</p>
	<p>Postleitzahl: ${login.postleitzahl}</p>
	<p>Ort: ${login.ort}</p>
	<p>Land: ${login.land}</p>

	<h2>Hier kannst du deine Änderungen eingeben:</h2>
	<form action="../ProfilBearbeiten" id="profilbearbeiten" method="post"
		enctype="multipart/form-data">
		<div>
			<fieldset>
				<p>
					Herr <input type="radio" name="geschlecht" id="Herr" value="Herr"
						required> Frau <input type="radio" name="geschlecht"
						id="Frau" value="Frau" required>
				</p>

				<p>
					<label for="titel">Titel:</label> <select name="titel" id="titel">
						<option value="">Kein Titel</option>
						<option value="Dr.">Dr.</option>
						<option value="Prof.">Prof.</option>
						<option value="Prof. Dr.">Prof. Dr.</option>
					</select>
				</p>

				<p>
					<label for="nachname">Nachname</label> <input type="text"
						id="nachname" name="nachname" size="25" maxlength="40"
						value="${login.nachname}" required> <label id="nachname2">
					</label> <label for="nachname"></label>
				</p>
				<p>
					<label for="vorname">Vorname</label> <input type="text"
						id="vorname" name="vorname" size="25" maxlength="40"
						value="${login.vorname}" required>
				</p>
				<p>
					<label for="strasse">Strasse</label> <input type="text"
						id="strasse" name="strasse" size="30" maxlength="40"
						value="${login.strasse}">
				</p>
				<p>
					<label for="hausnummer"> Hausnummer</label> <input type=text
						id="hausnummer" name="hausnummer" size="5" maxlength="10"
						value="${login.hausnummer}">
				</p>
				<p>
					<label for="postleitzahl">Postleitzahl</label> <input type="text"
						id="postleitzahl" size="5" maxlength="40" name="postleitzahl"
						value="${login.postleitzahl}">
				</p>
				<p>
					<label for="ort">Ort</label> <input type="text" id="ort" name="ort"
						size="30" maxlength="40" value="${login.ort}">
				</p>
				<p>
					<label for="land">Land</label> <input type="text" id="land"
						name="land" size="30" maxlength="40" value="${login.land}">
				</p>
				<p>
					<label for="profilBild"> Profilbild hochladen</label> <input
						type="file" name="profilBild" id="profilBild" accept="image/*">
					<label for="profilBild"></label>
				</p>
			</fieldset>
			<div>
				<p>
					<button type="submit" name="profiledit_submit"
						id="profiledit_submit">Speichern</button>
				</p>
			</div>
		</div>

	</form>
	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
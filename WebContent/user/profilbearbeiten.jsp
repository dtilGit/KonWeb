<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-UTF-8)">
<title>Profildaten bearbeiten</title>
</head>

<body>
	<h1>Profildaten bearbeiten</h1>

	<form action="../Profilbearbeiten" id="profilbearbeiten" method="post">
		<div>
			<p>
				<label for="geschlecht"></label> <label for="geschlecht">Herr</label>
				<input type="radio" name="geschlecht" id="Herr" value="Herr"
					required> <label for="anrede">Frau</label> <input
					type="radio" name="geschlecht" id="Frau" value="Frau" required>
			</p>

			<p>
				<label for="titel">Titel:</label> <select name="titel" id="titel">
					<option value="">Kein Titel</option>
					<option value="Dr.">Dr.</option>
					<option value="Prof.">Prof.</option>
					<option value="ProfDr.">Prof. Dr.</option>
				</select>
			</p>


			<label for="nachname">Nachname</label> <input type="text"
				id="nachname" name="nachname" size="25" maxlength="40"
				placeholder="${login.nachname}" required> 
				
			<label for="vorname">Vorname</label> <input type="text" id="vorname"
				name="vorname" size="25" maxlength="40" placeholder="Max" required>
				
			<label for="email">E-Mail</label> <input type="email" id="email"
				name="email" size="25" maxlength="40" placeholder="max.mustermann@web.de" required> 
				
			<label for="passwort">Passwort</label> <input type="password"
				name="passwort" id="passwort" size="25" maxlength="40"
				title="10 Zeichen, GroÃ- und Kleinbuchstaben, Zahlen"
				pattern="(?=.*\) (?=.*[a-z]) (?=.*[A-Z]).(10,)" required> 
				
			<label for="strasse">Strasse</label> <input type="text" id="strasse"
				name="strasse" size="30" maxlength="40"> 
				
			<label for="hausnummer"> Hausnummer</label> <input type=text
				id="hausnummer" name="hausnummer" size="5" maxlength="10"> 
				
			<label for="postleitzahl">Postleitzahl</label> <input type="text"
				id="postleitzahl" size="5" maxlength="40" name="postleitzahl">

			<label for="ort">Ort</label> <input type="text" id="ort" name="ort"
				size="30" maxlength="40"> 
				
			<label for="land">Land</label> <input type="text" id="land" name="land" size="30" maxlength="40">

		</div>
		<p>
			<button type="submit" name="profiledit_submit" id="profiledit_submit">
				Speichern</button>
		</p>
	</form>
</body>
</html>
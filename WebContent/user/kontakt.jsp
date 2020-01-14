<%--DAvid Häusler--%>
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
<link rel="stylesheet" type="text/css" href="../css/style.css" />

<title>Kontakt</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>
	<h1>Sende eine Frage an unser Support-Team</h1>
	<form action="../Kontakt" id="knt_form" method="post">
		<fieldset>
			<legend>Wie können wir dir helfen?</legend>
			<p>
				<label for="knt_betreff">Betreff: </label> <input type="text"
					name="knt_betreff" id="knt_betreff"
					placeholder="Gebe das Thema deines Anliegens ein" required>
			</p>
			<p>
				<label for="knt_nachname">Nachname: </label> <input type="text"
					name="knt_nachname" id="knt_nachname" size="25" maxlength="40"
					required>
			</p>
			<p>
				<label for="knt_vorname">Vorname: </label> <input type="text"
					name="knt_vorname" id="knt_vorname" size="25" maxlength="40"
					required>
			</p>
			<p>
				<label for="knt_email">E-Mail: </label> <input type="email"
					name="knt_email" id="knt_email" size="25" maxlength="40" required>
			</p>
			<p>
				<label for="knt_grund">Grund: </label> <select name="knt_grund"
					id="knt_grund" required>
					<option value="">Grund wählen</option>
					<option>Umtausch</option>
					<option>Produktinformationen/-Support</option>
					<option>Website-Informationen/-Support</option>
					<option>Datenschutz-Anliegen</option>
					<option>Sonstiges</option>
				</select>

			</p>
			<p>
				<label for="knt_nachricht">Nachricht: </label>
				<textarea name="knt_nachricht" id="knt_nachricht" rows="15"
					maxlength="2500" required></textarea>
			</p>
		</fieldset>
		<div>
			<p>
				<button type="submit" name="knt_button" id="knt_submit">Senden</button>
			</p>
		</div>

	</form>
	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
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
<script type="text/javascript" src="../js/passwort.js"></script>
<title>Login</title>

</head>
<body>
	<%@ include file="../jspf/header.jspf"%>

	<h1>Login</h1>
	<div id="logform">

		<form action="../LoginServlet" method="post" id="login">


			<fieldset>

				<label for="email"> E-Mail: </label> <input type="email"
					name="email" id="email" size="25" maxlength="30"
					placeholder="Deine E-Mail" required> <br> <label
					for="passwort"> Passwort: </label> <input type="password"
					name="passwort" id="passwort" size="25" maxlength="40"
					placeholder="Dein Passwort" required>
			</fieldset>

			<br>
			<div>
				<button type="submit" id="anmelden">Anmelden</button>
			</div>

		</form>
	</div>
	<p>
		Noch nicht registriert? Dann registriere dich doch <a
			href="registrierung.jsp">hier</a> :)
	</p>



	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
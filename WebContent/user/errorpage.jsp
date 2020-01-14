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
<title>Fehler!</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>

	<div>
		<h1>Fehlermeldung</h1>
		<h2>
			Bitte melde dich bei uns oder verfasse eine kurze Mail an folgende
			Mailadresse:
		</h2>
		<a
				href="mailto:info@todsbestcaps.de?subject=Eine%20Mail%20an%20Team%20TOD's%20BestCap">
				<img class="small-icon" alt="mail" src="../img/mail.png">
				info@todsbestcaps.de
			</a>
	</div>

	<form action="../index.jsp" method="get">
		<button id="backtotrack">Zurück zur Startseite</button>
	</form>

	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
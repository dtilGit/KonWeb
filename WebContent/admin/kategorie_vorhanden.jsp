<%-- David Häusler/Tilman Dewes --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<title>Fehler: Kategorie bereits vorhanden</title>

</head>
<body>
<%@ include file="../jspf/header.jspf"%>
	<div id="kategorievorhanden">
		<h2>Fehler! Diese Kategorie gibt es bereits für das gewählte Geschlecht!</h2>

		<form style="display: inline" action="../PreloadAdminpage"
			method="post">
			Zurück zur Adminseite:
			<button id="zurueckzuadmin">Adminverwaltung</button>
		</form>
	</div>
<%@ include file="../jspf/footer.jspf"%>


</body>
</html>
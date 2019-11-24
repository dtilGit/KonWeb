<%-- David Häusler --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Artikel gelöscht!</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<base href="${pageContext.request.requestURI}"/>

</head>
<body>
<%@ include file="/../jspf/header.jspf"%>
	<div id="artikelgeloescht">
		<h2>Der angegebene Artikel wurde gelöscht!</h2>

		<%--<p>Gelöschte Artikel ID: </p>${alleArtikel.artikel_id} <br>--%>

		<form style="display: inline" action="admin/adminpage.jsp"
			method="get">
			Zurück zur Adminseite:
			<button id="zurueckzuadmin">Adminverwaltung</button>
		</form>
	</div>
<%@ include file="/../jspf/footer.jspf"%>


</body>
</html>
<%-- David Häusler --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artikel gelöscht!</title>
</head>
<body>
<%-- 	<%@ include file="/jspf/header.jspf"%> --%>
	<div id="artikelgeloescht">
		<h2>Der angegebene Artikel wurde gelöscht!</h2>
		<em>Gelöschte Artikel ID: </em>${art_bean.artikel_id} <br>
		<form style="display: inline" action="admin/adminpage.jsp"
			method="get">
			Zurück zur Adminseite:
			<button id="zurueckzuadmin">Adminverwaltung</button>
		</form>
	</div>
<%-- 	<%@ include file="/jspf/footer.jspf"%> --%>


</body>
</html>
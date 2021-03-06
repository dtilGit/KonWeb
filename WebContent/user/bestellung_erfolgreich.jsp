
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

<title>Bestellung erfolgreich</title>

</head>
<body>

	<%@ include file="../jspf/header.jspf"%>
	<div id="artikelgeloescht">
		<h1>Bestellung erfolgreich abgeschlossen!</h1>
		<h2>Vielen Dank für deine Bestellung! Deine Artikel werden
			schnellstmöglichst verschickt!</h2>

		<p>
			Dein Shoppinghunger ist immer noch nicht gestillt? <a
				href="../index.jsp">Hier weitershoppen</a> :)
		</p>

	</div>
	<%@ include file="../jspf/footer.jspf"%>

</body>
</html>
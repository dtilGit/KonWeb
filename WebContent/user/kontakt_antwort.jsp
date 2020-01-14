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
<!-- Basis für reltive Verweise festlegen,  -->
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" href="../css/style.css" type="text/css">

<title>Kontaktformular erfolgreich abgeschickt</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>
	<h1>Kontaktformular abgeschickt</h1>
	<h2>Vielen Dank für die Kontaktaufnahme! Du erhältst innerhalb der
		nächsten 3 Tagen eine Rückmeldung von unserem Support-Team!</h2>

	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
<%--David Häusler --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page errorPage="../fehlerausgabe.jsp"%> --%>

<!DOCTYPE html>
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" href="../css/style.css" type="text/css">
<title>Aktion erfolgreich</title>
</head>
<body>
<%@ include file="../jspf/header.jspf"%>
SUCCESS: Ihre Aktion wurde erfolgreich ausgeführt<br>
Zurück zur Adminseite: <a href="adminpage.jsp"><button id="zurueckzuadmin">zurück</button></a>
<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
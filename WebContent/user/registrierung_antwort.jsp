<%-- Veronika Tschemodanov --%>
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


<title>Registrierung erfolgreich!</title>
</head>

<body>
	<%@ include file="../jspf/header.jspf"%>
	<h1>Registrierung ist erfolgt!</h1>
	<h2>Hallo ${regform.vorname} ${regform.nachname}! Du hast dich erfolgreich bei Tods registriert. Viel
		Spaß beim Shoppen!</h2>
	
	<p>
		<a href="login.jsp">Hier</a> geht's zur Anmeldung! 
	</p>

		<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
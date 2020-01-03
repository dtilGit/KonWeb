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
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" href="../css/style.css" type="text/css">

<title>Logout</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>
	<p>Sie haben sich erfolgreich abgemeldet!</p>
	<p>
		Hier geht's zur Anmeldung <a href="login.jsp">LOGIN</a>
	</p>
	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
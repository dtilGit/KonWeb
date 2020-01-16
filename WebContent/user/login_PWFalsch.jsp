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

<title>Fehlermeldung</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>
	<h1>Fehlermeldung</h1>
	<h2>Login fehlgeschlagen. Ihr Passwort wurde falsch eingegeben!</h2>
	<p>
		Versuchen Sie es erneut. <a href="login.jsp">Hier</a> zur Anmeldung.
	</p>

	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
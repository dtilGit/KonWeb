<%--Veronika Tschemodanov --%>
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
<link rel="stylesheet" type="text/css" href="../css/style.css" />

<title>Account gelöscht</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>

	<h1>Ihr Account wurde erfolgreich gelöscht!</h1>

	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>
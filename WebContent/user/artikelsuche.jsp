<%--Veronika Tschemodanov --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Suchergebnis</title>
</head>
<body>
	<c:choose>
		<c:when test="${art == null || empty art}">
			Kein Suchergebnis bei Ihrer Sucheingabe. 
		</c:when>
		<c:otherwise>
			<c:forEach var="suche" items="${art}" varStatus="status">
			<tr>
				
				<td>${suche.artikelbezeichnung}</td>
				<td>${suche.preis} €</td>
				<td><img src="../BildLaden?artikel_id=${suche.artikel_id}" alt="Artikelbild" ></td>
				<td>
			</tr>
		</c:forEach>
<!-- 			Hier kommen die gefundenen Artikel -->
<%-- 		${art.artikelbezeichnung}  --%>
<%-- 		${art.preis} --%>
		</c:otherwise>
	</c:choose>


</body>
</html>
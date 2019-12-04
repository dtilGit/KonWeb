<%--Veronika Tschemodanov --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Männer Artikel</title>
</head>
<body>
	<h1>Männer Artikel</h1>
	<%--Zuerst die Kategorien anzeigen, dann die jeweilgien Artikel --%>

	<c:forEach var="kategorieMen" items="${anzeige.kategorie}">
		<td>
			<button type="submit">${kategorieMen.kategoriebezeichnung}</button>
		</td>
	</c:forEach>
	
	<c:forEach var="artikelkategorie" items="${anzeige.artikel}">
		<td>${artikelkategorie.artikelbezeichnung}</td>
		<td>${artikelkategorie.preis)Euro}</td>
		
	</c:forEach>

</body>
</html>


<%--<form action="/KategorienLadenMen" method="get"> --%>
<%-- 			<td> <button type="submit" >${kategorieMen.kategoriebezeichnung}</button></td> --%>
<%--  			<c:forEach var="artikelkategorie" items="${anzeige.ArtikelKategorie }">  --%>
<%-- 				<td>${artikelkategorie.artikelbezeichnung}</td>  --%>
<%-- 				<td>${artikelkategorie.preis)Euro}</td> --%>
<!-- 				<td><img -->
<%-- 					src="../BildLaden?artikel_id=${kategorieMen.artikel_id}" --%>
<!-- 					alt="Artikelbild"></td> -->
<!-- 				<td> -->


<%-- 	</c:forEach> --%>

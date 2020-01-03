
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="fehlerausgabe.jsp"%>
    <%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../../css/tabellen.css"/> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}"/> 
<link rel="stylesheet" href="../../css/footer.css"
media="screen and (min-width:960px)">
<link rel="stylesheet" href="../../css/cookies.css"
media="screen and (min-width:960px)">

<!-- <a href="../warenkorb/warenkorb.jsp">Warenkorb</a> -->

<title>Artikel</title>
</head>
<body>
	
	<table>
	<tbody>
		<tr>
		
			<th>Bezeichnung</th>
			<th>Preis</th>
			<th>Bild</th>
			<th></th>
			
		</tr>
		<!-- Auswahl durch Klick des Users legt fest: Geschlecht-> Kategorie. Davon abhängig sind die angezeigten Artikel -->
		
		<c:forEach var="artikelauswahl" items="${artikelUser}" varStatus="status">
			<tr>
			
				<td>${artikelauswahl.bezeichnung}</td>
				<td>${artikelauswahl.preis} €</td>
				<td><img  src="../BildLaden?artikel_id=${artikelauswahl.artikel_id}" alt="bild_laden" ></td>
				<td>
			</tr>
		</c:forEach>
		
	</tbody>
	</table>
	 
</body>


</html>
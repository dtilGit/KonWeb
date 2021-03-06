<%-- David Häusler --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="de">
<head>
<base href="${pageContext.request.requestURI} " />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Impressum</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />

</head>
<body>

	<%@ include file="../jspf/header.jspf"%>
	<h1>Impressum</h1>
	<section>


		<h2>Geschäftsführer</h2>
		<ul class="impinfos">
			<li>Veronika Tschemodanov</li>
			<li>David Häusler</li>
			<li>Tilman Ansgar Dewes</li>
		</ul>
		<h2>Adresse</h2>
		<ul class="impinfos">
			<li>TOD's Best Caps</li>
			<li>Esplanade 10, 85049 Ingolstadt</li>
			<li>Telefon: 09131/123987654</li>
			<li>E-Mail: info@todsbestcaps.de</li>
		</ul>

	</section>
	<div id="footer">
		<%@ include file="../jspf/footer.jspf"%>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Adminpage</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<base href="${pageContext.request.requestURI}" />

</head>

<body>
	<%@ include file="/../jspf/header.jspf"%>

<section>
<div class= "intro">
Adminpage:<br>
Wenn auf diese Seite kommst, bist du bei uns als Admin hinterlegt.<br>
Hier kannst du unser Lager einsehen, unsere Artikel und Kategorien bearbeiten und löschen <br>
Tob dich aus! Aber pass auf deine Änderungen werden direkt in die Produktivdatenbank eingepflegt und ist anschließend für alle User sichtbar!
</div>

<!--Artikelübersicht -->
<div id="Artikeluebersicht">
<h1>Artikelübersicht</h1>
Du willst dir erstmal einen Überblick über all unsere Artikel verschaffen?<br>
Drücke ganz einfach:
<form action="../AlleArtikelLaden" method="post" enctype="multipart/form-data">
<button type="submit" id="artikel_laden">Artikel laden</button>
</form>
und anschließend:<br>
<button type="button" id="artikeluebersicht_anzeigen" onClick="document.getElementById('artikeluebersicht').style.display='inline';">
Artikelübericht anzeigen
</button><br>

<table id="artikeluebersicht" style="display: none">
 <thead>
				<tr>
					<th>Artikel ID</th> 
                    <th>Artikelbezeichnung</th> 
                    <th>Preis(€)</th>  
                    <th>Bild</th>                   
                </tr>
            </thead>
			
            <tbody>
			<c:forEach items="${alleArtikel}" var="artikel">
			<tr>
   		 	<td>${artikel.artikel_id}</td>
   		 	<td>${artikel.artikelbezeichnung}</td>
   		 	<td>${artikel.preis}</td>
   		 	<td><img src="${artikel.bild}"></td>
			</tr>
			</c:forEach> 
					<td><button type="reset" name="abbrechen" onClick="document.getElementById('artikeluebersicht').style.display='none';">abbrechen</button>
					</td>
                </tr>
                
                
	 </tbody>
</table>
</div>

<h1>Artikel bearbeiten</h1>
<h2>Artikel hinzufügen</h2><br><br><br><br>
Du willst einen neuen Artikel hinzufügen? Ganz einfach! Drücke zuerst: 
<form action="../AlleKategorienLaden" method="post" enctype="multipart/form-data">
<button type="submit" id="kategorien_laden">Kategorien laden</button>
</form>
Und anschließend<br>
<button type="button" id="neuer_artikel" onClick="document.getElementById('ArtikelHinzufuegen').style.display='inline';">
neuen Artikel hinzufügen
</button>
<form method="post" enctype="multipart/form-data" action="../ArtikelHinzufuegen">
	<table id="ArtikelHinzufuegen" style="display: none">
	<thead>
                <tr>
                    <th>Artikelbezeichnung</th>
                    <th>Preis(€)</th>
                    <th>Kategorie</th>
                    <th>Bild</th>
                    <th>Buttons</th>
                </tr>
    </thead>
	<tbody>	
	<tr>
					<td>            
					<input type="text" name="art_bez" maxlength="15"
                     placeholder="Bezeichnung des Artikels" required>
					</td>
					
                        
                    <td>
					<input type="number"
                        id="preis" name="preis" min="0.01"
                        max="1000.00" placeholder="z.B. 15,99" step= "0.01" required>
					</td>
					
					
					<td>
					<select name="alleKategorienLaden" required>
    				<c:forEach items="${alleKategorien}" var="kategorien">
   					<option name="kategorie_bez_geschlecht" value="${kategorien.kategorie_id}">
   					 <c:out value="${kategorien.kategoriebezeichnung}"/>,
   					 <c:out value="${kategorien.geschlecht}" />
   					 </option>
   					 </c:forEach>
					</select>
					</td>
					<td>
					<input
					type="file" name="bild" id="bild" accept="image/*" required>
					</td>
					<td>
					<button type="submit" name="speichern">speichern</button>
					<button type="reset" name="abbrechen" onClick="document.getElementById('ArtikelHinzufuegen').style.display='none';">abbrechen</button>
					</td>
					</tr>
	</tbody>
	</table>
	</form>
	
<h2>Artikel löschen</h2><br><br><br><br>
Du willst einen Artikel löschen? :( Na gut, Drücke zuerst:
<form action="../AlleArtikelLaden" method="post" enctype="multipart/form-data">
<button type="submit" id="artikel_laden">Artikel laden</button>
</form>
Und anschließend<br>
<button type="button" id="neuer_artikel" onClick="document.getElementById('ArtikelLoeschen').style.display='inline';">
Artikel löschen
</button>
<form action="../ArtikelLoeschen" method="get" enctype="multipart/form-data">
	<table id="ArtikelLoeschen" style="display: none">
	<thead>
		<tr>
			<th> Artikel ID, Artikelbezeichnung </th>
			<th>Buttons</th>
		</tr>
	</thead>
	<tbody>
	<tr>
	<td>
	<select name="alleArtikelLaden">
    <c:forEach items="${alleArtikel}" var="artikel">
   		 <option name="artikel_id_bez" value="${artikel.artikel_id}">
   		 <c:out value="${artikel.artikel_id}"/>,
   		 <c:out value="${artikel.artikelbezeichnung}" />
   		 </option>
   		 </c:forEach>
	</select>
	</td>
	<td>
	<button type="submit" name="loeschen">löschen</button>
	
	<button type="reset" name="abbrechen" onClick="document.getElementById('ArtikelLoeschen').style.display='none';">abbrechen</button>
	</td>
	</tr>
	</tbody>
	</table>
	</form>
	
<h1>Kategorien bearbeiten</h1>
<h2>Kategorien hinzufügen</h2><br><br><br><br>
Es kommt eine Kategorie hinzu? Die kannst du mit folgendem Button hinzufügen:<br>	 
<button type="button" id="neue_kategorie" onClick="document.getElementById('KategorieHinzufuegen').style.display='inline';">
neue Kategorie hinzufügen
</button>
<form action="../KategorieHinzufuegen" method="get" enctype="multipart/form-data">
	<table id="KategorieHinzufuegen" style="display: none">
	<thead>
                <tr>
                    <th>Kategorie-Bezeichnung</th>
                    <th>Geschlecht</th>					                   
                </tr>
    </thead>
	<tbody>
	<tr>
	<td>            <input type="text" name="kategorie_bezeichnung" maxlength="15"
                     placeholder="Bezeichnung der Kategorie" required>
					</td>
					
                    <td>
					<label for="kategorie_geschlecht"> </label> 		
					<select name="kategorie_geschlecht" required>
					<option></option>
					<option>Männlich</option> 
					<option>Weiblich</option>
					</select>
					</td>
					<td>
					<button type="submit" name="speichern">speichern</button>
					<button type="reset" name="abbrechen" onClick="document.getElementById('KategorieHinzufuegen').style.display='none';">abbrechen</button>
					</td>
	</tr>
	<tbody>
	</table>
	</form>
	
<h2>Kategorien löschen</h2><br><br><br><br>
Um eine bestehende Kategorie zu löschen drücke erst:
<form action="../AlleKategorienLaden" method="post" enctype="multipart/form-data">
<button type="submit" id="kategorien_laden">Kategorien laden</button>
</form>
Und danach:<br>
<button type="button" id="kategorie_delete" onClick="document.getElementById('KategorieLoeschen').style.display='inline';">
Kategorie löschen
</button><br>
<form action="../KategorieLoeschen" method="get" enctype="multipart/form-data">
	<table id="KategorieLoeschen" style="display: none">
	<thead>
                <tr>
                    <th>Kategorie</th>
                    <th>Buttons</th>				                   
                </tr>
    </thead>
	<tbody>
	<tr>
	<td>
	<select name="alleKategorienLaden">
    <c:forEach items="${alleKategorien}" var="kategorien">
   		 <option name="kategorie_bez_geschlecht" value="${kategorien.kategorie_id}">
   		 <c:out value="${kategorien.kategoriebezeichnung}"/>,
   		 <c:out value="${kategorien.geschlecht}" />
   		 </option>
   		 </c:forEach>
	</select>
	</td>
	<td>
	<button type="submit" name="loeschen">löschen</button>
	
	<button type="reset" name="abbrechen" onClick="document.getElementById('KategorieLoeschen').style.display='none';">abbrechen</button>
	</td>
	</tr>
	<tbody>
	</table>
	</form>


	</section>

	<!--Aside hier ausgeblendet da artikelhinzufügen tabelle reingeht 
<aside>
Aside
</aside>-->
	<%@ include file="/../jspf/footer.jspf"%>

</body>
</html>
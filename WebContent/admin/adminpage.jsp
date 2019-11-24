<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Adminpage</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<base href="${pageContext.request.requestURI}"/>

</head>

<body>
<%@ include file="/../jspf/header.jspf"%>

<div id="wrapper">
<!-- Seitengröße der Webseite festlegen mit width in stylesheet-->

<section>
<div class= "intro">
Adminpage: Artikel anpassen <br>
How to: kurze Beschreibung zum Bearbeiten<br><br><br>
Lager:
</div>

    <form id="AlleArtikelLaden" method="post" enctype="multipart/form-data" action="/servlets/AlleArtikelLaden">
        <table id="artikeltabelle">
		
            <thead>
                <tr>
                    <th>Artikelbezeichnung</th> 
                    <th>Preis(€)</th>
					<th>Bild</th>
					<th>Lagerbestand</th>
					<th>Kategorie</th> <!-- über Kategorie_ID geholt-->
					<th>Geschlecht</th> <!-- über Kategorie_ID geholt-->
					<th></th>                   
                </tr>
            </thead>
			
            <tbody>
			 <tr>
					<td>Adidas Allblack</td>				
                    <td>20</td>       
                    <td>BILD</td> 
					<td>500</td> 					
                    <td>Beanie</td>                    
                    <td>Männlich</td>
					<td> <input type="radio" id="1" name="radioadmin"></td>
                </tr>
				
				<tr>	
					<td>Nike tripple white</td>				
                    <td>20</td>       
                    <td>BILD</td>  
					<td>20</td>
                    <td>Beanie</td>                    
                    <td>Weiblich</td>
					<td> <input type="radio" id="2" name="radioadmin"></td>
    
                   
                </tr>
				
				<tr>
					<td></td>
                    <td></td>				
                    <td></td>       
                    <td></td>  
                    <td></td>                    
                    <td></td>
					<td> <input type="radio" id="3" name="radioadmin"></td>
				</tr>
	 </tbody>
</table>
</form>

		<!--DB bearbeiten Buttons-->				
		<div id="adminpagebutton">	
		 <button type="button" id="lager_erhoehen" onClick="document.getElementById('lager_befuellen').style.display='inline';">Lagerbestand erhöhen</button>
		 <button type="button" id="neuer_artikel" onClick="document.getElementById('ArtikelHinzufuegen').style.display='inline';">neuen Artikel hinzufügen</button>
		 <button type="button" id="neue_kategorie" onClick="document.getElementById('KategorieHinzufuegen').style.display='inline';">Kategorie hinzufügen</button>
		 <form action="../AlleKategorienLaden" method="post" enctype="multipart/form-data">
		 <button type="submit" id="kategorien_laden">Kategorien laden</button>
		 </form>
		  <form action="../AlleArtikelLaden" method="post" enctype="multipart/form-data">
		 <button type="submit" id="artikel_laden">Artikel laden</button>
		 </form>
		 <button type="button" id="neue_kategorie" onClick="document.getElementById('KategorieLoeschen').style.display='inline';">Kategorien löschen</button>
		 <button type="button" id="neuer_artikel" onClick="document.getElementById('ArtikelLoeschen').style.display='inline';">Artikel löschen</button>
		</div>
    
	
	<!--Pop ups-->
	<div id="admintabellen_popups">
	
	
	<!--neuen Artikel hinzufügen -->
	<form method="post" enctype="multipart/form-data" action="../ArtikelHinzufuegen">
	<table id="ArtikelHinzufuegen" style="display: none">
	<thead>
                <tr>
                    <th>Artikelbezeichnung</th>
                    <th>Preis(€)</th>
                    <th>Kategorie</th>
					<th>Bild</th>
					<th>Lagerbestand</th>
					<th>Kategorie</th>
					<th></th>
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
								<div>
									<label for="bild">Bild hochladen:</label> <input
										type="file" name="bild" id="bild" accept="image/*" required>
										<button type="submit" name="upload">Bild Upload</button>
								</div>
					</td>
								<!--  <td>
					<input type="file" name="image" id="artikel_image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .PNG" required>	
					<button type="submit" name="upload">upload</button>
					</td>-->
					
					<td>
					<button type="submit" name="speichern">speichern</button>
					<button type="reset" name="abbrechen" onClick="document.getElementById('ArtikelHinzufuegen').style.display='none';">abbrechen</button>
					</td>
					</tr>
	</tbody>
	</table>
	</form>
	
	
	<!--Neue Kategorie hinzufügen-->
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
	</div>
	
	<!--Kategorie löschen-->
	<form action="../KategorieLoeschen" method="get" enctype="multipart/form-data">
	<table id="KategorieLoeschen" style="display: none">
	<thead>
                <tr>
                	<th>Laden Button</th>
                    <th>Kategorie-Bezeichnung, Geschlecht</th>
                    <th>Lösch Button</th>				                   
                </tr>
    </thead>
	<tbody>
	<tr>
	<td>
	</td>
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
	</div>
	<div>
	<!-- Artikel löschen -->
	<form action="../ArtikelLoeschen" method="get" enctype="multipart/form-data">
	<table id="ArtikelLoeschen" style="display: none">
	<thead>
		<tr>
			<th> Artikel ID, Artikelbezeichnung </th>
			<th> Aus DB loeschen </th>
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
	</div>

</section>

<!--Aside hier ausgeblendet da artikelhinzufügen tabelle reingeht 
<aside>
Aside
</aside>-->

<footer>
<div id= "ServiceHotline">
<p>Du hast ein Problem?<br> Unsere Service Hotline 24/7 kostenlos für dich erreichbar:</p>
<p>09131/123987654</p>
</div>

<div id="impressumLink">
<p>anderweitig Kontakt findest du im:<p>
<a href="Impressum.html">Impressum</a>
</div>

</footer>
</body>
</html>
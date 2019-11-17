<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Adminpage</title>
<link rel="stylesheet" href="styleV2.css" type="text/css">

</head>

<body>

<div id="wrapper">
<!-- Seitengröße der Webseite festlegen mit width in stylesheet-->

<section>
<div class= "intro">
Adminpage: Artikel anpassen <br>
How to: kurze Beschreibung zum Bearbeiten<br><br><br>
Lager:
</div>

    <form id="alleArtikel_laden" method="post" enctype="multipart/form-data" action="/servlets/alleartikel_laden">
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
		 <button type="button" id="neuer_artikel" onClick="document.getElementById('artikel_hinzufügen').style.display='inline';">neuen Artikel hinzufügen</button>
		 <button type="button" id="neue_kategorie" onClick="document.getElementById('kategorie_hinzufügen').style.display='inline';">Kategorie hinzufügen</button>
		 <form action="/test-war/alleKategorien_laden" method="post" enctype="multipart/form-data">
		 <button type="submit" id="kategorien_laden">Kategorien laden</button>
		 </form>
		 <button type="button" id="neue_kategorie" onClick="document.getElementById('kategorie_loeschen').style.display='inline';">Kategorien löschen</button>
		 <button type="submit" name="loeschen">löschen</button>
		 <button type="submit" name="bearbeiten">bearbeiten</button>
		</div>
    
	
	<!--Pop ups-->
	<div id="admintabellen_popups">
	
	<!--Lagerbestand erhohen-->
	<form method="post" enctype="multipart/form-data" action="/?/?">
	<table id="lager_befuellen" style="display: none">
	
	<thead>
                <tr>
                    <th>Artikelbezeichnung</th>		
					<th>Anzahl</th>	
					<th></th>					
                </tr>
    </thead>
	<tbody>
					<tr>
	                <td>
					<label for="artikelgruppen_dropdown"> 	<!--Dropdown aller Artikelgruppen -->	
					<select required>
					<option>hier alle produkte</option> 
					<option>Adidas Allblack</option>
					<option>Nike Tripple White</option>
					<option>...</option>
					</select>
					</label> 
					</td>
					
					<td><label for="artikel_anzahl"> 
                    <input type="number"
                        id="artikel_anzahl" name="artikel_anzahl"
                        placeholder="z.b. 30" required>
                        </label> 
                    </td>
					
					<td>
					<button type="submit" name="speichern">speichern</button>
					<button type="reset" name="abbrechen" onClick="document.getElementById('lager_befuellen').style.display='none';">abbrechen</button>
					</td>
					</tr>
	<tbody>
	</table>
	</form>
	
	<!--neuen Artikel hinzufügen -->
	<form method="post" enctype="multipart/form-data" action="/?/?">
	<table id="artikel_hinzufügen" style="display: none"><!--Style element in html ok? -->
	<thead>
                <tr>
                    <th>Artikelbezeichnung</th>
                    <th>Preis(€)</th>
					<th>Bild</th>
					<th>Lagerbestand</th>
					<th>Geschlecht</th>
					<th>Kategorie</th>
					<th></th>
                </tr>
    </thead>
	<tbody>	
	<tr>
					<td><label for="artikel_bezeichnung">
                    <input type="text"
                        id="artikel_bezeichnung" name="artikel_bezeichnung" maxlength="15"
                        placeholder="Bezeichnung des Artikels" required> <!--size muss in css definiert werden -->
                    </label>
                    </td>
					
                        
                    <td><label for="artikel_preis">
					<input type="number"
                        id="preis" name="preis" min="0.01"
                        max="1000.00" placeholder="z.B. 15,99" step= "0.01" required>
                    </label>
					</td>
					
					<td><label for="artikel_image">
					<input type="file" name="image" id="artikel_image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .PNG" required>	
					<button type="submit" name="upload">upload</button>
					</label>
					</td>
					
					<td><label for="artikel_bestand"> 
					<input type="number"
                        id="artikel_bestand" name="artikel_bestand" min="0.00"
                        max="1000.00" placeholder="z.B. 20" step= "0.01" required>
                    </label>
					</td>
	
					<td><label for="kategorie_geschlecht">
					<select required>
					<option>Männlich</option>
					<option>Weiblich</option>
					</label> 					
					</select></td>
					
					<td><label for="kategorie_bezeichnung"> 
					<select required>
					<option>Cap</option><!--muss noch flexibel aus DB geholt werden abhängig von gewählten geschlecht alle holen-->
					<option>Beanie</option>
					<option>...</option>
					<option></option>
					</label>
					</select></td>
					
					<td>
					<button type="submit" name="speichern">speichern</button>
					<button type="reset" name="abbrechen" onClick="document.getElementById('artikel_hinzufügen').style.display='none';">abbrechen</button>
					</td>
					</tr>
	<tbody>
	</table>
	</form>
	
	
	<!--Neue Kategorie hinzufügen-->
	<form action="/test-war/kategorie_hinzufuegen" method="get" enctype="multipart/form-data">
	<table id="kategorie_hinzufügen" style="display: none">
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
					<button type="reset" name="abbrechen" onClick="document.getElementById('kategorie_hinzufügen').style.display='none';">abbrechen</button>
					</td>
	</tr>
	<tbody>
	</table>
	</form>
	</div>
	
	<!--Kategorie löschen-->
	<form action="/test-war/kategorie_loeschen" method="get" enctype="multipart/form-data">
	<table id="kategorie_loeschen" style="display: none">
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
	
	<button type="reset" name="abbrechen" onClick="document.getElementById('kategorie_loeschen').style.display='none';">abbrechen</button>
	</td>
	</tr>
	<tbody>
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
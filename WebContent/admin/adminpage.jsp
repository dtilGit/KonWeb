<!-- Tilman Dewes -->

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.requestURI}" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../js/showAndHide.js"></script>
<title>Adminpage</title>
</head>
<body>
	<%@ include file="../jspf/header.jspf"%>
	<section>
		<div class="intro">
			<h2>Adminpage:</h2>
			Wenn auf diese Seite kommst, bist du bei uns als Admin hinterlegt.<br>
			Hier kannst du unser Lager einsehen, unsere Artikel und Kategorien
			bearbeiten und löschen <br> Tob dich aus! Aber pass auf deine
			Änderungen werden direkt in die Produktivdatenbank eingepflegt und
			ist anschließend für alle User sichtbar!
		</div>

		<!--Übersicht -->
		<h1>Artikel- und Kategorieübersicht</h1>
		Du willst dir erstmal einen Überblick verschaffen?<br>
		<!--Übersichtsbutton -->

		<button type="button" id="artikeluebersicht_anzeigen"
			onClick="showArtikeluebersicht()">Artikelübersicht anzeigen</button>

		<button type="button" id="kategorieuebersicht_anzeigen"
			onClick="showKategorieuebersicht()">Kategorieübersicht
			anzeigen</button>
		<br> <br>

		<!--Artikelübersicht -->
		<div class="hidden" id="artikeluebersicht">
			<table id="Artikeluebersicht">
				<thead>
					<tr>
						<th>Artikel ID</th>
						<th>Artikelbezeichnung</th>
						<th>Preis(€)</th>
						<th>Bild</th>
						<th>Kategorie</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="alleArt" items="${preload.artikel}">
						<tr>
							<td>${alleArt.artikel_id}</td>
							<td>${alleArt.artikelbezeichnung}</td>
							<td>${alleArt.preis}</td>
							<td><img src="../BildLaden?artikel_id=${alleArt.artikel_id}"
								class="bild" alt="bild_laden" width="200" height="250"></td>

							<td>${alleArt.kategoriebezeichnung}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<br>
			<button type="reset" name="abbrechen"
				onClick="hideArtikeluebersicht()">abbrechen</button>
		</div>

		<!--Kategorieübersicht -->
		<div class="hidden" id="kategorieuebersicht">
			<table id="Kategorieuebersicht">
				<thead>
					<tr>
						<th>Kategorie ID</th>
						<th>Kategoriebezeichnung</th>
						<th>Geschlecht</th>
					</tr>
				</thead>

				<tbody>

					<c:forEach var="alleKat" items="${preload.kategorie}">
						<tr>
							<td>${alleKat.kategorie_id}</td>
							<td>${alleKat.kategoriebezeichnung}</td>
							<td>${alleKat.geschlecht}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button type="reset" name="abbrechen"
				onClick="hideKategorieuebersicht()">abbrechen</button>
		</div>


		<!--Bearbeiten -->
		<h1>Bearbeiten</h1>
		Hier kannst du Änderungen an unserer Datenbank vornehmen <br>
		Vorsicht! Wenn du eine Kategorie löscht werden alle dazugehörigen
		Artikel auch entfernt!<br>

		<!--Artikel -->
		<!--Artikel bearbeiten button -->
		<h2>Artikel bearbeiten</h2>
		<button type="button" id="artikel_add" onClick="showAddArtikel()">
			neuen Artikel hinzufügen</button>
		<button type="button" id="artikel_delete"
			onClick="document.getElementById('artikelLoeschen').style.display='inline';">
			Artikel löschen</button>
		<br>

		<!--Artikel hinzufügen -->
		<div class="hidden" id="artikelHinzufuegen">
			<form method="post" enctype="multipart/form-data"
				action="../ArtikelHinzufuegen">
				<table id="ArtikelHinzufuegen">
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
							<td><input type="text" name="art_bez" maxlength="15"
								placeholder="Bezeichnung des Artikels" required></td>


							<td><input type="number" id="preis" name="preis" min="0.01"
								max="1000.00" placeholder="z.B. 15,99" step="0.01" required>
							</td>


							<td><select name="alleKategorienLaden" required>
									<c:forEach var="kategorien" items="${preload.kategorie}">
										<option id="kategorie_bez_geschlecht2"
											value="${kategorien.kategorie_id}">
											<c:out value="${kategorien.kategoriebezeichnung}" />,
											<c:out value="${kategorien.geschlecht}" />
										</option>
									</c:forEach>
							</select></td>
							<td><input type="file" name="bild" id="bild"
								accept="image/*" required></td>
							<td>
								<button type="submit" name="speichern">speichern</button>
								<button type="reset" name="abbrechen" onClick="hideAddArtikel()">abbrechen</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>

		<!--Artikel löschen -->
		<div class="hidden" id="artikelLoeschen">
			<form action="../ArtikelLoeschen" method="get"
				enctype="multipart/form-data">
				<table id="ArtikelLoeschen">
					<thead>
						<tr>
							<th>Artikel ID, Artikelbezeichnung</th>
							<th>Buttons</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><select name="alleArtikelLaden">
									<c:forEach items="${preload.artikel}" var="artikel">
										<option id="artikel_id_bez" value="${artikel.artikel_id}">
											<c:out value="${artikel.artikel_id}" />,
											<c:out value="${artikel.artikelbezeichnung}" />
										</option>
									</c:forEach>
							</select></td>
							<td>
								<button type="submit" name="loeschen">löschen</button>
								<button type="reset" name="abbrechen" onClick="hideDeleteArtikel()">abbrechen</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>

		<!-- Kategorien -->
		<h2>Kategorien bearbeiten</h2>
		<!-- Kategorien bearbeiten button -->
		<button type="button" id="neue_kategorie" onClick="showAddKategorie()">
			neue Kategorie hinzufügen</button>
		<button type="button" id="kategorie_delete"
			onClick="showDeleteKategorie()">Kategorie (+Artikel) löschen</button>
		<br>

		<!-- Kategorie hinzufügen -->
		<div class="hidden" id="kategorieHinzufuegen">
			<form action="../KategorieHinzufuegen" method="get"
				enctype="multipart/form-data">
				<table id="KategorieHinzufuegen">
					<thead>
						<tr>
							<th>Kategorie-Bezeichnung</th>
							<th>Geschlecht</th>
							<th>Buttons</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" name="kategorie_bezeichnung"
								maxlength="15" placeholder="Bezeichnung der Kategorie" required>
							</td>

							<td><select name="kategorie_geschlecht" required>
									<option>Herren</option>
									<option>Weiblich</option>
							</select></td>
							<td>
								<button type="submit" name="speichern">speichern</button>
								<button type="reset" name="abbrechen"
									onClick="hideAddKategorie()">abbrechen</button>
							</td>
						</tr>
					<tbody>
				</table>
			</form>
		</div>

		<!-- Kategorie löschen -->
		<div class="hidden" id="kategorieLoeschen">
			<form action="../KategorieLoeschen" method="get"
				enctype="multipart/form-data">
				<table id="KategorieLoeschen">
					<thead>
						<tr>
							<th>Kategorie</th>
							<th>Buttons</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><select name="alleKategorienLaden">
									<c:forEach items="${preload.kategorie}" var="kategorien">
										<option id="kategorie_bez_geschlecht1"
											value="${kategorien.kategorie_id}">
											<c:out value="${kategorien.kategoriebezeichnung}" />,
											<c:out value="${kategorien.geschlecht}" />
										</option>
									</c:forEach>
							</select></td>
							<td>
								<button type="submit" name="loeschen">löschen</button>

								<button type="reset" name="abbrechen"
									onClick="hideDeleteKategorie()">abbrechen</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</section>
</body>

<%@ include file="../jspf/footer.jspf"%>
</html>
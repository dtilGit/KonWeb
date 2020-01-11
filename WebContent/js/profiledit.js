/**
 *David Häusler
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init() {
	var datenform = document.getElementById("profilbearbeiten");
	datenform.addEventListener("submit", editprofil);
}

// hier wird das Register Form auf Eingaben geprüft
function editprofil(event) {
	var nachnamepro = document.getElementById("nachname").value;
	var vornamepro = document.getElementById("vorname").value;
	var strasse = document.getElementById("strasse").value;
	var hausnummer = document.getElementById("hausnummer").value;
	var postleitzahl = document.getElementById("postleitzahl").value;
	var ort = document.getElementById("ort").value;
	var land = document.getElementById("land").value;
	//var onlyletters = /^[A-Za-zß-ü\s]+$/;

	var sonderzeichen = /\W+/;
	var zahlen = /\d/;
	var keinebuchstaben = /\D/;
	// Bedingung für Mail
//	var emailzeichen = /^([\w.+-]+@[\w.-]+\.[a-zA-Z]{2,3})$/;

	if (nachnamepro.match(zahlen)) {
		alert("Der Nachname darf keine Zahlen enthalten.");
		event.preventDefault();
		return;
	} else if (nachnamepro.match(sonderzeichen)) {
		alert("Der Nachname darf keine Sonderzeichen enthalten.");
		event.preventDefault();
		return;
	} else if (vornamepro.match(zahlen)) {
		alert("Der Vorname darf keine Zahlen enthalten.");
		event.preventDefault();
		return;
	} else if (vornamepro.match(sonderzeichen)) {
		alert("Der Vorname darf keine Sonderzeichen enthalten.");
		event.preventDefault();
		return;
	} else if (strasse.match(zahlen)) {
		alert("Die Strasse darf keine Zahlen enthalten.");
		event.preventDefault();
		return;
	} else if (strasse.match(sonderzeichen)) {
		alert("Die Strasse darf keine Sonderzeichen enthalten.");
		event.preventDefault();
		return;
	} else if (hausnummer.match(sonderzeichen)) {
		alert("Die Hausnummer muss eine Zahl enthalten! Buchstaben sind erlaubt. Zudem darf es keine Sonderzeichen enthalten! ");
		event.preventDefault();
		return;
	} else if (postleitzahl.match(keinebuchstaben)
			|| postleitzahl.match(sonderzeichen)) {
		alert("Die Postleitzahl darf nur Zahlen enthalten und davon genau 5, um eine vollständige PLZ zu erhalten!");
		event.preventDefault();
		return;
	} else if (postleitzahl.length !=5) {
		alert("Die Postleitzahl muss 5 Zahlen enthalten!");
		event.preventDefault();
		return;
	} else if (ort.match(zahlen)) {
		alert("Der Ort darf keine Zahlen enthalten.");
		event.preventDefault();
		return;
	} else if (ort.match(sonderzeichen)) {
		alert("Der Ort darf keine Sonderzeichen enthalten.");
		event.preventDefault();
		return;
	} else if (land.match(zahlen)) {
		alert("Das Land darf keine Zahlen enthalten.");
		event.preventDefault();
		return;
	} else if (land.match(sonderzeichen)) {
		alert("Das Land darf keine Sonderzeichen enthalten.");
		event.preventDefault();
		return;
	}

	else {
//		alert("Sie haben ihre Daten erfolgreich eingepflegt!");
	}

}
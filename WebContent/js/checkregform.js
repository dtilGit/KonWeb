/**
 *David Häusler
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init() {
	var datenform = document.getElementById("regform");
	datenform.addEventListener("submit", pruefereg);
	datenform.addEventListener("submit", checkemail);
	datenform.addEventListener("submit", checkpasswort);
	datenform.addEventListener("submit", formatPruefen);
}

// hier wird das Register Form auf Eingaben geprüft
function pruefereg(event) {
	var nachname = document.getElementById("nachnamereg").value;
	var korrekt = document.getElementById("pruefnn");
	var vorname = document.getElementById("vornamereg").value;
	//var pw = document.getElementById("pwreg").value;
	var strasse = document.getElementById("strassereg").value;
	var hausnummer = document.getElementById("hausnrreg").value;
	var postleitzahl = document.getElementById("plzreg").value;
	var ort = document.getElementById("ortreg").value;
	var land = document.getElementById("landreg").value;
	//var onlyletters = /^[A-Za-zß-ü\s]+$/;

	var sonderzeichen = /[\W+]^[ÄäÖöÜüß+]/;
	var zahlen = /\d/;
	var keinebuchstaben = /\D/;

	if (nachname.match(zahlen)) {
		alert("Der Nachname darf keine Zahlen enthalten.");
		event.preventDefault();
		return;
	} else if (nachname.match(sonderzeichen)) {
		alert("Der Nachname darf keine Sonderzeichen enthalten.");
		event.preventDefault();
		return;
	} else if (vorname.match(zahlen)) {
		alert("Der Vorname darf keine Zahlen enthalten.");
		event.preventDefault();
		return;
	} else if (vorname.match(sonderzeichen)) {
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


function checkemail(event){
	var email = document.getElementById("emailreg").value;
	var emailzeichen = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	if(email.match(emailzeichen)){
		//alert("Sie haben ihre Daten erfolgreich eingepflegt!");
	}else{
		alert("Die Email hat kein korrektes Format. Vor dem @ darf kein Sonderzeichen außer . - stehen! Genauso wie hinter dem @! Zusätzlich muss ein . in deinem Domäne Part existieren!");
		event.preventDefault();
		return;
	}
}

function checkpasswort(event){
	var pw = document.getElementById("pwreg").value;
	//var passwort = /(?=.*[a-z])(?=.*[A-Z]){6,10}/;
	//Überprüfen wegen maxLänge
	var passwort = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{6,10}/;
	
	if(pw.match(passwort)){
		
	}else{
		alert("Das Passwort muss min. eine Zahl und ein Sonderzeichen enthalten sowie aus min. 6 und max. 10 Zeichen bestehen.");
		event.preventDefault();
		return;
	}
}

function formatPruefen(event){
	var bild1 = document.getElementById("profilBild").value;
	//die Endung der Bildbezeichnung rauslesen 
	var bild2 = bild1.substring(bild1.lastIndexOf("."), bild1.length);
	
	if(bild2 === ".jpg" || bild2 === ".png" || bild2 === ".jpeg" || bild2 === ".JPG" || bild2 === ".JPEG" || bild2 === ".PNG"){
	}
	else{
		alert("Es werden nur Bilder im Format: jpg, jpeg oder png unterstützt.");
		//zum Verhindern des Uploads
		event.preventDefault();
		return;
	}
}


// document.addEventListener("DOMContentLoaded", pruefedaten);
//
// function init(){
// var nachname1 = document.getElementById("nachname");
// // The focus() method is used to give focus to an element (if it can be
// focused).
// //
// // Tip: Use the blur() method to remove focus from an element.
// nachname1.focus();
// nachname1.addEventListener("blur", zeichenCheck);
//	
// }
// https://wiki.selfhtml.org/wiki/JavaScript/DOM/Event/blur --> Erklärung
// für
// die Blur und focus

// function zeichenCheck(){
// var nachname2 = document.getElementById("nachname").value;
// var ausgabe = document.getElementById("nachname2");
// var zeichen = /^[A-Za-z\s]+$/;
// if(nachname2.match(zeichen)){
// ausgabe.innerHTML = "passt";
// }else {
// ausgabe.innerHTML="Bitte nur Buchstaben";
// // event.preventDefault();
// }
//
// }


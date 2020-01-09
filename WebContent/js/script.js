"use strict";
document.addEventListener("DOMContentLoaded", init);

function init() {
	var datenform = document.getElementById("regform");
	datenform.addEventListener("submit", pruefereg);
}

// hier wird das Register Form auf Eingaben geprüft
function pruefereg(event) {
	var nachname = document.getElementById("nachnamereg").value;
	var korrekt = document.getElementById("pruefnn");
	var vorname = document.getElementById("vornamereg").value;
	var email = document.getElementById("emailreg").value;
	var pw = document.getElementById("pwreg").value;
	var strasse = document.getElementById("strassereg").value;
	var hausnummer = document.getElementById("hausnrreg").value;
	var postleitzahl = document.getElementById("plzreg").value;
	var ort = document.getElementById("ortreg").value;
	var land = document.getElementById("landreg").value;
	var onlyletters = /^[A-Za-zß-ü\s]+$/;
	
	var sonderzeichen = /\W+/;
	var zahlen = /\d/;
	var keinebuchstaben = /\D/;
	//Bedingung für Mail
	var emailzeichen = /^([\w.+-]+@[\w.-]+\.[a-zA-Z]{2,3})$/;

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
	} else if (email.match(emailzeichen)) {
		alert("Die Email hat kein korrektes Format. Vor dem @ darf kein Sonderzeichen außer . - + stehen! Genauso wie hinter dem @! Zusätzlich muss ein . in deinem Domäne Part existieren!");
		event.preventDefault();
		return;
	} 
	else if (strasse.match(zahlen)) {
		alert("Die Strasse darf keine Zahlen enthalten.");
		event.preventDefault();
		return;
	} else if (strasse.match(sonderzeichen)) {
		alert("Die Strasse darf keine Sonderzeichen enthalten.");
		event.preventDefault();
		return;
	} else if (hausnummer.match(sonderzeichen)) {
		alert("Die Hausnummer darf keine Sonderzeichen enthalten, nur Buchstaben und Zahlen.");
		event.preventDefault();
		return;
	} else if (postleitzahl.match(keinebuchstaben) || postleitzahl.match(sonderzeichen) ) {
		alert("Die Postleitzahl darf nur Zahlen enthalten.");
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
		alert( "Sie haben ihre Daten erfolgreich eingepflegt!");
	}

	//	if (nachname.match(sonderzeichen)) {
	//		throw "Nachname gültig!"
	//		korrekt.innerhtml = "Nachname gültig!";
	//	} else {
	//
	//		alert("Der Nachname darf keine Zahlen oder Sonderzeichen entahlten.");
	//		event.preventDefault();
	//		return;
	//	}
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

// Überprüfung für das Formular bei Bearbeitung des Profils
// function pruefedaten(){
// var nachname = document.getElementById("nachname").value;
// var vorname = document.getElementById("vorname").value;
// var strasse = document.getElementById("strasse").value;
// var hausnummer = document.getElementById("hausnummer").value;
// var postleitzahl = document.getElementById("postleitzahl").value;
// var ort = document.getElementById("ort").value;
// var land = document.getElementById("land").value;
// var sonderzeichen =
//
// if (nachname.trim() === "") {
// alert("Sie müssen einen Nachnamen eintragen!");
// } else if (vorname.trim() === "") {
// alert("Sie müssen einen Vornamen eintragen!");
// } else if (strasse.trim() === "") {
// alert("Sie müssen einen Strassennamen eintragen!");
// } else if (hausnummer.trim() === "") {
// alert("Sie müssen eine Hausnummer eintragen!");
// } else if (postleitzahl.trim() === "") {
// alert("Sie müssen eine PLZ eintragen!");
// } else if (ort.trim() === "") {
// alert("Sie müssen einen Ort eintragen!");
// } else if (land.trim() === "") {
// alert("Sie müssen ein Land eintragen!");
// } else{
//		
// }
// }

// else if (vorname.trim() === "") {
// throw "Sie müssen einen Vornamen eintragen!";
// } else if (email.trim() === "") {
// throw "Sie müssen eine Email eintragen!";
// } else if (pw.trim() === "") {
// throw "Sie müssen ein Passwort eintragen!";
// } else if (strasse.trim() === "") {
// throw "Sie müssen einen Strassennamen eintragen!";
// } else if (hausnummer.trim() === "") {
// throw "Sie müssen eine Hausnummer eintragen!";
// } else if (postleitzahl.trim() === "") {
// throw "Sie müssen eine PLZ eintragen!";
// } else if (ort.trim() === "") {
// throw "Sie müssen einen Ort eintragen!";
// } else if (land.trim() === "") {
// throw "Sie müssen ein Land eintragen!";
//		
// }

// lediglich alerts werden geworfen, wenn die Felder leer sind - jedoch
// überprüft diese Funktion eigentlich required automatisch
// try {
// if (nachname.trim() === "") {
// throw "Sie müssen einen Nachnamen eintragen!";
// } else if (vorname.trim() === "") {
// throw "Sie müssen einen Vornamen eintragen!";
// } else if (email.trim() === "") {
// throw "Sie müssen eine Email eintragen!";
// } else if (pw.trim() === "") {
// throw "Sie müssen ein Passwort eintragen!";
// } else if (strasse.trim() === "") {
// throw "Sie müssen einen Strassennamen eintragen!";
// } else if (hausnummer.trim() === "") {
// throw "Sie müssen eine Hausnummer eintragen!";
// } else if (postleitzahl.trim() === "") {
// throw "Sie müssen eine PLZ eintragen!";
// } else if (ort.trim() === "") {
// throw "Sie müssen einen Ort eintragen!";
// } else if (land.trim() === "") {
// throw "Sie müssen ein Land eintragen!";
//		
// } else {
// if(nachname.match (/\d/)){
// throw "Der Nachname darf keine Zahlen entahlten.";
// } else if (nachname.match (/\W+/)){
// throw "Der Nachname darf keine Sonderzeichen entahlten." ;
//			
// } else if (vorname.match (/\d/)) {
// throw "Der Vorname darf keine Zahlen entahlten.";
// } else if (vorname.match (/\W+/)){
// throw "Der Nachname darf keine Sonderzeichen entahlten.";
// }
// }
// } catch (e){
// // message.innerHTML = "Es ist etwas schief gelaufen!" + e.message;
////		e.printStackTrace();
//		alert("Es ist etwas schief gelaufen!");
//	}


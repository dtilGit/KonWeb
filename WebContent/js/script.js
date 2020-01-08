"use strict";

//document.addEventListener("DOMContentLoaded", pruefedaten);
//
//function init(){
//	var nachname1 = document.getElementById("nachname");
////	The focus() method is used to give focus to an element (if it can be focused).
////
////	Tip: Use the blur() method to remove focus from an element.
//	nachname1.focus();
//	nachname1.addEventListener("blur", zeichenCheck);
//	
//}
//https://wiki.selfhtml.org/wiki/JavaScript/DOM/Event/blur --> Erklärung für die Blur und focus

//function zeichenCheck(){
//	var nachname2 = document.getElementById("nachname").value;
//	var ausgabe = document.getElementById("nachname2");
//	var zeichen = /^[A-Za-z\s]+$/;
//	if(nachname2.match(zeichen)){
//		ausgabe.innerHTML = "passt";
//	}else {
//		ausgabe.innerHTML="Bitte nur Buchstaben";
////		event.preventDefault();		
//	}
//
//}

function pruefedaten(){
	var nachname = document.getElementById("nachname").value;
	var vorname = document.getElementById("vorname").value;
	var strasse = document.getElementById("strasse").value;
	var hausnummer = document.getElementById("hausnummer").value;
	var postleitzahl = document.getElementById("postleitzahl").value;
	var ort = document.getElementById("ort").value;
	var land = document.getElementById("land").value;

	if (nachname.trim() === "") {
		alert("Sie müssen einen Nachnamen eintragen!");
	} else if (vorname.trim() === "") {
		alert("Sie müssen einen Vornamen eintragen!");
	} else if (strasse.trim() === "") {
		alert("Sie müssen einen Strassennamen eintragen!");
	} else if (hausnummer.trim() === "") {
		alert("Sie müssen eine Hausnummer eintragen!");
	} else if (postleitzahl.trim() === "") {
		alert("Sie müssen eine PLZ eintragen!");
	} else if (ort.trim() === "") {
		alert("Sie müssen einen Ort eintragen!");
	} else if (land.trim() === "") {
		alert("Sie müssen ein Land eintragen!");
	} else{
		
	}
}


function pruefereg(){
	var nachname = document.getElementById("nachnamereg").value;
	var vorname = document.getElementById("vornamereg").value;
	var email = document.getElementById("emailreg").value;
	var pw = document.getElementById("pwreg").value;
	var strasse = document.getElementById("strassereg").value;
	var hausnummer = document.getElementById("hausnrreg").value;
	var postleitzahl = document.getElementById("plzreg").value;
	var ort = document.getElementById("ortreg").value;
	var land = document.getElementById("landreg").value;

	if (nachname.trim() === "") {
		alert("Sie müssen einen Nachnamen eintragen!");
	} else if (vorname.trim() === "") {
		alert("Sie müssen einen Vornamen eintragen!");
	} else if (email.trim() === "") {
		alert("Sie müssen eine Email eintragen!");
	} else if (pw.trim() === "") {
		alert("Sie müssen ein Passwort eintragen!");
	} else if (strasse.trim() === "") {
		alert("Sie müssen einen Strassennamen eintragen!");
	} else if (hausnummer.trim() === "") {
		alert("Sie müssen eine Hausnummer eintragen!");
	} else if (postleitzahl.trim() === "") {
		alert("Sie müssen eine PLZ eintragen!");
	} else if (ort.trim() === "") {
		alert("Sie müssen einen Ort eintragen!");
	} else if (land.trim() === "") {
		alert("Sie müssen ein Land eintragen!");
		
	} else {
		if(nachname.match (/\d/)){
			throw "Der Nachname darf keine Zahlen entahlten.";
		} else if (nachname.match (/\W+/)){
			throw "Der Nachname darf keine Sonderzeichen entahlten." ;
			
		} else if (vorname.match (/\d/)) {
			alert("Der Vorname darf keine Zahlen entahlten.");
		} else if (vorname.match (/\W+/)){
			alert("Der Nachname darf keine Sonderzeichen entahlten.");
		}
		
			
	}
}
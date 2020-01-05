"use strict";

document.addEventListener("DOMContentLoaded", init);

function init(){
	var nachname1 = document.getElementById("nachname");
//	The focus() method is used to give focus to an element (if it can be focused).
//
//	Tip: Use the blur() method to remove focus from an element.
	nachname1.focus();
	nachname1.addEventListener("blur", zeichenCheck);
	
}
//https://wiki.selfhtml.org/wiki/JavaScript/DOM/Event/blur --> Erklärung für die Blur und focus

function zeichenCheck(){
	var nachname2 = document.getElementById("nachname").value;
	var ausgabe = document.getElementById("nachname2");
	var zeichen = /^[A-Za-z\s]+$/;
	if(nachname2.match(zeichen)){
		ausgabe.innerHTML = "passt";
	}else {
		ausgabe.innerHTML="Bitte nur Buchstaben";
//		event.preventDefault();		
	}
}
/**
 *David Häusler
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init() {
	var datenform = document.getElementById("knt_form");
	datenform.addEventListener("submit", checkkntform);
	datenform.addEventListener("submit", checkkntemail);

}

// hier wird das Kontakt Form auf Eingaben geprüft
function checkkntform(event) {
	var nachname = document.getElementById("knt_nachname").value;
	var vorname = document.getElementById("knt_vorname").value;
	
	//var onlyletters = /[\W]^[A-Za-z0-9_äÄöÖüÜß]/;
	//var onlyletters = /^\w+([^a-zA-Z0-9öäüßÖÄÜ. '-]+)$/;
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
	} 
	else {
//		alert("Sie haben ihre Daten erfolgreich eingepflegt!");
	}

}


function checkkntemail(event){
	var email = document.getElementById("knt_email").value;
	var emailzeichen = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	if(email.match(emailzeichen)){
		//alert("Sie haben ihre Daten erfolgreich eingepflegt!");
	}else{
		alert("Die Email hat kein korrektes Format. Vor dem @ darf kein Sonderzeichen außer . - stehen! Genauso wie hinter dem @! Zusätzlich muss ein . in deinem Domäne Part existieren!");
		event.preventDefault();
		return;
	}
}



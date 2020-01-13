/**
 *Veronika Tschemodanov + David Häusler
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init() {
	var datenform = document.getElementById("addArticle");
	datenform.addEventListener("submit", checkpreis);
}
function checkpreis(event) {
	var preis = document.getElementById("preis").value;
	//var pruefen = //;
	var pruefen = /^\d{1,3}[\.]\d{2}$/;
	
	if (preis.match(pruefen)) {
//		alert("preis richtig!");
	} else {
		alert("Der Preis muss ein Komma und zwei Nachkommastellen enthalten.");
	
	event.preventDefault();
	return;
	}
}
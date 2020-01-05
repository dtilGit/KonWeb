/**
 * Veronika Tschemodanov
 */

"use strict";
document.addEventListener("DOMContentLoaded", init);
function init() {
	var passwort = document.getElementById("passwort");
	passwort.addEventListener("submit", passwortChecker);
}
function passwortChecker() {
	var pw = document.getElementById("passwor");

	if (pw.length > 7) {
		if (pw.match(/\d{1,}/) && pw.match(/[A-Za-z]{1,}/)) {

		} else {
			alert("Passwort entpsricht nicht den Anforderungn");
		}
	}
}
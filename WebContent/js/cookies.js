//"use strict";
//
//document.addEventListener("DOMContentLoaded", init);
//
//function init() {
//	// navigator = object, contains the information about the browser
//	// cookieEnabled: Determines whether cookies are enabled in the browse
//	if (navigator.cookieEnabled === true) {
//		document.getElementById("cookiebox").className = "hidden";
//
//	} else {
//		document.getElementById("cookiebox").className = "show";
//
//		var cookiebutton = document.getElementById("cookiebutton");
//		cookiebutton.addEventListener("click", cookieButton);
//	}
//}
//
//function cookieButton() {
//	document.getElementById("cookiebox").className = "hidden";
//}

/**
 *alle
 */
"use strict";
document.addEventListener("DOMContentLoaded", init);

function init() {
	// navigator = object, contains the information about the browser
	if (navigator.cookieEnabled === false) {
		alert("Wir nutzen Cookies auf unserer Webseite, um diese laufend für Sie zu verbessern! Schalte daher bitte die Cookies ein!");
//	} else {
//		alert("Wir verwenden Cookies. Mit deiner Nutzung unserer Website gehen wir davon aus, dass du unserer Cookie-Richtlinie zustimmst.");
	}
}

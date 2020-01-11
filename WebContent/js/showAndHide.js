/**
 * Tilman Dewes
 */

"use strict";

/**
 * document.getElementById("artikeluebersicht_anzeigen").addEventListener("click",
 * showArtikeluebersicht);
 */
function showArtikeluebersicht() {
	document.getElementById("artikeluebersicht").className = "show";
}

function hideArtikeluebersicht() {
	document.getElementById('artikeluebersicht').className = "hidden";
}

function showKategorieuebersicht() {
	document.getElementById('kategorieuebersicht').className = "show";
}

function hideKategorieuebersicht() {
	document.getElementById('kategorieuebersicht').className = "hidden";
}

function showAddArtikel() {
	document.getElementById('artikelHinzufuegen').className = "show";
}

function hideAddArtikel() {
	document.getElementById('artikelHinzufuegen').className = "hidden";
}

function showDeleteArtikel() {
	document.getElementById('artikelEntfernen').className = "show";
}

function hideDeleteArtikel() {
	document.getElementById('artikelEntfernen').className = "hidden";
}

function showAddKategorie() {
	document.getElementById('kategorieHinzufuegen').className = "show";
}

function hideAddKategorie() {
	document.getElementById('kategorieHinzufuegen').className = "hidden";
}

function showDeleteKategorie() {
	document.getElementById('kategorieLoeschen').className = "show";
}

function hideDeleteKategorie() {
	document.getElementById('kategorieLoeschen').className = "hidden";
}
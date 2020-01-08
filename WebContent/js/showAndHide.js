/**
 * Tilman Dewes
 */

"use strict";

/**
 * document.getElementById("artikeluebersicht_anzeigen").addEventListener("click",
 * showArtikeluebersicht);
 */
function showArtikeluebersicht() {
	document.getElementById("artikeluebersicht").style.display = "inline";
}

function hideArtikeluebersicht() {
	document.getElementById('artikeluebersicht').style.display = 'none';
}

function showKategorieuebersicht() {
	document.getElementById('kategorieuebersicht').style.display = 'inline';
}

function hideKategorieuebersicht() {
	document.getElementById('kategorieuebersicht').style.display = 'none';
}

function showAddArtikel() {
	document.getElementById('artikelHinzufuegen').style.display = 'inline';
}

function hideAddArtikel() {
	document.getElementById('artikelHinzufuegen').style.display = 'none';
}

function showDeleteArtikel() {
	document.getElementById('artikelLoeschen').style.display = 'inline';
}

function hideDeleteArtikel() {
	document.getElementById('artikelLoeschen').style.display = 'none';
}

function showAddKategorie() {
	document.getElementById('kategorieHinzufuegen').style.display = 'inline';
}

function hideAddKategorie() {
	document.getElementById('kategorieHinzufuegen').style.display = 'none';
}

function showDeleteKategorie() {
	document.getElementById('kategorieLoeschen').style.display = 'inline';
}

function hideDeleteKategorie() {
	document.getElementById('kategorieLoeschen').style.display = 'none';
}
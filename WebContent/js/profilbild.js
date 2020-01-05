/**
 * Veronika Tschemodanov
 */

"use strict";
document.addEventListener("DOMCOntentLoaded",init);

function init(){
	var form = document.getElementById("" +
			"profilbearbeiten");
	form.addEventListener("profiledit_submit", formatPruefen);
}

function formatPruefen(evt){
	var bild1 = document.getElementById("profilBild").value;
	//die Endung der Bildbezeichnung rauslesen 
	var bild2 = bild1.substring(bild1.lastIndexOf("."), bild1.length)
	
	if(bild2 == ".jpg" || bild2 == ".png" || bild2 == ".jpeg" || bild2 == ".JPG" || bild2 == ".JPEG" || bild2 == ".PNG"){
		
	}
	else{
		alert("Es werden nur Bilder im Format: jpg, jpeg oder png unterstützt.");
		
		//zum Verhindern des Uploads
		evt.preventDefault();		
	}
}


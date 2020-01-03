package beans;

import java.io.Serializable;
import java.math.BigDecimal;

public class ArtikelBean {
	private static final long serialVersionUID = 1L;
	
	private Integer artikel_id; 
	private String artikel_bezeichnung; 
	private Double preis; 
	private Integer kategorie_id; 
	private Integer lagerbestand;
	private byte[] bild; 
	private String bildname; 
	
	//für "ZumWarenkorbHinzufuegen Z. 81
	public ArtikelBean() {}

	//Constructor für "ZumWarenkorbHinzufuegen Z. 41
	public ArtikelBean(String artikel_bezeichnung, double preis) {
		this.artikel_bezeichnung=artikel_bezeichnung;
		this.preis=preis;
	}

	public Integer getArtikel_id() {
		return artikel_id;
	}

	public void setArtikel_id(Integer artikel_id) {
		this.artikel_id = artikel_id;
	}
	
	public String getArtikelbezeichnung() {
		return artikel_bezeichnung;
	}
	
	//ï¿½nderung von artikel
	public void setArtikelbezeichnung(String artikel_bezeichnung) {
		this.artikel_bezeichnung = artikel_bezeichnung;
	}
	
	public Double getPreis() {
		return preis;
	}
	public void setPreis(Double preis) {
		this.preis = preis;
	}
	
	public Integer getKategorie_id() {
		return kategorie_id;
	}
	public void setKategorie_id(Integer kategorie_id) {
		this.kategorie_id = kategorie_id;
	}
	
	public Integer getLagerbestand() {
		return lagerbestand;
	}
	public void setLagerbestand(Integer lagerbestand) {
		this.lagerbestand = lagerbestand;
	}

	public byte[] getBild() {
		return bild;
	}

	public void setBild(byte[] bild) {
		this.bild = bild;
	}

	public String getBildname() {
		return bildname;
	}

	public void setBildname(String bildname) {
		this.bildname = bildname;
	}
	
}
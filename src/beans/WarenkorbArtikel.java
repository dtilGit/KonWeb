//Veronika Tschemodanov
package beans;

import java.io.Serializable;
import java.util.LinkedList;

public class WarenkorbArtikel implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String wk_size;
	private ArtikelBean wk_artikel;
	private Integer wk_art_anzahl;
	private Double wk_art_preis; 
	private LinkedList<WarenkorbArtikel> warenkorbList;
	
//	public WarenkorbArtikel(Double wk_art_preis, Integer wk_art_anzahl, Integer artikel_id) {
//		super();
//		this.wk_art_preis = wk_art_preis;
//		this.wk_art_anzahl = wk_art_anzahl;
//		artikel_id = wk_artikel.getArtikel_id();
//	}
	
	public Integer getWk_art_anzahl() {
		return wk_art_anzahl;
	}
	
	public void setWk_art_anzahl(Integer wk_art_anzahl) {
		this.wk_art_anzahl=wk_art_anzahl;
	}
	
	public WarenkorbArtikel (ArtikelBean wk_artikel) {
		this.wk_artikel = wk_artikel;
	}
	
	public ArtikelBean getWk_artikel() { 
		return wk_artikel;
	}
	
	public void setWk_artikel(ArtikelBean wk_artikel) {
		this.wk_artikel = wk_artikel;
	}
	
	public Integer getMenge() {
		return wk_art_anzahl;
	}
	public Double getWk_art_preis() {
		this.wk_art_preis = getMenge() * wk_artikel.getPreis();
		wk_art_preis = Math.round(100.0 * wk_art_preis) / 100.0;
		return this.wk_art_preis;
	}
	
	public void setWk_art_preis(Double wk_ges_preis) {
		this.wk_art_preis=getMenge() * wk_artikel.getPreis();
		wk_art_preis = Math.round(100.0 * wk_art_preis) / 100.0;
	}
	public String getWk_size() {
		return wk_size;
	}
	
	public void setWk_size(String wk_size) {
		this.wk_size=wk_size;
	}
	
	public void Wk_art_anzahl_erhoehen() {
		wk_art_anzahl++;
	}
	public void WarenkorbLeeren () {
		 	warenkorbList.clear();
		}
	public void Leeren() {
		warenkorbList = null;
	}
	
}

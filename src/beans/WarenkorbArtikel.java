//Veronika Tschemodanov
package beans;

import java.math.BigDecimal;
import java.io.Serializable;

public class WarenkorbArtikel {

	private static final long serialVersionUID = 1L;
	
	private String wk_size;
	private ArtikelBean wk_artikel;
	private Integer wk_art_anzahl;
	private BigDecimal wk_ges_preis; 
	
	
	public Integer getWk_art_anzahl() {
		return wk_art_anzahl;
	}
	
	public void setWk_art_anzahl(Integer wk_art_anzahl) {
		this.wk_art_anzahl=wk_art_anzahl;
	}
	
	//wofuer? 
	public WarenkorbArtikel (ArtikelBean wk_artikel) {
		this.wk_artikel = wk_artikel;
	}
	
	public ArtikelBean getWk_artikel() { 
		return wk_artikel;
	}
	
	public Integer getMenge() {
		return wk_art_anzahl;
	}
	public BigDecimal getWk_ges_preis() {
		this.wk_ges_preis = getWk_art_anzahl() * wk_artikel.getPreis();
		return this.wk_ges_preis;
	}
	
	public void setWk_ges_preis(BigDecimal wk_ges_preis) {
		this.wk_ges_preis=
	}
	public String wk_size() {
		return wk_size;
	}
	
	public void setWk_size(String wk_size) {
		this.wk_size=wk_size;
	}
	
}

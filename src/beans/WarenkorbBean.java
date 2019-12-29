//Veronika Tschemodanov
package beans;

import java.math.BigDecimal;
import java.util.LinkedList;

public class WarenkorbBean {

	private Double ges_preis;
	private Integer wk_groesse;
	private LinkedList<WarenkorbArtikel> warenkorbList;

	// evtl. nicht notwendig
	public WarenkorbBean() {
		warenkorbList = new LinkedList<WarenkorbArtikel>();
	}

	// was ist die Shopping_ID??
	public WarenkorbBean(Double ges_preis, Integer wk_groesse, Integer shopping_ID,
			LinkedList<WarenkorbArtikel> warenkorb) {
		super();
		this.ges_preis = ges_preis;
		this.wk_groesse = wk_groesse;
		warenkorbList = warenkorbList;
	}

	public WarenkorbBean(LinkedList<WarenkorbArtikel> warenkorbList) {
		this.warenkorbList = warenkorbList;
	}

	public LinkedList<WarenkorbArtikel> getWarenkorbList() {
		return warenkorbList;
	}

	public void setWarenkorbList(LinkedList<WarenkorbArtikel> warenkorbList) {
		this.warenkorbList = warenkorbList;
	}

	// Iterieren über die Liste
	public Double getGes_preis() {
		ges_preis = 0.0;
		for (WarenkorbArtikel korbIter : warenkorbList) {
			ges_preis = ges_preis + korbIter.getWk_art_preis();
		}
		return ges_preis;
	}

	public void setGes_preis(Double ges_preis) {
		this.ges_preis = ges_preis;
	}

	public Integer getWk_groesse() {
		wk_groesse = 0;
		for (WarenkorbArtikel korbIter : warenkorbList) {
			wk_groesse = wk_groesse + korbIter.getWk_art_anzahl();
		}
		return wk_groesse;
	}
	
	public void setWk_groesse (Integer wk_groesse) {
		this.wk_groesse = wk_groesse;
	}
	 
	//Korb leeren
	//public void WarenkorbLeeren () {
	// 	warenkorbList.clear();
	//}
}

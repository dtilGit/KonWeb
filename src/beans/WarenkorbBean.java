package beans;

import java.math.BigDecimal;
import java.util.LinkedList;

public class WarenkorbBean {

	private Double ges_preis;
	private Integer wk_groesse;
	private LinkedList<WarenkorbArtikel> warenkorbList;
	private Double preis;

	
	public Double getPreis() {
		ges_preis = 0.00;
		for (WarenkorbArtikel korbIter : warenkorbList) {
			ges_preis = ges_preis + korbIter.getWk_art_preis();
		}
		preis = ges_preis + 3.99;
		preis = Math.round(100.0 * preis) / 100.0;
		return preis;
	}
	
	public void setPreis(Double preis) {
		this.preis=preis;
	}
	
	// evtl. nicht notwendig
	public WarenkorbBean() {
		warenkorbList = new LinkedList<WarenkorbArtikel>();
	}

	public WarenkorbBean(Double ges_preis, Integer wk_groesse,
			LinkedList<WarenkorbArtikel> warenkorbList2) {
		super();
		this.ges_preis = ges_preis;
		this.wk_groesse = wk_groesse;
		warenkorbList = warenkorbList2;
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
		ges_preis = 0.00;
		for (WarenkorbArtikel korbIter : warenkorbList) {
			ges_preis = ges_preis + korbIter.getWk_art_preis();
		}
//		if (ges_preis < 60) {
//			ges_preis = 3.99 + ges_preis;
//		}
		ges_preis = Math.round(100.0 * ges_preis) / 100.0;
		return ges_preis;
	}

	public void setGes_preis(Double ges_preis) {
		this.ges_preis = ges_preis;
	}

	public Integer getWk_groesse() {
		wk_groesse = 0;
		for (WarenkorbArtikel korbIter : warenkorbList) {
			wk_groesse = wk_groesse + korbIter.getMenge();
		}
		return wk_groesse;
	}
	
	public void setWk_groesse (Integer wk_groesse) {
		this.wk_groesse = wk_groesse;
	}
	 
	//Korb leeren
	public void WarenkorbLeeren () {
	 	warenkorbList.clear();
	}
}

//Veronika Tschemodanov
package beans;

import java.math.BigDecimal;
import java.util.LinkedList;

public class WarenkorbBean {

	private BigDecimal ges_preis;
	private Integer wk_groessse;
	private LinkedList<WarenkorbArtikel> warenkorbList;
	
	//evtl. nicht notwendig
	public WarenkorbBean() {
		warenkorbList = new LinkedList<WarenkorbArtikel>();
	}
	
	//was ist die Shopping_ID??
	public WarenkorbBean(BigDecimal ges_preis, Integer wk_groesse, Integer shopping_ID, LinkedList<WarenkorbArtikel> warenkorb) {
		this.ges_preis=ges_preis;
		this.wk_groessse=wk_groesse;
		warenkorbList = warenkorb;
	}
	
	public WarenkorbBean (LinkedList <WarenkorbArtikel> warenkorbList) {
		this.warenkorbList= warenkorbList;
	}
	
	public LinkedList<WarenkorbArtikel> getWarenkorbList(){
		return warenkorbList;
	}
	
	public void setWarenkorbList(LinkedList<WarenkorbArtikel> warenkorbList) {
		this.warenkorbList=warenkorbList;
	}
	
	public BigDecimal getGes_preis() {
		ges_preis=0.0;
		
		
	}
}
	

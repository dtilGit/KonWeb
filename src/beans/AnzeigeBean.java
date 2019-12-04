package beans;
import java.io.Serializable;
import java.util.List;

import beans.ArtikelBean;

public class AnzeigeBean {

	private static final long serialVersionUID = 1L;
	private List<KategorieBean> kategorie;
	private List<ArtikelBean> artikel;
	
	public List<KategorieBean> getKategorie() {
		return kategorie;
	}

	public void setKategorie(List<KategorieBean> kategorie) {
		this.kategorie = kategorie;
	}
	
	public List<ArtikelBean> getArtikel() {
		return artikel;
	}

	public void setArtikel(List<ArtikelBean> artikel) {
		this.artikel = artikel;
	}
}

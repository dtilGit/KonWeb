//Veronika Tschemodanov
package beans;

public class WarenkorbBean {

	private int wk_id;
	private int kunde_id;
	private int artikel_id;
	private double summe;
	private int anzahl;
	private double ges_preis;

	public int getWk_id() {
		return wk_id;
	}

	public void setWk_id(int wk_id) {
		this.wk_id = wk_id;
	}

	public int getKunde_id() {
		return kunde_id;
	}

	public void setKunde_id(int kunde_id) {
		this.kunde_id = kunde_id;
	}

	public int getArtikel_id() {
		return artikel_id;
	}

	public void setArtikel_id(int artikel_id) {
		this.artikel_id = artikel_id;
	}

	public int getAnzahl() {
		return anzahl;
	}

	public void setAnzahl(int anzahl) {
		this.anzahl = anzahl;
	}

	public double getSumme() {
		return summe;
	}

	public void setSumme(double summe) {
		this.summe = summe;
	}

	public double getGes_preis() {
		return ges_preis;
	}

	public void setGes_preis(double ges_preis) {
		this.ges_preis = ges_preis;
	}

}

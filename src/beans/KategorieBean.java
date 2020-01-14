//David Häusler
package beans;

public class KategorieBean {
	private static final long serialVersionUID = 1L;
	private int kategorie_id;
	private String kategoriebezeichnung;
	private String geschlecht;
	
	public String getGeschlecht() {
		return geschlecht;
	}
	public void setGeschlecht(String geschlecht) {
		this.geschlecht = geschlecht;
	}
	public Integer getKategorie_id() {
		return kategorie_id;
	}
	public void setKategorie_id(Integer kategorie_id) {
		this.kategorie_id = kategorie_id;
	}
	public String getKategoriebezeichnung() {
		return kategoriebezeichnung;
	}
	public void setKategoriebezeichnung(String kategoriebezeichnung) {
		this.kategoriebezeichnung = kategoriebezeichnung;
	}
	

}

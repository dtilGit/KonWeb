//Veronika Tschemodanov
package beans;

import java.io.Serializable;

public class RegistrBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String geschlecht;
	private String titel;
	private String nachname;
	private String vorname;
	private String email;
	private String passwort;
	private String passwort2;
	private String strasse;
	private String hausnummer;
	private String postleitzahl;
	private String ort;
	private String land;
	private int admin;
	private WarenkorbBean warenkorb;
	private String fehlermeldung;
	private byte[] bild; 
	private String bildname; 

	public void setFehlermeldung(String fehlermeldung) {
		this.fehlermeldung = fehlermeldung;
	}

	public String getFehlermeldung() {
		return this.fehlermeldung;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public int getAdmin() {
		return this.admin;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGeschlecht() {
		return this.geschlecht;
	}

	public void setGeschlecht(String geschlecht) {
		this.geschlecht = geschlecht;
	}

	public String getTitel() {
		return this.titel;
	}

	public void setTitel(String titel) {
		this.titel = titel;
	}

	public String getNachname() {
		return this.nachname;
	}

	public void setNachname(String nachname) {
		this.nachname = nachname;
	}

	public String getVorname() {
		return this.vorname;
	}

	public void setVorname(String vorname) {
		this.vorname = vorname;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswort() {
		return this.passwort;
	}

	public void setPasswort(String passwort) {
		this.passwort = passwort;
	}

	public String getPasswort2() {
		return this.passwort2;
	}

	public void setPasswort2(String passwort2) {
		this.passwort2 = passwort2;
	}
	public String getStrasse() {
		return this.strasse;
	}

	public void setStrasse(String strasse) {
		this.strasse = strasse;
	}

	public String getHausnummer() {
		return this.hausnummer;
	}

	public void setHausnummer(String hausnummer) {
		this.hausnummer = hausnummer;
	}

	public String getPostleitzahl() {
		return this.postleitzahl;
	}

	public void setPostleitzahl(String postleitzahl) {
		this.postleitzahl = postleitzahl;
	}

	public String getOrt() {
		return this.ort;
	}

	public void setOrt(String ort) {
		this.ort = ort;
	}

	public WarenkorbBean getWarenkorb() {
		return warenkorb;
	}

	public void setWarenkorb(WarenkorbBean warenkorb) {
		this.warenkorb = warenkorb;
	}

	public String getLand() {
		return this.land;
	}

	public void setLand(String land) {
		this.land = land;
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

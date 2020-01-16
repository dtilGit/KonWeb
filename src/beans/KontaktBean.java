//David Häusler
package beans;

import java.io.Serializable;

public class KontaktBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int knt_id;
	private String knt_nachname;
	private String knt_vorname;
	private String knt_email;
	private String knt_betreff;
	private String knt_nachricht;
	private String knt_grund;


	public int getKnt_Id() {
		return knt_id;
	}

	public void setKnt_id(int knt_id) {
		this.knt_id = knt_id;
	}

	public String getKnt_nachname() {
		return knt_nachname;
	}

	public void setKnt_nachname(String knt_nachname) {
		this.knt_nachname = knt_nachname;
	}

	public String getKnt_vorname() {
		return knt_vorname;
	}

	public void setKnt_vorname(String knt_vorname) {
		this.knt_vorname = knt_vorname;
	}

	public String getKnt_email() {
		return knt_email;
	}

	public void setKnt_email(String knt_email) {
		this.knt_email = knt_email;
	}

	public String getKnt_betreff() {
		return knt_betreff;
	}

	public void setKnt_betreff(String knt_betreff) {
		this.knt_betreff = knt_betreff;
	}

	public String getKnt_nachricht() {
		return knt_nachricht;
	}

	public void setKnt_nachricht(String knt_nachricht) {
		this.knt_nachricht = knt_nachricht;
	}

	public String getKnt_grund() {
		return knt_grund;
	}

	public void setKnt_grund(String knt_grund) {
		this.knt_grund = knt_grund;
	}
}

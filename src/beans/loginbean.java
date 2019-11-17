package beans;

import java.io.Serializable;

public class loginbean implements Serializable{
	private static final long serialVersionUID = 1L;
	private String email;
	private String passwort;
	private String fehlermeldung;
	
	public void setEmail(String email){
		this.email = email;
	}
	
	 public String getEmail() {
	        return this.email;
	    }
	
	public void setPasswort(String passwort){
		this.passwort=passwort;
	}
	
	 public String getPasswort() {
	        return this.passwort;
	    }
	
	public void setFehlermeldung(String fehlermeldung){
		this.fehlermeldung=fehlermeldung;
	}
	
	 public String getFehlermeldung() {
	        return this.fehlermeldung;
	    }
}


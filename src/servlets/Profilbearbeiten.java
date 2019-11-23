package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Registrbean;

/**
 * Servlet implementation class Profilbearbeiten
 */
@WebServlet("/Profilbearbeiten")
public class Profilbearbeiten extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//die Änderungseingaben in "request" speichern
		request.setCharacterEncoding("UTF-8");
		
		Registrbean profiledit = new Registrbean();
		HttpSession session = request.getSession();
		
		RequestDispatcher disp; 
		
		String geschlecht = request.getParameter("geschlecht");
		String titel = request.getParameter("titel");
		String nachname  = request.getParameter("nachname");
		String vorname  = request.getParameter("vorname");
		String email  = request.getParameter("email");
		String strasse  = request.getParameter("strasse");
		String hausnummer  = request.getParameter("hausnummer");
		String ort  = request.getParameter("ort");
		String land  = request.getParameter("land");
	
		profiledit.setGeschlecht(geschlecht);
		profiledit.setTitel(titel);
		profiledit.setNachname(nachname);
		profiledit.setVorname(vorname);
		profiledit.setEmail(email);
		profiledit.setStrasse(strasse);
		profiledit.setHausnummer(hausnummer);
		profiledit.setOrt(ort);
		profiledit.setLand(land);
		//Statusüberprüfung -> Eingelogt oder nicht ??? Notwendig oder nicht?
		
		
		
		
	}

}

package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import beans.RegistrBean;

/**
 * Servlet implementation class Profilbearbeiten
 */
@WebServlet("/ProfilBearbeiten")
public class ProfilBearbeiten extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher disp; 
	
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	DataSource datasource;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//die Änderungseingaben in "request" speichern
		request.setCharacterEncoding("UTF-8");
		
		RegistrBean profiledit = new RegistrBean();
		HttpSession session = request.getSession();
		
		RegistrBean kunde = (RegistrBean)session.getAttribute("login"); 
		int id = kunde.getId();
		
		String geschlecht = request.getParameter("geschlecht");
		String titel = request.getParameter("titel");
		String nachname  = request.getParameter("nachname");
		String vorname  = request.getParameter("vorname");
		//String email  = request.getParameter("email");
		String strasse  = request.getParameter("strasse");
		String hausnummer  = request.getParameter("hausnummer");
		String postleitzahl = request.getParameter("postleitzahl");
		String ort  = request.getParameter("ort");
		String land  = request.getParameter("land");
		
	
		profiledit.setGeschlecht(geschlecht);
		profiledit.setTitel(titel);
		profiledit.setNachname(nachname);
		profiledit.setVorname(vorname);
		//profiledit.setEmail(email);
		profiledit.setStrasse(strasse);
		profiledit.setHausnummer(hausnummer);
		profiledit.setOrt(ort);
		profiledit.setPostleitzahl(postleitzahl);
		profiledit.setLand(land);
		profiledit.setId(id);
		
		//Statusüberprüfung -> Eingelogt oder nicht ??? Notwendig oder nicht?
		
		try (Connection con = datasource.getConnection();
			PreparedStatement pstmt = con.prepareStatement("UPDATE thidb.kunde SET geschlecht = COALESCE(NULLIF(?, ''), geschlecht), titel = COALESCE(NULLIF(?, ''),titel), nachname = COALESCE(NULLIF(?, ''), nachname),vorname = COALESCE(NULLIF(?, ''),vorname), strasse = COALESCE(NULLIF(?, ''), strasse), hausnummer = COALESCE(NULLIF(?, ''), hausnummer), postleitzahl = COALESCE(NULLIF(?, ''),postleitzahl), ort=COALESCE (NULLIF (?, ''), ort), land= COALESCE (NULLIF?, ''), land) WHERE id=?")){
				pstmt.setString(1, profiledit.getGeschlecht());
				pstmt.setString(2, profiledit.getTitel());
				pstmt.setString(3, profiledit.getNachname());
				pstmt.setString(4, profiledit.getVorname());
				pstmt.setString(5, profiledit.getStrasse());
				pstmt.setString(6, profiledit.getHausnummer());
				pstmt.setString(7, profiledit.getPostleitzahl());
				pstmt.setString(8, profiledit.getOrt());
				pstmt.setString(9, profiledit.getPostleitzahl());
				pstmt.setString(10, profiledit.getLand());
				pstmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("profiledit", profiledit);
		
		final RequestDispatcher dispatcher = request.getRequestDispatcher("/user/profilansehen.jsp");
		dispatcher.forward(request, response);
	}

}

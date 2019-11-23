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

import beans.Registrbean;

/**
 * Servlet implementation class Profilbearbeiten
 */
@WebServlet("/Profilbearbeiten")
public class Profilbearbeiten extends HttpServlet {
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
		
		Registrbean profiledit = new Registrbean();
		HttpSession session = request.getSession();
		
		Registrbean kunde = (Registrbean)session.getAttribute("login"); 
		int id = kunde.getId();
		
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
		profiledit.setId(id);
		
		//Statusüberprüfung -> Eingelogt oder nicht ??? Notwendig oder nicht?
		
		try (Connection con = datasource.getConnection();
			PreparedStatement pstmt = con.prepareStatement("UPDATE kunde SET geschlecht =?, titel=?, nachname=?, vorname=?, strasse=?, hausnummer=?, ort=?, land=? WHERE id=?")){
				pstmt.setString(1, profiledit.getGeschlecht());
				pstmt.setString(2, profiledit.getTitel());
				pstmt.setString(3, profiledit.getNachname());
				pstmt.setString(4, profiledit.getVorname());
				pstmt.setString(5, profiledit.getStrasse());
				pstmt.setString(6, profiledit.getHausnummer());
				pstmt.setString(7, profiledit.getOrt());
				pstmt.setString(8, profiledit.getLand());
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

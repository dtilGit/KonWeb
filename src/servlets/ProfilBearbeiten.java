//Veronika Tschemodanov
package servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import beans.RegistrBean;

/**
 * Servlet implementation class Profilbearbeiten
 */
@WebServlet("/ProfilBearbeiten")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5
* 5, location = "/tmp", fileSizeThreshold = 1024 * 1024)
public class ProfilBearbeiten extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher disp; 
	
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	DataSource datasource;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		System.out.println("===in deGet===");
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//die �nderungseingaben in "request" speichern
		System.out.println("===in duPost===");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		RegistrBean kunde = (RegistrBean)session.getAttribute("login"); 
		RegistrBean profiledit = new RegistrBean();
		
		String geschlecht = request.getParameter("geschlecht");
		profiledit.setGeschlecht(geschlecht);
		
		String titel = request.getParameter("titel");
		profiledit.setTitel(titel);
		
		String nachname  = request.getParameter("nachname");
		profiledit.setNachname(nachname);
		
		String vorname  = request.getParameter("vorname");
		profiledit.setVorname(vorname);
		
		String strasse  = request.getParameter("strasse");
		profiledit.setStrasse(strasse);
		
		String hausnummer  = request.getParameter("hausnummer");
		profiledit.setHausnummer(hausnummer);
		
		String postleitzahl = request.getParameter("postleitzahl");
		profiledit.setPostleitzahl(postleitzahl);
		
		String ort  = request.getParameter("ort");
		profiledit.setOrt(ort);
		
		String land  = request.getParameter("land");
		profiledit.setLand(land);
		
		int kunden_id = kunde.getId();
		profiledit.setId(kunden_id);
		
		Part filepart = request.getPart("profilBild");
		String contenttype = filepart.getContentType();
		
		profiledit.setBildname(filepart.getSubmittedFileName());
		
		try (ByteArrayOutputStream baos = new ByteArrayOutputStream(); InputStream in = filepart.getInputStream()) {
			int i = 0;
			while ((i = in.read()) != -1) {
				baos.write(i);
			}if (contenttype.equalsIgnoreCase("image/png") || contenttype.equalsIgnoreCase("image/jpg")
					|| contenttype.equalsIgnoreCase("image/jpeg")) {

				profiledit.setBild(baos.toByteArray());
				baos.flush();
			} else {
				profiledit.setBild(null);
			}
			profiledit.setBild(baos.toByteArray());
			baos.flush();
		} catch (IOException ex) {
			throw new ServletException(ex.getMessage());
		}
		
		//Status�berpr�fung -> Eingelogt oder nicht ??? Notwendig oder nicht?
		
		try (Connection con = datasource.getConnection();
				PreparedStatement pstmt = con.prepareStatement("UPDATE thidb.kunde SET geschlecht=?, titel=?, nachname=?, vorname=?, strasse=?, hausnummer=?, postleitzahl=?, ort=?, land=?, bildname=?, bild=? WHERE kunde_id=?")){
			//PreparedStatement pstmt = con.prepareStatement("UPDATE thidb.kunde SET geschlecht = COALESCE(NULLIF(?, ''), geschlecht), titel = COALESCE(NULLIF(?, ''),titel), nachname = COALESCE(NULLIF(?, ''), nachname),vorname = COALESCE(NULLIF(?, ''),vorname), strasse = COALESCE(NULLIF(?, ''), strasse), hausnummer = COALESCE(NULLIF(?, ''), hausnummer), postleitzahl = COALESCE(NULLIF(?, ''),postleitzahl), ort=COALESCE (NULLIF (?, ''), ort), land= COALESCE (NULLIF?, ''), land) WHERE id=?")){
			System.out.println("===in Try===");	
				pstmt.setString(1, profiledit.getGeschlecht());
				pstmt.setString(2, profiledit.getTitel());
				pstmt.setString(3, profiledit.getNachname());
				pstmt.setString(4, profiledit.getVorname());
				pstmt.setString(5, profiledit.getStrasse());
				pstmt.setString(6, profiledit.getHausnummer());
				pstmt.setString(7, profiledit.getPostleitzahl());
				pstmt.setString(8, profiledit.getOrt());
				pstmt.setString(9, profiledit.getLand());
				pstmt.setString(10, profiledit.getBildname());
				pstmt.setBytes(11, profiledit.getBild());
				pstmt.setInt(12, profiledit.getId());
				pstmt.executeUpdate();
				System.out.println("===in con===");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("login", kunde);
		
		final RequestDispatcher dispatcher = request.getRequestDispatcher("user/profilansehen.jsp");
		dispatcher.forward(request, response);
	}

}
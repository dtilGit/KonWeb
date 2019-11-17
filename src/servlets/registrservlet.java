package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.registrbean;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

//Servlet-Annotation: 
@WebServlet("/registrservlet")

public class registrservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Resource(lookup = "jdbc/MyTHIPool")
	private DataSource ds;
	
	//Warum kommt ein Fehler "HTTP Status 405 - HTTP method GET is not supported by this URL", wenn diese Methode fehlt?
	//trotzdem, dass die doPost-Methode verwendet werden soll
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//this.doPost(request,response);}
		doGet(request, response);}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // In diesem Format erwartet das Servlet jetzt die Formulardaten
		System.out.println("vor bean");
		registrbean regform = new registrbean();
		//speichern der Folumardaten in die Bohne "form"
		
		
		regform.setGeschlecht(request.getParameter("geschlecht"));
		regform.setTitel(request.getParameter("titel"));
		regform.setNachname(request.getParameter("nachname"));
		regform.setVorname(request.getParameter("vorname"));
		regform.setEmail(request.getParameter("email"));
		regform.setPasswort(request.getParameter("passwort"));
		regform.setStrasse(request.getParameter("strasse"));
		regform.setHausnummer(request.getParameter("hausnummer"));
		regform.setOrt(request.getParameter("ort"));
		regform.setLand(request.getParameter("land"));
		//Admin-Wert auf Null setzen, damit jeder "normale" Kunde durch diesen Wert beim Login vom Admin unterschieden werden kann
		regform.setAdmin(0);
		
		//Überprüfung der E-Mail 
		try (Connection con = ds.getConnection();
				//um Datenzugriff mitHilfe von SQl zu ermöglichen
				PreparedStatement psmt = con.prepareStatement("SELECT * FROM thidb.kunde WHERE email = ?")) {
			psmt.setString(1,regform.getEmail());
			
			ResultSet rs=psmt.executeQuery();
			//executeQuery --> lesen aus der Datenbank: bei Select
			
				//Wenn die E-Mail nicht bereits vorhanden ist und die Passwörter identisch sind, dann kann die Registrierung fortlaufen
				if (!rs.next()) {
					String[] generatedKeys = new String[] { "id" }; // Name der Spalte(n), die automatisch generiert wird(werden)

					try (Connection con2 = ds.getConnection();  
									
							PreparedStatement pstmt = con2.prepareStatement(
									"INSERT INTO thidb.kunde (geschlecht, titel, nachname,vorname, email, passwort, strasse, hausnummer, postleitzahl, ort, land, admin ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)", generatedKeys)) {

						// Zugriff Ã¼ber Klasse java.sql.PreparedStatement
						pstmt.setString(1, regform.getGeschlecht());
						pstmt.setString(2, regform.getTitel());
						pstmt.setString(3, regform.getNachname());
						pstmt.setString(4, regform.getVorname());
						pstmt.setString(5, regform.getEmail());
						pstmt.setString(6, regform.getPasswort());
						pstmt.setString(7, regform.getStrasse());
						pstmt.setString(8, regform.getHausnummer());
						pstmt.setString(9, regform.getPostleitzahl());
						pstmt.setString(10, regform.getOrt());
						pstmt.setString(11, regform.getLand());
						pstmt.setInt(12, regform.getAdmin());
						pstmt.executeUpdate();
						
						//System.out.println("nach execute");
						// Generierte(n) Schlüssel auslesen (funktioniert nur mit PreparedStatement)
						try (ResultSet rs2 = pstmt.getGeneratedKeys()) {
							while (rs2.next()) {
								regform.setId(rs.getInt(1));
							}
						}
					} catch (Exception ex) {
						throw new ServletException(ex.getMessage());}
					
						// Weiterleiten an JSP
						RequestDispatcher dispatcher = request.getRequestDispatcher("/user/registrierung_antwort.jsp");
						dispatcher.forward(request, response);
					
			} else if (rs.next()){
				RequestDispatcher dispatcher = request.getRequestDispatcher("/user/fehlerEmail.jsp");
				dispatcher.forward(request, response);
			} 
			//System.out.println("nach elseif");
			// Scope Session 
			HttpSession session = request.getSession();
			session.setAttribute("regform", regform);

			// Weiterleiten an JSP
			//final RequestDispatcher dispatcher = request.getRequestDispatcher("/user/registrierung_antwort.jsp");
			//dispatcher.forward(request, response);
			
		}catch (Exception e) { 
			e.printStackTrace();
		}
	}
	}
	
	/*
	private registrbean checkUser (String email) throws ServletException{
		registrbean registruser = new registrbean();
		
		//Überprüfung, ob bereits registriert
		try (Connection con = ds.getConnection();
				PreparedStatement pstm = con.prepareStatement("Select * FROM thidb.kunde WHERE email = ?")){
				pstm.setString(1, email);
				ResultSet rs = pstm.executeQuery();
				if(rs.next()){
					registruser.setFehlermeldung("Kunde mit dieser E-Mail-Adresse ist bereits registriert.");
				}
				
		}catch (Exception e){
			throw new ServletException (e.getMessage());
		}
		return registruser;
	}
*/

	


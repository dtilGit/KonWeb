//Veronika Tschemodanov
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.RegistrBean;
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
@WebServlet("/RegistrServlet")

public class RegistrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	DataSource ds;

	// Warum kommt ein Fehler "HTTP Status 405 - HTTP method GET is not supported by
	// this URL", wenn diese Methode fehlt?
	// trotzdem, dass die doPost-Methode verwendet werden soll
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("=== in get ==");
		// this.doPost(request,response);}
		doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // In diesem Format erwartet das Servlet jetzt die Formulardaten
		// System.out.println("vor bean");
		RegistrBean regform = new RegistrBean();
		RequestDispatcher dispatcher;

		HttpSession session = request.getSession();
		session.setAttribute("regform", regform);

		regform.setGeschlecht(request.getParameter("geschlecht"));
		regform.setTitel(request.getParameter("titel"));
		regform.setNachname(request.getParameter("nachname"));
		regform.setVorname(request.getParameter("vorname"));
		regform.setEmail(request.getParameter("email"));
		regform.setPasswort(request.getParameter("passwort"));
		regform.setStrasse(request.getParameter("strasse"));
		regform.setHausnummer(request.getParameter("hausnummer"));
		regform.setPostleitzahl(request.getParameter ("postleitzahl"));
		regform.setOrt(request.getParameter("ort"));
		regform.setLand(request.getParameter("land"));
		// Admin-Wert auf Null setzen, damit jeder "normale" Kunde durch diesen Wert
		// beim Login vom Admin unterschieden werden kann
		regform.setAdmin(0);

		// Überprüfung der E-Mail
		try (Connection con = ds.getConnection();
				PreparedStatement psmt = con.prepareStatement("SELECT * FROM thidb.kunde WHERE email = ?")) {
			psmt.setString(1, regform.getEmail());
			try (ResultSet rs = psmt.executeQuery();) {

				System.out.println("=== in try select ==");

				if (!rs.next()) {
					String[] generatedKeys = new String[] { "id" };

					System.out.println("=== in if 1 ==");

					try (Connection con2 = ds.getConnection();
							PreparedStatement pstmt2 = con2.prepareStatement(
									"INSERT INTO thidb.kunde (geschlecht, titel, nachname,vorname, email, passwort, strasse, hausnummer, postleitzahl, ort, land, admin ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)",
									generatedKeys)) {

						System.out.println("=== in try insert ==");

						// Zugriff Ã¼ber Klasse java.sql.PreparedStatement
						pstmt2.setString(1, regform.getGeschlecht());
						pstmt2.setString(2, regform.getTitel());
						pstmt2.setString(3, regform.getNachname());
						pstmt2.setString(4, regform.getVorname());
						pstmt2.setString(5, regform.getEmail());
						pstmt2.setString(6, regform.getPasswort());
						pstmt2.setString(7, regform.getStrasse());
						pstmt2.setString(8, regform.getHausnummer());
						pstmt2.setString(9, regform.getPostleitzahl());
						pstmt2.setString(10, regform.getOrt());
						pstmt2.setString(11, regform.getLand());
						pstmt2.setInt(12, regform.getAdmin());
						pstmt2.executeUpdate();

						System.out.println("=== in try insert ==");

						dispatcher = request.getRequestDispatcher("user/registrierung_antwort.jsp");
						dispatcher.forward(request, response);

						// Generierte(n) Schlüssel auslesen (funktioniert nur mit PreparedStatement)
						try (ResultSet rs2 = pstmt2.getGeneratedKeys()) {
							while (rs2.next()) {
								regform.setId(rs.getInt(1));
							}
						}
					}
				} else if (rs.next()) {
					System.out.println("=== in elseif ===");
					regform.setEmail(null);
					dispatcher = request.getRequestDispatcher("/user/fehlerEmail.jsp");
					dispatcher.forward(request, response);
				}
			} catch (Exception ex) {
				System.out.println("=== in exception ==");
				throw new ServletException(ex.getMessage());
			}

			System.out.println("=== nach elseif ===");

		} catch (Exception e) {
			System.out.println("=== in exception stacktrace ==");
			e.printStackTrace();
		}
	} 

}

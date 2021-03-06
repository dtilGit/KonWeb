//Veronika Tschemodanov
package servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

//Servlet-Annotation: 
@WebServlet("/RegistrServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5
		* 5, location = "/tmp", fileSizeThreshold = 1024 * 1024)

public class RegistrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	DataSource ds;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); 
		// System.out.println("vor bean");
		RegistrBean regform = new RegistrBean();
		RequestDispatcher dispatcher;

		HttpSession session = request.getSession();

		regform.setGeschlecht(request.getParameter("geschlecht"));
		regform.setTitel(request.getParameter("titel"));
		regform.setNachname(request.getParameter("nachname"));
		regform.setVorname(request.getParameter("vorname"));
		regform.setEmail(request.getParameter("email"));
		regform.setPasswort(request.getParameter("passwort"));
		regform.setPasswort2(request.getParameter("passwort2"));
		regform.setStrasse(request.getParameter("strasse"));
		regform.setHausnummer(request.getParameter("hausnummer"));
		regform.setPostleitzahl(request.getParameter("postleitzahl"));
		regform.setOrt(request.getParameter("ort"));
		regform.setLand(request.getParameter("land"));
		// Admin-Wert auf Null setzen, damit jeder "normale" Kunde durch diesen Wert
		// beim Login vom Admin unterschieden werden kann
		regform.setAdmin(0);
		Part filepart = request.getPart("profilBild");
		String contenttype = filepart.getContentType();
		regform.setBildname(filepart.getSubmittedFileName());

		session.setAttribute("regform", regform);
		try (ByteArrayOutputStream baos = new ByteArrayOutputStream(); InputStream in = filepart.getInputStream()) {
			int i = 0;
			while ((i = in.read()) != -1) {
				baos.write(i);
			}
			if (contenttype.equalsIgnoreCase("image/png") || contenttype.equalsIgnoreCase("image/jpg")
					|| contenttype.equalsIgnoreCase("image/jpeg")) {

				regform.setBild(baos.toByteArray());
				baos.flush();
			} else {
				regform.setBild(null);
			}
		} catch (IOException ex) {
			throw new ServletException(ex.getMessage());
		}

		try (Connection con = ds.getConnection();
				PreparedStatement psmt = con.prepareStatement("SELECT * FROM thidb.kunde WHERE email = ?")) {
			psmt.setString(1, regform.getEmail());
			try (ResultSet rs = psmt.executeQuery();) {				
				if (!rs.next()) {
					if (!passwortPruefen(regform.getPasswort(), regform.getPasswort2())) {
						regform.setEmail(null);
						dispatcher = request.getRequestDispatcher("../user/fehlerPasswort.jsp");
						dispatcher.forward(request, response);
					} else {
						String[] generatedKeys = new String[] { "id" };

					//	System.out.println("=== in if 1 ==");

						PreparedStatement pstmt2 = con.prepareStatement(
								"INSERT INTO thidb.kunde (geschlecht, titel, nachname,vorname, email, passwort, strasse, hausnummer, postleitzahl, ort, land, admin, bildname, bild ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
								generatedKeys);
						{
							//System.out.println("=== in try insert ==");
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
							pstmt2.setString(13, regform.getBildname());
							pstmt2.setBytes(14, regform.getBild());
							pstmt2.executeUpdate();

						//	System.out.println("=== in try insert ==");

							dispatcher = request.getRequestDispatcher("../user/registrierung_antwort.jsp");
							dispatcher.forward(request, response);
						}
					}
				} else {
					 //if (rs.next())
				//	System.out.println("=== in elseif ===");
					regform.setEmail(null);
					dispatcher = request.getRequestDispatcher("../user/fehlerEmail.jsp");
					dispatcher.forward(request, response);

				}
			} catch (Exception ex) {
				throw new ServletException(ex.getMessage());
			}

			//System.out.println("=== nach elseif ===");

		} catch (Exception e) {
		//	System.out.println("=== in exception stacktrace ==");
			e.printStackTrace();
		}
	}

	protected boolean passwortPruefen(String passwort, String passwort2) throws ServletException {
		if (passwort.equals(passwort2)) {
			return true;
		} else {
			return false;
		}
	}

}

//David Häusler
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import beans.KontaktBean;

@WebServlet("/Kontakt")
public class Kontakt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("UTF-8");
		HttpSession session = request.getSession();

		KontaktBean kontakt = new KontaktBean();
		kontakt.setKnt_betreff(request.getParameter("knt_betreff"));
		kontakt.setKnt_nachname(request.getParameter("knt_nachname"));
		kontakt.setKnt_vorname(request.getParameter("knt_vorname"));
		kontakt.setKnt_email(request.getParameter("knt_email"));
		kontakt.setKnt_grund(request.getParameter("knt_grund"));
		kontakt.setKnt_nachricht(request.getParameter("knt_nachricht"));

		String[] generatedKeys = new String[] { "knt_id" };

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO thidb.kontakt (knt_betreff, knt_nachname, knt_vorname, knt_email, knt_nachricht, knt_grund) VALUES (?,?,?,?,?,?)",
						generatedKeys)) {
			pstmt.setString(1, kontakt.getKnt_betreff());
			pstmt.setString(2, kontakt.getKnt_nachname());
			pstmt.setString(3, kontakt.getKnt_vorname());
			pstmt.setString(4, kontakt.getKnt_email());
			pstmt.setString(5, kontakt.getKnt_nachricht());
			pstmt.setString(6, kontakt.getKnt_grund());
			pstmt.executeUpdate();
			
			try (ResultSet rs = pstmt.getGeneratedKeys()) {
				while (rs.next()) {
					kontakt.setKnt_id(rs.getInt(1));
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());	
		}
		session.setAttribute("kontakt", kontakt);

		final RequestDispatcher dispatcher = request.getRequestDispatcher("user/kontakt_antwort.jsp");
		dispatcher.forward(request, response);
	}

}

//Veronika Tschemodanov
package servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import beans.RegistrBean;

/**
 * Servlet implementation class Profilansehen
 */
@WebServlet("/ProfilAnsehen")
public class ProfilAnsehen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	DataSource datasource;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RegistrBean kunde = (RegistrBean) session.getAttribute("login");
		int id = kunde.getId();
		RegistrBean profillesen = new RegistrBean();
		System.out.println("==== in do post prof-ansehen===");
		
		try (Connection con = datasource.getConnection();
				PreparedStatement pstmt = con.prepareStatement("Select * From thidb.kunde where kunde_id=?")){
					pstmt.setInt(1, id);
					try (ResultSet rs = pstmt.executeQuery()){
						while (rs.next()) {
							profillesen.setGeschlecht(rs.getString("geschlecht"));
							profillesen.setTitel(rs.getString("titel"));
							profillesen.setNachname(rs.getString("nachname"));
							profillesen.setVorname(rs.getString("vorname"));
							profillesen.setStrasse(rs.getString("strasse"));
							profillesen.setHausnummer(rs.getString("hausnummer"));
							profillesen.setPostleitzahl(rs.getString("postleitzahl"));
							profillesen.setOrt(rs.getString("ort"));
							profillesen.setLand(rs.getString("land"));
							profillesen.setBildname(rs.getString("bildname"));
							profillesen.setBild(rs.getBytes("bild"));
							System.out.println("===in con Profil ansehen===");
						}
					}catch (Exception ex) {
						throw new ServletException (ex.getMessage());
					}
			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
		request.setAttribute("login", profillesen);
		
		final RequestDispatcher dispatcher = request.getRequestDispatcher("/user/profilansehen.jsp");
		dispatcher.forward(request, response);
	}

}

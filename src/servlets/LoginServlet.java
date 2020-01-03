//Veronika Tschemodanov
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import beans.RegistrBean;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

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

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource datasource;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// this.doPost(request,response);}
		System.out.println("=== in Get ===");
		doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String passwort = request.getParameter("passwort");

		HttpSession session = request.getSession();

		RequestDispatcher disp;
		RegistrBean login = checkUser(email, request, response);

		// Passwort�berpr�fung
		if (passwort.equals(login.getPasswort())) {
			//System.out.println("=== in if ===");
			//login.setStatus(1);
			session.setAttribute("login", login);
			// System.out.println(login.getNachname());
			disp = request.getRequestDispatcher("user/login_weiterleitung.jsp");
			disp.forward(request, response);

		} else if (!passwort.equals(login.getPasswort())) {
			//System.out.println("=== in else if ===");
			//login.setStatus(0);
			// login.setFehlermeldung("Passwort ist nicht korrekt");
			disp = request.getRequestDispatcher("user/login_PWFalsch.jsp");
			disp.forward(request, response);
		}
	}

	// �berpr�fung, der login-Daten auf "Bereits registriert ja/nein?
	// Und ggf. Speicherung der Daten in die loginbean --> loginuser
	private RegistrBean checkUser(String email, HttpServletRequest request, HttpServletResponse response)
			throws ServletException {

		RegistrBean loginuser = new RegistrBean();
		System.out.println("=== in checkUser ===");
		RequestDispatcher disp;
		// �berpr�fung, ob bereits registriert
		try (Connection con = datasource.getConnection();
				PreparedStatement pstm = con.prepareStatement("Select * FROM thidb.kunde WHERE email = ?")) {
			pstm.setString(1, email);

			try (ResultSet rs = pstm.executeQuery();) {
				System.out.println("=== in try Select ===");
				if (rs.next()) {
					System.out.println("=== in if re.next ===");
					loginuser.setPasswort(rs.getString("passwort"));
					loginuser.setAdmin(rs.getInt("admin"));
					loginuser.setVorname(rs.getString("vorname"));
					loginuser.setNachname(rs.getString("nachname"));
					loginuser.setGeschlecht(rs.getString("geschlecht"));
					loginuser.setTitel(rs.getString("titel"));
					loginuser.setStrasse(rs.getString("strasse"));
					loginuser.setHausnummer(rs.getString("hausnummer"));
					loginuser.setPostleitzahl(rs.getString("postleitzahl"));
					loginuser.setOrt(rs.getString("ort"));
					loginuser.setLand(rs.getString("land"));
					loginuser.setEmail(rs.getString("email"));
					loginuser.setId(rs.getInt("kunde_id"));
					loginuser.setBildname(rs.getString("bildname"));
					loginuser.setBild(rs.getBytes("bild"));
					// Status==1 bedeutet, dass der Kunde eingeloggt ist.
//					loginuser.setStatus(rs.getInt(1));

				} else if (!rs.next()) {
					System.out.println("=== in else if rs.next ===");
					//loginuser.setStatus(rs.getInt(0));
					disp = request.getRequestDispatcher("user/login_RGFehler.jsp");
					disp.forward(request, response);
				}
			} catch (Exception e) {
				throw new ServletException(e.getMessage());
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return loginuser;
	}
}
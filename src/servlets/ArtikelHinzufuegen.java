/**David Haäusler**/

package servlets;

import java.io.ByteArrayOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import beans.ArtikelBean;
import beans.KategorieBean;

/**
 * Servlet implementation class ArtikelHinzufuegen
 */
@WebServlet("/ArtikelHinzufuegen")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5
		* 5, location = "/tmp", fileSizeThreshold = 1024 * 1024)

public class ArtikelHinzufuegen extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		ArtikelBean art_bean = new ArtikelBean();
		art_bean.setArtikelbezeichnung(request.getParameter("art_bez"));
		Double preis = new Double(request.getParameter("preis"));
		art_bean.setPreis(preis);
		int kat_id = Integer.parseInt(request.getParameter("alleKategorienLaden"));
		art_bean.setKategorie_id(kat_id);

		/* Hier anfangend mit Bild Upload - welchen Filename bekommt das Ganze */
		Part filepart = request.getPart("bild");
		art_bean.setBildname(filepart.getSubmittedFileName());

		// Bilduebertragung
		try (ByteArrayOutputStream baos = new ByteArrayOutputStream(); InputStream in = filepart.getInputStream()) {
			int i = 0;
			while ((i = in.read()) != -1) {
				baos.write(i);
			}
			art_bean.setBild(baos.toByteArray());
			baos.flush();
		} catch (IOException ex) {
			throw new ServletException(ex.getMessage());
		}
		/* Ende Bildubertrgaung */

		String[] generatedKeys = new String[] { "artikel_id" };

		// checkArtikelname(art_bean.getArtikelbezeichnung(),
		// art_bean.getKategorie_id());	
		if (checkArtikel(art_bean.getArtikelbezeichnung(), art_bean.getKategorie_id()) == false) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/artikelname_vorhanden.jsp");
			dispatcher.forward(request, response);
		}
		else {
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO thidb.artikel (artikelbezeichnung, preis, kategorie, bildname, bild) VALUES (?, ?, ?, ?, ?)",
						generatedKeys)) {

			pstmt.setString(1, art_bean.getArtikelbezeichnung());
			pstmt.setDouble(2, art_bean.getPreis());
			pstmt.setInt(3, art_bean.getKategorie_id());
			pstmt.setString(4, art_bean.getBildname());
			pstmt.setBytes(5, art_bean.getBild());
			pstmt.executeUpdate();

			try (ResultSet rs = pstmt.getGeneratedKeys()) {
				while (rs.next()) {
					art_bean.setArtikel_id(rs.getInt(1));
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

		final RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/adminpage_success.jsp");
		dispatcher.forward(request, response);
	}
	}
	
	public boolean checkArtikel(String art_bez, int kat_id) throws ServletException{
	try (Connection con_ca = ds.getConnection();
			PreparedStatement pstmt = con_ca
					.prepareStatement("SELECT * FROM thidb.artikel WHERE artikelbezeichnung =? AND kategorie=?")) {
		pstmt.setString(1, art_bez);
		pstmt.setInt(2, kat_id);
		try (ResultSet rs = pstmt.executeQuery()) {
			
			if (rs.next()) {
				return false;
			}
			else {
				return true;
			}
		}

	} catch (Exception ex) {
		throw new ServletException(ex.getMessage());
	}
	}
	
	/*
	 * private void checkArtikelname(String artikelbezeichnung, Integer
	 * kategorie_id) throws ServletException { try (Connection con =
	 * ds.getConnection(); PreparedStatement psmt =
	 * con.prepareStatement("SELECT * FROM thidb.artikel")) { psmt.setString(1,
	 * artikelbezeichnung); psmt.setInt(2, kategorie_id); try (ResultSet rs =
	 * psmt.executeQuery();) { while (rs.next()==true) { if
	 * (rs.getString(1)==artikelbezeichnung) { System.out.println("vorhanden"); }
	 * else { System.out.println("NICHT vorhanden"); } } } } catch (Exception ex) {
	 * throw new ServletException(ex.getMessage()); }
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}
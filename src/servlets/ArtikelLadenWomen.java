//David Häusler
package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import beans.ArtikelBean;
import beans.KategorieBean;
import beans.AnzeigeBean;

/**
 * Servlet implementation class ArtikelLadenWomen
 */
@WebServlet("/ArtikelLadenWomen")
public class ArtikelLadenWomen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	DataSource ds;
	RequestDispatcher dispatcher;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// Entgegennahme von Sucheingabe
		Integer art_kategorie = Integer.parseInt(request.getParameter("kategorie_id"));
		//System.out.println(art_kategorie);

		List<ArtikelBean> artikel = loadArtikel(art_kategorie);
		List<KategorieBean> kategorien = loadKategorien();
		
		AnzeigeBean anzeige = new AnzeigeBean();
		anzeige.setArtikel(artikel);
		anzeige.setKategorie(kategorien);
		
		//System.out.println("arrrt" + art_kategorie);
		//artikel.forEach(e -> System.out.println(e.getArtikelbezeichnung()));

		request.setAttribute("anzeige", anzeige);

		dispatcher = request.getRequestDispatcher("user/artikelWomen.jsp");
		dispatcher.forward(request, response);
	}

	// Fast eins zu eins aus dem JDBC-Script, S. 19 ï¿½bernommen
	private List<ArtikelBean> loadArtikel(Integer art_kategorie) throws ServletException {

		List<ArtikelBean> artikel = new ArrayList<ArtikelBean>();

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("Select * From thidb.artikel where kategorie LIKE ?")) {

			pstmt.setInt(1, art_kategorie);

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					//System.out.println("=== in if===");
					ArtikelBean artikelbean = new ArtikelBean();

					int id = Integer.valueOf(rs.getInt("artikel_id"));
					artikelbean.setArtikel_id(id);

					String artikelbez = rs.getString("artikelbezeichnung");
					artikelbean.setArtikelbezeichnung(artikelbez);

					Double preis = Double.valueOf(rs.getDouble("preis"));
					artikelbean.setPreis(preis);

					Integer kategorie = rs.getInt("kategorie");
					artikelbean.setKategorie_id(kategorie);

					byte[] bild = rs.getBytes("bild");
					artikelbean.setBild(bild);

					artikel.add(artikelbean);
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		//System.out.println(" sizeee " + artikel.size());
		return artikel;
	}

	private List<KategorieBean> loadKategorien() throws ServletException {

		List<KategorieBean> womenKategorien = new ArrayList<>();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("SELECT * FROM thidb.kategorie WHERE geschlecht='Weiblich'")) {
			
			try (ResultSet rs = pstmt.executeQuery()) {

				while (rs.next()) {
					KategorieBean kat_bean = new KategorieBean();

					Integer kat_id = rs.getInt("kategorie_id");
					kat_bean.setKategorie_id(kat_id);

					String kat_bezeichnung = rs.getString("kategoriebezeichnung");
					kat_bean.setKategoriebezeichnung(kat_bezeichnung);
					womenKategorien.add(kat_bean);
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return womenKategorien;
	}
}
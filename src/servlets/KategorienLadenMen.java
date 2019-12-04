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

@WebServlet("/KategorienLadenMen")
public class KategorienLadenMen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===in KategorienLadenMen- Servlet===");
		List<KategorieBean> KategorienMen = new ArrayList<KategorieBean>();
		List<ArtikelBean> ArtikelKategorie = new ArrayList<ArtikelBean>();

		try (Connection con = ds.getConnection();
				// warum erscheint ein Fehler, wenn man "Männlich" schreibt? WHERE
				// geschlecht=Männlich
				// vllt einfache Klammern?
				PreparedStatement pstmt = con
						.prepareStatement("SELECT * FROM thidb.kategorie WHERE geschlecht='Männlich'")) {
			System.out.println("=== try  ===");
			try (ResultSet rs = pstmt.executeQuery()) {

				while (rs.next()) {
					System.out.println("=== try while  ===");
					KategorieBean kat_bean = new KategorieBean();

					int kat_id = rs.getInt("kategorie_id");
					kat_bean.setKategorie_id(kat_id);

					String kat_bezeichnung = rs.getString("kategoriebezeichnung");
					kat_bean.setKategoriebezeichnung(kat_bezeichnung);

					String kat_geschlecht = rs.getString("geschlecht");
					kat_bean.setGeschlecht(kat_geschlecht);

					KategorienMen.add(kat_bean);

					try (Connection con2 = ds.getConnection();
							PreparedStatement pstmt2 = con2
									.prepareStatement("SELECT * FROM thidb.artikel WHERE kategorie LIKE ?")) {
						pstmt2.setInt(1, kat_bean.getKategorie_id());
						System.out.println("===bischt du da????===");
						try (ResultSet rs2 = pstmt2.executeQuery()) {
							while (rs2.next()) {
								System.out.println("===bischt du au wirklich da????===");
								ArtikelBean artikel = new ArtikelBean();

								String art_bezeichnung = rs2.getString("artikelbezeichnung");
								artikel.setArtikelbezeichnung(art_bezeichnung);

								BigDecimal preis = BigDecimal.valueOf(rs2.getLong("preis"));
								artikel.setPreis(preis);

								ArtikelKategorie.add(artikel);
							}
						}
					}
				}

			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		AnzeigeBean anzeige = new AnzeigeBean();
		anzeige.setArtikel(ArtikelKategorie);
		anzeige.setKategorie(KategorienMen);

		request.setAttribute("anzeige", anzeige);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/user/artikelMen.jsp");
		dispatcher.forward(request, response);
	}

//    /**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
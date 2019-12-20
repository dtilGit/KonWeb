//Veronika Tschemodanov
package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import jdk.nashorn.internal.ir.RuntimeNode.Request;
import beans.AnzeigeBean;

@WebServlet("/KatArtLadenMen")
public class KatArtLadenMen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===in KatArtLadenMen- Servlet===");
		List<KategorieBean> KategorienMen = new ArrayList<KategorieBean>();
		List<ArtikelBean> ArtikeListe = new ArrayList<ArtikelBean>();
		
		
		//Ausgeben der Kategorien
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("SELECT * FROM thidb.kategorie WHERE geschlecht='Männlich'")) {
			System.out.println("=== try  ===");
			try (ResultSet rs = pstmt.executeQuery()) {
				
				while (rs.next()) {
					System.out.println("=== try while  ===");
					KategorieBean kat_bean = new KategorieBean();
					
					Integer kat_id = rs.getInt("kategorie_id");
					kat_bean.setKategorie_id(kat_id);

					String kat_bezeichnung = rs.getString("kategoriebezeichnung");
					kat_bean.setKategoriebezeichnung(kat_bezeichnung);
					
					try (Connection con2 = ds.getConnection();
							PreparedStatement pstmt2 = con2
										.prepareStatement("SELECT *  FROM artikel JOIN kategorie WHERE artikel.kategorie=? and kategorie.kategorie_id=?")) {
						pstmt2.setInt(1,kat_id);
						pstmt2.setInt(2, kat_id);
						//kat_bean.getKategorie_id()
					//	System.out.println("===bischt du da????===");
							try (ResultSet rs2 = pstmt2.executeQuery()) {
								while (rs2.next()) {
							//	System.out.println("===bischt du au wirklich da????===");
								ArtikelBean artikel = new ArtikelBean();
			
									String art_bezeichnung = rs2.getString("artikelbezeichnung");
									artikel.setArtikelbezeichnung(art_bezeichnung);

									BigDecimal preis = BigDecimal.valueOf(rs2.getLong("preis"));
									artikel.setPreis(preis);
									
									Integer kategorie = rs2.getInt("kategorie");
									artikel.setKategorie_id(kategorie);
									
									Integer artikel_id = rs2.getInt("artikel_id");
									artikel.setArtikel_id(artikel_id);

									ArtikeListe.add(artikel);
								}
							}
						}
					KategorienMen.add(kat_bean);
					
				//	System.out.println("listenausgabe");
				//	KategorienMen.forEach(e -> System.out.println(e.getKategoriebezeichnung()));
					
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		AnzeigeBean anzeige = new AnzeigeBean();
		anzeige.setArtikel(ArtikeListe);
		anzeige.setKategorie(KategorienMen);

		request.setAttribute("anzeige", anzeige);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/user/artikelMen.jsp");
		dispatcher.forward(request, response);
	}

//	private List<ArtikelBean> artikelLaden (int kategorie_id) throws SQLException{
//		
//		ArtikelBean art_bean = new ArtikelBean();
//		List<ArtikelBean> artikelKat = new ArrayList<ArtikelBean>();
//		
//		try (Connection con2 = ds.getConnection();
//				PreparedStatement pstmt2 = con2
//							.prepareStatement("SELECT * FROM thidb.artikel JOIN thidb.kategorie WHERE ?=kategorie_id")) {
//			pstmt2.setInt(1, kategorie_id);
//			
//			System.out.println("===bischt du da????===");
//				try (ResultSet rs2 = pstmt2.executeQuery()) {
//					while (rs2.next()) {
//					System.out.println("===bischt du au wirklich da????===");
//					ArtikelBean artikel = new ArtikelBean();
//
//						String art_bezeichnung = rs2.getString("artikelbezeichnung");
//						artikel.setArtikelbezeichnung(art_bezeichnung);
//
//						BigDecimal preis = BigDecimal.valueOf(rs2.getLong("preis"));
//						artikel.setPreis(preis);
//
//						artikelKat.add(art_bean);
//					}
//				}
//			}
//		
//		return artikelKat;
//	}

}
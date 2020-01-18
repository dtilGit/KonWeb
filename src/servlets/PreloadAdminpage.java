//Tilman Dewes
package servlets;

import java.io.IOException;
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

import beans.KategorieBean;
import beans.ArtikelBean;
import beans.AnzeigeBean;

/**Tilman Dewes
 * Servlet implementation class PreloadAdminpage
 */
@WebServlet("/PreloadAdminpage")
public class PreloadAdminpage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
     
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreloadAdminpage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<KategorieBean> kategorie = new ArrayList<KategorieBean>();
		List<ArtikelBean> artikel = new ArrayList<ArtikelBean>();
		AnzeigeBean preload = new AnzeigeBean();
		
		//Kategorie list mit kategorienbeans befüllen
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM thidb.kategorie")) {
			
					try (ResultSet rs = pstmt.executeQuery()) {
					
						while (rs.next()) {
							
							KategorieBean kat_bean = new KategorieBean();
							
							int kat_id = rs.getInt("kategorie_id");
							kat_bean.setKategorie_id(kat_id);
							
							String kat_bezeichnung = rs.getString("kategoriebezeichnung");
							kat_bean.setKategoriebezeichnung(kat_bezeichnung);
							
							String kat_geschlecht = rs.getString("geschlecht");
							kat_bean.setGeschlecht(kat_geschlecht);

							kategorie.add(kat_bean);			
						} 
						
					}
					
				} catch (Exception ex) {
					throw new ServletException(ex.getMessage());
				}
		
		//Artikellist mit Artikelbeans befüllen
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM thidb.artikel INNER JOIN kategorie ON artikel.kategorie = kategorie.kategorie_id")) {
			
			try (ResultSet rs = pstmt.executeQuery()) {

				while (rs.next()) {

					ArtikelBean art_bean = new ArtikelBean();

					int art_id = rs.getInt("artikel_id");
					art_bean.setArtikel_id(art_id);
					
					String art_bez = rs.getString("artikelbezeichnung");
					art_bean.setArtikelbezeichnung(art_bez);

					Double preis = Double.valueOf(rs.getLong("preis"));
					art_bean.setPreis(preis);

					int art_kategorie = rs.getInt("kategorie");
					art_bean.setKategorie_id(art_kategorie);

					String kategoriebezeichnung = rs.getString("kategoriebezeichnung");
					art_bean.setKategoriebzeichnung(kategoriebezeichnung);
					
					String kategoriegeschlecht = rs.getString("geschlecht");
					art_bean.setKategoriegeschlecht(kategoriegeschlecht);
					
					byte[] art_bild = rs.getBytes("bild");
					art_bean.setBild(art_bild);

					artikel.add(art_bean);
				}

			}
		
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		//Anzeige Bean mit den beiden Listen befüllen
		preload.setKategorie(kategorie);
		preload.setArtikel(artikel);
		
		request.setAttribute("preload", preload);
		final RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/adminpage.jsp");
		dispatcher.forward(request, response);
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

//Veronika Tschemodanov
package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import beans.ArtikelBean;
import beans.RegistrBean;
import beans.WarenkorbArtikel;
import beans.WarenkorbBean;

@WebServlet("/ZumWarenkorbHinzufuegen")
public class ZumWarenkorbHinzufuegen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("UTF-8");
		HttpSession session = request.getSession();

		WarenkorbBean warenkorbB = (WarenkorbBean) session.getAttribute("warenkorbB");

		String artikelbezeichnung = request.getParameter("artikelbezeichnung");
		Double preis = Double.valueOf(request.getParameter("preis"));
		ArtikelBean artB = new ArtikelBean(artikelbezeichnung, preis);

		artB.setArtikel_id(Integer.valueOf(request.getParameter("art_id")));
		//String art_Anzahl = request.getParameter("art_Anzahl");

		if (warenkorbB == null) {
			warenkorbB = new WarenkorbBean();
			session.setAttribute("warenkorbB", warenkorbB);
		}
		// In der Bohne Korb erstellen --> ist eine Liste von den Artikeln
		session.setAttribute("warenkorbB", warenkorbB);
		LinkedList<WarenkorbArtikel> wk_artikel = warenkorbB.getWarenkorbList();

		boolean neu = true;
		for (int i = 0; i < wk_artikel.size(); i++) {
			WarenkorbArtikel art_pruefen;
			art_pruefen = wk_artikel.get(i);
			if (art_pruefen.getWk_artikel().getArtikel_id().equals(artB.getArtikel_id())) {
				neu = false;
				Integer anzahl = art_pruefen.getWk_art_anzahl();
				anzahl++;
			}
		}
		if (neu = true) {
			Integer art_id = Integer.valueOf(request.getParameter("art_id"));
			ArtikelBean artikel = artikelLaden(art_id);

			WarenkorbArtikel pruefen = new WarenkorbArtikel(artikel);
			// Anzahl wird auf 1 gesetzt, wenn noch kein Artikel im WK 
			pruefen.setWk_art_anzahl(1);
			//pruefen.setWk_size(art_Anzahl);
			wk_artikel.add(pruefen);
		}
		int ges_anzahl;
		request.setAttribute("ges_preis", warenkorbB.getGes_preis());

		final RequestDispatcher dispatcher = request.getRequestDispatcher("user/warenkorb.jsp");
		dispatcher.forward(request, response);
	}

	private ArtikelBean artikelLaden(Integer art_id) throws ServletException {
		ArtikelBean artikel = new ArtikelBean();
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("Select * from thidb.artikel where artikel_id=?")) {
			pstmt.setInt(1, art_id);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {

					artikel.setArtikel_id(Integer.valueOf(rs.getInt("artikel_id")));
					artikel.setArtikelbezeichnung(rs.getString("artikelbezeichnung"));
					artikel.setPreis(rs.getDouble("preis"));
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return artikel;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

/*David Häusler*/
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

import beans.artikel_bean;

/**
 * Servlet implementation class alleArtikel_laden
 */
@WebServlet("/alleArtikel_laden")
public class alleArtikel_laden extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public alleArtikel_laden() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<artikel_bean> alleArtikel = new ArrayList<artikel_bean>();

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM thidb.artikel")) {

			try (ResultSet rs = pstmt.executeQuery()) {

				while (rs.next()) {

					artikel_bean art_bean = new artikel_bean();

					int art_id = rs.getInt("artikel_id");
					art_bean.setArtikel_id(art_id);

					String art_bez = rs.getString("artikelbezeichnung");
					art_bean.setArtikelbezeichnung(art_bez);

					BigDecimal preis = BigDecimal.valueOf(rs.getLong("preis"));
					art_bean.setPreis(preis);

					int art_kategorie = rs.getInt("kategorie");
					art_bean.setKategorie_id(art_kategorie);

					byte[] art_bild = rs.getBytes("bild");
					art_bean.setBild(art_bild);

					alleArtikel.add(art_bean);
				}

			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		request.setAttribute("alleArtikel", alleArtikel);
		final RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/adminpage.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
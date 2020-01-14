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

/**
 * Servlet implementation class SucheServlet
 */
@WebServlet("/SucheServlet")
public class SucheServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	DataSource ds;
	RequestDispatcher dispatcher;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//Entgegennahme von Sucheingabe
		String artikelbezeichnung = request.getParameter("artikelbezeichnung");
		
		List<ArtikelBean> art = suchen(artikelbezeichnung);
		
		request.setAttribute("art", art);

		dispatcher = request.getRequestDispatcher("user/artikelsuche.jsp"); 
		dispatcher.forward(request, response);
	}

	// Fast eins zu eins aus dem JDBC-Script, S. 19 �bernommen
	private List<ArtikelBean> suchen(String artikelbezeichnung) throws ServletException {
			artikelbezeichnung = (artikelbezeichnung == null || artikelbezeichnung == "") ? "%"
				: "%" + artikelbezeichnung + "%";
		List<ArtikelBean> artikel = new ArrayList<ArtikelBean>();

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("Select * From thidb.artikel where artikelbezeichnung LIKE ?")) {

			pstmt.setString(1, artikelbezeichnung);
			
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					//System.out.println("=== in if===");
					ArtikelBean artikelbean = new ArtikelBean();

					int id = Integer.valueOf(rs.getInt("artikel_id"));
					artikelbean.setArtikel_id(id);

					// Welche Daten werden bei Artikelanzeigen auf der Seite angezeigt?
					// Auf Vollst�ndigkeit pr�fen
					// artikel_id, artikelbezeichnung, preis, kategorie, bild
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

		return artikel;
	}

}

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

@WebServlet("/KatLadenMen")
public class KatLadenMen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//System.out.println("===in KatLadenMen- Servlet===");
		List<KategorieBean> KategorienMen = new ArrayList<KategorieBean>();		
		
		//Ausgeben der Kategorien
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("SELECT * FROM thidb.kategorie WHERE geschlecht='Herren'")) {
			
			try (ResultSet rs = pstmt.executeQuery()) {
				
				while (rs.next()) {
					KategorieBean kat_bean = new KategorieBean();
					
					Integer kat_id = rs.getInt("kategorie_id");
					kat_bean.setKategorie_id(kat_id);

					String kat_bezeichnung = rs.getString("kategoriebezeichnung");
					kat_bean.setKategoriebezeichnung(kat_bezeichnung);
											
					KategorienMen.add(kat_bean);
				
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		AnzeigeBean anzeige = new AnzeigeBean();
		anzeige.setKategorie(KategorienMen);

		request.setAttribute("anzeige", anzeige);
		final RequestDispatcher dispatcher = request.getRequestDispatcher("/user/artikelMen.jsp");
		dispatcher.forward(request, response);
	}


}
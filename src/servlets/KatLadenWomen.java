//David Hauesler
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

@WebServlet("/KatLadenWomen")
public class KatLadenWomen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<KategorieBean> KategorienWomen = new ArrayList<KategorieBean>();		
		
		//Ausgeben der Kategorien
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("SELECT * FROM thidb.kategorie WHERE geschlecht='Frauen'")) {
			
			try (ResultSet rs = pstmt.executeQuery()) {
				
				while (rs.next()) {
					
					KategorieBean kat_bean = new KategorieBean();
					
					Integer kat_id = rs.getInt("kategorie_id");
					kat_bean.setKategorie_id(kat_id);

					String kat_bezeichnung = rs.getString("kategoriebezeichnung");
					kat_bean.setKategoriebezeichnung(kat_bezeichnung);
					
					KategorienWomen.add(kat_bean);
					
					//KategorienWomen.forEach(e -> System.out.println(e.getKategoriebezeichnung()));
					
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		//AnzeigeBean in diesem Servlet dazu notwenig, damit keine weitere "artikelWomen.jsp" erstellt werden muss. 
		//Der Aufruf der Werte ist  
		AnzeigeBean anzeige = new AnzeigeBean();
		anzeige.setKategorie(KategorienWomen);

		request.setAttribute("anzeige", anzeige);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/user/artikelWomen.jsp");
		dispatcher.forward(request, response);
	}

}
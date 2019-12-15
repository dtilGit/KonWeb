//Veronika Tschemodanov
package servlets;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import beans.ArtikelBean;
import beans.RegistrBean;
import beans.WarenkorbBean;

/**
 * Servlet implementation class ZumWarenkorbHinzufuegen
 */
@WebServlet("/ZumWarenkorbHinzufuegen")
public class ZumWarenkorbHinzufuegen extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource datasource;

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		RegistrBean kunde = (RegistrBean) session.getAttribute("login");
		WarenkorbBean warenkorb = (WarenkorbBean) session.getAttribute("warenkorb");

		int id = kunde.getId();
		
		//das übergebene Value durch den Klick auf "zum Warenkorb hinzufügen"
		String artikel_id = request.getParameter("artikel_id");
		int artikel_ID = Integer.parseInt(artikel_id);

		ArtikelBean art_bean = new ArtikelBean();
		
		
	}

}

package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ArtikelBean;
import beans.RegistrBean;
import beans.WarenkorbArtikel;
import beans.WarenkorbBean;

/**
 * Servlet implementation class WarenkorbGroesse
 */
@WebServlet("/WarenkorbGroesse")
public class WarenkorbGroesse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("UTF-8");

		HttpSession session = request.getSession();
		WarenkorbBean warenkorbB = (WarenkorbBean) session.getAttribute("warenkorbB");
		RegistrBean kunde = (RegistrBean) session.getAttribute("login");
		// was kommt an der Stelle in die ""??
		Integer artikel_ID = (Integer.valueOf(request.getParameter("art_id")));
		ArtikelBean artikel = new ArtikelBean();
		artikel.setArtikel_id(artikel_ID);

		for (int i = 0; i < warenkorbB.getWarenkorbList().size(); i++) {
			WarenkorbArtikel wk = warenkorbB.getWarenkorbList().get(i);
			if (wk.getWk_artikel().getArtikel_id() == artikel.getArtikel_id()) {
				Integer menge = Integer.valueOf(request.getParameter("menge"));
				if (menge > 0) {
					wk.setWk_art_anzahl(menge);
				} else if (menge == 0) {
					wk.setWk_art_anzahl(menge);
									
//					wk.Leeren();
//					wk.getWk_artikel().setArtikel_id(null);
//					wk.setWk_art_anzahl(null);
//					wk.getWk_artikel().setArtikelbezeichnung(null);
//					wk.getWk_artikel().setBild(null);
//					wk.getWk_artikel().setBildname(null);
//					wk.getWk_artikel().setPreis(null);
//					wk.setWk_art_preis(null);
//					wk.setWk_art_anzahl(null);
//					session.removeAttribute("wk_artikel");
				}
			}
		}
		session.setAttribute("warenkorbB", warenkorbB);
		if (kunde != null) {
			kunde.setWarenkorb(warenkorbB);
			session.setAttribute("login", kunde);
		}
		final RequestDispatcher dispatcher = request.getRequestDispatcher("/user/warenkorb.jsp");
		dispatcher.forward(request, response);
	}
}

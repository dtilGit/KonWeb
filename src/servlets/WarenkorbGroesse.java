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
		WarenkorbBean warenkorb = (WarenkorbBean) session.getAttribute("warenkorbB");
		RegistrBean kunde = (RegistrBean) session.getAttribute("login");
		// was kommt an der Stelle in die ""??
		Integer artikel_ID = (Integer.valueOf(request.getParameter("art_id")));
		ArtikelBean artikel = new ArtikelBean();
		artikel.setArtikel_id(artikel_ID);
		//String groesse = request.getParameter("groesse");

		for (int i = 0; i < warenkorb.getWarenkorbList().size(); i++) {
			WarenkorbArtikel wk = warenkorb.getWarenkorbList().get(i);
			if (wk.getWk_artikel().getArtikel_id() == artikel.getArtikel_id()) {
				wk.setWk_art_anzahl(Integer.valueOf(request.getParameter("menge")));
			}
		}
		session.setAttribute("warenkorbB", warenkorb);
		if(kunde !=null) {
			kunde.setWarenkorb(warenkorb);
			session.setAttribute("login", kunde);
		}
		
		final RequestDispatcher dispatcher = request.getRequestDispatcher("/user/warenkorb.jsp");
		dispatcher.forward(request, response);
	}
	

//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		doGet(request, response);
//	}

}

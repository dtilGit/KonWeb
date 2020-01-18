//Veronika Tschemodanov
package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import beans.RegistrBean;
import beans.WarenkorbBean;

/**
 * Servlet implementation class BestellenServlet
 */
@WebServlet("/BestellenServlet")
public class BestellenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("UTF-8");
		HttpSession session = request.getSession();
		// Warenkorb-Session muss befüllt sein mit den Werten
		WarenkorbBean warenkorbB = (WarenkorbBean) session.getAttribute("warenkorbB");
		// Kunde-Session muss befüllt sein mit den Werten = Eingeloggt
		RegistrBean kunde = (RegistrBean) session.getAttribute("login");

		if (warenkorbB != null && kunde != null) {
			String[] generatedKeys = new String[] { "bestell_id" };
			//System.out.println("=== in if1 ===");

			try (Connection con = ds.getConnection();
					PreparedStatement pstmt = con.prepareStatement(
							"INSERT INTO thidb.bestellung (kunde_id, ges_preis) Values (?,?)", generatedKeys)) {
				pstmt.setInt(1, kunde.getId());
				pstmt.setDouble(2, warenkorbB.getGes_preis());
				pstmt.executeUpdate();
				//System.out.println("=== in try Insert ===");
			} catch (Exception ex) {
				throw new ServletException(ex.getMessage());	
			}

			request.setAttribute("ges_preis", warenkorbB.getGes_preis());
			request.setAttribute("login", kunde);
			
			warenkorbB.getWarenkorbList().clear();
			session.removeAttribute("warenkorbB");
//			request.getSession().invalidate();
						
			RequestDispatcher dispatcher = request.getRequestDispatcher("user/bestellung_erfolgreich.jsp");
			dispatcher.forward(request, response);
			
		} 
	}
}

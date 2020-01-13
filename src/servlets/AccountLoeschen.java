/**Veronika Tschemodanov**/
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

/**
 * Servlet implementation class kategorie_loeschen
 */
@WebServlet("/AccountLoeschen")
public class AccountLoeschen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("==in post==");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		RegistrBean kunde = (RegistrBean) session.getAttribute("login");

		int kunden_id = kunde.getId();

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM thidb.kunde WHERE kunde_id = ?")) {
			pstmt.setInt(1, kunden_id);
			pstmt.executeUpdate();
			System.out.println("==in try l�schen==");
		}

		catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

		request.getSession().invalidate();
		
		final RequestDispatcher dispatcher = request.getRequestDispatcher("user/account_geloescht.jsp");
		dispatcher.forward(request, response);
	}
}
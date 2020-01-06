package servlets;

import java.io.IOException;
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

import beans.KategorieBean;
import beans.ArtikelBean;

/**
 * Servlet implementation class AlleArtikelUndKategorienLaden
 */
@WebServlet("/AlleArtikelUndKategorienLaden")
public class AlleArtikelUndKategorienLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlleArtikelUndKategorienLaden() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	/**
	 NICHT VOLLSTÄNDIG
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<KategorieBean> alleKategorien = new ArrayList<KategorieBean>();

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM thidb.kategorie")) {

			try (ResultSet rs = pstmt.executeQuery()) {

				while (rs.next()) {

					KategorieBean kat_bean = new KategorieBean();

					int kat_id = rs.getInt("kategorie_id");
					kat_bean.setKategorie_id(kat_id);

					String kat_bezeichnung = rs.getString("kategoriebezeichnung");
					kat_bean.setKategoriebezeichnung(kat_bezeichnung);

					String kat_geschlecht = rs.getString("geschlecht");
					kat_bean.setGeschlecht(kat_geschlecht);

					alleKategorien.add(kat_bean);
				}

			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		request.setAttribute("alleKategorien", alleKategorien);
		final RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/adminpage.jsp");
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

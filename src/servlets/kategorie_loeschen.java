package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import beans.kategorie_bean;

/**
 * Servlet implementation class kategorie_loeschen
 */
@WebServlet("/kategorie_loeschen")
public class kategorie_loeschen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kategorie_loeschen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	
		
		String kategorie;
		String geschlecht;
		
		String kat_geschlecht = request.getParameter("kategorie_bez_geschlecht");
		
		
		kategorie_bean form = new kategorie_bean();
		form.setKategoriebezeichnung(request.getParameter("kategorie_bez_geschlecht"));
		form.setGeschlecht(request.getParameter("kategorie_geschlecht"));
		
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM thidb.kategorie WHERE kategorie_bezeichnung = ? && kategorie_geschlecht = ?")){
			
			pstmt.setString(1, form.getKategoriebezeichnung());
			pstmt.setString(2, form.getGeschlecht());
			pstmt.executeUpdate();
		
		}
	catch (Exception ex) {
		throw new ServletException(ex.getMessage());
		}
		System.out.println("nach datenbank");
	
	final RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/adminpage_sucess.jsp");
	dispatcher.forward(request, response);		
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}

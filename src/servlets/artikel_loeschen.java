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

import beans.artikel_bean;

/**
 * Servlet implementation class kategorie_loeschen
 */
@WebServlet("/artikel_loeschen")
public class artikel_loeschen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public artikel_loeschen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	
		
		artikel_bean art_bean = new artikel_bean();
		int i = Integer.parseInt(request.getParameter("alleArtikelLaden"));
		art_bean.setArtikel_id(i); // parse Int
		
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM thidb.artikel WHERE artikel_id = ?")){
			
			pstmt.setInt(1, art_bean.getArtikel_id());
			pstmt.executeUpdate();
		
		}
	    
		catch (Exception ex) {
		throw new ServletException(ex.getMessage());
		}
		
	
	final RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/artikel_geloescht.jsp");
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
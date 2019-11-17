/* autor: Tilman*/
package servlets;

import java.io.ByteArrayOutputStream;

import java.io.IOException
;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import beans.artikel_bean;

/**
 * Servlet implementation class ArtikelHinzufuegen
 */
@WebServlet("/artikel_hinzufuegen")
@MultipartConfig(
        maxFileSize=2024*2024*5,
        maxRequestSize=2024*2024*5*5, 
        location= "/tmp",
        fileSizeThreshold=2024*2024)

public class artikel_hinzufuegen extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	
		
	//	HttpSession session = request.getSession();
		
		artikel_bean form = new artikel_bean();
		form.setArtikelbezeichnung(request.getParameter("artikel_bezeichnung"));
		BigDecimal preis = new BigDecimal (request.getParameter("preis"));
		form.setPreis(preis);
		Integer lagerbestand = Integer.valueOf(request.getParameter("lagerbestand"));
		form.setLagerbestand(lagerbestand);
		//System.out.println("nach form");
		//Part filepart = request.getPart("bild");
		//form.setFilename(filepart.getSubmittedFileName());
		
		//String[] generatedKeys = new String[] {"artikel_id"};
		
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("INSERT INTO thidb.test (artikel_bezeichnung, preis, lagerbestand) VALUES (?, ?, ?)")){
			
			pstmt.setString(1, form.getArtikelbezeichnung());
			pstmt.setBigDecimal(2, form.getPreis());
			pstmt.setInt(3, form.getLagerbestand());
			pstmt.executeUpdate();
			
		try (ResultSet rs = pstmt.getGeneratedKeys()){
			while (rs.next()) {
				form.setArtikel_id(rs.getInt(1));
			}
		}
		}
	catch (Exception ex) {
		throw new ServletException(ex.getMessage());
		}
		System.out.println("nach datenbank");
	// Scope "Request"
	//request.setAttribute("form", form);
	
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

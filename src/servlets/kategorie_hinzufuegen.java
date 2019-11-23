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

import beans.kategorie_bean;

@WebServlet("/kategorie_hinzufuegen")
@MultipartConfig(
        maxFileSize=2024*2024*5,
        maxRequestSize=2024*2024*5*5, 
        location= "/tmp",
        fileSizeThreshold=2024*2024)

public class kategorie_hinzufuegen extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	// In diesem Format erwartet das Servlet jetzt die Formulardaten
		
	//	HttpSession session = request.getSession();
		
		kategorie_bean kat_bean = new kategorie_bean();
		kat_bean.setKategoriebezeichnung(request.getParameter("kategorie_bezeichnung"));
		kat_bean.setGeschlecht(request.getParameter("kategorie_geschlecht"));
		
		String[] generatedKeys = new String[] {"kategorie_id"};
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("INSERT INTO thidb.kategorie (kategoriebezeichnung, geschlecht) VALUES (?, ?)", generatedKeys)){
			
			pstmt.setString(1, kat_bean.getKategoriebezeichnung());
			pstmt.setString(2, kat_bean.getGeschlecht());
			pstmt.executeUpdate();
			
		try (ResultSet rs = pstmt.getGeneratedKeys()){
			while (rs.next()) {
				kat_bean.setKategorie_id(rs.getInt(1));
			}
		}
		}
	catch (Exception ex) {
		throw new ServletException(ex.getMessage());
		}
	
	final RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/adminpage_sucess.jsp");
	dispatcher.forward(request, response);		
	
	//noch Fehlerabfangen: bezeichnung und geschelcht kombi existiert bereits
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}
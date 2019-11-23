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
        maxFileSize=1024*1024*5,
        maxRequestSize=1024*1024*5*5, 
        location= "/tmp",
        fileSizeThreshold=1024*1024)

public class artikel_hinzufuegen extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	
		
		artikel_bean art_bean = new artikel_bean();
		//�nderung von artikelbezeichnung
		art_bean.setArtikelbezeichnung(request.getParameter("art_bez"));
		BigDecimal preis = new BigDecimal (request.getParameter("preis"));
		art_bean.setPreis(preis);
		int kat_id = Integer.parseInt(request.getParameter("alleKategorienLaden"));
		art_bean.setKategorie_id(kat_id);
		
		/* Hier anfangend mit Bild Upload - welchen Filename bekommt das Ganze  */
		Part filepart = request.getPart("bild");
		art_bean.setBildname(filepart.getSubmittedFileName());
		System.out.println(filepart.getSize());

		//Bildübertragung
		try (ByteArrayOutputStream baos = new ByteArrayOutputStream(); InputStream in = filepart.getInputStream()) {
			int i = 0;
			while ((i = in.read()) != -1) {
				baos.write(i);
			}
			art_bean.setBild(baos.toByteArray());
			baos.flush();
		} catch (IOException ex) {
			throw new ServletException(ex.getMessage());
		}
		/* hier hört auf nur für Bild annahme */
		
		String[] generatedKeys = new String[] {"artikel_id"};
		
		//Part filepart = request.getPart("image");
		//art_bean.setFilename(filepart.getSubmittedFileName());
		try (Connection con = ds.getConnection();
			PreparedStatement pstmt = con.prepareStatement("INSERT INTO thidb.artikel (artikelbezeichnung, preis, kategorie, bildname, bild) VALUES (?, ?, ?, ?, ?)", generatedKeys)){
			
			pstmt.setString(1, art_bean.getArtikelbezeichnung());
			pstmt.setBigDecimal(2, art_bean.getPreis());
			pstmt.setInt(3,art_bean.getKategorie_id());
			pstmt.setString(4, art_bean.getBildname());
			pstmt.setBytes(5, art_bean.getBild());
			pstmt.executeUpdate();
			
			try (ResultSet rs = pstmt.getGeneratedKeys()){
				while (rs.next()) {
					art_bean.setArtikel_id(rs.getInt(1));
				}
			}
			
}
	catch (Exception ex) {
		throw new ServletException(ex.getMessage());
		}
	
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
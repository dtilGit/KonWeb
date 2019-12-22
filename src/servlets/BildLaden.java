package servlets;

import java.io.IOException;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

//Servlet zum Auslesen der Bilder aus der DB

@WebServlet("/BildLaden")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 5,
		maxRequestSize = 1024 * 1024 * 5 * 5,
		location = "/tmp",
		fileSizeThreshold = 1024 * 1024
)
public class BildLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;


@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
private DataSource ds;


public BildLaden() {
 super();

}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	HttpSession session = request.getSession();
	if(session.getAttribute("form") == null) {
	final RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/login/login.jsp");
	dispatcher.forward(request, response);
	}
	
	request.setCharacterEncoding("UTF-8");	
	Integer artikel_id = Integer.valueOf(request.getParameter("artikel_id"));
	
	// fast vollständig aus dem JDBC-Script übernommen
	try (Connection con = ds.getConnection();
		 PreparedStatement pstmt = con.prepareStatement("SELECT bild FROM thidb.artikel WHERE artikel_id = ?" )) {
	pstmt.setLong(1, artikel_id);
		try (ResultSet rs = pstmt.executeQuery()) {
		
			if (rs != null && rs.next()) {
				Blob bild = rs.getBlob("bild");
				response.reset();
				long length = bild.length();
				response.setHeader("Content-Length",String.valueOf(length));
				
				try (InputStream in = bild.getBinaryStream()) {
					final int bufferSize = 256;
					byte[] buffer = new byte[bufferSize];
					
					ServletOutputStream out = response.getOutputStream();
					while ((length = in.read(buffer)) != -1) {
						out.write(buffer,0,(int) length);
					}
					out.flush();
				}
			}
		}
	} catch (Exception ex) {
		throw new ServletException(ex.getMessage());
	}
}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doGet(request, response);
}

}

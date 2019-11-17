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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

//Servlet zum Auslesen der Bilder aus der DB

@WebServlet("/bild_laden")
public class bild_laden extends HttpServlet {
	private static final long serialVersionUID = 1L;


@Resource(lookup="jdbc/MyTHIPool")
private DataSource ds;


public bild_laden() {
 super();

}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	HttpSession session = request.getSession();
	if(session.getAttribute("form") == null) {
	final RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/login/login.jsp");
	dispatcher.forward(request, response);
	}
	
	request.setCharacterEncoding("UTF-8");	
	Integer idartikel = Integer.valueOf(request.getParameter("artikel_id"));
	
	// DB-Zugriff
	try (Connection con = ds.getConnection();
		 PreparedStatement pstmt = con.prepareStatement("SELECT bild FROM artikel WHERE artikel_id = ?" )) {
	pstmt.setLong(1, idartikel);
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

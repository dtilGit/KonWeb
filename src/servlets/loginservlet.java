package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import beans.loginbean;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet ("/loginservlet")

public class loginservlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Resource(lookup = "jdbc/MyTHIPool")
	private DataSource datasource;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//this.doPost(request,response);}
		doGet(request, response);}
	
	protected void doPost (HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
	
		String email = request.getParameter("email");
		String passwort = request.getParameter("passwort");
		
		loginbean login = checkUser(email);
		HttpSession session=request.getSession();
		RequestDispatcher disp;
		
		//Passwortüberprüfung
		if(passwort.equals(login.getPasswort())){
			session.setAttribute("login", login);
			disp=request.getRequestDispatcher("/user/loginWeiterleitung.jsp");
			disp.forward(request, response);
			
		}else {	login.setFehlermeldung("Passwort ist nicht korrekt");
			}

		// Weiterleiten an JSP
		//final RequestDispatcher dispatcher = request.getRequestDispatcher("/user/loginWeiterleitung.jsp");
		//dispatcher.forward(request, response);
	}
	
	//Überprüfung, der login-Daten auf "Bereits registriert ja/nein?
	//Und ggf. Speicherung der Daten in die loginbean --> loginuser
	private loginbean checkUser (String email) throws ServletException{
		
		loginbean loginuser = new loginbean();
		
		//Überprüfung, ob bereits registriert
		try (Connection con = datasource.getConnection();
				PreparedStatement pstm = con.prepareStatement("Select * FROM thidb.kunde WHERE email = ?")){
				pstm.setString(1, email);
				ResultSet rs = pstm.executeQuery();
				if(rs.next()){
					loginuser.setPasswort("passwort");
					//admin ja/nein Überprüfung fehlt!
				}else {
					loginuser.setFehlermeldung("Sie sind noch nicht registriert.");
					
				}
				
		}catch (Exception e){
			throw new ServletException (e.getMessage());
		}
		return loginuser;
	}
	
}
	
	



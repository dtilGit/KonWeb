package edu.thi.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
    private DataSource ds;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<body>");
		try {
			final Connection con = ds.getConnection();
			if (con.isValid(10))
				out.println("<BR>Connected via @Resource!");
			con.close();
		} catch (Exception ex) {
			out.println(ex.getMessage()+"\n");
			ex.printStackTrace(out);
		}
		out.println("</body></html>");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

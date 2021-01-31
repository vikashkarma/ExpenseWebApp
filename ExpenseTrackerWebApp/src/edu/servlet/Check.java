package edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Check
 */
@WebServlet("/Check")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		PrintWriter out = response.getWriter();
		String acno = request.getParameter("user");
		System.out.println(acno);
		String pass = request.getParameter("pass");
		HttpSession session = request.getSession();
		session.setAttribute("sess", acno);

		try {

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:ques");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from bank where pass='" + pass + "' and Acno=" + acno);

			if (rs.next()) {
				String s1 = rs.getString(1);
				out.println("name" + s1);
				RequestDispatcher rd = request.getRequestDispatcher("/user.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("signin.html");
				rd.forward(request, response);
			}

		} catch (Exception e) {

		}
	}
}

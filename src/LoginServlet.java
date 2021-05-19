import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String USERNAME = req.getParameter("username");
		String PASSWORD = req.getParameter("password");
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","Ankita2704");
			PreparedStatement ps=con.prepareStatement("select * from medical_store where USERNAME=? and PASSWORD=?");
			ps.setString(1, USERNAME);
			ps.setString(2,PASSWORD);
			ResultSet rs =ps.executeQuery();
			resp.setContentType("text/html");
			PrintWriter out =resp.getWriter();
			
			
		if(rs.next())
		{
			HttpSession hs=req.getSession();
			hs.setAttribute("role", rs.getString("role"));
			out.println("<script>"
					+ "alert('Welcome "+USERNAME+"');"
					+ "window.location='Managestore.jsp'"
					+ "</script>");
			
		}
		else {
			out.println("<script>"
					+ "alert('incorrect username or password');"
					+ "window.location='Login.jsp'"
					+ "</script>");
		}
			
		} 
		catch (Exception e) 
		{
			
		}
	}
}

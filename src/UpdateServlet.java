import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int ID=Integer.parseInt(req.getParameter("ID"));
		String STORE_NAME = req.getParameter("store_name");
		String USERNAME = req.getParameter("username");
		
		String STORE_LICENCE =req.getParameter("select");
		int STORE_TYPE_ID = Integer.parseInt(req.getParameter("type"));
		
		
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","Ankita2704");
			PreparedStatement ps=con.prepareStatement("update medical_store set STORE_NAME=?,USERNAME=?,STORE_LICENCE=?,STORE_TYPE_ID=? where ID=?");
			ps.setString(1, STORE_NAME);
			ps.setString(2, USERNAME);
			ps.setString(3, STORE_LICENCE);
			ps.setInt(4, STORE_TYPE_ID);
		
			ps.setInt(5,ID);
			ps.execute();
			PrintWriter out=resp.getWriter();
			out.println("<script>"
					+ "alert('Medicine Updated Succesfully');"
					+ "window.location='Managestore.jsp'"
					+ "</script>");
			
		
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
	}
}

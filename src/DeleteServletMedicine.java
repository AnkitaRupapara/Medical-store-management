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


@WebServlet("/DeleteServletMedicine")
public class DeleteServletMedicine extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int ID=Integer.parseInt(req.getParameter("ID"));
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","Ankita2704");
			PreparedStatement ps=con.prepareStatement("delete from medicine_details where ID=?");
			ps.setInt(1, ID);
			ps.executeUpdate();
			PrintWriter out=resp.getWriter();
			out.println("<script>"
					+ "alert('Medicine Deleted Succesfully');"
					+ "window.location='Medicine.jsp'"
					+ "</script>");
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
	}
}

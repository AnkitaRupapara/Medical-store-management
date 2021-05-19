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

@WebServlet("/UpdateServletMedicine")
public class UpdateServletMedicine extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int ID=Integer.parseInt(req.getParameter("ID"));
		String MEDICINE_NAME = req.getParameter("medicine_name");
		
		float MEDICINE_PRICE = Float.parseFloat(req.getParameter("Price"));
		
		String MEDICINE_EXPIRY_DATE = req.getParameter("date");
		int STORE_ID = Integer.parseInt(req.getParameter("s_type"));
		int MEDICINE_TYPE_ID = Integer.parseInt(req.getParameter("m_type"));
		
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","Ankita2704");
			PreparedStatement ps=con.prepareStatement("update medicine_details set MEDICINE_NAME=?,MEDICINE_PRICE=?,MEDICINE_EXPIRY_DATE=?,MEDICINE_TYPE_ID=?,STORE_ID=? where ID=?");
			ps.setString(1, MEDICINE_NAME);
			ps.setFloat(2, MEDICINE_PRICE);
			ps.setString(3, MEDICINE_EXPIRY_DATE);
			
			ps.setInt(4,  MEDICINE_TYPE_ID);
			ps.setInt(5,STORE_ID);
			ps.setInt(6,ID);
			ps.execute();
			PrintWriter out=resp.getWriter();
			out.println("<script>"
					+ "alert('Medicine Updated Succesfully');"
					+ "window.location='Medicine.jsp'"
					+ "</script>");

		
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
	}
}

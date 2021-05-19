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
@WebServlet("/MedicineServlet")
public class MedicineServlet extends HttpServlet 
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String MEDICINE_NAME = req.getParameter("medicine_name");
		String MEDICINE_DETAILS =req.getParameter("details");
		float MEDICINE_PRICE  =Float.parseFloat(req.getParameter("Price"));
		int MEDICINE_QUANTITY = Integer.parseInt(req.getParameter("quantity"));
		String MEDICINE_EXPIRY_DATE = req.getParameter("date");
		int STORE_ID = Integer.parseInt(req.getParameter("type"));
		int MEDICINE_TYPE_ID = Integer.parseInt(req.getParameter("m_type"));
		int  COMPANY_ID = Integer.parseInt(req.getParameter("var"));
		
		
																									
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","Ankita2704");
			PreparedStatement ps =con.prepareStatement("insert into medicine_details(MEDICINE_NAME,MEDICINE_DETAILS,MEDICINE_PRICE,MEDICINE_QUANTITY,MEDICINE_EXPIRY_DATE,STORE_ID,MEDICINE_TYPE_ID, COMPANY_ID) values(?,?,?,?,?,?,?,?)");
			ps.setString(1, MEDICINE_NAME);
			ps.setString(2, MEDICINE_DETAILS);
			ps.setFloat(3, MEDICINE_PRICE);
			ps.setInt(4, MEDICINE_QUANTITY);
			ps.setString(5, MEDICINE_EXPIRY_DATE);
			ps.setInt(6,  STORE_ID);
			ps.setInt(7,MEDICINE_TYPE_ID);
			ps.setInt(8, COMPANY_ID);
			ps.executeUpdate();
			PrintWriter out=resp.getWriter();
			out.println("<script>"
					+ "alert('Medicine added successfully!!!');"
					+ "window.location='Medicine.jsp'"
					+ "</script>");

			
		}
		catch (Exception e)
		{
			System.out.println(e);
			PrintWriter out=resp.getWriter();
			out.println("<script>"
					+ "window.location='addmedicine.jsp'"
					+ "</script>");
		}
		
		
	}
}

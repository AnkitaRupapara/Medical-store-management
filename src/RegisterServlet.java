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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String STORE_NAME = req.getParameter("store_name");
		String USERNAME = req.getParameter("username");
		String PASSWORD = req.getParameter("password");
		String STORE_EMAIL_ID =req.getParameter("email");
		String MOBILE_NUMBER =req.getParameter("mobile");
		String  STORE_REGISTRATION_NO =req.getParameter("registration");
		String ADDRESS_1= req.getParameter("address1");
		String ADDRESS_2= req.getParameter("address2");
		String STORE_LICENCE =req.getParameter("select");
		int STORE_TYPE_ID = Integer.parseInt(req.getParameter("type"));
		String role= req.getParameter("role");
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","Ankita2704");
			PreparedStatement ps=con.prepareStatement("insert into medical_store (STORE_NAME,USERNAME,PASSWORD,STORE_EMAIL_ID,MOBILE_NUMBER,ADDRESS_1,ADDRESS_2,STORE_LICENCE,STORE_TYPE_ID,STORE_REGISTRATION_NO,role) values(?,?,?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, STORE_NAME);
			ps.setString(2, USERNAME);
			ps.setString(3, PASSWORD);
			ps.setString(4, STORE_EMAIL_ID);
			ps.setString(5, MOBILE_NUMBER);
			ps.setString(6, ADDRESS_1);
			ps.setString(7, ADDRESS_2);
			ps.setString(8 ,STORE_LICENCE);
			ps.setInt(9, STORE_TYPE_ID);
			ps.setString(10, STORE_REGISTRATION_NO);
			ps.setString(11, role);
			ps.executeUpdate();
			PrintWriter out=resp.getWriter();
			out.println("<script>"
					+ "alert('Registered Successfully!!!');"
					+ "window.location='Login.jsp'"
					+ "</script>");

			
		}
		catch (Exception e) 
		{
			System.out.println(e);
			PrintWriter out=resp.getWriter();
			out.println("<script>"
					+ "alert('Username Already exist!!!');"
					+ "window.location='register.jsp'"
					+ "</script>");

		}
	}
		
		
		
	}



import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns= {"/addmedicine.jsp","/MedicineServlet","/edit.jsp","/UpdateServlet","/editmedicine.jsp","/UpdateServletMedicine"})
public class LoginFilter implements Filter 
{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException 
	{
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		
		HttpSession hs=req.getSession();
		if(hs.getAttribute("role")==null)
		{
			resp.sendRedirect("Login.jsp");
		}
		
		chain.doFilter(req, resp);
	}
}

import java.io.IOException;
import java.io.PrintWriter;
//// import javax.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author sbhatt3
 *
 */
public class LandingPage extends HttpServlet{ 

	@Override
	public void doPost(final HttpServletRequest request, final HttpServletResponse response)
			throws ServletException,IOException{
		response.setContentType("text/html"); 
		final PrintWriter out = response.getWriter();
		String nextJSP = Messages.getString("homepage"); 
		System.out.println("MySQL Connect Example."); 
		Connection conn = null;
		final String url = Messages.getString("connectionURL"); 
		final String dbName = Messages.getString("database"); 
		final String driver = Messages.getString("dbDriver"); 
		final String userName = Messages.getString("dbuser");  
		final String password = Messages.getString("dbPassword"); 
		System.out.println("request.getHeader(Referer);>>>>>>>>>>>"+request.getHeader("Referer"));  
		if(!(request.getHeader("Referer")!=null && request.getHeader("Referer").contains("ttallur1:7001")))   
		{
			request.setAttribute("message","Not Valid User");  

			nextJSP = Messages.getString("homepage"); 
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			//dispatcher.forward(request,response);
		}
		//request.getHeader("Referer");
		System.out.println("Connected to the databas1>>>>>>>>>>>efg"+url+dbName); 
		Statement st;
		try {
			Class.forName(driver).newInstance();

			conn = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database"); 

			ArrayList al=null;
			final ArrayList userList =new ArrayList();
			ArrayList projectList =new ArrayList();
			final String query = Messages.getString("loginQuery"); 
			System.out.println("query " + query); 
			st = conn.createStatement();
			final ResultSet  rs = st.executeQuery(query);
			boolean flag=false;
			boolean isLogin=true;
			System.out.println("request.getAttribute(username :: "+request.getParameter("userName"));  
			if(request.getParameter("userName")!=null) 
			{}else
			{

				isLogin=false;
				request.setAttribute("page",null); 
				flag=true;
			}


			while(rs.next())
			{
				al  = new ArrayList();

				if(isLogin &&( request.getParameter("userName").equalsIgnoreCase(rs.getString(1)) &&request.getParameter("password").equalsIgnoreCase(rs.getString(2))) )  
				{
					System.out.println("inlogin>>>>>>>>>>"); 
					al.add(rs.getString(1));
					al.add(rs.getString(2));
					al.add(rs.getString(3)); 
					flag=true;
					userList.add(al);

					System.out.println("al :: "+al); 
					break;

				}
			}
			System.out.println("<>>>>>>>>>>>>>>>"+flag); 

			HttpSession session = null;
			session = request.getSession(true);
			session.removeAttribute("sessionid"); 





			session.setMaxInactiveInterval(30*60);
			if(flag)
			{



				projectList=getProjectDetails(conn);
				//request.setAttribute("userList",userList);
				session.setAttribute("sessionid",session.getId()); 
				session.setAttribute("userName", al.get(0)); 
				session.setAttribute("userRole", al.get(2)); 
				System.out.println("<>>>>>>>>>>>>>>>"+session.getId()); 
				System.out.println("<>>>>>>>>>>>>>>>"+projectList); 
				request.setAttribute("projectList", projectList); 
				System.out.println("<>>>>>>>>>>>>>>>"+2); 
				request.setAttribute("message","");  
				System.out.println("<>>>>>>>>>>>>>>>"+3); 
				nextJSP = "/home/"; 
				System.out.println("<>>>>>>>>>>>>>>>"+4); 
				conn.close();
				System.out.println("Disconnected from database"); 



			}
			else
			{
				request.setAttribute("message","Not Valid User");  
				System.out.println("<>>>>>>>>>>>>>>>"+6); 

				conn.close();
				System.out.println("Disconnected from database"); 


			}
			getServletContext().getRequestDispatcher(nextJSP).forward(request,response);


			return ;  


		} catch (final Exception e) {
			System.out.println("<>>>>>>>>>>>>>>>"+7); 
			e.printStackTrace();
			System.out.println(e);
		}
	}

	private ArrayList getProjectDetails(final Connection conn) {
		final ArrayList projects=new ArrayList();
		// TODO Auto-generated method stub
		try{
			final String query = Messages.getString("GetAppProjectQuery"); 
			System.out.println("query " + query); 
			final Statement st1 = conn.createStatement();
			final ResultSet  rs = st1.executeQuery(query);

			ArrayList p1=new ArrayList();

			while(rs.next())
			{
				p1  = new ArrayList();
				p1.add(rs.getString(1));
				p1.add(rs.getString(2));
				p1.add(rs.getString(3));
				p1.add(rs.getString(4));
				p1.add(rs.getString(5));
				p1.add(rs.getString(6));
				p1.add(rs.getString(7));
				p1.add(rs.getString(8));
				p1.add(rs.getString(9)); 

				if(rs.getString(10)!=null && rs.getString(10).equalsIgnoreCase("true")) 
				{
					p1.add("Yes"); 
				}else {
					p1.add(""); 
				}
				if(rs.getString(11)!=null && rs.getString(11).equalsIgnoreCase("true")) 
				{
					p1.add("Yes"); 
				}else {
					p1.add(""); 
				}
				if(rs.getString(12)!=null && rs.getString(12).equalsIgnoreCase("true")) 
				{
					p1.add("Yes"); 
				}else {
					p1.add(""); 
				}


				projects.add(p1);
			}


		}catch(final Exception e)
		{System.out.println(e);}

		return projects;
	}



}
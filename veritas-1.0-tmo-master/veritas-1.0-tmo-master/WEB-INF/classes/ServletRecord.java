import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class ServletRecord extends HttpServlet{ 
 
   public void doPost(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			  String nextJSP = "/index.jsp";
			System.out.println("MySQL Connect Example.");
			Connection conn = null;
			String url = Messages.getString("connectionURL"); 
			String dbName = Messages.getString("database"); 
			String driver = Messages.getString("dbDriver"); 
			String userName = Messages.getString("dbuser");  
			String password = Messages.getString("dbPassword");
			System.out.println("request.getHeader(Referer);>>>>>>>>>>>"+request.getHeader("Referer"));
			if(!(request.getHeader("Referer")!=null && request.getHeader("Referer").contains("ttallur1:7001")))
			{
				 request.setAttribute("message","Not Valid User");
					
	                 nextJSP = "/index.jsp";
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
					//dispatcher.forward(request,response);
			}
//request.getHeader("Referer");
			System.out.println("Connected to the databas1>>>>>>>>>>>e"+url+dbName);
			Statement st;
			try {
				Class.forName(driver).newInstance();
				
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				
				ArrayList al=null;
				ArrayList userList =new ArrayList();
				ArrayList projectList =new ArrayList();
				String query = "select * from login";
				System.out.println("query " + query);
				st = conn.createStatement();
				ResultSet  rs = st.executeQuery(query);
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
					
				
					
					
					
					session.setMaxInactiveInterval(60*60);
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
				

			} catch (Exception e) {
				 System.out.println("<>>>>>>>>>>>>>>>"+7);
			e.printStackTrace();
			System.out.println(e);
			}
  }

private ArrayList getProjectDetails(Connection conn) {
	ArrayList projects=new ArrayList();
	// TODO Auto-generated method stub
	try{
	String query = "select * from project order by ProjectTitle";
	System.out.println("query " + query);
	Statement st1 = conn.createStatement();
	ResultSet  rs = st1.executeQuery(query);
	
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
		  projects.add(p1);
	}
	
	
	}catch(Exception e)
	{System.out.println(e);}
	
	return projects;
}



}
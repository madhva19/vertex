import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class ViewAllReviewStatus extends HttpServlet{ 
 
   public void doGet(HttpServletRequest request, HttpServletResponse response)
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
			
			System.out.println("Connected to the databas1>>>>>>>>>>>e"+url+dbName);
			Statement st;
			try {
				Class.forName(driver).newInstance();
				
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				
				ArrayList al=null;
				ArrayList userList =new ArrayList();
				ArrayList projectList =new ArrayList();
				
					 projectList=getAllHLSD(conn);
					 //request.setAttribute("userList",userList);
					 System.out.println("<>>>>>>>>c>>>>>>>"+projectList);
					 request.setAttribute("hlsdList", projectList);
					 System.out.println("<>>>>>>>>>>>>>>>"+2);
					 request.setAttribute("message","");
					 System.out.println("<>>>>>>>>>>>>>>>"+3);
		                 nextJSP = "/allReviewUI/";
		                System.out.println("<>>>>>>>>>>>>>>>"+4);
						 conn.close();
							System.out.println("Disconnected from database");
				
						
				
				
					getServletContext().getRequestDispatcher(nextJSP).forward(request,response);
					
					
					return ;  
				

			} catch (Exception e) {
				 System.out.println("<>>>>>>>>>>>>>>>"+7);
			e.printStackTrace();
			System.out.println(e);
			}
  }

private ArrayList getAllHLSD(Connection conn) {
	ArrayList projects=new ArrayList();
	// TODO Auto-generated method stub
	try{
		
	
		
		
		
		
		
		
		
	String query = "Select b.ProjectID ,b.ProjectNumber,b.ProjectTitle,a.ReviewDate,a.ReviewStatus,	a.BRDbaslined,	a.HLSDReceived,	a.HLSDReviewWithBiz,a.AttendeesReceived,a.DocSentToReviewer,a.ReviewDecReceived,a.MOMSent, b.ProjectType,b.Workstream,a.ReviewsType from projectmanagementservice.hlsd a	 Join projectmanagementservice.project b    on a.ProjectID = b.ProjectID and b.ProjectStatus != 'Dependency'";
	System.out.println("query1 " + query);
	Statement st1 = conn.createStatement();
	ResultSet  rs = st1.executeQuery(query);
	
	ArrayList p1=new ArrayList();
	ArrayList p2=new ArrayList();
	
	
	
	
	
	while(rs.next())
	{
		p1  = new ArrayList();
		  p1.add(rs.getString(1));
		  p1.add(rs.getString(2));
		  p1.add(rs.getString(13));
		  p1.add(rs.getString(3));
		  p1.add(rs.getString(14));
		  p1.add(rs.getString(15));
		  p1.add(rs.getString(4));
		  p1.add(rs.getString(5));
		
		  
		 
		  if(rs.getString(6)!=null && !rs.getString(6).equalsIgnoreCase("null"))
		  {
			  p1.add(rs.getString(6));
		  }else 
		  {
			  p1.add("false");
		  }
		  if(rs.getString(7)!=null && !rs.getString(7).equalsIgnoreCase("null"))
		  {
			  p1.add(rs.getString(7));
		  }else 
		  {
			  p1.add("false");
		  }
		  if(rs.getString(8)!=null && !rs.getString(8).equalsIgnoreCase("null"))
		  {
			  p1.add(rs.getString(8));
		  }else 
		  {
			  p1.add("false");
		  }
		  if(rs.getString(9)!=null && !rs.getString(9).equalsIgnoreCase("null"))
		  {
			  p1.add(rs.getString(9));
		  }else 
		  {
			  p1.add("false");
		  }
		  if(rs.getString(10)!=null && !rs.getString(10).equalsIgnoreCase("null"))
		  {
			  p1.add(rs.getString(10));
		  }else 
		  {
			  p1.add("false");
		  }
		  
		  if(rs.getString(11)!=null && !rs.getString(11).equalsIgnoreCase("null"))
		  {
			  p1.add(rs.getString(11));
		  }else 
		  {
			  p1.add("false");
		  }
		  if(rs.getString(12)!=null && !rs.getString(12).equalsIgnoreCase("null"))
		  {
			  p1.add(rs.getString(12));
		  }else 
		  {
			  p1.add("false");
		  }
		  
			String query1 = " select ProjectResource from  projectmanagementservice.projectleadership where ProjectID="+rs.getString(1);
			System.out.println("query1 " + query1);
			Statement st2 = conn.createStatement();
			ResultSet  rs2 = st2.executeQuery(query1);  
		 String resource="";
			while(rs2.next())
			  
		  {
			  
				resource  = resource+rs2.getString(1)+",";
			  
		  }
		  
		 	  
		  p1.add(resource); 
	
		  projects.add(p1);
	}
	
	
	}catch(Exception e)
	{System.out.println(e);}
	
	return projects;
}



}
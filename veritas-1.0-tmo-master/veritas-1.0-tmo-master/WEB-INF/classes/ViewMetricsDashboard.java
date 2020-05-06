import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class ViewMetricsDashboard extends HttpServlet{ 
 
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
				
					 projectList=getProjectDetails(conn);
					 //request.setAttribute("userList",userList);
					 System.out.println("<>>>>>>>>c>>>>>>>"+projectList);
					 request.setAttribute("projectList", projectList);
					 System.out.println("<>>>>>>>>>>>>>>>"+2);
					 request.setAttribute("message","");
					 System.out.println("<>>>>>>>>>>>>>>>"+3);
		                 nextJSP = "/MetricsDashboard/";
		                System.out.println("<>>>>>>>>>>>>>>>sudhanshu"+4);
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

private ArrayList getProjectDetails(Connection conn) {
	ArrayList projects=new ArrayList();
	// TODO Auto-generated method stub
	try{
	
		
	String query = "Select c.ReviewId,a.projectNumber,a.ProjectTitle,a.ProjectCategory, \n" + 
			"			a.ProjectType, c.ReviewsType, c.ReviewDate,c.ReviewStatus\n" + 
			"				from projectmanagementservice.project a, projectmanagementservice.hlsd c where a.ProjectID=c.ProjectID AND a.ProjectStatus != 'Dependency' Order by UNIX_TIMESTAMP(ReviewDate) DESC;";

	System.out.println("query " + query);
	Statement st1 = conn.createStatement();
	ResultSet  rs = st1.executeQuery(query);
	System.out.println("Result Set :"+rs);
	
	ArrayList p1=new ArrayList();
	
	while(rs.next())
	{	  
		  p1  = new ArrayList();
		  p1.add(rs.getString(1));
	 	  p1.add(rs.getString(2));
		 
		 /* if(rs.getString(5)!=null && rs.getString(5).equalsIgnoreCase("true"))
		  {
			  
		 	
		 	  p1.add("This is restricted Project you can view it only after you are RPAed");
		  }else {
			
			  p1.add(rs.getString(3));
		  }*/
	 	 p1.add(rs.getString(3));
		  
		  p1.add(rs.getString(4));
		  p1.add(rs.getString(5));
		  p1.add(rs.getString(6));
		  p1.add(rs.getString(7));
		  p1.add(rs.getString(8));
		  
		  /*<option value="Record_Added">To be Scheduled </option>
    <option value="Review_Pending">Pending Review</option>
    <option value="Approved">Approved</option>
    <option value="ReturnwithComment">Return with Feedback</option>
	 <option value="ReviewInProgress">Review In Progress</option>
	 <option value="hold">Put on Hold</option>	*/  
		 
		  
		  projects.add(p1);
		
	}
	
	
	}catch(Exception e)
	{System.out.println(e);}
	
	return projects;
}



}
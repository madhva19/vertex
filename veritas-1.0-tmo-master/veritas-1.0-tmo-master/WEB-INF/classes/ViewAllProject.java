import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class ViewAllProject extends HttpServlet{ 
 
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
		                 nextJSP = "/allProj/";
		                System.out.println("<>>>>>>>>>>>>>>>"+4);
						 conn.close();
							System.out.println("Disconnected from database ViewAll project");
				
						
				
				
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
		HashMap EAC=new HashMap();
		HashMap LeadArch=new HashMap();
		
		 String eacQuery="select b.ProjectID,b.ProjectResource from projectmanagementservice.projectleadership b where b.ProjectRole='EACArchitect'";
		  String leadQuery ="select b.ProjectID,b.ProjectResource  from projectmanagementservice.projectleadership b where b.ProjectRole='LeadArchitect'";
		
	String query = "	select a.ProjectID,a.projectNumber,a.ProjectTitle,a.ProjectStatus ,a.Restricted,c.ReviewDate AS ReveiwDate,c.ReviewStatus,c.ReviewsType\n" + 
			"from projectmanagementservice.project a, projectmanagementservice.hlsd c where a.ProjectID=c.ProjectID Order by UNIX_TIMESTAMP(ReviewDate) DESC, a.ProjectID DESC";
	Statement st2 = conn.createStatement();
	ResultSet  rs2 = st2.executeQuery(eacQuery);
	Statement st3 = conn.createStatement();
	ResultSet  rs3 = st3.executeQuery(leadQuery);
	while(rs2.next())
	{
		if(rs2.getString(2)!=null && !rs2.getString(2).equalsIgnoreCase("null"))
			
		{
			if (EAC.get(rs2.getString(1))!=null && EAC.get(rs2.getString(1)).toString()!=" ")
			{
				String EACArch=EAC.get(rs2.getString(1)).toString()+" , "+ rs2.getString(2);
				EAC.put(rs2.getString(1), EACArch);
				
			}else {
			
			EAC.put(rs2.getString(1), rs2.getString(2));
			}
		}else 
		{
			EAC.put(rs2.getString(1)," ");
		}
	}
	
	while(rs3.next())
	{
		
		if(rs3.getString(2)!=null && !rs3.getString(2).equalsIgnoreCase("null"))
		{
			
			
			if (LeadArch.get(rs3.getString(1))!=null && LeadArch.get(rs3.getString(1)).toString()!=" ")
			{
				String LeadArchString=LeadArch.get(rs3.getString(1)).toString()+" , "+ rs3.getString(2);
				LeadArch.put(rs3.getString(1), LeadArchString);
				
			}else {
			
			
			
			LeadArch.put(rs3.getString(1), rs3.getString(2));
			}
		}else 
		{
			LeadArch.put(rs3.getString(1), " ");
		}
		
		
		
	}
			 
		
	
	System.out.println("query " + query);
	Statement st1 = conn.createStatement();
	ResultSet  rs = st1.executeQuery(query);
	
	ArrayList p1=new ArrayList();
	
	while(rs.next())
	{
		if(rs.getString(4)!=null && !rs.getString(4).trim().equalsIgnoreCase("null") && !rs.getString(4).trim().equalsIgnoreCase("")&& !rs.getString(4).trim().equalsIgnoreCase("Dependency"))
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
		 
		  if(LeadArch.get(rs.getString(1))!=null && !LeadArch.get(rs.getString(1)).toString().equalsIgnoreCase("null"))
		  {
		  p1.add(LeadArch.get(rs.getString(1)));
		  }else
		  {
			  p1.add(" ");
		  }
		  if(EAC.get(rs.getString(1))!=null && !EAC.get(rs.getString(1)).toString().equalsIgnoreCase("null"))
		  {
			  p1.add(EAC.get(rs.getString(1)));
		  }else
		  {
			  p1.add(" ");
		  }
		  if(rs.getString(8)!=null)
		  {
			  if(rs.getString(8).trim().equalsIgnoreCase("null"))
					  {
				  p1.add("HLSD");
					  }else
					  {
						  p1.add(rs.getString(8).split(" ")[0]); 
					  }
		  }else
		  {
			  p1.add("HLSD");
		  }
	
		  
		
		  p1.add(rs.getString(6));
		  
		  /*<option value="Record_Added">To be Scheduled </option>
    <option value="Review_Pending">Pending Review</option>
    <option value="Approved">Approved</option>
    <option value="ReturnwithComment">Return with Feedback</option>
	 <option value="ReviewInProgress">Review In Progress</option>
	 <option value="hold">Put on Hold</option>	*/  
		  
		  
		  if(rs.getString(7)!=null && rs.getString(7).toString().equalsIgnoreCase("Review_Pending"))
		  {
			  p1.add("Pending Review"); 
		  }else {
		  
		  if(rs.getString(7)!=null && rs.getString(7).toString().equalsIgnoreCase("Record_Added"))
		  {
			  p1.add("To be Scheduled "); 
		  }else {
		  
		  if(rs.getString(7)!=null && rs.getString(7).toString().equalsIgnoreCase("Approved"))
		  {
			  p1.add("Approved"); 
		  }else {
			  if(rs.getString(7)!=null && (rs.getString(7).toString().equalsIgnoreCase("ApprovedWithAI")|| rs.getString(7).toString().equalsIgnoreCase("Approved pending AI")))
			  {
				  p1.add("Approved with AIs"); 
			  }
		  
		  
		  
		  else {
		  if(rs.getString(7)!=null && rs.getString(7).toString().equalsIgnoreCase("ReturnwithComment"))
		  {
			  p1.add("Returned with Feedback"); 
		  }
		  else {
		  if(rs.getString(7)!=null && rs.getString(7).toString().equalsIgnoreCase("ReviewInProgress"))
		  {
			  p1.add("Review In Progress"); 
		  }else {
		  
		  if(rs.getString(7)!=null && rs.getString(7).toString().equalsIgnoreCase("hold"))
		  {
			  p1.add("Put on Hold"); 
		  }else {
			  p1.add(rs.getString(7));
			  
		  }}}}}}}
			  
		  
		 
		  
		  
		  
		 
		
		  
		  projects.add(p1);
		}
	}
	
	
	}catch(Exception e)
	{System.out.println(e);}
	
	return projects;
}



}
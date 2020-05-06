import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class ViewAllProjectDependency extends HttpServlet{ 
 
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
					 
					 Map<Object,Object> map = null;
					
						List<Map<Object,Object>> projDep = new ArrayList<Map<Object,Object>>();
						List<Map<Object,Object>> depProj = new ArrayList<Map<Object,Object>>();
						HashMap project=new HashMap();
					 
						Statement st1,st2,st3,st4,st5,st6,st7,st8;
					 
					 String query4 ="select ProjectID,count(*) from projectmanagementservice.project_dependency group by projectID";
						String query5 ="select DependentProjectID,count(*) from projectmanagementservice.project_dependency group by DependentProjectID";
						String query7 ="select projectID,ProjectNumber from projectmanagementservice.project";
					 
						System.out.println("query7 " + query7);
						st = conn.createStatement();
						ResultSet  rs = st.executeQuery(query7);
						while(rs.next())
						{
							project.put(rs.getString(1), rs.getString(2));
							
						}
						
						
						System.out.println("query4 " + query4);
						st6 = conn.createStatement();
						ResultSet  rs6 = st6.executeQuery(query4);
						while(rs6.next())
						{
							if(Integer.parseInt(rs6.getString(2))>5)
							{
							map = new HashMap<Object,Object>();
							map.put("label", project.get(rs6.getString(1))); 
							map.put("y",Integer.parseInt(rs6.getString(2)));
							projDep.add(map);
							}
						}
						
						System.out.println("query5" + query5);
						st7 = conn.createStatement();
						ResultSet  rs7 = st7.executeQuery(query5);
						while(rs7.next())
						{
							if(Integer.parseInt(rs7.getString(2))>5)
							{
							map = new HashMap<Object,Object>();
							map.put("label", project.get(rs7.getString(1))); 
							map.put("y",Integer.parseInt(rs7.getString(2)));
							depProj.add(map);
						}}
					 
					 
					 //request.setAttribute("userList",userList);
					 System.out.println("<>>>>>>>>c>>>>>>>"+projectList);
					 HttpSession session = request.getSession(false);
					 request.setAttribute("projectDependency", projectList);
					 session.setAttribute("projDep",projDep);
		                session.setAttribute("depProj",depProj);
					 System.out.println("<>>>>>>>>>>>>>>>"+2);
					 request.setAttribute("message","");
					 System.out.println("<>>>>>>>>>>>>>>>"+3);
		                 nextJSP = "/ProjectDependency/";
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

private ArrayList getProjectDetails(Connection conn) {
	ArrayList projects=new ArrayList();
	// TODO Auto-generated method stub
	try{
	String query = "select * from project order by ProjectTitle";
	
	query="Select  c.ProjectNumber , c.ProjectTitle    ,  c.TargetDeployment,c.ProjectStatus     , b.ProjectNumber     , b.ProjectTitle    " + 
			"    , b.ProjectStatus     , a.NatureOfDependency    , a.MitigationStrategies from 	projectmanagementservice.project_dependency a Join	projectmanagementservice.project b    on a.DependentProjectID = b.ProjectID Join	projectmanagementservice.project c    on a.ProjectID = c.ProjectID Order by 3 ";
	System.out.println("query ViewAllProjectDependency " + query);
	Statement st1 = conn.createStatement();
	ResultSet  rs = st1.executeQuery(query);
	
	ArrayList p1=new ArrayList();
	int count=0;
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
			  
			/*String query2 = "select project.projectid,project.ProjectNumber,project.ProjectTitle,project.ProjectType,project.ProjectStatus from projectmanagementservice.project where project.projectID in "
		  						+ "(select DependentProjectID from projectmanagementservice.project_dependency where projectID="+Integer.parseInt(rs.getString(1))+");" ;

		  System.out.println("query2 " + query2);
		  Statement st2 = conn.createStatement();
			ResultSet  rs2 = st2.executeQuery(query2);
			while(rs2.next())
			{
			  		if(count>0)
			  		{
			  			 projects.add(p1);
			  			 p1  = new ArrayList();
			  		  p1.add(rs.getString(1));
			  	 	  p1.add(rs.getString(2));
			  	 	 p1.add(rs.getString(3));
			  		  p1.add(rs.getString(4));
			  		  p1.add(rs.getString(8));
			  		  p1.add(rs.getString(9)); 
			  		  
			  		 
			  			
			  		}
				  p1.add(rs2.getString(3));
				  p1.add(rs2.getString(4));
				  p1.add(rs2.getString(5)); 	 
			count++;
			}
			
			   if(count==0)
			   {
				   p1.add("");
				   p1.add("");
				   p1.add("");
				   p1.add("");
				   p1.add("");
				 	  
			   }
		  
		  
		  */
		  
		  
		  projects.add(p1);
		
	}
	
	
	}
	catch(Exception e)
	{System.out.println(e);}
	
	return projects;
}



}
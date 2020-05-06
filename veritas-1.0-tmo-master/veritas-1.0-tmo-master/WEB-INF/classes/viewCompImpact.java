import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class viewCompImpact extends HttpServlet{ 
 
   public void doGet(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String str[] = request.getRequestURI().toString().split("/");

	         int compid = Integer.parseInt(str[3]);
			
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
				ArrayList compList =new ArrayList();
				try{
					String query1 = "select * from component where componentID="+compid;
					System.out.println("query " + query1);
					Statement st2 = conn.createStatement();
					ResultSet  rs1 = st2.executeQuery(query1);
					
					HashMap c1=new HashMap();
					
					
				
					
					while(rs1.next())
					{
						
						  c1.put("ComponentID",rs1.getString(1));
					 	  c1.put("ComponentName",rs1.getString(2));
						  c1.put("ComponentType",rs1.getString(3));
						  c1.put("ComponentOwner",rs1.getString(4));
						  
						 
					}
					
					 request.setAttribute("compDetail", c1);
					}catch(Exception e)
					{System.out.println(e);}
					 compList=getCompDetails(conn,compid);
					 //request.setAttribute("userList",userList);
					 System.out.println("<>>>>>>>>c>>>>>>>"+compList);
					 request.setAttribute("compprojectList", compList);
					
					 System.out.println("<>>>>>>>>>>>>>>>"+2);
					 request.setAttribute("message","");
					 System.out.println("<>>>>>>>>>>>>>>>"+3);
		                 nextJSP = "/viewCompDetails/";
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

private ArrayList getCompDetails(Connection conn, int compid) {
	ArrayList projects=new ArrayList();
	// TODO Auto-generated method stub
	try{
	String query = "select feature_component.ProjectID,feature_component.Impact,feature_component.TShirt_size,feature_component.ImpactType,feature_component.ImpactDetails from "
			+ "projectmanagementservice.feature_component where feature_component.componentID="+compid;
	System.out.println("query " + query);
	Statement st1 = conn.createStatement();
	ResultSet  rs = st1.executeQuery(query);
	
	ArrayList p1=new ArrayList();
	
	while(rs.next())
	{
		p1  = new ArrayList();
		 
	 	  
		  p1.add(rs.getString(1));
		
	 	  
	 	  
	 	
	 	
	 
		 	 
		 	 String query2 = "select project.projectNumber,project.ProjectTitle,project.targetdeployment,Project.workstream from "
			 			+ "projectmanagementservice.project where project.projectID="+Integer.parseInt(rs.getString(1));
			 	System.out.println("query1 " + query2);
			 	Statement st3 = conn.createStatement();
			 	ResultSet  rs2 = st3.executeQuery(query2);
			 	
			 	while(rs2.next())
				{
					
					  p1.add(rs2.getString(1));
				 	  p1.add(rs2.getString(2));
				 	 p1.add(rs2.getString(3));
				 	 p1.add(rs2.getString(4));
			 	  
				}
			 	p1.add(rs.getString(2));
				  p1.add(rs.getString(3));
				  p1.add(rs.getString(4));
				  p1.add(rs.getString(5));
	 	  
	
	 	  
		  projects.add(p1);
	}
	
	
	}catch(Exception e)
	{System.out.println(e);}
	
	return projects;
}



}
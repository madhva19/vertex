
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.util.*;

public class addComponentforProject extends HttpServlet{ 
 
   public void doGet(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String str[] = request.getRequestURI().toString().split("/");

         int projectID = Integer.parseInt(str[3]);
			System.out.println("MySQL Connect Example.");
			Connection conn = null;
			String url = Messages.getString("connectionURL"); 
			String dbName = Messages.getString("database"); 
			String driver = Messages.getString("dbDriver"); 
			String userName = Messages.getString("dbuser");  
			String password = Messages.getString("dbPassword");
			ArrayList compExistingList= new ArrayList();

		//	out.println(request.getRequestURI());
			Statement st,st1,st2,st3,st4,st5,st6;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				
				
				HashMap projectDescription=null;
				HashMap project=null;
				ArrayList featureList=new ArrayList();
				ArrayList featureListFinal=new ArrayList();
				HashMap leadership=null;
				ArrayList allcomponentList=new ArrayList();
				HashMap component=null;
				HashMap allcomponentMap=null;
				ArrayList componentList=new ArrayList();
				String query = "select * from feature_component  where ProjectID="+projectID;
				String query2 = "select * from project where ProjectID="+projectID;
				String query3 = "select * from component";
				
				
				
				
					
				System.out.println("query " + query);
				st = conn.createStatement();
				ResultSet  rs = st.executeQuery(query);
				

                System.out.println(query2);
               
				while(rs.next())
				{
				  
				       				 
        				 
        				 component =new HashMap();
        				 component.put("ProjectID",rs.getString(1));
        				 component.put("ComponentID",rs.getString(2));
        				 component.put("Impact",rs.getString(3));
        				 component.put("TShirt_Size",rs.getString(4));
        				 component.put("ImpactType",rs.getString(5));
	        				
        				 component.put("ImpactDetails",rs.getString(6));
 					  				  
 					  
 					 String query5 = "select * from component  where ComponentID="+Integer.parseInt(rs.getString(2));
 					 System.out.println(query5);
 					st5 = conn.createStatement();
 					 ResultSet  rs5 = st5.executeQuery(query5); 
 					 while(rs5.next())
	 					{
 						component.put("ComponentName",rs5.getString(2));
        				 component.put("ComponentType",rs5.getString(3));
        				 component.put("ComponentOwner",rs5.getString(4));
	 					}
 					 
 				
 					 
 					componentList.add(component);
 					compExistingList.add(rs.getString(2));
 					
 					 
 					}
        		
				
				st2 = conn.createStatement();
				ResultSet  rs2 = st2.executeQuery(query2);
				while(rs2.next())
				{
				  		project	=new  HashMap();
				 		project.put("ProjectID",rs2.getString(1));
				 		project.put("ProjectNumber",rs2.getString(2));
				 		project.put("ProjectTitle",rs2.getString(3));
				 		project.put("ProjectDescription",rs2.getString(4));
				 		project.put("Workstream",rs2.getString(9));
				  	  		
				 		 
				
				}
				
	
				
				
				st3 = conn.createStatement();
				 ResultSet  rs3 = st3.executeQuery(query3);
	                System.out.println(query3);
	                ArrayList p1=new ArrayList();
	                boolean add=true;
	                while(rs3.next())
					{
	                	p1  = new ArrayList();
	                	Iterator itx=compExistingList.iterator();
	                	while(itx.hasNext())
	        			{
	                		if(rs3.getString(1).equalsIgnoreCase(itx.next().toString()))
	                		{
	                			add=false;
	                		}
	                 	
	        			}
	                	if(add) {
	          		  p1.add(rs3.getString(1));
	          	 	  p1.add(rs3.getString(2));
	          		  p1.add(rs3.getString(3));
	          		  p1.add(rs3.getString(4));
	            	 	 
	            		  
	            	 	allcomponentList.add(p1);
	                	}else {
	                		add=true;
	                	}
					
					}
	                   
	                
	                
	                
	                
				
	                HttpSession session = request.getSession(false);
	              //save message in session
	             // session.setAttribute("helloWorld", "Hello world");
				
				

	                session.setAttribute("allcomponentList",allcomponentList);
	                session.setAttribute("project",project);
	                session.setAttribute("componentList",componentList);
				
                String nextJSP = "/Veritas/addComponentforProjectUI";
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
				//dispatcher.forward(request,response);
				conn.close();
				System.out.println("Disconnected from database");
				response.sendRedirect(nextJSP);
			
			} catch (Exception e) {
			e.printStackTrace();
			}
  }
}
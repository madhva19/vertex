import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.Map.Entry;

public class AddFeature extends HttpServlet{ 
 
   public void doGet(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			System.out.println("MySQL Connect Example.");
			Connection conn = null;
String url = Messages.getString("connectionURL"); 
			String dbName = Messages.getString("database"); 
			String driver = Messages.getString("dbDriver"); 
			String userName = Messages.getString("dbuser");  
			String password = Messages.getString("dbPassword");
			int DependentFeature=0;
			int FeatureID=0;
			int id=0;
			if(request.getParameter("action") !=null && request.getParameter("action").toString().equalsIgnoreCase("addFeatureWithoutProject"))
				
			{
				 
				id=0;
			}else {
				
				 id = Integer.parseInt(request.getParameter("projectID").toString());
			}
			 String  FeatureCode="";
			
		if(request.getParameter("FeatureCode")!=null)
		{
			        FeatureCode = request.getParameter("FeatureCode");
			      
		}
		String FeatureDescription="";
		
		if (request.getParameter("FeatureDescription")!=null)
		{
		
			     FeatureDescription = request.getParameter("FeatureDescription").toString();
			    
		}
		
		
		
		
			
			if(request.getParameter("DependentFeature")!=null && !request.getParameter("DependentFeature").equalsIgnoreCase(""))
			{
				 DependentFeature = Integer.parseInt(request.getParameter("DependentFeature").toString());
			}
			
			if(request.getParameter("FeatureID")!=null)
			{
				FeatureID = Integer.parseInt(request.getParameter("FeatureID").toString());
			}
			
	
		
			
	
			
			
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				ArrayList al=null;
				ArrayList userList =new ArrayList();
				int maxFID=0;
				if(FeatureID==0) {
				Statement stMaxF=conn.createStatement();
				String queryMaxF ="select max(FeatureID) from feature";
				
				
				ResultSet  rsMaxF = stMaxF.executeQuery(queryMaxF);
				
				while(rsMaxF.next())
				{
					maxFID=rsMaxF.getInt(1);
					maxFID++;
				}
				}
				int feature=0;
					String query2="";
					
					if((request.getParameter("action")!=null && request.getParameter("action").toString().equalsIgnoreCase("addFeatureWithoutProject")) || FeatureID==0)
					{
					
						 query2="INSERT INTO projectmanagementservice.feature(FeatureID,ProjectID,FeatureCode,FeatureTitle,DependentFeature)VALUES ("+maxFID+","+id+",'"+FeatureCode+"','"+FeatureDescription+"',"+DependentFeature+")";
						 
					}
					else if((request.getParameter("action")!=null && request.getParameter("action").toString().equalsIgnoreCase("updateProject")))
						
					{

						 query2="UPDATE  projectmanagementservice.feature SET ProjectID="+id+" where FeatureID ="+FeatureID;
					}else
						
						
					{
						
						
						 query2="UPDATE  projectmanagementservice.feature SET FeatureID ="+FeatureID
						 		+ ",ProjectID="+id+",DependentFeature="+DependentFeature+",FeatureTitle='"+FeatureDescription+"' where FeatureID ="+FeatureID;

					}
						System.out.println(query2);
						Statement stF=conn.createStatement();
							feature= stF.executeUpdate(query2);
						
						
				
				
			
				
				
				
				if(feature>0)
				{ 
					request.setAttribute("pageer", "addp");
					System.out.println("mmmmmmmmmmmmmmmmmmm"+request.getAttribute("pageer"));
					response.sendRedirect("ViewAllProject");
						conn.close();
				}
				
				
				
				
				
				
				
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}
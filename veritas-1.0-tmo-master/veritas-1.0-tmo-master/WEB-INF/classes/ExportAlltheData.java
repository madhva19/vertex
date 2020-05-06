import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class ExportAlltheData extends HttpServlet{ 
 
 



public void doGet(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html");
		
			System.out.println("MySQL Connect Example.");
			Connection conn = null;
			String url = Messages.getString("connectionURL"); 
			String dbName = Messages.getString("database"); 
			String driver = Messages.getString("dbDriver"); 
			String userName = Messages.getString("dbuser");  
			String password = Messages.getString("dbPassword");
			
			
		System.out.println("Connected to the databas1>>>>>>>>>>>e"+url+dbName);
			Statement st;
			try {
				Class.forName(driver).newInstance();
				
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
								
				HashMap<String, String> project=new HashMap<String, String>();
				String query7 ="select projectID,ProjectTitle from projectmanagementservice.project";	
				System.out.println("query7 " + query7);
				st = conn.createStatement();
				ResultSet  rs = st.executeQuery(query7);
				while(rs.next())
				{
					project.put(rs.getString(1), rs.getString(2));
	 				
				}
				
				System.out.println("project"+project);
				ArrayList<ArrayList<String>> projectDependencyList =getProjectDependecy(conn);
				System.out.println("<>>>>>>>>projectDependency>>>>>>>"+projectDependencyList);
				request.setAttribute("projectDependency", projectDependencyList);
				ArrayList<ArrayList<String>> projectTD =techDT(conn,project);	
				System.out.println("<>>>>>>>>projectTD>>>>>>>"+projectTD);
				request.setAttribute("projectTD", projectTD);
				ArrayList<ArrayList<String>> projectHLSD =getAllHLSD(conn,project);
				System.out.println("<>>>>>>>>projectHLSD>>>>>>>"+projectHLSD);
				request.setAttribute("projectHLSD", projectHLSD);
				
				ArrayList<ArrayList<String>> projectFeatureList =getAllFeature(conn,project);
				System.out.println("<>>>>>>>>projectFeatureList>>>>>>>"+projectFeatureList);
				request.setAttribute("projectFeatureList", projectFeatureList);
				HashMap<String, ArrayList<ArrayList<String>>> comlist= applicationList(conn,project);
				
				System.out.println("<>>>>>>>>apiList>>>>>>>"+comlist.get("api"));
				request.setAttribute("apiList", comlist.get("api"));
				System.out.println("<>>>>>>>>appList>>>>>>>"+comlist.get("app"));
				request.setAttribute("appList", comlist.get("app"));
				
				 System.out.println("<>>>>>>>>>>>>>>>"+2);
					 request.setAttribute("message","");
					 System.out.println("<>>>>>>>>>>>>>>>"+3);
		                String  nextJSP = "/ReportExport/";
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

   
   
   
private ArrayList<ArrayList<String>> getProjectDependecy(Connection conn) {
	ArrayList projects=new ArrayList();
	// TODO Auto-generated method stub
	try{
	String query = "select * from project order by ProjectTitle";
	
	query="Select a.DependencyID , c.ProjectNumber , c.ProjectTitle    , c.ProjectDescription    , c.TargetDeployment    , c.Workstream    , b.ProjectNumber     , b.ProjectTitle     , b.ProjectType" + 
			"    , b.ProjectStatus    , a.NatureOfDependency    , a.MitigationStrategies from 	projectmanagementservice.project_dependency a Join	projectmanagementservice.project b    on a.DependentProjectID = b.ProjectID Join	projectmanagementservice.project c    on a.ProjectID = c.ProjectID Order by 3 ";
	System.out.println("query " + query);
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
		  if(rs.getString(4)!=null)
		  {
			  p1.add((rs.getString(4).replaceAll("[^a-zA-Z0-9\\s+]", "")).replaceAll("\n", ""));
		  }else {
			  p1.add("");
		  }
		 
		  p1.add(rs.getString(5)); 
		  p1.add(rs.getString(6));
		 	 p1.add(rs.getString(7));
			  p1.add(rs.getString(8));
			  p1.add(rs.getString(9));
			  p1.add(rs.getString(10)); 
			  if(rs.getString(11)!=null)
			  {
				  p1.add((rs.getString(11).replaceAll("[^a-zA-Z0-9\\s+]", "")).replaceAll("\n", ""));
			  }else {
				  p1.add("");
			  }
			  
			  if(rs.getString(12)!=null)
			  {
				  p1.add((rs.getString(12).replaceAll("[^a-zA-Z0-9\\s+]", "")).replaceAll("\n", ""));
			  }else {
				  p1.add("");
			  }
			//  p1.add((rs.getString(11).replaceAll("[^a-zA-Z0-9\\s+]", "")).replaceAll("\n", ""));
			 // p1.add((rs.getString(12).replaceAll("[^a-zA-Z0-9\\s+]", "")).replaceAll("\n", "")); 
		  
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

private ArrayList<ArrayList<String>> techDT(Connection conn, HashMap<String, String> project)


{
	ArrayList<ArrayList<String>> techDebt=null;
	

			   try {
				String query8="select * from projectmanagementservice.techdebtdetails  order by projectID desc";

				  Statement st8=conn.createStatement();
				   ResultSet rs8=st8.executeQuery(query8);
				   ArrayList<String> tD=null;
				     techDebt=new ArrayList<ArrayList<String>>();
				   
						   while(rs8.next())
							{
							   tD=new  ArrayList<String>();	
							   tD.add(rs8.getString(2));
							   tD.add(project.get(rs8.getString(2)));
							   tD.add(rs8.getString(1));
							   if(rs8.getString(3)!=null)
							   {
							   tD.add((rs8.getString(3).replaceAll("[^a-zA-Z0-9\\s+]", "")).replaceAll("\n", ""));
							   }else {
								   tD.add("");   
							   }
							   tD.add(rs8.getString(4));
							   tD.add(rs8.getString(5));
							   techDebt.add(tD);
								}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					  
		
	return techDebt;
}




private ArrayList<ArrayList<String>> getAllHLSD(Connection conn,HashMap<String, String> project) {
	ArrayList<ArrayList<String>> hlsd=new ArrayList<ArrayList<String>>();
	// TODO Auto-generated method stub
	try{
		
			
	String query = "select * from hlsd";
	System.out.println("query " + query);
	Statement st1 = conn.createStatement();
	ResultSet  rs = st1.executeQuery(query);
	
	ArrayList<String> p1=new ArrayList<String>();
	
		while(rs.next())
	{
			
			
		p1  = new ArrayList<String>();
		  p1.add(rs.getString(1));
		  p1.add(project.get(rs.getString(1)));
	 	  p1.add(rs.getString(2));
		  p1.add(rs.getString(3));
		  p1.add(rs.getString(4));
		  p1.add(rs.getString(5));
		  p1.add(rs.getString(6));
		  p1.add(rs.getString(7));
		  p1.add(rs.getString(8));
		  p1.add(rs.getString(9)); 
		  p1.add(rs.getString(10));
		  if(rs.getString(11)!=null)
		  {
		  p1.add((rs.getString(11).replaceAll("[^a-zA-Z0-9\\s+]", "")).replaceAll("\n", ""));
		  }
		  else {
			  
			  p1.add(""); 
		  }
		  p1.add(rs.getString(12)); 
		  p1.add(rs.getString(13));
		  p1.add(rs.getString(14));
		  p1.add(rs.getString(15));
		  p1.add(rs.getString(16));
		  p1.add(rs.getString(17)); 
		  p1.add(rs.getString(18));
		  p1.add(rs.getString(19));
		  p1.add(rs.getString(20)); 
		  hlsd.add(p1);
	}
	
	//20-
	}catch(Exception e)
	{System.out.println(e);}
	
	return hlsd;
}


private ArrayList<ArrayList<String>> getAllFeature(Connection conn,HashMap<String, String> project) {
	ArrayList<ArrayList<String>> features=new ArrayList<ArrayList<String>>();
	// TODO Auto-generated method stub
	try{
		String query = "select FeatureID, projectID,FeatureTitle,DependentFeature,FeatureCode from projectmanagementservice.feature where projectID>0 order by projectID;";

	System.out.println("query " + query);
	Statement st1 = conn.createStatement();
	ResultSet  rs = st1.executeQuery(query);
	
	ArrayList<String> p1=new ArrayList<String>();
	
	

	
	while(rs.next())
	{
		p1  = new ArrayList<String>();
		  p1.add(rs.getString(1));
	 	  p1.add(rs.getString(3));
		  p1.add(rs.getString(4));
		  p1.add(rs.getString(5));
		
		  System.out.println("rs.getString(2) "+rs.getString(2)+" project Tittle" + project.get(rs.getString(2)));
		  p1.add(project.get(rs.getString(2)));
		  
		  features.add(p1);
	}
	
	
	}catch(Exception e)
	{System.out.println(e);}
	
	return features;
}



private HashMap<String, ArrayList<ArrayList<String>>> applicationList(Connection conn, HashMap<String, String> project)


{
	HashMap<String, ArrayList<ArrayList<String>>> App=new HashMap();;
	
	ArrayList<ArrayList<String>> appList=new ArrayList<ArrayList<String>>();
	ArrayList<ArrayList<String>> apiList=new ArrayList<ArrayList<String>>();
	

			   try {
					
					
				   
				   
				   String query8 ="select componentID,ComponentName,ComponentType from projectmanagementservice.component";
				   String query3 ="select componentID,ProjectID,ImpactType,TShirt_Size,ImpactDetails from projectmanagementservice.feature_component";
				   
				   
					System.out.println("query8 " + query8);
					HashMap<String, String> comp=new HashMap<String, String>();
					HashMap<String, String> API=new HashMap<String, String>();
					Statement st1 = conn.createStatement();
					ResultSet  rs1 = st1.executeQuery(query8);
					while(rs1.next())
					{
						if(rs1.getString(3).equalsIgnoreCase("API"))
						{
							String datText="";
							
							if(rs1.getString(2)!=null)
							{
								datText=rs1.getString(2);
							datText=datText.replaceAll("[^a-zA-Z0-9\\s+]", "");
				      
							datText=datText.replaceAll("\n", "");
							}
							
							API.put(rs1.getString(1),datText );
						}else {
						comp.put(rs1.getString(1), rs1.getString(2));
						}
						
					}
				   
				   
				   
					
					System.out.println("query3 " + query3);
					Statement st5 = conn.createStatement();
					ResultSet  rs5 = st5.executeQuery(query3);
					ArrayList<String> p1=null;
					while(rs5.next())
					{
						String datText="";
						if(rs5.getString(5)!=null)
						{
						 datText=rs5.getString(5);

						datText=datText.replaceAll("[^a-zA-Z0-9\\s+]", "");
			      
						datText=datText.replaceAll("\n", "");
						}
					
						p1  = new ArrayList<String>();
						if(API.get(rs5.getString(1)) !=null)
						{
					      p1.add(API.get(rs5.getString(1)));
					      p1.add(project.get(rs5.getString(2)));
					      p1.add(rs5.getString(3));
					      p1.add(rs5.getString(4));
					     
					      
							
						
					      p1.add(datText);
					     
					      
					      apiList.add(p1);
					      
						}else
						{
							p1.add(comp.get(rs5.getString(1)));
						      p1.add(project.get(rs5.getString(2)));
						      p1.add(rs5.getString(3));
						      p1.add(rs5.getString(4));
						      p1.add(datText);
						      appList.add(p1);
						}
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					  
			   App.put("api",apiList);
			   App.put("app",appList);
	return App;
}










}

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class ProjectDGraph extends HttpServlet{ 
 
   @SuppressWarnings("unchecked")
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

		//	out.println(request.getRequestURI());
			Statement st,st1,st2,st3,st4,st5,st6,st7,st8;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				LinkedHashMap<Object,Object> map = null;
				List<Map<Object,Object>> workStream = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> feature = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> projectComp = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> compProj = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> projDep = new ArrayList<Map<Object,Object>>();
				List<Object> depProj = null;
				List<Map<Object,Object>> techDebt = new ArrayList<Map<Object,Object>>();
				HashMap project=new HashMap();
				LinkedHashMap comp=new LinkedHashMap();
				String query = "Select * from projectmanagementservice.project";
				/*String query1 ="select ProjectID, count(*) from projectmanagementservice.feature  group by projectID";
				String query2 ="select ProjectID,count(*) from projectmanagementservice.feature_component group by projectID";
				String query3 ="select componentID,count(*) from projectmanagementservice.feature_component group by componentID";
				String query4 ="select ProjectID,count(*) from projectmanagementservice.project_dependency group by projectID";
				String query5 ="select DependentProjectID,count(*) from projectmanagementservice.project_dependency group by DependentProjectID";
				String query6 ="select ProjectID,count(*) from projectmanagementservice.techdebtdetails group by projectID";
			
				String query8 ="select componentID,ComponentName from projectmanagementservice.component";
				*/
				String query7 ="select projectID,ProjectTitle from projectmanagementservice.project";
				
			//	{id: "5",dependsOn: ["1", "4"]},
				
			
				System.out.println("query7 " + query7);
				st = conn.createStatement();
				ResultSet  rs = st.executeQuery(query7);
				while(rs.next())
				{
					project.put(rs.getString(1), rs.getString(2));
					
				}
				/*	
				System.out.println("query8 " + query8);
				st1 = conn.createStatement();
				ResultSet  rs1 = st1.executeQuery(query8);
				while(rs1.next())
				{
					comp.put(rs1.getString(1), rs1.getString(2));
					
				}*/
				
				System.out.println("query " + query);
				st2 = conn.createStatement();
				ResultSet  rs2 = st2.executeQuery(query);
				map = new LinkedHashMap<Object,Object>();
				map.put("id","1"); 
				map.put("name","Start"); 
				
				projDep.add(map);
				while(rs2.next())
				{
					map = new LinkedHashMap<Object,Object>();
				
					
					String query4 ="select DependentProjectID from projectmanagementservice.project_dependency where projectID="+rs2.getString(1);
					
					System.out.println("query4 " + query4);
					st6 = conn.createStatement();
					ResultSet  rs6 = st6.executeQuery(query4);
					depProj = new ArrayList<Object>();
					while(rs6.next())
					{
						
						depProj.add(rs6.getString(1)); 
						
						
					}
					map.put("id",rs2.getString(1)); 
					map.put("name",project.get(rs2.getString(1))); 
					if(!depProj.isEmpty())
						{
						map.put("dependsOn", depProj);
						}
						
					System.out.println(map);
					projDep.add(map);
					
				}
				System.out.println(projDep);
				/*System.out.println("query1 " + query1);
				st3 = conn.createStatement();
				ResultSet  rs3 = st3.executeQuery(query1);
				while(rs3.next())
				{
					if(Integer.parseInt(rs3.getString(1))>0)
					{
					map = new HashMap<Object,Object>();
					map.put("label", project.get(rs3.getString(1))); 
					map.put("y",Integer.parseInt(rs3.getString(2)));
					feature.add(map);
					}
				}
				
				System.out.println("query2" + query2);
				st4 = conn.createStatement();
				ResultSet  rs4 = st4.executeQuery(query2);
				while(rs4.next())
				{
					map = new HashMap<Object,Object>();
					map.put("label", project.get(rs4.getString(1))); 
					map.put("y",Integer.parseInt(rs4.getString(2)));
					projectComp.add(map);
				}
				
				
				System.out.println("query3 " + query3);
				st5 = conn.createStatement();
				ResultSet  rs5 = st5.executeQuery(query3);
				while(rs5.next())
				{
					if(Integer.parseInt(rs5.getString(2))>6)
					{
					map = new HashMap<Object,Object>();
					map.put("label", comp.get(rs5.getString(1))); 
					map.put("y",Integer.parseInt(rs5.getString(2)));
					compProj.add(map);
					}
				}
	                
	              /////
				
				
				
				System.out.println("query4 " + query4);
				st6 = conn.createStatement();
				ResultSet  rs6 = st6.executeQuery(query4);
				while(rs6.next())
				{
					map = new HashMap<Object,Object>();
					map.put("label", project.get(rs6.getString(1))); 
					map.put("y",Integer.parseInt(rs6.getString(2)));
					projDep.add(map);
				}
				
				System.out.println("query5" + query5);
				st7 = conn.createStatement();
				ResultSet  rs7 = st7.executeQuery(query5);
				while(rs7.next())
				{
					map = new HashMap<Object,Object>();
					map.put("label", project.get(rs7.getString(1))); 
					map.put("y",Integer.parseInt(rs7.getString(2)));
					depProj.add(map);
				}
				
				
				System.out.println("query6 " + query6);
				st8 = conn.createStatement();
				ResultSet  rs8 = st8.executeQuery(query6);
				while(rs8.next())
				{
					map = new HashMap<Object,Object>();
					map.put("label", project.get(rs8.getString(1))); 
					map.put("y",Integer.parseInt(rs8.getString(2)));
					techDebt.add(map);
				}
				*/
				
	                
	                
	                
	                
				
	                HttpSession session = request.getSession(false);
	              //save message in session
	             // session.setAttribute("helloWorld", "Hello world");
				
				
	                
	              
	                

	              /*  session.setAttribute("workStream",workStream);
	                session.setAttribute("feature",feature);
	                session.setAttribute("projectComp",projectComp);
	                session.setAttribute("compProj",compProj);*/
	                session.setAttribute("projDep",projDep);
	               /* session.setAttribute("depProj",depProj);
	                session.setAttribute("techDebt",techDebt);*/
			
				
                String nextJSP = "/Veritas/ProjectDGraphUI/";
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
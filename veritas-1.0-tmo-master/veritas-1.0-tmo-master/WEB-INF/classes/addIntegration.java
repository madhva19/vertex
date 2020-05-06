import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.Date;
import java.util.Map.Entry;

public class addIntegration extends HttpServlet{ 
 
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
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDate localDate = LocalDate.now();
			
			
			String ITC_Consumer="";
			String ITC_add_details="";
			
			
			
			
			//	ProjectResource=4444&ProjectRole=ProductOwner&Company=Sprint&ProjectResource2=444&ProjectRole2=SolutionCaptain&Company2=TMOBILE&Submit=Save
					
					int projectID = Integer.parseInt(request.getParameter("projectID").toString());
					
					String IT_Type = request.getParameter("IT_Type").toString();
					String IT_Method = request.getParameter("IT_Method").toString();
					String ITC_Name = request.getParameter("ITC_Name").toString();
					String ITC_Owner = request.getParameter("ITC_Owner").toString();
					
					if(request.getParameter("ITC_Consumer")!=null)
					{
						ITC_Consumer = request.getParameter("ITC_Consumer").toString();
					}
							
					if(request.getParameter("ITC_add_details")!=null)
					{
						ITC_add_details = request.getParameter("ITC_add_details").toString();
					}
					int maxFID=0;
					
					
						
				
					
					Statement stmt;
					try {
						Class.forName(driver).newInstance();
						conn = DriverManager.getConnection(url+dbName,userName,password);
						System.out.println("Connected to the database");
						int i=0;
						
						Statement stMaxF=conn.createStatement();
						String queryMaxF ="select max(iTDID) from projectitddetails";
						
						
						ResultSet  rsMaxF = stMaxF.executeQuery(queryMaxF);
						
						while(rsMaxF.next())
						{
							maxFID=rsMaxF.getInt(1);
							maxFID++;
						}
						
						
										
						
						
						boolean flag=false;
						String query5="";
						
						if(request.getParameter("action") !=null && request.getParameter("action").toString().equalsIgnoreCase("update"))
						{
							
							 maxFID = Integer.parseInt(request.getParameter("iTDID").toString());
							
							 query5="UPDATE projectmanagementservice.projectitddetails SET iTDID ="+maxFID+",ProjectID="+projectID+",IT_Type ='"+IT_Type+"',IT_Method='"+IT_Method+"',ITC_Name ='"+ITC_Name+"',"
							 		+ "ITC_Owner ='"+ITC_Owner+"',ITC_Consumer ='"+ITC_Consumer+"',ITC_add_details='"+ITC_add_details+"' WHERE iTDID ="+maxFID;
					    	
						
						}else
						{
							 query5="INSERT INTO projectmanagementservice.projectitddetails (iTDID,ProjectID,IT_Type,IT_Method,ITC_Name,ITC_Owner,ITC_Consumer,ITC_add_details) VALUES ("+maxFID+","+projectID+",'"+IT_Type+"','"+IT_Method+"','"+ITC_Name+"','"+ITC_Owner+"','"+ITC_Consumer+"','"+ITC_add_details+"')";
						}
						
						
						
			
			
			
			
			
				
				
				
				
				System.out.println(query5);
				
				
				Statement hlsdst=conn.createStatement();
				i=hlsdst.executeUpdate(query5);
				
				
		
				
				
				
				
				
				
				
				
				
				
				
				if(i>0)
				{ 
					request.setAttribute("pageer", "addp");
					System.out.println("mmmmmmmmmmmmmmmmmmm"+request.getAttribute("pageer"));
					response.sendRedirect("viewNoteServlet/"+projectID);
						conn.close();
				}
				
				
				
				
				
				
				
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}
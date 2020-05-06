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

public class AddResource extends HttpServlet{ 
 
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
			
			
			
			
			
			
	//	ProjectResource=4444&ProjectRole=ProductOwner&Company=Sprint&ProjectResource2=444&ProjectRole2=SolutionCaptain&Company2=TMOBILE&Submit=Save
			
			int id = Integer.parseInt(request.getParameter("projectID").toString());
			String ProjectResource = request.getParameter("ProjectResource").toString();
			String ProjectRole = request.getParameter("ProjectRole").toString();
			String Company = request.getParameter("Company").toString();
			
			
			String action="";
			if (request.getParameter("action") !=null)
			{
				action=request.getParameter("action").toString();
				 
			}
		
			
			
				
		
		
			
		
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
						
				
		
				
				boolean resourceflag=false;
				int resource=0;
				
			
					String query3="";
				
						
					if (!action.equalsIgnoreCase("update"))
					{
					 query3="INSERT INTO projectmanagementservice.projectleadership(ProjectResource,ProjectID,ProjectRole,Company,StartDate)VALUES('"+ProjectResource+"',"+id+",'"+ProjectRole+"','"+Company+"','"+dtf.format(localDate)+"' )";
					}else
					{
					
						
						String ProjectResource1 = request.getParameter("ProjectResource1").toString();
						 query3="UPDATE  projectmanagementservice.projectleadership SET ProjectResource ='"+ProjectResource
						 		+"',ProjectRole='"+ProjectRole+"',Company='"+Company+"' where ProjectID ="+id+" and ProjectResource='"+ProjectResource1+"'";

					}
				
					
				
						System.out.println(query3);
						Statement stF=conn.createStatement();
						//String query2="INSERT INTO pms.projectcontact set ProjectId='"+id+"',EPOPM='"+epopm+"',EITPM='"+eitpm+"',TESTPM='"+testpm+"',TDM='"+tdm+"',BSA='"+bsa+"',SA='"+sa+"',Dev_Lead='"+dev+"',Lead_Arch='"+lead_arch+"'";
						resource= stF.executeUpdate(query3);
					

				
				
				
				
				if(resource>0)
				{ 
					request.setAttribute("pageer", "addp");
					System.out.println("mmmmmmmmmmmmmmmmmmm"+request.getAttribute("pageer"));
					response.sendRedirect("viewNoteServlet/"+id);
						conn.close();
				}
				
				
				
				
				
				
				
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}
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

public class addTD extends HttpServlet{ 
 
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
			
			
			
		//	projectID=211069&tdDetails=fddflllll&td_Status=dddd&td_Org=ddd&td_Just=78&td_team=www&action=update&tdid=24&Submit=Save
			
			
	//	ProjectResource=4444&ProjectRole=ProductOwner&Company=Sprint&ProjectResource2=444&ProjectRole2=SolutionCaptain&Company2=TMOBILE&Submit=Save
			
			int projectID = Integer.parseInt(request.getParameter("projectID").toString());
			int maxFID=0;
			String td_Just ="";
			String td_team ="";
			String tdDetails ="";
			String td_Status ="";
			String td_Org ="";
			String td_Component_String ="";
			int td_Component = 0;
			if(request.getParameter("td_Status") !=null)
			{
			td_Status = request.getParameter("td_Status").toString();
			}
			if(request.getParameter("tdDetails") !=null)
			{
			 tdDetails = request.getParameter("tdDetails").toString();
			}
			if(request.getParameter("td_Org") !=null)
			{
			 td_Org = request.getParameter("td_Org").toString();
			}
			if(request.getParameter("td_Just") !=null)
			{
				td_Just = request.getParameter("td_Just").toString();
			}
			if(request.getParameter("td_team") !=null)
			{
				td_team = request.getParameter("td_team").toString();
			}
			if(request.getParameter("td_Component_String") !=null)
			{
				td_Component=Integer.parseInt(request.getParameter("td_Component_String"));
			}
			String ReviewDate="";
			if(request.getParameter("action") !=null && request.getParameter("action").toString().equalsIgnoreCase("update"))
			{
				maxFID = Integer.parseInt(request.getParameter("tdid").toString());
			
			}
		
			
			
				
		
			
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				int i=0;
				
			
							
		
				
				boolean flag=false;
				String query5="";
				
				if(request.getParameter("action") !=null && request.getParameter("action").toString().equalsIgnoreCase("update"))
				{
				
				 
				 query5= "UPDATE projectmanagementservice.techdebtdetails SET " + 
				 		"techdebtID = "+maxFID+"," + 
				 		"projectID = "+projectID+"," + 
				 		"techdebt_Details = '"+tdDetails+"'," + 
				 		"Techdebt_status = '"+td_Status+"'," + 
				 		"Techdebt_origination = '"+td_Org+"'," + 
				 		"td_Just = '"+td_Just+"'," + 
						"td_team = '"+td_team +"'"+ 
						"td_Component = '"+td_Component +"'"+ 
				 		" WHERE techdebtID= "+maxFID;
				 
				
				
				}else
				{
					
					Statement stMaxF=conn.createStatement();
					String queryMaxF ="select max(techdebtID) from techdebtdetails";
					
					
					ResultSet  rsMaxF = stMaxF.executeQuery(queryMaxF);
					
					while(rsMaxF.next())
					{
						maxFID=rsMaxF.getInt(1);
						maxFID++;
					}
					
					
					
				
					 query5="INSERT INTO projectmanagementservice.techdebtdetails (techdebtID,projectID,techdebt_Details,Techdebt_status,Techdebt_origination,td_Just,td_team,td_Component) VALUES ("+maxFID+","+projectID+",'"+tdDetails+"','"+td_Status+"','"+td_Org+"','"+td_Just+"','"+td_team+"','"+td_Component+"')";
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
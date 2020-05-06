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

public class addCR extends HttpServlet{ 
 
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
			

			String JRDBDetails="";
			String cr_add="";
			String cr_Recom="";
			String cr_loc="";
			String ReviewDate="";
			 Date date =null;
			 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");
			if(request.getParameter("ReviewDate") !=null)
			{
			 ReviewDate = request.getParameter("ReviewDate").toString();
		
			
			
			 
		        try
		        {
		            date = simpleDateFormat.parse(ReviewDate);

		            System.out.println("date : "+simpleDateFormat.format(date));
		        }
		        catch (ParseException ex)
		        {
		            System.out.println("Exception "+ex);
		        }
			 
			}
			
	//	ProjectResource=4444&ProjectRole=ProductOwner&Company=Sprint&ProjectResource2=444&ProjectRole2=SolutionCaptain&Company2=TMOBILE&Submit=Save
			
			int projectID = Integer.parseInt(request.getParameter("projectID").toString());
			
			String cr_num = request.getParameter("cr_num").toString();
			String crDetails = request.getParameter("crDetails").toString();
			String cr_size = request.getParameter("cr_size").toString();
			String cr_System = request.getParameter("cr_System").toString();
			
			if(request.getParameter("JRDBDetails")!=null)
			{
				JRDBDetails = request.getParameter("JRDBDetails").toString();
			}
			if(request.getParameter("cr_add")!=null)
			{
				cr_add = request.getParameter("cr_add").toString();
			}
			if(request.getParameter("cr_Recom")!=null)
			{
				cr_Recom = request.getParameter("cr_Recom").toString();
			}
			if(request.getParameter("cr_loc")!=null)
			{
				cr_loc = request.getParameter("cr_loc").toString();
			}
			
			
			
			
			
			int maxFID=0;
			
			
				
		
			
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				int i=0;
				
				Statement stMaxF=conn.createStatement();
				String queryMaxF ="select max(crID) from projectcrdetails";
				
				
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
					
					 maxFID = Integer.parseInt(request.getParameter("crID").toString());
					
					 query5="UPDATE projectmanagementservice.projectcrdetails SET crID ="+maxFID+",ProjectID="+projectID+",cr_num ='"+cr_num+"',crDetails='"+crDetails+"',cr_size ='"+cr_size+"',"
					 		+ "cr_System ='"+cr_System+"',JRDBDetails ='"+JRDBDetails+"',cr_add ='"+cr_add+"',cr_Recom ='"+cr_Recom+"',cr_loc='"+cr_loc+"', reviewDate ='"+simpleDateFormat.format(date)+"' WHERE crID ="+maxFID;
			    	
				
				}else
				{
					 query5="INSERT INTO projectmanagementservice.projectcrdetails (crID,ProjectID,cr_num,crDetails,cr_size,cr_System,JRDBDetails,cr_add,cr_Recom,cr_loc,reviewDate) VALUES ("+maxFID+","+projectID+",'"+cr_num+"','"+crDetails+"','"+cr_size+"','"+cr_System+"','"+JRDBDetails+"','"+cr_add+"','"+cr_Recom+"','"+cr_loc+"','"+simpleDateFormat.format(date)+"')";
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
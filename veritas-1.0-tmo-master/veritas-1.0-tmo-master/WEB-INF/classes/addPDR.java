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

public class addPDR extends HttpServlet{ 
 
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
			
			int projectID = Integer.parseInt(request.getParameter("projectID").toString());
			
			String dr_Status = request.getParameter("dr_Status").toString();
			String drDetails = request.getParameter("trdDetails").toString();
			String dr_Org = request.getParameter("dr_Org").toString();
			String dr_type = request.getParameter("dr_type").toString();
			
			
			int maxFID=0;
			
			
				
		
			
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				int i=0;
				
				Statement stMaxF=conn.createStatement();
				String queryMaxF ="select max(pdrID) from projectdeleiveryrisk";
				
				
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
				/*// ReviewDate = request.getParameter("ReviewDate").toString();
				 Date date =null;
				  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");
			        try
			        {
			          //  date = simpleDateFormat.parse(ReviewDate);

			            System.out.println("date : "+simpleDateFormat.format(date));
			        }
			        catch (ParseException ex)
			        {
			            System.out.println("Exception "+ex);
			        }
				 
				// query5= "UPDATE hlsd SET ProjectID ="+projectID+",ReviewDate ='"+simpleDateFormat.format(date)+"',HLSD_TShirt ='"+HLSD_TShirt+"',ReviewStatus ='"+ReviewStatus+"',ActionItems ="+ActionItems+",ImpactedDomains ="+ImpactedDomains+",ImpactedCapabilities ="
				 	//	+ImpactedCapabilities+",AxiomScore ="+AxiomScore+",APICount ="+APICount+" ,FeatureCount ="+FeatureCount+",ExecutiveSummary ='"+ExecutiveSummary+"',ReviewFeedbackLink ='"+ReviewFeedbackLink+"' WHERE ProjectID ="+projectID+" AND ReviewDate ='"+simpleDateFormat.format(date)+"'" ;
				 
				*/ 
			    	
				
				}else
				{
					 query5="INSERT INTO projectmanagementservice.projectdeleiveryrisk (pdrID,ProjectID,prd_type,prd_details,prd_status,prd_org) VALUES ("+maxFID+","+projectID+",'"+dr_type+"','"+drDetails+"','"+dr_Status+"','"+dr_Org+"')";
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
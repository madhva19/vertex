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

public class addHLSD extends HttpServlet{ 
 
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
			
			int projectID = Integer.parseInt(request.getParameter("projectID").toString().trim());
			String ReviewsType="Assessment Review";
			String HLSD_TShirt = request.getParameter("HLSD_TShirt").toString();
			String ReviewStatus = request.getParameter("ReviewStatus").toString();
			int ActionItems =Integer.parseInt(request.getParameter("ActionItems").toString());
			int ImpactedDomains =Integer.parseInt(request.getParameter("ImpactedDomains").toString());
			int ImpactedCapabilities =Integer.parseInt(request.getParameter("ImpactedCapabilities").toString());
			int AxiomScore =Integer.parseInt(request.getParameter("AxiomScore").toString());
			int APICount =Integer.parseInt(request.getParameter("APICount").toString());
			int FeatureCount =Integer.parseInt(request.getParameter("FeatureCount").toString());
			String ReviewFeedbackLink = request.getParameter("ReviewFeedbackLink").toString();
			String ExecutiveSummary = request.getParameter("ExecutiveSummary").toString();
			String JRDBReview="";
			if(request.getParameter("SDOReview")!=null)
					{
						  JRDBReview = request.getParameter("SDOReview").toString();
					}
			String ReviewDate="";
			if(request.getParameter("action") !=null && request.getParameter("action").toString().equalsIgnoreCase("update"))
			{
			 ReviewDate = request.getParameter("ExecutiveSummary").toString();
			
			}
			if(request.getParameter("ReviewsType")!=null)
			{
				ReviewsType = request.getParameter("ReviewsType").toString();
			}
		
			String BRDbaslined="false";
			String HLSDReceived="false";
			String HLSDReviewWithBiz="false";
			String AttendeesReceived="false";
			String DocSentToReviewer="false";
			String ReviewDecReceived="false";
			String MOMSent="false";
			
			if (request.getParameterValues("Reviews")!=null)
			{
			String[] SelectedcheckBox = request.getParameterValues("Reviews");
			
			System.out.println(SelectedcheckBox);
		
			for (int i=0;i < SelectedcheckBox.length;i++ )
			{
				System.out.println(SelectedcheckBox[i].toString());
				if(SelectedcheckBox[i].equalsIgnoreCase("BRD Baselined"))
				{
					
					BRDbaslined="true";
				}else if(SelectedcheckBox[i].toString().equalsIgnoreCase("HLSD Received"))
				{
					HLSDReceived="true";
				}else if(SelectedcheckBox[i].toString().equalsIgnoreCase("HLSD Reviewed with Biz"))
				{
					HLSDReviewWithBiz="true";
				}else if(SelectedcheckBox[i].toString().equalsIgnoreCase("Attendees Received"))
				{
					AttendeesReceived="true";
				}else if(SelectedcheckBox[i].toString().equalsIgnoreCase("Docs Sent to Reviewers"))
				{
					DocSentToReviewer="true";
				}else if(SelectedcheckBox[i].toString().equalsIgnoreCase("Review Deck Received"))
				{
					ReviewDecReceived="true";
				}else if(SelectedcheckBox[i].toString().equalsIgnoreCase("Meeting NotesAIs Sent"))
				{
					MOMSent="true";
				}
				
				
			}	
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
					
					int reviewID=0;
					if(request.getParameter("reviewID")!=null)
					{
						reviewID=Integer.parseInt(request.getParameter("reviewID").toString());
					}
					
				 ReviewDate = request.getParameter("ReviewDate").toString();
				 Date date =null;
				  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");
			        try
			        {
			            date = simpleDateFormat.parse(ReviewDate);

			            System.out.println("date : "+simpleDateFormat.format(date));
			        }
			        catch (ParseException ex)
			        {
			            System.out.println("Exception "+ex);
			        }
				 
				 query5= "UPDATE hlsd SET ProjectID ="+projectID+",ReviewDate ='"+simpleDateFormat.format(date)+"',HLSD_TShirt ='"+HLSD_TShirt+"',ReviewStatus ='"+ReviewStatus+"',ActionItems ="+ActionItems+",ImpactedDomains ="+ImpactedDomains+",ImpactedCapabilities ="
				 		+ImpactedCapabilities+",AxiomScore ="+AxiomScore+",APICount ="+APICount+" ,FeatureCount ="+FeatureCount+",ExecutiveSummary ='"+ExecutiveSummary+"',ReviewFeedbackLink ='"+ReviewFeedbackLink+"',ReviewDate ='"+simpleDateFormat.format(date)+"',BRDbaslined='"+BRDbaslined+"', HLSDReceived='"+HLSDReceived+"',HLSDReviewWithBiz='"+HLSDReviewWithBiz+"',AttendeesReceived='"
						 +AttendeesReceived+"',DocSentToReviewer='"+DocSentToReviewer+"',ReviewDecReceived='"+ReviewDecReceived+"',MOMSent='"+MOMSent+"',reviewID="+reviewID+",ReviewsType='"+ReviewsType+"' WHERE reviewID ="+reviewID ;
				 
				 
						
				
				}else
				{
					
					Statement stMaxR=conn.createStatement();
					String queryMaxR="select max(reviewID) from hlsd";
					
					
					ResultSet  rsMaxR = stMaxR.executeQuery(queryMaxR);
					int maxRID=0;
					while(rsMaxR.next())
					{
						maxRID=rsMaxR.getInt(1);
						maxRID++;
					}
					
					
					 query5="INSERT INTO projectmanagementservice.hlsd (ProjectID,ReviewDate,HLSD_TShirt,ReviewStatus,ActionItems,ImpactedDomains,ImpactedCapabilities,AxiomScore,"
							+ "APICount,FeatureCount,ExecutiveSummary,ReviewFeedbackLink,BRDbaslined,HLSDReceived,HLSDReviewWithBiz,AttendeesReceived,DocSentToReviewer,ReviewDecReceived,MOMSent,reviewID,ReviewsType) VALUES ("+projectID+",'"+JRDBReview+"','"+HLSD_TShirt+"','"+ReviewStatus+"',"+ActionItems+","+ImpactedDomains+","+ImpactedCapabilities+","
							+AxiomScore+","+APICount+","+FeatureCount+",'"+ExecutiveSummary+"','"+ReviewFeedbackLink+"','"+BRDbaslined+"','"+HLSDReceived+"','"+HLSDReviewWithBiz+"','"+AttendeesReceived+"','"+DocSentToReviewer+"','"+ReviewDecReceived+"','"+MOMSent+"',"+maxRID+",'"+ReviewsType+"')";
				}
				
				
				
				
				if (ExecutiveSummary!=null || ExecutiveSummary!="")
				{
				
				
				System.out.println(query5);
				
				
				Statement hlsdst=conn.createStatement();
				i=hlsdst.executeUpdate(query5);
				
				
				}
				
				
				
				
				
				
				
				
				
				
				
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
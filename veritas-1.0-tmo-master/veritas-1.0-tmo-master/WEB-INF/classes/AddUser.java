import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.Date;
import java.util.Map.Entry;

public class AddUser extends HttpServlet{ 
 
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
			
			String ProjectNumber = request.getParameter("ProjectNumber").toString();
			String ProjectTittle = request.getParameter("ProjectTittle").toString();
			String ProjectDescription = request.getParameter("ProjectDescription").toString();
			String ProjectCategory = "T-Mobile";
			if(request.getParameter("ProjectCategory") != null) {
			ProjectCategory = request.getParameter("ProjectCategory").toString();
			}
			String ProjectType = request.getParameter("ProjectType").toString();
			String ProjectSite = request.getParameter("ProjectSite").toString();
			String ProjectStatus = request.getParameter("ProjectStatus").toString();
			String WorkStream = request.getParameter("WorkStream").toString();
			String TargetDeployment = request.getParameter("TargetDeployment").toString();
			String ReviewsType="Assessment Review";

			
			
			String action=null;
			if(request.getParameter("action")!=null)
			{
				action=request.getParameter("action").toString();
			}

			String[] wavecheckBox = request.getParameterValues("wave");
			String wave1="false";
			String wave2="false";
			String wave3="false";
			
			if(wavecheckBox!=null)
			{
			System.out.println(wavecheckBox);
		
			for (int i=0;i < wavecheckBox.length;i++ )
			{
				System.out.println(wavecheckBox[i].toString());
				if(wavecheckBox[i].equalsIgnoreCase("wave1"))
				{
					
					wave1="true";
				}else if(wavecheckBox[i].toString().equalsIgnoreCase("wave2"))
				{
					wave2="true";
				}else if(wavecheckBox[i].toString().equalsIgnoreCase("wave3"))
				{
					wave3="true";
				}
				
			}
			}
			
				
			
			/*String bsa = request.getParameter("bsa").toString();
			String lead_arch = request.getParameter("lead_arch").toString();
			String lead_sa = request.getParameter("lead_sa").toString();
			String sa = request.getParameter("sa").toString();
			String dev = request.getParameter("dev").toString();
			String tdm = request.getParameter("tdm").toString();*/
		
			
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				int id=0;
				ArrayList al=null;
				ArrayList userList =new ArrayList();
				Statement st=conn.createStatement();
				if(action==null)
				{
				String query1 ="select max(ProjectId) from project";
				
				
				ResultSet  rs1 = st.executeQuery(query1);
				while(rs1.next())
				{
					id=rs1.getInt(1);
					id++;
				}
				
				String HLSD_TShirt="TBD";
				
				
				int ActionItems =0;
				int ImpactedDomains =0;
				int ImpactedCapabilities =0;
				int AxiomScore =0;
				int APICount =0;
				int FeatureCount =0;
				String ReviewFeedbackLink = "";
				String ExecutiveSummary = "";
			
				String JRDBReview ="";
				if(request.getParameter("HLSD_TShirt")!=null)
				{
					 HLSD_TShirt = request.getParameter("HLSD_TShirt").toString();
				}
				
				
				String ReviewStatus = request.getParameter("ReviewStatus").toString();
				if(request.getParameter("ActionItems")!=null)
				{
					 ActionItems =Integer.parseInt(request.getParameter("ActionItems").toString());
				}
				if(request.getParameter("ImpactedDomains")!=null)
				{
					ImpactedDomains =Integer.parseInt(request.getParameter("ImpactedDomains").toString());
				}
				if(request.getParameter("ImpactedCapabilities")!=null)
				{
					ImpactedCapabilities =Integer.parseInt(request.getParameter("ImpactedCapabilities").toString());
				}
				if(request.getParameter("AxiomScore")!=null)
				{
					AxiomScore =Integer.parseInt(request.getParameter("AxiomScore").toString());
				}
				if(request.getParameter("APICount")!=null)
				{
					APICount =Integer.parseInt(request.getParameter("APICount").toString());
				}
				if(request.getParameter("FeatureCount")!=null)
				{
					FeatureCount =Integer.parseInt(request.getParameter("FeatureCount").toString());
				}
				if(request.getParameter("ReviewFeedbackLink")!=null)
				{
					ReviewFeedbackLink = request.getParameter("ReviewFeedbackLink").toString();
				}if(request.getParameter("ExecutiveSummary")!=null)
				{
					ExecutiveSummary = request.getParameter("ExecutiveSummary").toString();
				}if(request.getParameter("SDOReview")!=null)
				{
					JRDBReview = request.getParameter("SDOReview").toString();
				}
				if(request.getParameter("ReviewsType")!=null)
				{
					ReviewsType = request.getParameter("ReviewsType").toString();
				}
			
				
				
				String[] SelectedcheckBox = request.getParameterValues("Reviews");
				
				String BRDbaslined="false";
				String HLSDReceived="false";
				String HLSDReviewWithBiz="false";
				String AttendeesReceived="false";
				String DocSentToReviewer="false";
				String ReviewDecReceived="false";
				String MOMSent="false";
				
				
				if(SelectedcheckBox!=null)
				{
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
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				//new SimpleDateFormat("MM/dd/yyyy").parse(
				String query="INSERT INTO projectmanagementservice.project (ProjectID,ProjectNumber,ProjectTitle,ProjectDescription,ProjectCategory,ProjectType,ProjectSite,ProjectStatus,TargetDeployment,Workstream,Wave1,Wave2,Restricted)VALUES("+id+",'"+ProjectNumber+"','"+ProjectTittle+"','"+ProjectDescription+"','"+ProjectCategory+"','"+ProjectType+"','"
						+ProjectSite+"','"+ProjectStatus+"','"+TargetDeployment+"','"+WorkStream+"','"+wave1+"','"+wave2+"','"+wave3+"' )";
				System.out.println(query);
			//	String query1 = "insert into pms.projectmaster set ProjectId='"+id+"',ProjectCode='"+p_code+"',ProjectLink='"+link+"',ProjectName='"+p_name+"',ProjectRelaseDate='"+r_date+"',ProjectHealth='"+p_health+"'";
				stmt = conn.createStatement();
				//String query2="INSERT INTO pms.projectcontact set ProjectId='"+id+"',EPOPM='"+epopm+"',EITPM='"+eitpm+"',TESTPM='"+testpm+"',TDM='"+tdm+"',BSA='"+bsa+"',SA='"+sa+"',Dev_Lead='"+dev+"',Lead_Arch='"+lead_arch+"'";
				int i = stmt.executeUpdate(query);
				
				Statement stMaxF=conn.createStatement();
				String queryMaxF ="select max(FeatureID) from feature";
				
				
				ResultSet  rsMaxF = stMaxF.executeQuery(queryMaxF);
				int maxFID=0;
				while(rsMaxF.next())
				{
					maxFID=rsMaxF.getInt(1);
					maxFID++;
				}
				boolean flag=false;
				int feature=0;
				//int j=stmt.executeUpdate(query2);
				for(int ij=1;ij<20;ij++) {
					String query2="";
					if(ij==1 && request.getParameter("FeatureCode")!=null && !request.getParameter("FeatureCode").equalsIgnoreCase("") )
					{
						
					String FeatureCode = request.getParameter("FeatureCode").toString();
					String FeatureDescription = request.getParameter("FeatureDescription").toString();
					String DependentFeature = "0";
					 query2="INSERT INTO projectmanagementservice.feature(FeatureID,ProjectID,FeatureCode,FeatureTitle,DependentFeature)VALUES ("+maxFID+","+id+",'"+FeatureCode+"','"+FeatureDescription+"','"+DependentFeature+"')";
					flag=true;
					}
					
					else if(request.getParameter("FeatureCode"+ij+"")!=null && !request.getParameter("FeatureCode"+ij+"").equalsIgnoreCase(""))
					 {
						String FeatureCode = request.getParameter("FeatureCode"+ij+"").toString();
						String FeatureDescription = request.getParameter("FeatureDescription"+ij+"").toString();
						String DependentFeature = "0";
						 query2="INSERT INTO projectmanagementservice.feature(FeatureID,ProjectID,FeatureCode,FeatureTitle,DependentFeature)VALUES ("+maxFID+","+id+",'"+FeatureCode+"','"+FeatureDescription+"','"+DependentFeature+"')";
						flag=true;	
					}
					if(flag && !query2.equalsIgnoreCase(""))
					{
						System.out.println(query2);
						Statement stF=conn.createStatement();
						//String query2="INSERT INTO pms.projectcontact set ProjectId='"+id+"',EPOPM='"+epopm+"',EITPM='"+eitpm+"',TESTPM='"+testpm+"',TDM='"+tdm+"',BSA='"+bsa+"',SA='"+sa+"',Dev_Lead='"+dev+"',Lead_Arch='"+lead_arch+"'";
						feature= stF.executeUpdate(query2);
						query2="";
						flag=false;
						++maxFID;
					}

				}
				
				
				
				
				
//				ProjectResource=4444&ProjectRole=ProductOwner&Company=Sprint&ProjectResource2=444&ProjectRole2=SolutionCaptain&Company2=TMOBILE&Submit=Save
				
				
				
				//		
				
				
				
				boolean resourceflag=false;
				int resource=0;
				
				for(int ijk=1;ijk<20;ijk++) {
					String query3="";
					if(ijk==1 && request.getParameter("ProjectResource")!=null && !request.getParameter("ProjectResource").equalsIgnoreCase(""))
					{
						
					String ProjectResource = request.getParameter("ProjectResource").toString();
					String ProjectRole = request.getParameter("ProjectRole").toString();
					String Company = request.getParameter("Company").toString();
					 query3="INSERT INTO projectmanagementservice.projectleadership(ProjectResource,ProjectID,ProjectRole,Company,StartDate)VALUES('"+ProjectResource+"',"+id+",'"+ProjectRole+"','"+Company+"','"+dtf.format(localDate)+"' )";
					 resourceflag=true;
					}
					
					else if(request.getParameter("ProjectResource"+ijk+"")!=null && !request.getParameter("ProjectResource"+ijk+"").equalsIgnoreCase(""))
					 {
						String ProjectResource = request.getParameter("ProjectResource"+ijk+"").toString();
						String ProjectRole = request.getParameter("ProjectRole"+ijk+"").toString();
						String Company = request.getParameter("Company"+ijk+"").toString();
						 query3="INSERT INTO projectmanagementservice.projectleadership(ProjectResource,ProjectID,ProjectRole,Company,StartDate)VALUES('"+ProjectResource+"',"+id+",'"+ProjectRole+"','"+Company+"','"+dtf.format(localDate)+"' )";
						 resourceflag=true;	
					}
					if(resourceflag && !query3.equalsIgnoreCase(""))
					{
						System.out.println(query3);
						Statement stF=conn.createStatement();
						//String query2="INSERT INTO pms.projectcontact set ProjectId='"+id+"',EPOPM='"+epopm+"',EITPM='"+eitpm+"',TESTPM='"+testpm+"',TDM='"+tdm+"',BSA='"+bsa+"',SA='"+sa+"',Dev_Lead='"+dev+"',Lead_Arch='"+lead_arch+"'";
						feature= stF.executeUpdate(query3);
						query3="";
						resourceflag=false;
						
					}

				}
				
							
				
				Statement stMaxR=conn.createStatement();
				String queryMaxR="select max(reviewID) from hlsd";
				
				
				ResultSet  rsMaxR = stMaxR.executeQuery(queryMaxR);
				int maxRID=0;
				while(rsMaxR.next())
				{
					maxRID=rsMaxR.getInt(1);
					maxRID++;
				}
				
				
				
				
				String query5="INSERT INTO projectmanagementservice.hlsd (ProjectID,ReviewDate,HLSD_TShirt,ReviewStatus,ActionItems,ImpactedDomains,ImpactedCapabilities,AxiomScore,"
						+ "APICount,FeatureCount,ExecutiveSummary,ReviewFeedbackLink,BRDbaslined,HLSDReceived,HLSDReviewWithBiz,AttendeesReceived,DocSentToReviewer,ReviewDecReceived,MOMSent,reviewID,ReviewsType) VALUES ("+id+",'"+JRDBReview+"','"+HLSD_TShirt+"','"+ReviewStatus+"',"+ActionItems+","+ImpactedDomains+","+ImpactedCapabilities+","
						+AxiomScore+","+APICount+","+FeatureCount+",'"+ExecutiveSummary+"','"+ReviewFeedbackLink+"','"+BRDbaslined+"','"+HLSDReceived+"','"+HLSDReviewWithBiz+"','"+AttendeesReceived+"','"+DocSentToReviewer+"','"+ReviewDecReceived+"','"+MOMSent+"',"+maxRID+",'"+ReviewsType+"')";
				System.out.println(query5);
				
				
				Statement hlsdst=conn.createStatement();
				hlsdst.executeUpdate(query5);
				
				
				
				}
				
				
				if(action!=null)
				{
					int ProjectID = Integer.parseInt(request.getParameter("ProjectID").toString());
					
					
					String query="UPDATE projectmanagementservice.project SET ProjectID ="+ProjectID+",ProjectNumber ='"+ProjectNumber+"',ProjectTitle ='"+ProjectTittle+"',ProjectDescription ='"+ProjectDescription+"',ProjectType ='"+ProjectType+"',ProjectSite ='"+ProjectSite+"',ProjectStatus ='"+ProjectStatus+"',Workstream ='"+WorkStream+"',Wave1 ='"+wave1+"',Wave2 ='"+wave2+"',Wave3 ='"+wave3+"', TargetDeployment='"+TargetDeployment+"' WHERE ProjectID ="+ProjectID;
					
					
					System.out.println(query);
				//	String query1 = "insert into pms.projectmaster set ProjectId='"+id+"',ProjectCode='"+p_code+"',ProjectLink='"+link+"',ProjectName='"+p_name+"',ProjectRelaseDate='"+r_date+"',ProjectHealth='"+p_health+"'";
					stmt = conn.createStatement();
					//String query2="INSERT INTO pms.projectcontact set ProjectId='"+id+"',EPOPM='"+epopm+"',EITPM='"+eitpm+"',TESTPM='"+testpm+"',TDM='"+tdm+"',BSA='"+bsa+"',SA='"+sa+"',Dev_Lead='"+dev+"',Lead_Arch='"+lead_arch+"'";
					int i = stmt.executeUpdate(query);
				
				}
				
				
				
				
					request.setAttribute("pageer", "addp");
					System.out.println("mmmmmmmmmmmmmmmmmmm"+request.getAttribute("pageer"));
					response.sendRedirect("ViewAllProject");
						conn.close();
			
				
				
				
				
				
				
				
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}
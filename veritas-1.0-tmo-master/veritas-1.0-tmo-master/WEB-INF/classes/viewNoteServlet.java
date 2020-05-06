
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class viewNoteServlet extends HttpServlet{ 
 
   public void doGet(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html"); //$NON-NLS-1$
			PrintWriter out = response.getWriter();
			String str[] = request.getRequestURI().toString().split("/"); //$NON-NLS-1$

         int id = Integer.parseInt(str[3]);
			System.out.println("MySQL Connect Example."); //$NON-NLS-1$
			Connection conn = null;
			String url = Messages.getString("connectionURL"); //$NON-NLS-1$
			String dbName = Messages.getString("database"); //$NON-NLS-1$
			String driver = Messages.getString("dbDriver"); //$NON-NLS-1$
			String userName = Messages.getString("dbuser");  //$NON-NLS-1$
			String password = Messages.getString("dbPassword"); //$NON-NLS-1$

		//	out.println(request.getRequestURI());
			Statement st,st1,st2,st3,st4,st5,st6,st7,st8,st9,st10,st11,st12,st13,st14;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database"); //$NON-NLS-1$
				
				
				@SuppressWarnings("rawtypes")
				HashMap projectDescription=null;
				HashMap feature=null;
				HashMap hlsd=null;
				ArrayList featureList=new ArrayList();
				ArrayList featureListFinal=new ArrayList();
				HashMap leadership=null;
				ArrayList leadershipList=new ArrayList();
				HashMap component=null;
				ArrayList componentList=new ArrayList();
				String query = "select * from project  where ProjectID="+id; //$NON-NLS-1$
				String query2 = "select * from feature where ProjectID="+id; //$NON-NLS-1$
				String query3 = "select * from projectleadership  where ProjectID="+id; //$NON-NLS-1$
				String query7 = "select * from hlsd  where ProjectID="+id; //$NON-NLS-1$
				
				
				
				
					
				System.out.println("query " + query); //$NON-NLS-1$
				st = conn.createStatement();
				ResultSet  rs = st.executeQuery(query);
			
                System.out.println(query2);
               
				while(rs.next())
				{
				  
				  projectDescription =new HashMap();
				  projectDescription.put("ProjectID",rs.getString(1)); //$NON-NLS-1$
				  projectDescription.put("ProjectNumber",rs.getString(2)); //$NON-NLS-1$
				  projectDescription.put("ProjectTitle",rs.getString(3)); //$NON-NLS-1$
				  projectDescription.put("ProjectDescription",rs.getString(4)); //$NON-NLS-1$
				  projectDescription.put("ProjectType",rs.getString(5)); //$NON-NLS-1$
				  projectDescription.put("ProjectSite",rs.getString(6)); //$NON-NLS-1$
				  projectDescription.put("ProjectStatus",rs.getString(7)); //$NON-NLS-1$
				  projectDescription.put("TargetDeployment",rs.getString(8)); //$NON-NLS-1$
				  projectDescription.put("Workstream",rs.getString(9)); //$NON-NLS-1$
				  if (rs.getString(10)!=null && !rs.getString(10).toString().trim().equalsIgnoreCase("null")) //$NON-NLS-1$
				  {
					  projectDescription.put("wave1",rs.getString(10)); //$NON-NLS-1$
				  }else
				  {
					  projectDescription.put("wave1","false"); //$NON-NLS-1$ //$NON-NLS-2$
				  }
				  
				  
				  if (rs.getString(11)!=null && !rs.getString(11).toString().trim().equalsIgnoreCase("null")) //$NON-NLS-1$
				  {
					  projectDescription.put("wave2",rs.getString(11)); //$NON-NLS-1$
				  }else
				  {
					  projectDescription.put("wave2","false"); //$NON-NLS-1$ //$NON-NLS-2$
				  }
				  
				  
				  if (rs.getString(12)!=null && !rs.getString(12).toString().trim().equalsIgnoreCase("null")) //$NON-NLS-1$
				  {
					  projectDescription.put("isRestricted",rs.getString(12)); //$NON-NLS-1$
				  }else
				  {
					  projectDescription.put("isRestricted","false"); //$NON-NLS-1$ //$NON-NLS-2$
				  }
				  
				
				}
				
				
				
				
				String statusQuery1="SELECT FLD_Design," +  //$NON-NLS-1$
		 				"    FLD_Dev," +  //$NON-NLS-1$
		 				"    FLD_Loc," +  //$NON-NLS-1$
		 				"    SD_Loc," +  //$NON-NLS-1$
		 				"    num_epic," +  //$NON-NLS-1$
		 				"    AC_Design," +  //$NON-NLS-1$
		 				"    AC_Dev," +  //$NON-NLS-1$
		 				"    AC_Test," +  //$NON-NLS-1$
		 				"    AC_Dep," +  //$NON-NLS-1$
		 				"    Logging," +  //$NON-NLS-1$
		 				"    Telemetry," +  //$NON-NLS-1$
		 				"    FO," +  //$NON-NLS-1$
		 				"    OP," +  //$NON-NLS-1$
		 				"    Data_Mov_Init," +  //$NON-NLS-1$
		 				"    Data_Mov_In," +  //$NON-NLS-1$
		 				"    Data_Mov_Recon," +  //$NON-NLS-1$
		 				"    DIT_Check," +  //$NON-NLS-1$
		 				"    QAT_Check," +  //$NON-NLS-1$
		 				"    PRD_Check," +  //$NON-NLS-1$
		 				"    Network_Check," +  //$NON-NLS-1$
		 				"    SD," +  //$NON-NLS-1$
		 				"    Security_Check," +  //$NON-NLS-1$
		 				"    Test_Check," +  //$NON-NLS-1$
		 				"    FeatureInAC," +  //$NON-NLS-1$
		 				"    HLSD_Baslined," +  //$NON-NLS-1$
		 				"    FLD_Complete," +  //$NON-NLS-1$
		 				"    Swagger," +  //$NON-NLS-1$
		 				"    Test_Data_Check," +  //$NON-NLS-1$
		 				"    EDP_Check," +  //$NON-NLS-1$
		 				"    feature_toggele_check," +  //$NON-NLS-1$
		 				"    Data_Mov_Check," +  //$NON-NLS-1$
		 				"    Create_DTM," +  //$NON-NLS-1$
		 				"    Create_By," +  //$NON-NLS-1$
		 				"    Update_DTM," +  //$NON-NLS-1$
		 				"    Update_By," +  //$NON-NLS-1$
		 				"    Swagger_Loc," +  //$NON-NLS-1$
		 				"    securityauth," +  //$NON-NLS-1$
		 				"targetDate,"+ //$NON-NLS-1$
		 				"notes"+ //$NON-NLS-1$
		 				" FROM projectmanagementservice.feature_status where FeatureID=101 and ProjectID="+id; //$NON-NLS-1$
		 		
		 		System.out.println("query " + statusQuery1); //$NON-NLS-1$
		 		Statement stStatus1 = conn.createStatement();
		 		ResultSet  rsStatus1 = stStatus1.executeQuery(statusQuery1);
		 		
		 		HashMap p11=null;
		 		
		 		while(rsStatus1.next())
		 		{
		 			
		 					
		 			p11  = new HashMap();
		 			
		 		 	  p11.put("FLD_Design",rsStatus1.getString(1)); //$NON-NLS-1$
		 		 	  p11.put("FLD_Dev",rsStatus1.getString(2)); //$NON-NLS-1$
		 			  p11.put("FLD_Loc",rsStatus1.getString(3)); //$NON-NLS-1$
		 			  p11.put("SD_Loc",rsStatus1.getString(4)); //$NON-NLS-1$
		 			  p11.put("num_epic",rsStatus1.getString(5));  //$NON-NLS-1$
		 			  p11.put("AC_Design",rsStatus1.getString(6)); //$NON-NLS-1$
		 			  p11.put("AC_Dev",rsStatus1.getString(7));  //$NON-NLS-1$
		 			  p11.put("AC_Test",rsStatus1.getString(8)); //$NON-NLS-1$
		 			  p11.put("AC_Dep",rsStatus1.getString(9));  //$NON-NLS-1$
		 			  p11.put("Logging",rsStatus1.getString(10)); //$NON-NLS-1$
		 			  p11.put("Telemetry",rsStatus1.getString(11)); //$NON-NLS-1$
		 			  p11.put("FO",rsStatus1.getString(12)); //$NON-NLS-1$
		 			  p11.put("OP",rsStatus1.getString(13)); //$NON-NLS-1$
		 			  p11.put("Data_Mov_Init",rsStatus1.getString(14)); //$NON-NLS-1$
		 			  p11.put("Data_Mov_In",rsStatus1.getString(15)); //$NON-NLS-1$
		 			  p11.put("Data_Mov_Recon",rsStatus1.getString(16)); //$NON-NLS-1$
		 			  p11.put("DIT_Check",rsStatus1.getString(17));  //$NON-NLS-1$
		 			  p11.put("QAT_Check",rsStatus1.getString(18)); //$NON-NLS-1$
		 			  p11.put("PRD_Check",rsStatus1.getString(19));  //$NON-NLS-1$
		 			  p11.put("Network_Check",rsStatus1.getString(20));  //$NON-NLS-1$
		 			  p11.put("SD",rsStatus1.getString(21));  //$NON-NLS-1$
		 			  p11.put("Security_Check",rsStatus1.getString(22)); //$NON-NLS-1$
		 			  p11.put("Test_Check",rsStatus1.getString(23)); //$NON-NLS-1$
		 			  p11.put("FeatureInAC",rsStatus1.getString(24)); //$NON-NLS-1$
		 			  p11.put("HLSD_Baslined",rsStatus1.getString(25)); //$NON-NLS-1$
		 			  p11.put("FLD_Complete",rsStatus1.getString(26)); //$NON-NLS-1$
		 			  p11.put("Swagger",rsStatus1.getString(27)); //$NON-NLS-1$
		 			  p11.put("Test_Data_Check",rsStatus1.getString(28)); //$NON-NLS-1$
		 			  p11.put("EDP_Check",rsStatus1.getString(29)); //$NON-NLS-1$
		 			  p11.put("feature_toggele_check",rsStatus1.getString(30));  //$NON-NLS-1$
		 			  p11.put("Data_Mov_Check",rsStatus1.getString(31)); //$NON-NLS-1$
		 			  p11.put("Create_DTM",rsStatus1.getString(32)); //$NON-NLS-1$
		 			  p11.put("Create_By",rsStatus1.getString(33)); //$NON-NLS-1$
		 			  p11.put("Update_DTM",rsStatus1.getString(34));  //$NON-NLS-1$
		 			  p11.put("Update_By",rsStatus1.getString(35));						 //$NON-NLS-1$
		 			  p11.put("Swagger_Loc",rsStatus1.getString(36)); //$NON-NLS-1$
		 			  p11.put("securityauth",rsStatus1.getString(37)); //$NON-NLS-1$
		 			 p11.put("targetDate",rsStatus1.getString(38)); //$NON-NLS-1$
		 			 p11.put("notes",rsStatus1.getString(39)); //$NON-NLS-1$
		 			 
		 			projectDescription.put("status",p11); //$NON-NLS-1$
		 			
		 		}
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			/*	SELECT `feature`.`FeatureID`,
			    `feature`.`ProjectID`,
			    `feature`.`FeatureTitle`,
			    `feature`.`DependentFeature`,
			    `feature`.`FeatureCode`
			FROM `projectmanagementservice`.`feature`;*/
				
				st2 = conn.createStatement();
				ResultSet  rs2 = st2.executeQuery(query2);
				while(rs2.next())
				{
				  		feature	=new  HashMap();
				 		feature.put("FeatureID",rs2.getString(1)); //$NON-NLS-1$
				 		feature.put("FeatureTitle",rs2.getString(3)); //$NON-NLS-1$
				 		feature.put("DependentFeature",rs2.getString(4)); //$NON-NLS-1$
				 		feature.put("FeatureCode",rs2.getString(5)); //$NON-NLS-1$
				  	
				 		String statusQuery="SELECT FLD_Design," +  //$NON-NLS-1$
				 				"    FLD_Dev," +  //$NON-NLS-1$
				 				"    FLD_Loc," +  //$NON-NLS-1$
				 				"    SD_Loc," +  //$NON-NLS-1$
				 				"    num_epic," +  //$NON-NLS-1$
				 				"    AC_Design," +  //$NON-NLS-1$
				 				"    AC_Dev," +  //$NON-NLS-1$
				 				"    AC_Test," +  //$NON-NLS-1$
				 				"    AC_Dep," +  //$NON-NLS-1$
				 				"    Logging," +  //$NON-NLS-1$
				 				"    Telemetry," +  //$NON-NLS-1$
				 				"    FO," +  //$NON-NLS-1$
				 				"    OP," +  //$NON-NLS-1$
				 				"    Data_Mov_Init," +  //$NON-NLS-1$
				 				"    Data_Mov_In," +  //$NON-NLS-1$
				 				"    Data_Mov_Recon," +  //$NON-NLS-1$
				 				"    DIT_Check," +  //$NON-NLS-1$
				 				"    QAT_Check," +  //$NON-NLS-1$
				 				"    PRD_Check," +  //$NON-NLS-1$
				 				"    Network_Check," +  //$NON-NLS-1$
				 				"    SD," +  //$NON-NLS-1$
				 				"    Security_Check," +  //$NON-NLS-1$
				 				"    Test_Check," +  //$NON-NLS-1$
				 				"    FeatureInAC," +  //$NON-NLS-1$
				 				"    HLSD_Baslined," +  //$NON-NLS-1$
				 				"    FLD_Complete," +  //$NON-NLS-1$
				 				"    Swagger," +  //$NON-NLS-1$
				 				"    Test_Data_Check," +  //$NON-NLS-1$
				 				"    EDP_Check," +  //$NON-NLS-1$
				 				"    feature_toggele_check," +  //$NON-NLS-1$
				 				"    Data_Mov_Check," +  //$NON-NLS-1$
				 				"    Create_DTM," +  //$NON-NLS-1$
				 				"    Create_By," +  //$NON-NLS-1$
				 				"    Update_DTM," +  //$NON-NLS-1$
				 				"    Update_By," +  //$NON-NLS-1$
				 				"    Swagger_Loc," +  //$NON-NLS-1$
				 				"    securityauth," +  //$NON-NLS-1$
				 				"targetDate,"+ //$NON-NLS-1$
				 				"notes"+ //$NON-NLS-1$
				 				" FROM projectmanagementservice.feature_status where FeatureID="+rs2.getString(1); //$NON-NLS-1$
				 		
				 		System.out.println("query " + statusQuery); //$NON-NLS-1$
				 		Statement stStatus = conn.createStatement();
				 		ResultSet  rsStatus = stStatus.executeQuery(statusQuery);
				 		
				 		HashMap p1=null;
				 		int count=0;
				 		while(rsStatus.next())
				 		{
				 			
				 					
				 			p1  = new HashMap();
				 			
				 		 	  p1.put("FLD_Design",rsStatus.getString(1)); //$NON-NLS-1$
				 		 	  p1.put("FLD_Dev",rsStatus.getString(2)); //$NON-NLS-1$
				 			  p1.put("FLD_Loc",rsStatus.getString(3)); //$NON-NLS-1$
				 			  p1.put("SD_Loc",rsStatus.getString(4)); //$NON-NLS-1$
				 			  p1.put("num_epic",rsStatus.getString(5));  //$NON-NLS-1$
				 			  p1.put("AC_Design",rsStatus.getString(6)); //$NON-NLS-1$
				 			  p1.put("AC_Dev",rsStatus.getString(7));  //$NON-NLS-1$
				 			  p1.put("AC_Test",rsStatus.getString(8)); //$NON-NLS-1$
				 			  p1.put("AC_Dep",rsStatus.getString(9));  //$NON-NLS-1$
				 			  p1.put("Logging",rsStatus.getString(10)); //$NON-NLS-1$
				 			  p1.put("Telemetry",rsStatus.getString(11)); //$NON-NLS-1$
				 			  p1.put("FO",rsStatus.getString(12)); //$NON-NLS-1$
				 			  p1.put("OP",rsStatus.getString(13)); //$NON-NLS-1$
				 			  p1.put("Data_Mov_Init",rsStatus.getString(14)); //$NON-NLS-1$
				 			  p1.put("Data_Mov_In",rsStatus.getString(15)); //$NON-NLS-1$
				 			  p1.put("Data_Mov_Recon",rsStatus.getString(16)); //$NON-NLS-1$
				 			  p1.put("DIT_Check",rsStatus.getString(17));  //$NON-NLS-1$
				 			  p1.put("QAT_Check",rsStatus.getString(18)); //$NON-NLS-1$
				 			  p1.put("PRD_Check",rsStatus.getString(19));  //$NON-NLS-1$
				 			  p1.put("Network_Check",rsStatus.getString(20));  //$NON-NLS-1$
				 			  p1.put("SD",rsStatus.getString(21));  //$NON-NLS-1$
				 			  p1.put("Security_Check",rsStatus.getString(22)); //$NON-NLS-1$
				 			  p1.put("Test_Check",rsStatus.getString(23)); //$NON-NLS-1$
				 			  p1.put("FeatureInAC",rsStatus.getString(24)); //$NON-NLS-1$
				 			  p1.put("HLSD_Baslined",rsStatus.getString(25)); //$NON-NLS-1$
				 			  p1.put("FLD_Complete",rsStatus.getString(26)); //$NON-NLS-1$
				 			  p1.put("Swagger",rsStatus.getString(27)); //$NON-NLS-1$
				 			  p1.put("Test_Data_Check",rsStatus.getString(28)); //$NON-NLS-1$
				 			  p1.put("EDP_Check",rsStatus.getString(29)); //$NON-NLS-1$
				 			  p1.put("feature_toggele_check",rsStatus.getString(30));  //$NON-NLS-1$
				 			  p1.put("Data_Mov_Check",rsStatus.getString(31)); //$NON-NLS-1$
				 			  p1.put("Create_DTM",rsStatus.getString(32)); //$NON-NLS-1$
				 			  p1.put("Create_By",rsStatus.getString(33)); //$NON-NLS-1$
				 			  p1.put("Update_DTM",rsStatus.getString(34));  //$NON-NLS-1$
				 			  p1.put("Update_By",rsStatus.getString(35));						 //$NON-NLS-1$
				 			  p1.put("Swagger_Loc",rsStatus.getString(36)); //$NON-NLS-1$
				 			  p1.put("securityauth",rsStatus.getString(37)); //$NON-NLS-1$
				 			 p1.put("targetDate",rsStatus.getString(38)); //$NON-NLS-1$
				 			 p1.put("notes",rsStatus.getString(39)); //$NON-NLS-1$
				 			 
				 			feature.put("status",p1); //$NON-NLS-1$
				 			
				 		}
				 		
				 		
				 		
				 		
				 		
				 		
				 		
				 		
				 		
				 		featureList.add(feature);
				  		
				 		 
				
				}
				
				   projectDescription.put("featureList", featureList); //$NON-NLS-1$
				
				/*SELECT `projectleadership`.`ProjectResource`,
			    `projectleadership`.`ProjectID`,
			    `projectleadership`.`ProjectRole`,
			    `projectleadership`.`Company`,
			    `projectleadership`.`StartDate`,
			    `projectleadership`.`EndDate`
			FROM `projectmanagementservice`.`projectleadership`;
*/
				
				
				   st7=conn.createStatement();
				   ResultSet rs7=st7.executeQuery(query7);
				   ArrayList hlsdList=new ArrayList();
				   boolean ishlsd=false;
						   while(rs7.next())
							{
							  		hlsd	=new  HashMap();
							  		hlsd.put("ReviewDate",rs7.getString(2)); //$NON-NLS-1$
							  		hlsd.put("HLSD_TShirt",rs7.getString(3)); //$NON-NLS-1$
							  		

							  	  if(rs7.getString(4)!=null && rs7.getString(4).toString().equalsIgnoreCase("Review_Pending"))
								  {
							  		hlsd.put("ReviewStatus","Pending Review"); 
								  }else {
								  
								  if(rs7.getString(4)!=null && rs7.getString(4).toString().equalsIgnoreCase("Record_Added"))
								  {
									  hlsd.put("ReviewStatus","To be Scheduled "); 
								  }else {
								  
								  if(rs7.getString(4)!=null && rs7.getString(4).toString().equalsIgnoreCase("Approved"))
								  {
									  hlsd.put("ReviewStatus","Approved"); 
								  }else {
									  if(rs7.getString(4)!=null && (rs7.getString(4).toString().equalsIgnoreCase("ApprovedWithAI")|| rs7.getString(4).toString().equalsIgnoreCase("Approved pending AI")))
									  {
										  hlsd.put("ReviewStatus","Approved with AIs"); 
									  }
								  
								  
								  
								  else {
								  if(rs7.getString(4)!=null && rs7.getString(4).toString().equalsIgnoreCase("ReturnwithComment"))
								  {
									  hlsd.put("ReviewStatus","Returned with Feedback"); 
								  }
								  else {
								  if(rs7.getString(4)!=null && rs7.getString(4).toString().equalsIgnoreCase("ReviewInProgress"))
								  {
									  hlsd.put("ReviewStatus","Review In Progress"); 
								  }else {
								  
								  if(rs7.getString(4)!=null && rs7.getString(4).toString().equalsIgnoreCase("hold"))
								  {
									  hlsd.put("ReviewStatus","Put on Hold"); 
								  }else {
									  hlsd.put("ReviewStatus",rs7.getString(4));
									  
								  }}}}}}}						  		
							  		
							  		
							  		
							  		
							  		
/////							  		
							  		
							  		//hlsd.put("ReviewStatus",rs7.getString(4)); //$NON-NLS-1$
							  		hlsd.put("ActionItems",rs7.getString(5)); //$NON-NLS-1$
							  		hlsd.put("ImpactedDomains",rs7.getString(6)); //$NON-NLS-1$
							  		hlsd.put("ImpactedCapabilities",rs7.getString(7)); //$NON-NLS-1$
							  		hlsd.put("AxiomScore",rs7.getString(8)); //$NON-NLS-1$
							  		hlsd.put("APICount",rs7.getString(9)); //$NON-NLS-1$
							  		hlsd.put("FeatureCount",rs7.getString(10)); //$NON-NLS-1$
							  		hlsd.put("ExecutiveSummary",rs7.getString(11)); //$NON-NLS-1$
							  		hlsd.put("ReviewFeedbackLink",rs7.getString(12)); //$NON-NLS-1$
							  		hlsd.put("BRDbaslined",rs7.getString(13)); //$NON-NLS-1$
							  		hlsd.put("HLSDReceived",rs7.getString(14)); //$NON-NLS-1$
							  		hlsd.put("HLSDReviewWithBiz",rs7.getString(15)); //$NON-NLS-1$
							  		hlsd.put("AttendeesReceived",rs7.getString(16)); //$NON-NLS-1$
							  		hlsd.put("DocSentToReviewer",rs7.getString(17)); //$NON-NLS-1$
							  		hlsd.put("ReviewDecReceived",rs7.getString(18)); //$NON-NLS-1$
							  		hlsd.put("MOMSent",rs7.getString(19)); //$NON-NLS-1$
							  		hlsd.put("reviewID",rs7.getString(20)); //$NON-NLS-1$
							  		hlsd.put("reviewType",rs7.getString(21)); //$NON-NLS-1$
							   
							
							  		hlsdList.add(hlsd);
							  		ishlsd=true;
							
							}
							
						   if(ishlsd)
						   {
							  projectDescription.put("hlsd", hlsdList); //$NON-NLS-1$
						   }
				   
				   
						   String query8="select * from projectmanagementservice.techdebtdetails where projectID="+id; //$NON-NLS-1$
  
						   st8=conn.createStatement();
						   ResultSet rs8=st8.executeQuery(query8);
						   ArrayList tD=new ArrayList();
						   HashMap tdMap=null;
								   while(rs8.next())
									{
									   tdMap=new  HashMap();	
									   tdMap.put("techdebtID",rs8.getString(1)); //$NON-NLS-1$
									   tdMap.put("techdebt_Details",rs8.getString(3)); //$NON-NLS-1$
									   tdMap.put("Techdebt_status",rs8.getString(4)); //$NON-NLS-1$
									   tdMap.put("Techdebt_origination",rs8.getString(5)); //$NON-NLS-1$
									  if(rs8.getString(6)!=null && !rs8.getString(6).toString().trim().equalsIgnoreCase("null"))
									  {
										  tdMap.put("td_Just",rs8.getString(6));
									  }else
									  {
										  tdMap.put("td_Just"," ");
									  }
									   
									   
									  if(rs8.getString(7)!=null && !rs8.getString(7).toString().trim().equalsIgnoreCase("null"))
									  {
									   tdMap.put("td_team",rs8.getString(7));
									  }else{
										  
										   tdMap.put("td_team"," ");
									  }
									   tD.add(tdMap);
										 
									
									}
								   projectDescription.put("techDebt",tD); //$NON-NLS-1$
								   
								  
								   String query9="select * from projectmanagementservice.projectdeleiveryrisk where projectID="+id; //$NON-NLS-1$
								   
								   st9=conn.createStatement();
								   ResultSet rs9=st9.executeQuery(query9);
								   ArrayList pdr=new ArrayList();
								   HashMap pdrMap=null;
										   while(rs9.next())
											{
											   pdrMap=new  HashMap();	
											   pdrMap.put("pdrID",rs9.getString(1)); //$NON-NLS-1$
											   pdrMap.put("prd_type",rs9.getString(3)); //$NON-NLS-1$
											   pdrMap.put("prd_details",rs9.getString(4)); //$NON-NLS-1$
											   pdrMap.put("prd_status",rs9.getString(5)); //$NON-NLS-1$
											   pdrMap.put("prd_org",rs9.getString(6)); //$NON-NLS-1$
											   pdr.add(pdrMap);
											
											  					 		 
											
											}
										   projectDescription.put("pdr",pdr); //$NON-NLS-1$
								   
				   
										   
										   String query10="select * from projectmanagementservice.projectcrdetails where projectID="+id; //$NON-NLS-1$
										   
										   st10=conn.createStatement();
										   ResultSet rs10=st10.executeQuery(query10);
										   ArrayList cr=new ArrayList();
										   HashMap crMap=null;
												   while(rs10.next())
													{
													   crMap=new  HashMap();	
													   crMap.put("crID",rs10.getString(1)); //$NON-NLS-1$
													   crMap.put("cr_num",rs10.getString(3)); //$NON-NLS-1$
													   crMap.put("crDetails",rs10.getString(4)); //$NON-NLS-1$
													   crMap.put("cr_size",rs10.getString(5)); //$NON-NLS-1$
													   crMap.put("cr_System",rs10.getString(6)); //$NON-NLS-1$
													   crMap.put("JRDBDetails",rs10.getString(7)); //$NON-NLS-1$
													   crMap.put("cr_add",rs10.getString(8)); //$NON-NLS-1$
													   crMap.put("cr_Recom",rs10.getString(9)); //$NON-NLS-1$
													   crMap.put("cr_Recom",rs10.getString(10)); //$NON-NLS-1$
													   crMap.put("reviewDate",rs10.getString(11)); //$NON-NLS-1$
													   cr.add(crMap);
													
													  					 		 
													
													}
												   projectDescription.put("cr",cr); //$NON-NLS-1$
												  		   			   
										   
												   String query11="select * from projectmanagementservice.projectitddetails where projectID="+id; //$NON-NLS-1$
												   
												   st11=conn.createStatement();
												   ResultSet rs11=st11.executeQuery(query11);
												   ArrayList itd=new ArrayList();
												   HashMap itdMap=null;
														   while(rs11.next())
															{
															   itdMap=new  HashMap();	
															   itdMap.put("iTDID",rs11.getString(1)); //$NON-NLS-1$
															   itdMap.put("IT_Type",rs11.getString(3)); //$NON-NLS-1$
															   itdMap.put("IT_Method",rs11.getString(4)); //$NON-NLS-1$
															   itdMap.put("ITC_Name",rs11.getString(5)); //$NON-NLS-1$
															   itdMap.put("ITC_Owner",rs11.getString(6)); //$NON-NLS-1$
															   itdMap.put("ITC_Consumer",rs11.getString(7)); //$NON-NLS-1$
															   itdMap.put("ITC_add_details",rs11.getString(8)); //$NON-NLS-1$
															   
															   
															   
															   itd.add(itdMap);
															
															  					 		 
															
															}
														   projectDescription.put("itd",itd);					    //$NON-NLS-1$
										   
										   
										   
										   
										   
												   
										   
										   
										   
										   
				st3 = conn.createStatement();
				 ResultSet  rs3 = st3.executeQuery(query3);
	                System.out.println(query3);
	                while(rs3.next())
					{
	                	leadership	=new  HashMap();
	                	leadership.put("ProjectResource",rs3.getString(1)); //$NON-NLS-1$
	                	leadership.put("ProjectID",rs3.getString(2)); //$NON-NLS-1$
	                	
	                	leadership.put("ProjectRole",rs3.getString(3)); //$NON-NLS-1$
	                	leadership.put("Company",rs3.getString(4)); //$NON-NLS-1$
	                	leadership.put("StartDate",rs3.getString(5)); //$NON-NLS-1$
	                	leadership.put("EndDate",rs3.getString(6)); //$NON-NLS-1$
	                	leadershipList.add(leadership);
					 
					
					}
	                projectDescription.put("leadershipList", leadershipList); //$NON-NLS-1$
	                st4 = conn.createStatement();
	                
	                
	        			
	        			 String query4 = "select * from feature_component where ProjectID="+id; //$NON-NLS-1$
	        			 System.out.println(query4);
	        			 ResultSet  rs4 = st4.executeQuery(query4); 
	        			
	        			
	        			 
	        			 while(rs4.next())
	 					{
	 					  
	        				 
	        				 
	        				 component =new HashMap();
	        				 component.put("ProjectID",rs4.getString(1)); //$NON-NLS-1$
	        				 component.put("ComponentID",rs4.getString(2)); //$NON-NLS-1$
	        				 component.put("Impact",rs4.getString(3)); //$NON-NLS-1$
	        				
	        				 component.put("TShirt_Size",rs4.getString(4)); //$NON-NLS-1$
	        				 if(rs4.getString(5)!=null && !rs4.getString(5).equalsIgnoreCase("null"))
	        				 {
	        				 component.put("ImpactType",rs4.getString(5)); //$NON-NLS-1$
	        				 }else
	        				 {
	        					 component.put("ImpactType","HLSD Review");
	        				 }
		        				
	        				 component.put("ImpactDetails",rs4.getString(6)); //$NON-NLS-1$
	        				
	 					  				  
	 					  
	 					 String query5 = "select * from component  where ComponentID="+Integer.parseInt(rs4.getString(2)); //$NON-NLS-1$
	 					 System.out.println(query5);
	 					st5 = conn.createStatement();
	 					 ResultSet  rs5 = st5.executeQuery(query5); 
	 					 while(rs5.next())
		 					{
	 						component.put("ComponentName",rs5.getString(2)); //$NON-NLS-1$
	        				 component.put("ComponentType",rs5.getString(3)); //$NON-NLS-1$
	        				 component.put("ComponentOwner",rs5.getString(4)); //$NON-NLS-1$
		 					}
	 					 
	 				
	 					 
	 					componentList.add(component);
	 					 
	 					 
	 					}


	        			 
	        			
	        		
	        		projectDescription.put("componentList", componentList); //$NON-NLS-1$
	        		projectDescription.put("featureListFinal", featureListFinal); //$NON-NLS-1$
					
				
	             /*
	        		SELECT `component_relationship`.`ParentComponentID`,
	        	    `component_relationship`.`DependentComponentID`,
	        	    `component_relationship`.`StartDate`,
	        	    `component_relationship`.`EndDate`
	        	FROM `projectmanagementservice`.`component_relationship`;*/
	

			/*
	        		String query6 = "select * from component_relationship  where ComponentID="+Integer.parseInt(rs4.getString(2));
					 System.out.println(query6);
					 ResultSet  rs6 = st6.executeQuery(query6); 
					 while(rs6.next())
	 					{
						component.put("ComponentName",rs5.getString(2));
       				 component.put("ComponentType",rs5.getString(3));
       				 component.put("ComponentOwner",rs5.getString(4));
	 					}
	                */
	                
	                
	        		
	        		
	        		
	        		
	        		
	        		ArrayList dependencyList=new ArrayList();
					
	    			
					String queryD = "select * from project_dependency  where ProjectID="+id; //$NON-NLS-1$
					
				
					HashMap dependency=null;
					
					
					
						
					System.out.println("query " + queryD); //$NON-NLS-1$
					st12 = conn.createStatement();
					ResultSet  rs12 = st12.executeQuery(queryD);
					

	              
					while(rs12.next())
					{
					  
						 String query15 = "select * from project where ProjectID="+Integer.parseInt(rs12.getString(2)); //$NON-NLS-1$
	 					 System.out.println(query15);
	 					st14 = conn.createStatement();
	 					 ResultSet  rs15 = st14.executeQuery(query15); 
	 					 while(rs15.next())
		 					{
	 						dependency=new HashMap();
	 						
	 						dependency.put("DependencyID",rs12.getString(5)); //$NON-NLS-1$
	 						dependency.put("ProjectID",rs15.getString(1)); //$NON-NLS-1$
	 						dependency.put("ProjectNumber",rs15.getString(2)); //$NON-NLS-1$
	 						dependency.put("ProjectTitle",rs15.getString(3)); //$NON-NLS-1$
	 						dependency.put("ProjectDescription",rs15.getString(4)); //$NON-NLS-1$
	 						dependency.put("ProjectStatus",rs15.getString(7)); //$NON-NLS-1$
	 						dependency.put("Workstream",rs15.getString(9)); //$NON-NLS-1$
	 						dependency.put("nature",rs12.getString(3)); //$NON-NLS-1$
	 						dependency.put("strategies",rs12.getString(4)); //$NON-NLS-1$
		 					}
	 					 
	 				
	 					 
	 					dependencyList.add(dependency);
					}
	 					projectDescription.put("dependencyList", dependencyList); //$NON-NLS-1$
	 					
	 					///////////////
	        		
	        		
	        		
	        		
	        		
	        		
	 					ArrayList feedbackHLSDList =new ArrayList();
	        		
	 					Statement stMaxF=conn.createStatement();
	 					String queryMaxF ="select * from feedback where ProjectID="+id;
	 					
	 					ArrayList feedbackList =new ArrayList();
	 					ResultSet  rsMaxF = stMaxF.executeQuery(queryMaxF);
	 					
	 					HashMap c1=null;
	 					while(rsMaxF.next())
	 					{
	 						c1=new HashMap();
	 					c1.put("commentID",rsMaxF.getString(1));
	 					c1.put("commen",rsMaxF.getString(2));
	 					c1.put("hlsds",rsMaxF.getString(3));
	 					c1.put("commentby",rsMaxF.getString(4));
	 					c1.put("notes",rsMaxF.getString(5));
	 					c1.put("projectID",rsMaxF.getString(6));
	 					if(rsMaxF.getString(7)!=null && rsMaxF.getString(7).equalsIgnoreCase("Assessment Review"))
	 					{
	 					feedbackList.add(c1);
	 					}else {
	 						feedbackHLSDList.add(c1);
	 					}
	 				
	 					}
	 					
	 					
	 					projectDescription.put("feedbackList", feedbackList); 
	        		
	 					projectDescription.put("feedbackHLSDList", feedbackHLSDList);
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	        		
	                
	                
	                
	                
	                
				
	                HttpSession session = request.getSession(false);
	              //save message in session
	             // session.setAttribute("helloWorld", "Hello world");
				
				

	                session.setAttribute("projectDescription",projectDescription); //$NON-NLS-1$
			
				
                String nextJSP = "/Veritas/projectDetails/"; //$NON-NLS-1$
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
				//dispatcher.forward(request,response);
				conn.close();
				System.out.println("Disconnected from database"); //$NON-NLS-1$
				response.sendRedirect(nextJSP);
			
			} catch (Exception e) {
			e.printStackTrace();
			}
  }
}
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

public class AddProjectStatus extends HttpServlet{ 
 
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
			
			
			
			
			int projectID = Integer.parseInt(request.getParameter("projectID").toString());

			int featureID = Integer.parseInt(request.getParameter("featureID").toString());
			String FLD_Design = "";
			String FLD_Dev = "";
			String FLD_Loc ="";
			String Swagger_Loc ="";
			String SD_Loc ="";
			String num_epic ="";
			String ac_design ="";
			String ac_dev ="";
			String ac_test = "";
			String ac_dep = "";
			String logging="";
			String securityauth ="";
			String telemetry ="";
			String fo ="";
			String op ="";
			String data_mov_init = "";
			String data_mov_in = "";
			String data_mov_recon="";
			String targetDate = "";
			String notes="";
			if(request.getParameter("targetDate") !=null )
			{
			
				targetDate = request.getParameter("targetDate").toString();
			}
			if(request.getParameter("notes") !=null )
			{
			
				notes = request.getParameter("notes").toString();
			 }
			
			if(request.getParameter("FLD_Design") !=null )
			{
			
			 FLD_Design = request.getParameter("FLD_Design").toString();
			}
			if(request.getParameter("FLD_Dev") !=null )
			{
			
			 FLD_Dev = request.getParameter("FLD_Dev").toString();
			 }
			if(request.getParameter("FLD_Loc") !=null )
			{
			
			FLD_Loc =request.getParameter("FLD_Loc").toString();
			}
			if(request.getParameter("Swagger_Loc") !=null )
			{
			
			Swagger_Loc =request.getParameter("Swagger_Loc").toString();
			}
			if(request.getParameter("SD_Loc") !=null )
			{
			
			SD_Loc =request.getParameter("SD_Loc").toString();
			}
			if(request.getParameter("num_epic") !=null )
			{
			
			num_epic =request.getParameter("num_epic").toString();
			}
			if(request.getParameter("ac_design") !=null )
			{
			
			ac_design =request.getParameter("ac_design").toString();
			}
			if(request.getParameter("ac_dev") !=null )
			{
			
			ac_dev =request.getParameter("ac_dev").toString();
			}
			if(request.getParameter("ac_test") !=null )
			{
			
			ac_test = request.getParameter("ac_test").toString();
			}
			if(request.getParameter("ac_dep") !=null )
			{
			
			ac_dep = request.getParameter("ac_dep").toString();
			}
			if(request.getParameter("logging") !=null )
			{
			
			logging=request.getParameter("logging").toString();
			}
			
			if(request.getParameter("securityauth") !=null )
			{
			
			 securityauth =request.getParameter("securityauth").toString();
			 }
			if(request.getParameter("telemetry") !=null )
			{
			
			telemetry =request.getParameter("telemetry").toString();
			}
			if(request.getParameter("fo") !=null )
			{
			
			fo =request.getParameter("fo").toString();}
			if(request.getParameter("op") !=null )
			{
			
			op =request.getParameter("op").toString();}
			if(request.getParameter("ac_test") !=null )
			{
			
			data_mov_init = request.getParameter("ac_test").toString();}
			if(request.getParameter("ac_dep") !=null )
			{
			
			data_mov_in = request.getParameter("ac_dep").toString();
			}
			if(request.getParameter("data_mov_recon") !=null )
			{
			
			data_mov_recon=request.getParameter("data_mov_recon").toString();
			}
			
			
			String ReviewDate="";
			if(request.getParameter("action") !=null && request.getParameter("action").toString().equalsIgnoreCase("update"))
			{
			// ReviewDate = request.getParameter("ExecutiveSummary").toString();
			
			}
			
		
			String DIT_check=request.getParameter("DIT_check");
			String QAT_check=request.getParameter("QAT_check");
			String prd_check=request.getParameter("prd_check");
			String network_check=request.getParameter("network_check");
			String SD=request.getParameter("SD");
			String security_check="false";
			String Test_check="false";
			
			String featureinAC=request.getParameter("featureinAC");
			String HLSD_Baslined=request.getParameter("HLSD_Baslined");
			String FLD_Complete=request.getParameter("FLD_Complete");
			String Swagger=request.getParameter("Swagger");
			String Test_data_check=request.getParameter("Test_data_check");
			String edp_check=request.getParameter("edp_check");
			String feature_toggele_check=request.getParameter("feature_toggele_check");
			String data_mov_check=request.getParameter("data_mov_check");
			
		
			if(request.getParameter("security_check")!=null)
			{
				
				security_check="true";
			}
			if(request.getParameter("Test_check")!=null)
			{
				
				featureinAC="true";
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
					
					/*int reviewID=0;
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
				 */
			 
			        
			        query5="UPDATE projectmanagementservice.feature_status " + 
			        		" SET " + 
			        		" ProjectID = "+projectID+"," + 
			        		"FeatureID = "+featureID+"," + 
			        		"FLD_Design = '"+FLD_Design+"'," + 
			        		"FLD_Dev = '"+FLD_Dev+"'," + 
			        		"FLD_Loc = '"+FLD_Loc+"'," + 
			        		"SD_Loc = '"+SD_Loc+"'," + 
			        		"num_epic = '"+num_epic+"'," + 
			        		"AC_Design = '"+ac_design+"'," + 
			        		"AC_Dev = '"+ac_dev+"'," + 
			        		"AC_Test = '"+ac_test+"'," + 
			        		"AC_Dep = '"+ac_dep+"'," + 
			        		"Logging = '"+logging+"'," + 
			        		 "Telemetry = '"+telemetry+"'," + 
			        		"FO = '"+fo+"'," + 
			        		"OP = '"+op+"'," + 
			        		"Data_Mov_Init = '"+data_mov_init+"'," + 
			        		"Data_Mov_In = '"+data_mov_in+"'," + 
			        		"Data_Mov_Recon = '"+data_mov_recon+"'," + 
			        		"DIT_Check = '"+DIT_check+"'," + 
			        		"QAT_Check = '"+QAT_check+"'," + 
			        		"PRD_Check = '"+prd_check+"'," + 
			        		"Network_Check = '"+network_check+"'," + 
			        		"SD = '"+SD+"'," + 
			        		"Security_Check = '"+security_check+"'," + 
			        		"Test_Check = '"+Test_check+"'," + 
			        		"FeatureInAC = '"+featureinAC+"'," + 
			        		"HLSD_Baslined = '"+HLSD_Baslined+"'," + 
			        		"FLD_Complete = '"+FLD_Complete+"'," + 
			        		"Swagger = '"+Swagger+"'," + 
			        		"Test_Data_Check = '"+Test_data_check+"'," + 
			        		"EDP_Check = '"+edp_check+"'," + 
			        		"feature_toggele_check = '"+feature_toggele_check+"'," + 
			        		"Data_Mov_Check = '"+data_mov_check+"'," + 
			
			        		"Swagger_Loc = '"+Swagger_Loc+"'," + 
			        		"securityauth =  '"+securityauth+"'," + 
			        		"targetDate = '"+targetDate+"'," + 
			        		"notes = '"+notes+"'" + 
			        		"WHERE ProjectID =  "+projectID+" AND FeatureID = "+featureID+"";
						
				
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
					
					
					//`Create_DTM` DATETIME NOT NULL,
					//  `Create_By` VARCHAR(10) NULL,
					 // `Update_DTM` DATETIME NULL,
					//  `Update_By` VARCHAR(10) NULL,
					
					 query5="INSERT INTO projectmanagementservice.Feature_Status (projectID,FeatureID,FLD_Design,FLD_Dev,FLD_Loc,Swagger_Loc,SD_Loc,num_epic,ac_design,ac_dev,ac_test,ac_dep,logging,securityauth,telemetry,fo,op,data_mov_init,data_mov_in,data_mov_recon,DIT_check,QAT_check,prd_check,network_check,SD,security_check,Test_check"
					 		+ ",featureinAC,HLSD_Baslined,FLD_Complete,Swagger,Test_data_check,edp_check,feature_toggele_check,data_mov_check,targetDate,notes) VALUES ("+projectID+","+featureID+",'"+FLD_Design+"','"+FLD_Dev+"','"+FLD_Loc+"','"+Swagger_Loc+"','"+SD_Loc+"','"+num_epic+"','"+ac_design+"','"+ac_dev+"','"+ac_test+"','"+ac_dep+"','"+logging+"','"+securityauth+"','"+telemetry+"','"+fo+"','"+op+"','"+data_mov_init+"','"+data_mov_in+"','"+data_mov_recon+"','"+DIT_check+"','"+QAT_check+"','"+prd_check+"','"+network_check+"','"+SD+"','"+security_check+"','"+Test_check+"','"+featureinAC+"','"+HLSD_Baslined+"','"+FLD_Complete+"','"+Swagger+"','"+Test_data_check+"','"+edp_check+"','"+feature_toggele_check+"','"+data_mov_check+"','"+targetDate+"','"+notes+"')";
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
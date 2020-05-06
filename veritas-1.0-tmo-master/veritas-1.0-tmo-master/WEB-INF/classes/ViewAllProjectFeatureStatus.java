import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class ViewAllProjectFeatureStatus extends HttpServlet{ 
 
   public void doGet(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			  String nextJSP = "/index.jsp";
			System.out.println("MySQL Connect Example.");
			Connection conn = null;
			String url = Messages.getString("connectionURL"); 
			String dbName = Messages.getString("database"); 
			String driver = Messages.getString("dbDriver"); 
			String userName = Messages.getString("dbuser");  
			String password = Messages.getString("dbPassword");
			System.out.println("request.getHeader(Referer);>>>>>>>>>>>"+request.getHeader("Referer"));
			if(!(request.getHeader("Referer")!=null && request.getHeader("Referer").contains("ttallur1:7001")))
			{
				 request.setAttribute("message","Not Valid User");
					
	                 nextJSP = "/index.jsp";
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
					//dispatcher.forward(request,response);
			}
//request.getHeader("Referer");
			System.out.println("Connected to the databas1>>>>>>>>>>>e"+url+dbName);
			Statement st;
			try {
				Class.forName(driver).newInstance();
				
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				
				ArrayList al=null;
				ArrayList userList =new ArrayList();
				ArrayList projectList =new ArrayList();
				
					 projectList=getProjectDetails(conn);
					 //request.setAttribute("userList",userList);
					 System.out.println("<>>>>>>>>c>>>>>>>"+projectList);
					 request.setAttribute("ProjectFeatureStatus", projectList);
					 System.out.println("<>>>>>>>>>>>>>>>"+2);
					 request.setAttribute("message","");
					 System.out.println("<>>>>>>>>>>>>>>>"+3);
		                 nextJSP = "/ProjectFeatureStatusUI/";
		                System.out.println("<>>>>>>>>>>>>>>>"+4);
						 conn.close();
							System.out.println("Disconnected from database");
				
						
				
				
					getServletContext().getRequestDispatcher(nextJSP).forward(request,response);
					
					
					return ;  
				

			} catch (Exception e) {
				 System.out.println("<>>>>>>>>>>>>>>>"+7);
			e.printStackTrace();
			System.out.println(e);
			}
  }

private ArrayList getProjectDetails(Connection conn) {
	ArrayList projects=new ArrayList();
	// TODO Auto-generated method stub
	try{
	String query = "select * from project order by ProjectTitle";
	
	query="SELECT a.ProjectID," + 
			"b.ProjectTitle," + 
			"b.ProjectNumber," + 
			"    a.targetDate," + 
			"    a.FeatureID," + 
			"    c.FeatureCode," + 
			"    c.FeatureTitle," + 
			"    a.FeatureInAC," + 
			"    a.FLD_Design," + 
			"    a.FLD_Dev," + 
			"    a.FLD_Complete," + 
			"    a.FLD_Loc," + 
			"    a.HLSD_Baslined," + 
			"    a.Swagger," + 
			"    a.Swagger_Loc," + 
			"    a.SD," + 
			"    a.SD_Loc," + 
			"    a.Security_Check," + 
			"    a.Test_Check," + 
			"    a.DIT_Check," + 
			"    a.QAT_Check," + 
			"    a.PRD_Check," + 
			"    a.Network_Check," + 
			"    a.Test_Data_Check," + 
			"    a.num_epic," + 
			"    a.EDP_Check," + 
			"    a.AC_Design," + 
			"    a.AC_Dev," + 
			"    a.AC_Test," + 
			"    a.AC_Dep," + 
			"    a.feature_toggele_check," + 
			"    a.Logging," + 
			"    a.securityauth," + 
			"    a.Telemetry," + 
			"    a.FO," + 
			"    a.OP," + 
			"    a.Data_Mov_Check," + 
			"    a.Data_Mov_Init," + 
			"    a.Data_Mov_In," + 
			"    a.Data_Mov_Recon," + 
			"    a.notes," + 
				"    a.Create_DTM," + 
			"    a.Create_By," + 
			"    a.Update_DTM," + 
			"    a.Update_By" + 
			
		
		
			
			" FROM projectmanagementservice.feature_status a join projectmanagementservice.project b on a.projectID=b.projectID join projectmanagementservice.feature c on a.featureid=c.featureID;";
	System.out.println("query " + query);
	Statement st1 = conn.createStatement();
	ResultSet  rs = st1.executeQuery(query);
	
	ArrayList p1=new ArrayList();
	int count=0;
	while(rs.next())
	{
		
				
		p1  = new ArrayList();
		
	 	  p1.add(rs.getString(1));
	 	  p1.add(rs.getString(2));
		  p1.add(rs.getString(3));
		  p1.add(rs.getString(4));
		  p1.add(rs.getString(5)); 
		  p1.add(rs.getString(6));
		  p1.add(rs.getString(7)); 
		  p1.add(rs.getString(8));
		  p1.add(rs.getString(9)); 
		  p1.add(rs.getString(10));
		  p1.add(rs.getString(11));
		  p1.add(rs.getString(12));
		  p1.add(rs.getString(13));
		  p1.add(rs.getString(14));
		  p1.add(rs.getString(15));
		  p1.add(rs.getString(16));
		  p1.add(rs.getString(17));
		  p1.add(rs.getString(18)); 
		  p1.add(rs.getString(19));
		  p1.add(rs.getString(20)); 
		  p1.add(rs.getString(21));
		  p1.add(rs.getString(22)); 
		  p1.add(rs.getString(23));
		  p1.add(rs.getString(24));
		  p1.add(rs.getString(25));
		  p1.add(rs.getString(26));
		  p1.add(rs.getString(27));
		  p1.add(rs.getString(28));
		  p1.add(rs.getString(29));
		  p1.add(rs.getString(30));
		  p1.add(rs.getString(31)); 
		  p1.add(rs.getString(32));
		  p1.add(rs.getString(33));
		  p1.add(rs.getString(34));
		  p1.add(rs.getString(35)); 
		  p1.add(rs.getString(36));						
		  p1.add(rs.getString(37));
		  p1.add(rs.getString(38));
		  p1.add(rs.getString(39));
		  p1.add(rs.getString(40)); 
		  p1.add(rs.getString(41));
		  p1.add(rs.getString(42));
		  p1.add(rs.getString(43));
		  p1.add(rs.getString(44));
		  p1.add(rs.getString(45));
		  
		  projects.add(p1);
		
	}
	
	
	}
	catch(Exception e)
	{System.out.println(e);}
	
	return projects;
}



}
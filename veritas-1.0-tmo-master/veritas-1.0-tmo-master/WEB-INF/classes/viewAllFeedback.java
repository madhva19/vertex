
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class viewAllFeedback extends HttpServlet{ 
 
   @SuppressWarnings("unchecked")
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
		
		System.out.println("Connected to the databas1>>>>>>>>>>>e"+url+dbName);
		Statement st;
		try {
			Class.forName(driver).newInstance();
			
			conn = DriverManager.getConnection(url+dbName,userName,password);
			System.out.println("Connected to the database");
			
			ArrayList al=null;
			ArrayList userList =new ArrayList();
			ArrayList projectList =new ArrayList();
			int projectcount=0;
			int ActionItemcount=0;
			String countStatus=" select ReviewStatus,count(*) from projectmanagementservice.hlsd  where reviewstype ='Assessment Review' group by ReviewStatus";
			
			Statement st4 = conn.createStatement();
			ResultSet  rs4 = st4.executeQuery(countStatus);
			Map<Object,Object> map = null;
			List<Map<Object,Object>> assessmentStatus = new ArrayList<Map<Object,Object>>();
			while(rs4.next())
			{
				map = new HashMap<Object,Object>();
				 
					 map.put("label", rs4.getString(1));
					  
						
				
				map.put("y",Integer.parseInt(rs4.getString(2)));
				projectcount=projectcount+Integer.parseInt(rs4.getString(2));
				assessmentStatus.add(map);
			}
			
			
String countStatus1=" select impact,count(*) from projectmanagementservice.feedback where reviewstype ='Assessment Review' group by impact";
			
			Statement st5 = conn.createStatement();
			ResultSet  rs5 = st5.executeQuery(countStatus1);
			Map<Object,Object> map1 = null;
			List<Map<Object,Object>> AssessmentReview = new ArrayList<Map<Object,Object>>();
	
			while(rs5.next())
			{
				map1 = new HashMap<Object,Object>();
				 if(rs5.getString(1)!=null && !rs5.getString(1).equalsIgnoreCase("")&& !rs5.getString(1).equalsIgnoreCase("null"))
				 {
					 map1.put("label", rs5.getString(1)+" "+rs5.getString(2));
				 }else {
					 if(rs5.getString(1)!=null && rs5.getString(1).equalsIgnoreCase(""))
					 {
						 map1.put("label", "Blank "+rs5.getString(2));
					 }else {
						 map1.put("label", "Old Data "+rs5.getString(2));
					 }
				 }
					map1.put("y",Integer.parseInt(rs5.getString(2)));
					ActionItemcount=ActionItemcount+Integer.parseInt(rs5.getString(2));
					AssessmentReview.add(map1);
			}
			
			
				 projectList=getAllHLSD(conn);
				 //request.setAttribute("userList",userList);
				 request.setAttribute("ActionItemcount", ActionItemcount);
				 request.setAttribute("projectcount", projectcount);
				 System.out.println("<>>>>>>>>c>>>>>>>"+projectList);
				 request.setAttribute("hlsdStatus", assessmentStatus);
				 request.setAttribute("AssesmentStatus", AssessmentReview);
				 request.setAttribute("hlsdList", projectList);
				 System.out.println("<>>>>>>>>>>>>>>>"+2);
				 request.setAttribute("message","");
				 System.out.println("<>>>>>>>>>>>>>>>"+3);
	                 nextJSP = "/allfeedbackUI/";
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

private ArrayList getAllHLSD(Connection conn) {
ArrayList projects=new ArrayList();
// TODO Auto-generated method stub
try{
	
	HashMap project=new HashMap();
	String query7 ="select projectID,ProjectTitle from projectmanagementservice.project";	
	System.out.println("query7 " + query7);
	Statement st = conn.createStatement();
	ResultSet  rs1 = st.executeQuery(query7);
	while(rs1.next())
	{
		project.put(rs1.getString(1), rs1.getString(2));
		
	}
	
	
	
	
	
	
	
	
	
	
String query = "select a.reviewstype,a.projectid,b.ProjectNumber,b.ProjectTitle,a.comment,a.priority,a.notes from projectmanagementservice.feedback a join projectmanagementservice.project b on a.projectid=b.projectid";
System.out.println("query " + query);
Statement st1 = conn.createStatement();
ResultSet  rs = st1.executeQuery(query);

ArrayList p1=new ArrayList();





while(rs.next())
{
	if(rs.getString(1)!=null && rs.getString(1).trim().equalsIgnoreCase("Assessment Review"))
	{
	p1  = new ArrayList();
	
	 
	  p1.add(rs.getString(2));
	  p1.add(rs.getString(3));
	
	  p1.add(rs.getString(4));
	  p1.add(rs.getString(5));

	  p1.add(rs.getString(6));
	  p1.add(rs.getString(7));
	
	
	 
	  projects.add(p1);
}
}

}catch(Exception e)
{System.out.println(e);}

return projects;
}

				
			

			
					
}
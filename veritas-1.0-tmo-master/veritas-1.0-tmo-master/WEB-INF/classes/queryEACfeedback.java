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

public class queryEACfeedback extends HttpServlet{ 
 
	 public void doGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException,IOException{
response.setContentType("text/html");
PrintWriter out = response.getWriter();
String str[] = request.getRequestURI().toString().split("/");

int ProjectID = Integer.parseInt(str[3]);


			System.out.println("MySQL Connect Example.");
			Connection conn = null;
String url = Messages.getString("connectionURL"); 
			String dbName = Messages.getString("database"); 
			String driver = Messages.getString("dbDriver"); 
			String userName = Messages.getString("dbuser");  
			String password = Messages.getString("dbPassword");
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDate localDate = LocalDate.now();
			
			
		

			
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				int id=0;
				ArrayList al=null;
				ArrayList feedbackList =new ArrayList();
				ArrayList feedbackHLSDList =new ArrayList();
				
				HashMap project=null;
				
				
			
				String query2 = "select * from project where ProjectID="+ProjectID;
			
				
				
				
				
		
				

                System.out.println(query2);
            	Statement st2=conn.createStatement();
                st2 = conn.createStatement();
				ResultSet  rs2 = st2.executeQuery(query2);
				while(rs2.next())
				{
				  		project	=new  HashMap();
				 		project.put("ProjectID",rs2.getString(1));
				 		project.put("ProjectNumber",rs2.getString(2));
				 		project.put("ProjectTitle",rs2.getString(3));
				 		project.put("ProjectDescription",rs2.getString(4));
				 		project.put("Workstream",rs2.getString(9));
				  	  		
				 		 
				
				}
               
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				int maxFID=0;
				
				Statement stMaxF=conn.createStatement();
				String queryMaxF ="select * from feedback where ProjectID="+ProjectID;
				
			
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
				c1.put("ReviewsType",rsMaxF.getString(7));
				c1.put("potentialImpact",rsMaxF.getString(9));
				if(rsMaxF.getString(8)!=null)
				{
					if( rsMaxF.getString(8).trim().equalsIgnoreCase("null"))
					{
						c1.put("priority", "Medium");
					}else {
				c1.put("priority", rsMaxF.getString(8));
				}
					
					
				}else {
					c1.put("priority", "Medium");	
					}
				if(rsMaxF.getString(7)!=null && rsMaxF.getString(7).equalsIgnoreCase("Assessment Review"))
				{
				feedbackList.add(c1);
				}else {
					feedbackHLSDList.add(c1);
				}
				}
				
				

				
				
				
					
				request.setAttribute("feedbackHLSDList", feedbackHLSDList);
					request.setAttribute("feedbacklist", feedbackList);
					request.setAttribute("project", project);
					 System.out.println("<>>>>>>>>>>>>>>>"+2);
					 request.setAttribute("message","");
					 System.out.println("<>>>>>>>>>>>>>>>"+3);
		                String nextJSP = "/eacfeedbackUI/";
		                System.out.println("<>>>>>>>>>>>>>>>"+4);
						 conn.close();
							System.out.println("Disconnected from database");
				
						
				
				
					getServletContext().getRequestDispatcher(nextJSP).forward(request,response);
					
				
				
				
				
				
			
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}
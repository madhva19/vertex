
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class viewAllCR extends HttpServlet{ 
 
   @SuppressWarnings("unchecked")
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

		//	out.println(request.getRequestURI());
			Statement st,st1,st2,st3,st4,st5,st6,st7,st8;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				HashMap project=new HashMap();
				String query7 ="select projectID,ProjectTitle from projectmanagementservice.project";	
				System.out.println("query7 " + query7);
				st = conn.createStatement();
				ResultSet  rs = st.executeQuery(query7);
				while(rs.next())
				{
					project.put(rs.getString(1), rs.getString(2));
					
				}
				
				
				
				  
				  
							
				
				
				
				
			
						   String query8="select * from projectmanagementservice.projectcrdetails  order by projectID desc";
  
						   st8=conn.createStatement();
						   ResultSet rs8=st8.executeQuery(query8);
						   ArrayList tD=null;
						    ArrayList techDebt=new ArrayList();
						   
								   while(rs8.next())
									{
									   tD=new  ArrayList();	
									   tD.add(rs8.getString(2));
									   tD.add(project.get(rs8.getString(2)));
									   tD.add(rs8.getString(1));
									   tD.add(rs8.getString(3));
									   tD.add(rs8.getString(4));
									   tD.add(rs8.getString(5));
									   tD.add(rs8.getString(6));
									   tD.add(rs8.getString(7));
									   tD.add(rs8.getString(8));
									   tD.add(rs8.getString(9));
									   tD.add(rs8.getString(10));
									   tD.add(rs8.getString(11));
									   techDebt.add(tD);
										}
								  
				   
			
	                
	                
	                
	                
	                
				
	                HttpSession session = request.getSession(false);
	              //save message in session
	             // session.setAttribute("helloWorld", "Hello world");
				
				

	                session.setAttribute("techDebt",techDebt);
			
				
                String nextJSP = "/Veritas/viewAllCRUI/";
				conn.close();
				System.out.println("Disconnected from database");
				response.sendRedirect(nextJSP);
			
			} catch (Exception e) {
			e.printStackTrace();
			}
  }
}
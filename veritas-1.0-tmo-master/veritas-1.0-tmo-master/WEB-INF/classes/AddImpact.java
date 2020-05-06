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

public class AddImpact extends HttpServlet{ 
 
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
			String action=null;
			if(request.getParameter("action")!=null)
			{
				action=request.getParameter("action").toString();
			}

			String Impact = request.getParameter("Impact").toString();
			String TShirtSize = request.getParameter("TShirtSize").toString();
			int componentID = Integer.parseInt(request.getParameter("componentID").toString());
			int ProjectID = Integer.parseInt(request.getParameter("ProjectID").toString());
			
			String ImpactType = request.getParameter("ImpactType").toString();
			String ImpactDetails = request.getParameter("ImpactDetails").toString();
			

			
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				int id=0;
				ArrayList al=null;
				ArrayList userList =new ArrayList();
				Statement st=conn.createStatement();
				
				String query="INSERT INTO projectmanagementservice.feature_component (ProjectID,ComponentID,Impact,TShirt_Size,ImpactType,ImpactDetails)VALUES("+ProjectID+","+componentID+","+Impact+",'"+TShirtSize+"','"+ImpactType+"','"+ImpactDetails+"')";
				if(action!=null)
				{
					query = "UPDATE feature_component SET ProjectID =" +ProjectID+",ComponentID ="+componentID+",Impact ="+Impact+",TShirt_Size ='"+TShirtSize+"',ImpactType ='"+ImpactType+"' ,ImpactDetails ='"+ImpactDetails+"'  WHERE ProjectID ="+ProjectID+" AND ComponentID = "+componentID;

				}
								System.out.println(query);
					stmt = conn.createStatement();
					int i = stmt.executeUpdate(query);
				
				
				
				
				if(i>0)
				{ 
					request.setAttribute("pageer", "addp");
					System.out.println("mmmmmmmmmmmmmmmmmmm"+request.getAttribute("pageer"));
					conn.close();
					response.sendRedirect("addComponentforProject/"+ProjectID);
					
				}
				
				
				
				
				
				
				
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}
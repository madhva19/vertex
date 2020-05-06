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

public class AddDependency extends HttpServlet{ 
 
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

			
			int componentID = Integer.parseInt(request.getParameter("DependentProjectID").toString());
			int ProjectID = Integer.parseInt(request.getParameter("ProjectID").toString());

			String nature = "";
			String strategies =""; 
			
			
				if (request.getParameter("Nature")!=null)
				{
					nature=request.getParameter("Nature").toString();
				}
				
			if (request.getParameter("Strategies")!=null)
			{
				strategies=request.getParameter("Strategies").toString();
			}	

			
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				int id=0;
				ArrayList al=null;
				ArrayList userList =new ArrayList();
				
				
				int maxFID=0;
				
				Statement stMaxF=conn.createStatement();
				String queryMaxF ="select max(dependencyID) from project_dependency";
				
				
				ResultSet  rsMaxF = stMaxF.executeQuery(queryMaxF);
				
				while(rsMaxF.next())
				{
					maxFID=rsMaxF.getInt(1);
					maxFID++;
				}
				
				
				
				
				
				Statement st=conn.createStatement();
			
				String query="INSERT INTO projectmanagementservice.project_dependency (ProjectID,DependentProjectID,NatureOfDependency,MitigationStrategies,DependencyID)VALUES("+ProjectID+","+componentID+",'"+nature+"','"+strategies+"',"+maxFID+")";
				if(action!=null)
				{
					query = "UPDATE projectmanagementservice.project_dependency SET NatureOfDependency ='" +nature+"',MitigationStrategies ='"+strategies+"'  WHERE ProjectID ="+ProjectID+" AND DependentProjectID = "+componentID;

				}
								System.out.println(query);
					stmt = conn.createStatement();
					int i = stmt.executeUpdate(query);
				
				
				
				
				if(i>0)
				{ 
					request.setAttribute("pageer", "addp");
					System.out.println("mmmmmmmmmmmmmmmmmmm"+request.getAttribute("pageer"));
					conn.close();
					response.sendRedirect("addDependencyforProject/"+ProjectID);
					
				}
				
				
				
				
				
				
				
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}
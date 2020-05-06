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

public class AddEACFeedback extends HttpServlet{ 
 
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
			int commentID=0;
			if(request.getParameter("action")!=null)
			{
				action=request.getParameter("action").toString();
				commentID=Integer.parseInt(request.getParameter("commentID").toString());
				
			}

		
			
			
			int ProjectID = Integer.parseInt(request.getParameter("ProjectID").toString());

			String ReviewsType="Assessment Review";
			String comment = "";
			String commentby =""; 
			String hlsds = "";
			String notes =""; 
			String potentialImpactTextarea="";
			String priority="Medium";
			if (request.getParameter("priority")!=null)
			{
				priority=request.getParameter("priority").toString();
			}
			
			if(request.getParameter("potential-impact")!=null)
			{
				potentialImpactTextarea=request.getParameter("potential-impact").toString();
			}
			
				if (request.getParameter("comment")!=null)
				{
					comment=request.getParameter("comment").toString();
				}
				
			if (request.getParameter("commentby")!=null)
			{
				commentby=request.getParameter("commentby").toString();
			}	
			
			if (request.getParameter("hlsds")!=null)
			{
				hlsds=request.getParameter("hlsds").toString();
			}
			
		if (request.getParameter("notes")!=null)
		{
			notes=request.getParameter("notes").toString();
		}	
		if(request.getParameter("ReviewsType")!=null)
		{
			ReviewsType = request.getParameter("ReviewsType").toString();
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
				String queryMaxF ="select max(commentID) from feedback";
				
				
				ResultSet  rsMaxF = stMaxF.executeQuery(queryMaxF);
				
				while(rsMaxF.next())
				{
					maxFID=rsMaxF.getInt(1);
					maxFID++;
				}
				
				


				
				
				Statement st=conn.createStatement();
			
				String query="INSERT INTO projectmanagementservice.feedback (commentID,comment,HLSDSection,commentby,notes,projectid,ReviewsType,priority,impact)VALUES("+maxFID+",'"+comment+"','"+hlsds+"','"+commentby+"','"+notes+"',"+ProjectID+",'"+ReviewsType+"','"+priority+"','"+potentialImpactTextarea+"')";
				if(action!=null)
				{
					query = "UPDATE projectmanagementservice.feedback SET comment ='" +comment+"',HLSDSection ='"+hlsds+"',commentby ='"+commentby+"',notes ='"+notes+"',ReviewsType='"+ReviewsType+"',priority='"+priority+"',impact='"+potentialImpactTextarea+"'  WHERE ProjectID ="+ProjectID+" AND commentID = "+commentID;

				}
								System.out.println(query);
					stmt = conn.createStatement();
					int i = stmt.executeUpdate(query);
				
				
				
				
				if(i>0)
				{ 
					request.setAttribute("pageer", "addp");
					System.out.println("mmmmmmmmmmmmmmmmmmm"+request.getAttribute("pageer"));
					conn.close();
					response.sendRedirect("queryEACfeedback/"+ProjectID);
					
				}
				
				
				
				
				
				
				
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}
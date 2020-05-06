import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.Map.Entry;

public class AddComponent extends HttpServlet{ 
 
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
			
						
			//String ComponentID = request.getParameter("ComponentID").toString();
			String ComponentName = request.getParameter("ComponentName").toString();
			String ComponentType = request.getParameter("ComponentType").toString();
			String ComponentOwner = request.getParameter("ComponentOwner").toString();
		
			Statement stmt;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				int id=0;
				ArrayList al=null;
				ArrayList userList =new ArrayList();
				Statement st=conn.createStatement();
				
				String query1 ="select max(ComponentID) from component";
				
				
				ResultSet  rs1 = st.executeQuery(query1);
				while(rs1.next())
				{
					id=rs1.getInt(1);
					id++;
				}
				
			
				//	INSERT INTO projectmanagementservice.component(ComponentID,ComponentName,ComponentType,ComponentOwner)
				
				String query="INSERT INTO projectmanagementservice.component (ComponentID,ComponentName,ComponentType,ComponentOwner) VALUES("+id+",'"+ComponentName+"','"+ComponentType+"','"+ComponentOwner+"')";
				System.out.println(query);
				stmt = conn.createStatement();
				int i = stmt.executeUpdate(query);
		
			
				
				if(i>0)
				{ 
					request.setAttribute("pageer", "addp");
					System.out.println("mmmmmmmmmmmmmmmmmmm"+request.getAttribute("pageer"));
					response.sendRedirect("ViewAllComponent");
						conn.close();
				}
				
				
				
				
				
				
				
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
	  }
}
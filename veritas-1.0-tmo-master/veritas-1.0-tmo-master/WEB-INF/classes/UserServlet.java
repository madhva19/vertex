import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class UserServlet extends HttpServlet{ 
 
   public void doGet(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String str[] = request.getRequestURI().toString().split("/");

         int id = Integer.parseInt(str[3]);
			System.out.println("MySQL Connect Example.");
			Connection conn = null;
			String url = Messages.getString("connectionURL"); 
			String dbName = Messages.getString("database"); 
			String driver = Messages.getString("dbDriver"); 
			String userName = Messages.getString("dbuser");  
			String password = Messages.getString("dbPassword");

		//	out.println(request.getRequestURI());
			Statement st,st1,st2;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				
				
				ArrayList userList=null;
				String query = "select * from projectmaster a where ProjectId="+id;
				String query1 = "select * from projectcontact a where ProjectId="+id;
				String query2 = "select * from projectwrokdetails a where ProjectID="+id;
				System.out.println("query " + query);
				st = conn.createStatement();
				ResultSet  rs = st.executeQuery(query);
				st1 = conn.createStatement();
				ResultSet  rs1 = st1.executeQuery(query1);
				st2 = conn.createStatement();
				ResultSet  rs2 = st2.executeQuery(query2);

				while(rs.next())
				{
				  
				  userList =new ArrayList();
				  userList.add(rs.getString(1));
				  userList.add(rs.getString(2));
				  userList.add(rs.getString(3));
				  userList.add(rs.getString(4));
				  userList.add(rs.getString(5));
				  userList.add(rs.getString(6));
				
				}
				
				while(rs1.next())
				{
				  
				  
				  
				  userList.add(rs1.getString(2));
				  userList.add(rs1.getString(3));
				  userList.add(rs1.getString(4));
				  userList.add(rs1.getString(5));
				  userList.add(rs1.getString(6));
				  userList.add(rs1.getString(7));
				  userList.add(rs1.getString(8));
				  userList.add(rs1.getString(9));
				 
				
				}
				while(rs2.next())
				{
				  			
				
				  userList.add(rs2.getString(2));
				  userList.add(rs2.getString(3));
				 
				
				}
				
				
				
				
				
				
				
				

				request.setAttribute("userList",userList);
				
                String nextJSP = "/editUser.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
				dispatcher.forward(request,response);
				conn.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
			e.printStackTrace();
			}
  }
}

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
// import javax.sql.*;
import java.sql.*;
import java.util.*;

public class addFeatureforProject extends HttpServlet{ 
 
   public void doGet(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException,IOException{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String str[] = request.getRequestURI().toString().split("/");

         int featureid = Integer.parseInt(str[3]);
			System.out.println("MySQL Connect Example.");
			Connection conn = null;
String url = Messages.getString("connectionURL"); 
			String dbName = Messages.getString("database"); 
			String driver = Messages.getString("dbDriver"); 
			String userName = Messages.getString("dbuser");  
			String password = Messages.getString("dbPassword");
			ArrayList compExistingList= new ArrayList();

		//	out.println(request.getRequestURI());
			Statement st,st1,st2,st3,st4,st5,st6;
			try {
				Class.forName(driver).newInstance();
				conn = DriverManager.getConnection(url+dbName,userName,password);
				System.out.println("Connected to the database");
				
				
				HashMap projectDescription=null;
				HashMap feature=null;
				ArrayList featureList=new ArrayList();
				ArrayList featureListFinal=new ArrayList();
				HashMap leadership=null;
				ArrayList allcomponentList=new ArrayList();
				HashMap component=null;
				HashMap allcomponentMap=null;
				ArrayList componentList=new ArrayList();
				//String query = "select * from feature_component  where FeatureID="+featureid;
				String query2 = "select * from feature where projectID =0";
				//String query3 = "select * from component";
				
				
				
				
					
				//System.out.println("query " + query);
				//st = conn.createStatement();
				//ResultSet  rs = st.executeQuery(query);
				

                System.out.println(query2);
               
				ArrayList featureDetail=new ArrayList();
				
						
				st2 = conn.createStatement();
				ResultSet  rs2 = st2.executeQuery(query2);
				while(rs2.next())
				{
					featureDetail=new ArrayList();
					featureDetail.add(rs2.getString(1));
					featureDetail.add(rs2.getString(3));
					featureDetail.add(rs2.getString(4));
					featureDetail.add(rs2.getString(5));
				  	  		
					featureListFinal.add(featureDetail);	 
				
				}
				HttpSession session = request.getSession(false);
				 session.setAttribute("featureForAddFeatureForProject",featureListFinal);
			
			        
	                
	              //save message in session
	             // session.setAttribute("helloWorld", "Hello world");
				
				

	               
	             	
                String nextJSP = "/Veritas/addFeatureforProjectUI";
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
				//dispatcher.forward(request,response);
				conn.close();
				System.out.println("Disconnected from database");
				response.sendRedirect(nextJSP);
			
			} catch (Exception e) {
			e.printStackTrace();
			}
  }
}
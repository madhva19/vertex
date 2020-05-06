
<%@ page language="java" import="java.util.*;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
    <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
  
  <script language="javascript">

  function addNote(id){
	   
	    window.location.href="addNote/"+id; 
	  }
</script>
 </HEAD>

 <BODY>
 <br>
<table align="center">
  
</table>
<br>
  <table width="600px"  align="center" style="background-color:#EDF6EA;border:1px solid #000000;">
 <tr><td colspan='9'  align="center" height="10px"></td></tr>

    <tr><td colspan='9' align="center"><a href="addUser.jsp" style="font-weight:bold;color:#cc0000;">Add New Project</a></td></tr>
<tr><td colspan='9' align="center" height="10px"></td></tr>
  <tr style="background-color:#7BA88B;font-weight:bold;">
     <td>Project ID</td><td>Project Code</td><td>Project Description</td><td>Release Date</td>
	 <td>Project Health</td><td>SharePint Link</td><td>Add Note</td>
  </tr>
	<%
	String bgcolor="";
	int count=0;
	List viewList = new ArrayList();
	Iterator  viewItr;
	
	if(request.getAttribute("projectDescription")!=null && request.getAttribute("projectDescription")!="")
	{
		List userList =  (List)request.getAttribute("projectDescription");
		
		Iterator itr = userList.iterator();
		
		while(itr.hasNext())
		{
			
			if(count%2==0)
			{
			 bgcolor = "#C8E2D1";
			 %>
			 <tr style="background-color:<%=bgcolor%>;">
				<td><%=itr.next()%></td></tr>>
				
				<%
			}
			else
			{
				
				bgcolor = "#EAF8EF";
				%>
				<tr style="background-color:<%=bgcolor%>;">
				<td><%=itr.next()%></td></tr>
				
				<%
			}
			
			
			String id = viewList.get(0).toString();
			viewItr = viewList.iterator();
			%>
			<tr style="background-color:<%=bgcolor%>;">
			
								</tr>
			<%
		}
	}
	if(count==0)
	{
		%>
		<tr><td colspan="9" align="center">&nbsp;</td></tr>
            <tr><td colspan="9" align="center">No Record Avaliable</td></tr>
		<%
	}
	%>
	 <tr><td colspan='9' align="center" height="2px"></td></tr>
	<tr><td colspan='9' align="center" height="2px"> Notes</td></tr>
	 <tr><td colspan='9' align="center" height="2px"></td></tr>
	
	 <tr><td colspan='9' align="center" height="10px"></td></tr>

    <tr><td colspan='9' align="center"></td></tr>
<tr><td colspan='9' align="center" height="10px"></td></tr>
  <tr style="background-color:#7BA88B;font-weight:bold;">
    <td>Date</td><td>Note</td>
	
  </tr>
	<%
	
	 count=0;
	List viewList1 = new ArrayList();
	Iterator  viewItr1;
	
	if(request.getAttribute("notes")!=null && request.getAttribute("notes")!="")
	{
		List userList1 =  (ArrayList)request.getAttribute("notes");
		Iterator itr1 = userList1.iterator();
		
		while(itr1.hasNext())
		{
			
			if(count%2==0)
			{
			 bgcolor = "#C8E2D1";
			}
			else
			{
				
				bgcolor = "#EAF8EF";
			}
			
			viewList1 = (ArrayList)itr1.next();
			
			viewItr1 = viewList1.iterator();
			%>
			<tr style="background-color:<%=bgcolor%>;">
			<%	
			while(viewItr1.hasNext())
			{
			
				%>
				<td><%=viewItr1.next()%></td>
				
				<%
					
			}
			count++;
			%>
											</tr>
			<%
		}
	}
	if(count==0)
	{
		%>
		<tr><td colspan="9" align="center">&nbsp;</td></tr>
            <tr><td colspan="9" align="center">No Record Avaliable</td></tr>
		<%
	}
	%>
	
	
	
     <tr><td colspan='9' align="center" height="2px"></td></tr>
  </table>	
 </BODY>
</HTML>

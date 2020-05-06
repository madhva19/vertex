<%@ page language="java" import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
   <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
   
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
  
  <script language="javascript">
function editRecord(id){
   
    window.location.href="editServlet/"+id; 
  }


  function deleteRecord(id){
   
    window.location.href="deleteUser/"+id; 
  }
  
  function viewNote(id){
	   
	    window.location.href="viewNoteServlet/"+id; 
	  }
  function addNote(id){
	   
	    window.location.href="addNoteServlet/"+id; 
	  }
</script>
<style>
  .bordered {
   
    border: 2px dashed #E20074;
  }
  table#t01 tr:nth-child(even) {
  background-color: #fce2ec;
}
table#t01 tr:nth-child(odd) {
 background-color: #fff;
}
table#t01 th {
  background-color: E20074;
   font-family: Arial;
  color: white;
}
table {
	
	 margin: 30px;
}



table#t01 td {
  text-align: left;
   font-family: Arial;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>

 </HEAD>

 <BODY>
  <%@ include file="viewMenuItem.jsp" %>

 <br>
<div align="center" style="font-size:280%; color:#E20074; font-family: Arial;"; > Unused Feature List </div><div><input type="button" id="btnExport" onclick="Export('Veritas_unusedFeature_Export.xls')" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" value="Export to Excel"></div>
<div align="center" style="font-family: Arial;" >
  <table id='t01'  align="center" style="border:2px double #E20074;border-style:  solid double;">
  <tr style="border:2px double #E20074;border-style:  solid double;">
  
  
  
 <th>FeatureID </th>
  <th>Feature Title </th>

 <th>Dependent Feature </th>
  <th>Feature Code</th>

  </tr>



	<%
	String bgcolor="";
	int count=0;
	List viewList = new ArrayList();
	Iterator  viewItr;
	
	if(request.getAttribute("UnusedfeatureList")!=null && request.getAttribute("UnusedfeatureList")!="")
	{
		List userList =  (ArrayList)request.getAttribute("UnusedfeatureList");
		Iterator itr = userList.iterator();
		
		while(itr.hasNext())
		{
			
			if(count%2==0)
			{
			 bgcolor = "#C8E2D1";
			}
			else
			{
				
				bgcolor = "#EAF8EF";
			}
			
			viewList = (ArrayList)itr.next();
			
			viewItr = viewList.iterator();
			%>
			<tr>
			
			<%	
			while(viewItr.hasNext())
			{
			
				%>
				
				<td><%=viewItr.next()%></td>
				
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
     <tr><td align="center" height="2px"></td></tr>
  </table>	
  </div>
 </BODY>
</HTML>

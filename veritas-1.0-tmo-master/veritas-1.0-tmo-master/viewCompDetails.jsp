<%@ page language="java" import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
    <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="logo.png"/>
   
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   
   <script src="/Veritas/alert.js"></script>
  <link rel="stylesheet" href="/Veritas/alert.css">
  <script language="javascript">
  
  
  function addFeature(id){
   
    window.location.href="addFeatureforProject.jsp?id="+id; 
  }
    function addComponent(id){
   
    window.location.href="addComponentforProject/"+id; 
  }
  
  
  function addResource(id){
   
    window.location.href="addResourceforProject.jsp?id="+id; 
  }
function editRecord(id){
   
    window.location.href="editServlet/"+id; 
  }


  function deleteRecord(id){
   
    swal("Error!"," You don't have permision to delete Record!", "error");
  }
  
 
  function viewNote(id){
	   
	    window.location.href="/Veritas/viewNoteServlet/"+id; 
	  }
</script>
<style>
  .bordered {
   
    border: 2px dashed #E20074;
	 margin: 100px;
  }
 table#t01 tr:nth-child(even) {
  background-color: #fce2ec;
}
table#t01 tr:nth-child(odd) {
 background-color: #fff;
}
table#t01 th {
  background-color: E20074;
  color: white;
}
table {
	
	 margin: 30px;
}



table#t01 td {
  text-align: center;
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
 



<div align="center" style="font-size:280%; color:#E20074"; > Component Summary </div>
  <table align="center" style="border:2px double #E20074;border-style:  solid double;">
<%
	String bgcolor="";
	int count=0;
	HashMap viewMap = new HashMap();
	HashMap feature=new HashMap();
	Iterator  viewItr;
	
	if(request.getAttribute("compDetail")!=null && request.getAttribute("compDetail")!="")
	{
		 viewMap =  (HashMap)request.getAttribute("compDetail");
		 count=1;
	}
	
	%>
	
	
	 
	
    <tr>
		 <td style="font-weight:bold;">Component ID :</td> 
		 <td> <%=viewMap.get("ComponentID")%> </td> 
		 <td style="font-weight:bold;">Component Name : </td>
		 <td><%=viewMap.get("ComponentName")%></td> 
		 <td style="font-weight:bold;">Component Type : </td>
		 <td><%=viewMap.get("ComponentType")%></td>
		 <td style="font-weight:bold;">Component Owner  : </td>
		 <td><%=viewMap.get("ComponentOwner")%></td>
	</tr>
	
  </table>
  
 <table  id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
 	<tr>

	
	
	
<th >Project ID </th>
		<th >Project Number </th>
	
		<th>Project Title  </th>
		<th >Target Deployment </th>

		<th >Workstream </th>
	
		<th >Impact </th>

		
	
		<th >TShirt Size </th>
		<th >Impact Type </th>

	
		<th >Impact Details </th>

		
		<th colspan="1">Action</th> 				
	 			</tr>
 
 
 <%
  ArrayList compprojectList= new ArrayList();
    ArrayList viewList= new ArrayList();
 if(request.getAttribute("compprojectList")!=null && request.getAttribute("compprojectList")!="")
	{
		 compprojectList =  (ArrayList)request.getAttribute("compprojectList");
		 count=1;
	}
 
 
  Iterator itrComp = compprojectList.iterator();
		
		while(itrComp.hasNext())
		{
			
						
			viewList = (ArrayList)itrComp.next();
			String id = viewList.get(0).toString();
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
			
			%>
							<td><i class="fa fa-arrow-circle-right" aria-hidden="true" onclick="viewNote(<%=id%>);" ></i></td>
				
			</tr>
			<%
		}%>
  </table>

  
  
 </BODY>
</HTML>

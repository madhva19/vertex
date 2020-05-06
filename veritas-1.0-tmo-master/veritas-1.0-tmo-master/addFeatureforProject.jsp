<%@ page language="java" import="java.util.*"%>
<html>
<head>
  <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>

<script>
/*
This script is identical to the above JavaScript function.
*/
var ct = 1;
var ct1 = 1;
function new_Leadership()
{

ct++;
 var newRow=document.getElementById('newlink').insertRow();
  	//var te=document.getElementById('newlink').innerHTML;
	var te1='<td style="font-weight:bold;">Project Resource:   <input type="text" name="ProjectResource'+ct+'" value=""> </td> <td style="font-weight:bold;"> Project Role    <select name="ProjectRole'+ct+'" > <option value="SolutionCaptain">Solution Captain</option> <option value="ProductOwner">Product Owner</option> <option value="LeadArchitect">Lead Architect</option><option value="EACArchitect">EAC Architect</option><option value="LeadAnalyst">Lead Analyst</option></select> </td <td style="font-weight:bold;"> Company   <select name="Company'+ct+'" > <option value="TMOBILE">T-Mobile</option><option value="Sprint">Sprint</option></select></td>';
	//var Final =te.append(te1);
	
	
	newRow.innerHTML = te1;
}
function new_Feature()
{

ct1++;
 var newRow=document.getElementById('newlink1').insertRow();
  	//var te=document.getElementById('newlink').innerHTML;
	var te1='<td style="font-weight:bold;">Feature Code:  <input type="text" name="FeatureCode'+ct1+'" value=""></td><td style="font-weight:bold;">Feature Description:  <input type="text" name="FeatureDescription'+ct1+'" value=""></td><td style="font-weight:bold;">Dependent Feature :  <input type="text" name="DependentFeature'+ct1+'" value=""></td>';
	//var Final =te.append(te1);
	
	
	newRow.innerHTML = te1;
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

 td {
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


</head>
<body>
  <%@ include file="viewMenuItem.jsp" %>

<%
	String bgcolor="";
	int count=0;
	HashMap viewMap = new HashMap();
	HashMap feature=new HashMap();
	Iterator  viewItr;
	
	if(session.getAttribute("projectDescription")!=null && session.getAttribute("projectDescription")!="")
	{
		 viewMap =  (HashMap)session.getAttribute("projectDescription");
		 count=1;
	}
	
	ArrayList featureForAddFeatureForProject=new ArrayList();
	  
	  if(session.getAttribute("featureForAddFeatureForProject")!=null && session.getAttribute("featureForAddFeatureForProject")!="")
	{
		 featureForAddFeatureForProject =  (ArrayList)session.getAttribute("featureForAddFeatureForProject");
	}
	
	%>
	<ul class="breadcrumb" style="background-color:white;">
  <li><a href='/Veritas/home/'>Home</a></li>
  <li><a href="/Veritas/ViewAllProject">Review Dashboard</a></li>
    <li><a href="/Veritas/viewNoteServlet/<%=viewMap.get("ProjectID") %>" ><%=viewMap.get("ProjectTitle")%></a></li>
    <li><a href="#" style="color:black;">Add Component </a></li>
</ul>	 
	

<div align="center" style="font-size:280%; color:#E20074"; > Add Capabilities to  : <%=viewMap.get("ProjectNumber")%></div>




<table align="center" style="border:2px double #E20074;border-style:  solid double;width:90%">

	
	 
	

	<tr>
		<td style="font-weight:bold; text-align:left;font-size:15px;color:#e20074;" >Project Number: </td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"> <%=viewMap.get("ProjectNumber")%>
		<input type=hidden name="projectID" Value= '<%=viewMap.get("ProjectID")%>'> </td>
	</tr>
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;" >Project Tittle: </td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"> <%=viewMap.get("ProjectTitle")%></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;">Project Description: </td> 
		
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"> <%=viewMap.get("ProjectDescription")%></td>
	</tr>
	
</table>


 <table id='t01'   align="center" style="border:2px double #E20074;border-style:  solid double;">

  <tr style="border:2px double #E20074;height:40px;border-style:  solid double;">

   
  
 <th width=10%>Feature ID </th>
  <th>Feature Description</th>
  <th width=10%>Dependent Feature  </th>
 <th >Feature Code</th>
  <th width=10%>Action</th>
  </tr>


<%

if(featureForAddFeatureForProject!=null )
	{
		
		Iterator itr = featureForAddFeatureForProject.iterator();
		List viewList = new ArrayList();
	Iterator  viewItr1;
		while(itr.hasNext())
		{
			
			
			viewList = (ArrayList)itr.next();
			String id = viewList.get(0).toString();
			viewItr1 = viewList.iterator();
			%>
			<tr>
			<form name="userform" method="get" action="AddFeature">
			
			
			<%	
			while(viewItr1.hasNext())
			{
			
				%>
				
				<td ><%=viewItr1.next()%></td>
				<input type='hidden' name='FeatureID' value=<%=id%>>
					<input type=hidden name="projectID" Value=<%=viewMap.get("ProjectID")%>>
					<input type='hidden' name='action' value='updateProject'>
				<%
					
			}
			
			%>
			
			<td style="text-align:center;"><input type="submit" name="view" value="Add "  ></td>
				
</form>
			</tr>
			
			<%
		}
	}
	%>
	









</body>
</html>



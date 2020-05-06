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






</div>
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
	%>
<ul class="breadcrumb" style="background-color:white;">
  <li><a href='/Veritas/home/'>Home</a></li>
  <li><a href="/Veritas/ViewAllProject">Review Dashboard</a></li>
    <li><a href="/Veritas/viewNoteServlet/<%=viewMap.get("ProjectID") %>" ><%=viewMap.get("ProjectTitle")%></a></li>
    <li><a href="#" style="color:black;">Edit Stakeholder</a></li>
</ul>	 

<div align="center" style="font-size:280%; color:#E20074"; > Edit Stakeholder to  : <%=viewMap.get("ProjectTitle")%></div>


<form name="userform" method="get" action="AddResource">
<br><br><br>
<table align="center" style="border:2px double #E20074;border-style:  solid double; width: 50%;" cellpadding="5">



	<tr>
		<td style="font-weight:bold; text-align:left;font-size:15px;color:#e20074;" >Project Number: </td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"  colspan=2> <%=viewMap.get("ProjectNumber")%>
		<input type=hidden name="projectID" Value= '<%=viewMap.get("ProjectID")%>'> </td>
	</tr>
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;" >Project Title: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;" colspan=2> <%=viewMap.get("ProjectTitle")%></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;">Project Description: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;" colspan=2> <%=viewMap.get("ProjectDescription")%></td>
	</tr>
		
		<tr class=trbordered>
		<td style="font-weight:bold;text-align:left;">Project Resource </td> <td style="font-weight:bold;text-align:left;"> <input type="text" name="ProjectResource" value="<%=request.getParameter("ProjectResource")%>" > 
		<input type=hidden name="ProjectResource1" Value='<%=request.getParameter("ProjectResource")%>'>
		<input type=hidden name="action" Value="update">
		</td>
	</tr><tr>
		<td style="font-weight:bold;text-align:left;"> Project Role </td> <td style="font-weight:bold;text-align:left;"> <select name="ProjectRole" >
		<option value="PM" <% if(request.getParameter("ProjectRole").toString().equalsIgnoreCase("PM")){%>selected<%} %>>PM</option>
    <option value="SolutionCaptain" <% if(request.getParameter("ProjectRole").toString().equalsIgnoreCase("SolutionCaptain")){%>selected<%} %>>Solution Captain</option>
    <option value="ProductOwner" <% if(request.getParameter("ProjectRole").toString().equalsIgnoreCase("ProductOwner")){%>selected<%} %>>Product Owner</option>
    <option value="LeadArchitect" <% if(request.getParameter("ProjectRole").toString().equalsIgnoreCase("LeadArchitect")){%>selected<%} %>>Lead Architect</option>
	 <option value="EACArchitect" <% if(request.getParameter("ProjectRole").toString().equalsIgnoreCase("EACArchitect")){%>selected<%} %>>EAC Architect</option>
    <option value="LeadAnalyst" <% if(request.getParameter("ProjectRole").toString().equalsIgnoreCase("LeadAnalyst")){%>selected<%} %>>Lead Analyst</option>
      </select> </td></tr><tr>
			<td style="font-weight:bold;text-align:left;"> Company  </td> <td style="font-weight:bold;text-align:left;"> <select name="Company" >
    <option value="TMOBILE" <% if(request.getParameter("Company").toString().equalsIgnoreCase("TMOBILE")){%>selected<%} %>>T-Mobile</option>
    <option value="Sprint" <% if(request.getParameter("Company").toString().equalsIgnoreCase("Sprint")){%>selected<%} %>>Sprint</option>
   
  </select></td>
	</tr>
	
	
	
	
		
		
		
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Save" style="border:0;background-color: #E20074;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;"></td>
	</tr>
	<tr><td colspan=2 align="center" height="10px"></td></tr>
</table>

</form>


</body>
</html>



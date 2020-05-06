<%@ page language="java" import="java.util.*"%>
<html>
<head>
   <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="logo.png"/>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>

<script>

 function add(id){
   
    window.location.href="addComponentforProject/"+id; 
  }
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
function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }

</script>

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
</head>
<body>
  <%@ include file="viewMenuItem.jsp" %>






</div>

<ul class="breadcrumb" style="background-color:white;">
  <li><a href='/Veritas/home/'>Home</a></li>
  <li><a href="/Veritas/ViewAllProject">Review Dashboard</a></li>
    <li><a href="/Veritas/viewNoteServlet/<%=request.getParameter("ProjectID") %>" ><%=request.getParameter("ProjectID")%></a></li>
    <li><a href="#" style="color:black;">Add CR</a></li>
</ul>	 


<div align="center" style="font-size:280%; color:#E20074"; > Edit component for the project <%=request.getParameter("ProjectID")%> </div>



<br><br><br>


 <table id='t01'   align="center" style="border:2px double #E20074;border-style:  solid double;">
  <tr style="border:2px double #E20074;border-style:  solid double;">

 <th>ComponentID</th>
  <th>Component Name </th>
  <th>Component Type </th>
 <th>Component Owner </th>
  <th >Impact</th>

		<th >TShirt Size </th>
			<th >Impact Type </th>

	
		<th >Impact Details </th>
		
	<th >Action</th>
  </tr>




			<tr>
			<form name="userform" method="get" action="AddImpact">
			<td> <%=request.getParameter("ComponentID")%></td>
			<td> <%=request.getParameter("ComponentName")%></td>
			<td><%=request.getParameter("ComponentType")%></td>
			<td><%=request.getParameter("ComponentOwner")%></td>
		
			
			
			<td><input type="text" name="Impact" onkeypress="return isNumberKey(event)"  value="<%=request.getParameter("Impact")%>"></td>
			
			<td><select name="TShirtSize" >
			<option value="<%=request.getParameter("TShirt")%>"><%=request.getParameter("TShirt")%></option>
    <option value="XS">Extra Small</option>
    <option value="S">Small</option>
	 <option value="M">Medium</option>
    <option value="L">Large</option>
	 <option value="XL">Extra Large</option>
    <option value="XXL">XXL</option>
	    <option value="XXXL">XXXL</option>
   
  </select></td>
  
  <td><input type="text" name="ImpactType"  value="<%=request.getParameter("ImpactType")%>"></td>
  <td><input type="text" name="ImpactDetails"   value="<%=request.getParameter("ImpactDetails")%>"></td>
			
			<input type="hidden" name="componentID" value="<%=request.getParameter("ComponentID")%>">
			<input type="hidden" name="ProjectID" value="<%=request.getParameter("ProjectID")%>">
			<input type="hidden" name="action" value="update">
			
				<td ><input type="submit" name="view" value="Add " style="background-color:#ff7faf;font-weight:bold;color:#ffffff;"  ></td>
			</form>	
			</tr>
			
	
     <tr><td align="center" height="2px"></td></tr>
  </table>	










</form>


</body>
</html>



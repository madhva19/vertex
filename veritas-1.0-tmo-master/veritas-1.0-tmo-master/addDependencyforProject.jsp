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
function viewNote(id){
	   
	    window.location.href="/Veritas/viewNoteServlet/"+id; 
	  }
 function add(id){
   
    window.location.href="addComponentforProject/"+id; 
  }
/*
This script is identical to the above JavaScript function.
*/
var ct = 1;
var ct1 = 1;

function new_Feature()
{

ct1++;
 var newRow=document.getElementById('newlink1').insertRow();
  	//var te=document.getElementById('newlink').innerHTML;
	var te1='<td style="font-weight:bold;">Feature Code:  <input type="text" name="FeatureCode'+ct1+'" value=""></td><td style="font-weight:bold;">Feature Description:  <input type="text" name="FeatureDescription'+ct1+'" value=""></td><td style="font-weight:bold;">Dependent Feature :  <input type="text" name="DependentFeature'+ct1+'" value=""></td>';
	//var Final =te.append(te1);
	
	
	newRow.innerHTML = te1;
}

function editDependency(id)
{
	var btn="editD"+id;
	document.getElementById(btn).style.display='none';
	var Strategies="Strategies"+id;
	document.getElementById(Strategies).disabled =false;
	var Nature="Nature"+id;
	document.getElementById(Nature).disabled =false;
	var save="saveD"+id;
	document.getElementById(save).style.display='inline';
	

}



function formValidate()
{
	
	
	var i=0;
	 for( i=0; i<document.getElementsByName('Strategies').length;i++)
		 {
		 if(document.getElementsByName('Strategies')[i].value!="")
			 {
			 replaceSpecialChar(document.getElementsByName('Strategies')[i]);

			 }
		 
		 }
	
 
  return;
}



function saveDependency(id)
{
	var btn='editD'+id;
	document.getElementById(btn).style.display='inline';

	var save="saveD"+id;
	document.getElementById(save).style.display='none';
	
	var i=0;
	 for( i=0; i<document.getElementsByName('Strategies').length;i++)
		 {
		 if(document.getElementsByName('Strategies')[i].value!="")
			 {
			 replaceSpecialChar(document.getElementsByName('Strategies')[i]);

			 }
		 
		 }
	
 
  return;
}

function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }

	 
	  
	  
	  function editComponent(ProjectID,ComponentID,ComponentName,ComponentType,ComponentOwner,Impact,TShirt,ImpactType,ImpactDetails){
   ComponentName=encodeURIComponent(ComponentName);
  ComponentOwner=encodeURIComponent(ComponentOwner);
   ImpactType=encodeURIComponent(ImpactType);
  ImpactDetails=encodeURIComponent(ImpactDetails);
  
    var url="editComponentforProject.jsp?ProjectID="+ProjectID+"&ComponentID="+ComponentID+"&ComponentName="+ComponentName+"&ComponentType="+ComponentType+"&ComponentOwner="+ComponentOwner+"&Impact="+Impact+"&TShirt="+TShirt+"&ImpactType="+ImpactType+"&ImpactDetails="+ImpactDetails;


window.location.href=url;
	}
	  
	 	  function filterResult(id,input1) {
  // Declare variables 
  var input, filter, table, tr, td, i, txtValue;
  //input = document.getElementById("myInput");
  filter = input1.value.toUpperCase();
  table = document.getElementById("t02");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[id];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
} 

function blockSpecialChar(e)
{
var k;
document.all ? k = e.keyCode : k = e.which;
return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57) || k == 190 || k == 188 || k==44 || k==46 || k==45 || k==13);
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

table#t02 tr:nth-child(even) {
  background-color: #fce2ec;
}
table#t02 tr:nth-child(odd) {
 background-color: #fff;
}
table#t02 th {
  background-color: E20074;
  color: white;
}

table#t02 td {
  text-align: center;
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


   
<%
	String bgcolor="";
	int count=0;
	HashMap viewMap = new HashMap();
	
	
	ArrayList componentList=new ArrayList();
	ArrayList allprojectList=new ArrayList();
	
	ArrayList ProjectList=new ArrayList();
	Iterator  viewItr;
	
	if(session.getAttribute("project")!=null && session.getAttribute("project")!="")
	{
		 viewMap =  (HashMap)session.getAttribute("project");
		 count=1;
	}
	
	if(session.getAttribute("ProjectList")!=null && session.getAttribute("ProjectList")!="")
	{
		 ProjectList =  (ArrayList)session.getAttribute("ProjectList");
		
	}
	
	if(session.getAttribute("allprojectList")!=null && session.getAttribute("allprojectList")!="")
	{
		 allprojectList =  (ArrayList)session.getAttribute("allprojectList");
		 count=1;
	}
	
	
	
	%>


<ul class="breadcrumb" style="background-color:white;">
  <li><a href='/Veritas/home/'>Home</a></li>
  <li><a href="/Veritas/ViewAllProject">Review Dashboard</a></li>
    <li><a href="/Veritas/viewNoteServlet/<%=viewMap.get("ProjectID") %>" ><%=viewMap.get("ProjectTitle")%></a></li>
    <li><a href="#" style="color:black;">Dependency </a></li>
</ul>	 


</div>
<div align="center" style="font-size:280%; color:#E20074"; >Dependency for the Project <%=viewMap.get("ProjectTitle")%> </div>



<br><br><br>

 <table id="t01" width="1800px"  align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>
		<th >Dependency ID </th>
		<th >Project ID </th>

		<th >Project Number </th>
	
		<th>Project Title </th>
		<th >Project Description </th>
		<th >Workstream </th>

		<th >Project Status </th>
		
		
		<th >Nature of Dependency </th>
		
		
		<th >Dependency and Mitigation</th>
	       <th colspan="2">Action</th> 				
	 			</tr>
  
  <%
 
 Iterator itrcompnent = ProjectList.iterator();
		
		while(itrcompnent.hasNext())
		{
			HashMap component=(HashMap)itrcompnent.next();
 %>
    
	
		
	<form name="userform" method="get" action="AddDependency" onsubmit="return saveDependency(<%=component.get("DependencyID")%>)">
    
	<tr>
	
		<td > <%=component.get("DependencyID")%></td>
		<td > <%=component.get("ProjectID")%></td>

		<td ><%=component.get("ProjectNumber")%></td>
	
		<td ><%=component.get("ProjectTitle")%></td>
		<td > <%=component.get("ProjectDescription")%></td>
		<td ><%=component.get("Workstream")%></td>

<td ><%=component.get("ProjectStatus")%></td>
<td ><select name="Nature" id="Nature<%=component.get("DependencyID")%>" disabled>
 <option value="<%=component.get("nature")%>"><%=component.get("nature")%></option>
    <option value="Data_Dependency">Data Dependency</option>
    <option value="Code_Dependency">Code Dependency</option>
	 <option value="Deployment_Dependency">Deployment Dependency</option>
    <option value="Function_Dependency">Function Dependency</option>
	 <option value="Project_Dependency">Project Dependency</option>
    <option value="Hardware_Dependency">Hardware Dependency</option>
	

	
	
   
          </select> </td>
<td >  <textarea name="Strategies" id="Strategies<%=component.get("DependencyID")%>" onkeypress="return blockSpecialChar(event);" rows="5" cols="33" disabled><%=component.get("strategies")%></textarea>


</td>

			<input type="hidden" name="DependentProjectID" value="<%=component.get("ProjectID")%>">
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="ProjectID" value="<%=viewMap.get("ProjectID")%>">
<input type=hidden name="DependencyID" Value=	<%=component.get("DependencyID")%>> 
	
		
			
	<td><input type="button" name="editD" id="editD<%=component.get("DependencyID")%>" value="Edit Dependency" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="editDependency(<%=component.get("DependencyID")%>);" ><input type="submit" name="saveD" id="saveD<%=component.get("DependencyID")%>" value="Save Dependency" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;display:none;" ></td>	
			
	<td><input type="button" name="edit" value="View Project" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="viewNote(<%=component.get("ProjectID")%>);" ></td>
				
				
				
			</tr>
			</form>
		<%}%>
  </table>

<table width="1800px"  align="center" style="border:2px double #E20074;border-style:  solid double;">

   <tr style="border:2px double #E20074;border-style:  solid double;">
  
 <td><input type="text" id="myInput" onkeyup="filterResult(0,this)" placeholder="Project ID.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(1,this)" placeholder="Project Number.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(2,this)" placeholder="Project Title.."> </td>
 <td><input type="text" id="myInput" onkeyup="filterResult(3,this)" placeholder="Project Description.."> </td>
 <td><input type="text" id="myInput" onkeyup="filterResult(8,this)" placeholder="Work stream.."> </td>
 <td><input type="text" id="myInput" onkeyup="filterResult(6,this)" placeholder="Project Status.."> </td>

    
	<td>NA</td>
  </tr>
</table>
 <table id='t02' width="1800px"  align="center" style="border:2px double #E20074;border-style:  solid double;">
  <tr style="border:2px double #E20074;border-style:  solid double;">

	<th >Project ID </th>

		<th >Project Number </th>
	
		<th>Project Title </th>
		<th >Project Description </th>
		<th >Workstream </th>

		<th >Project Status </th>
		
		<th >Nature of Dependency </th>
		
		
		<th >Dependency and Mitigation </th>
	<th colspan=1>Action</th>
  </tr>



	<%
	
	
	List viewList = new ArrayList();
	Iterator  viewItr1;
	
	if(allprojectList!=null )
	{
		
		Iterator itr = allprojectList.iterator();
		
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
			String id = viewList.get(0).toString();
			viewItr1 = viewList.iterator();
			%>
			<tr>
			<form name="userform" method="get" action="AddDependency" onsubmit="return formValidate()">
			
			
			<%	
			while(viewItr1.hasNext())
			{
			
				%>
				
				<td><%=viewItr1.next()%></td>
				
				<%
					
			}
			count++;
			%>
			
	<td ><select name="Nature" id="Nature">
	<option value=""></option>
    <option value="Data_Dependency">Data Dependency</option>
    <option value="Code_Dependency">Code Dependency</option>
	<option value="Deployment_Dependency">Deployment Dependency</option>
    <option value="Function_Dependency">Function Dependency</option>
	 <option value="Project_Dependency">Project Dependency</option>
    <option value="Hardware_Dependency">Hardware Dependency</option>
   
          </select> </td>
<td >  <textarea name="Strategies" id="Strategies" onkeypress=" return blockSpecialChar(event);" 
          rows="5" cols="33" ></textarea>


</td>

			<input type="hidden" name="DependentProjectID" value="<%=id%>">
			<input type="hidden" name="ProjectID" value="<%=viewMap.get("ProjectID")%>">
			
				<td><input type="submit" name="view" value="Add " style="background-color:#ff7faf;font-weight:bold;color:#ffffff;"  ></td>
			</form>	
			</tr>
			
			<%
		}
	}
	%>
     <tr><td align="center" height="2px"></td></tr>
  </table>	













</body>
</html>



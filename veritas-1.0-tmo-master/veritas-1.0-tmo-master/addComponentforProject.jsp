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

 function FormValidation(){
	 var i=0;
	 for( i=0; i<document.getElementsByName('ImpactType').length;i++)
		 {
		 if(document.getElementsByName('ImpactType')[i].value!="")
			 {
			 replaceSpecialChar(document.getElementsByName('ImpactDetails')[i]);
			 replaceSpecialChar(document.getElementsByName('ImpactType')[i]);
			 }
		 
		 }
	
   
    return;
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

	 
	  
	  
	  function editComponent(ProjectID,ComponentID,ComponentName,ComponentType,ComponentOwner,Impact,TShirt,ImpactType,ImpactDetails){
   ComponentName=encodeURIComponent(ComponentName);
  ComponentOwner=encodeURIComponent(ComponentOwner);
   ImpactType=encodeURIComponent(ImpactType);
  ImpactDetails=encodeURIComponent(ImpactDetails);
  
    var url="editComponentforProject.jsp?ProjectID="+ProjectID+"&ComponentID="+ComponentID+"&ComponentName="+ComponentName+"&ComponentType="+ComponentType+"&ComponentOwner="+ComponentOwner+"&Impact="+Impact+"&TShirt="+TShirt+"&ImpactType="+ImpactType+"&ImpactDetails="+ImpactDetails;


window.location.href=url;
	}
	  
	  
	  
</script>

</script>
<style>
  .bordered {
   
    border: 2px dashed #E20074;
  }
 table tr:nth-child(even) {
  background-color: #fce2ec;
}
table tr:nth-child(odd) {
 background-color: #fff;
}
table th {
  background-color: E20074;
  color: white;
}
table {
	
	 margin: 30px;
}



table td {
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
th {
  cursor: pointer;
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
	ArrayList allcomponentList=new ArrayList();
	Iterator  viewItr;
	
	if(session.getAttribute("project")!=null && session.getAttribute("project")!="")
	{
		 viewMap =  (HashMap)session.getAttribute("project");
		 count=1;
	}
	
	if(session.getAttribute("componentList")!=null && session.getAttribute("componentList")!="")
	{
		 componentList =  (ArrayList)session.getAttribute("componentList");
		
	}
	
	if(session.getAttribute("allcomponentList")!=null && session.getAttribute("allcomponentList")!="")
	{
		 allcomponentList =  (ArrayList)session.getAttribute("allcomponentList");
		 count=1;
	}
	
	
	
	%>


<ul class="breadcrumb" style="background-color:white;">
  <li><a href='/Veritas/home/'>Home</a></li>
  <li><a href="/Veritas/ViewAllProject">Review Dashboard</a></li>
    <li><a href="/Veritas/viewNoteServlet/<%=viewMap.get("ProjectID") %>" ><%=viewMap.get("ProjectTitle")%></a></li>
    <li><a href="#" style="color:black;">Add Application</a></li>
</ul>	 


</div>
<div align="center" style="font-size:280%; color:#E20074"; > Add Application for  <%=viewMap.get("ProjectTitle")%> </div>



<br><br><br>

 <table id="t01"  align="center" style="border:2px double #E20074;border-style:  solid double;width: 90%;">
  	<tr style="height:40px">

		<th width=8% onclick="sortTable(0,'t01')">Component ID </th>

		<th width=10% onclick="sortTable(1,'t01')">Component Name </th>
	
		<th width=8% onclick="sortTable(2,'t01')">Component Type </th>
		<th width=8% onclick="sortTable(3,'t01')" >Component Owner </th>
		<th width=5% onclick="sortTable(4,'t01')">Project </th>

		<th width=4% onclick="sortTable(5,'t01')">Impact</th>

		
		<th width=4% onclick="sortTable(6,'t01')">TShirt Size </th>
		<th width=5% onclick="sortTable(7,'t01')" >Impact Type </th>

	
		<th onclick="sortTable(8,'t01')">Impact Details </th>
		
	       <th width=5% colspan="2">Action</th> 				
	 			</tr>
  
  <%
 
 Iterator itrcompnent = componentList.iterator();
		
		while(itrcompnent.hasNext())
		{
			HashMap component=(HashMap)itrcompnent.next();
 %>
    
	
		
	
    
	<tr>
	
		<td > <%=component.get("ComponentID")%></td>

		<td ><%=component.get("ComponentName")%></td>
	
		<td ><%=component.get("ComponentType")%></td>
		<td > <%=component.get("ComponentOwner")%></td>
		<td ><%=component.get("ProjectID")%></td>

<td ><%=component.get("Impact")%></td>

		
		<td ><%=component.get("TShirt_Size")%></td>
	<td ><%if(component.get("ImpactType")!=null && !component.get("ImpactType").toString().equalsIgnoreCase("NULL")) {%> <%=component.get("ImpactType")%> <%}%></td>

		
		<td ><%if(component.get("ImpactDetails")!=null && !component.get("ImpactDetails").toString().equalsIgnoreCase("NULL")) {%> <%=component.get("ImpactDetails")%><%}%></td>
		
			
	<td><i align=center; class="fa fa-pencil" aria-hidden="true" onclick="editComponent(<%=component.get("ProjectID")%>, <%=component.get("ComponentID")%>,'<%=component.get("ComponentName")%>','<%=component.get("ComponentType")%>','<%=component.get("ComponentOwner")%>','<%=component.get("Impact")%>','<%=component.get("TShirt_Size")%>','<%=component.get("ImpactType")%>','<%=component.get("ImpactDetails")%>');" ></i></td>
				
				
					<td><i class="fa fa-trash-o" aria-hidden="true" onclick="deleteRecord(<%=component.get("ComponentID")%>);"></i></td>
			</tr>
		<%}%>
  </table>

 
  
  
  
  

 <table id='t02'   align="center" style="border:2px double #E20074;border-style:  solid double;width: 90%;">
  <tr style="border:2px double #E20074;border-style:  solid double;height:40px;">

 <th width=8% onclick="sortTable(0,'t02')">Component ID</th>
  <th width=10% onclick="sortTable(1,'t02')">Component Name </th>
  <th width=8%  onclick="sortTable(2,'t02')">Component Type </th>
 <th width=8% onclick="sortTable(3,'t02')">Component Owner </th>
  <th width=5% onclick="sortTable(4,'t02')">Impact </th>

		
	
		<th width=7% >TShirt Size </th>
	<th width=5%>Impact Type </th>

	
		<th >Impact Details </th>
		
	<th width=8%>Action</th>
  </tr>



	<%
	
	
	List viewList = new ArrayList();
	Iterator  viewItr1;
	
	if(allcomponentList!=null )
	{
		
		Iterator itr = allcomponentList.iterator();
		
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
			<form name="userform" method="get" action="AddImpact" onsubmit="return FormValidation();">
			
			
			<%	
			while(viewItr1.hasNext())
			{
			
				%>
				
				<td><%=viewItr1.next()%></td>
				
				<%
					
			}
			count++;
			%>
			
			
			<td><input type="text" name="Impact" onkeypress="return isNumberKey(event)"  value="0"></td>
			
			<td><select name="TShirtSize" >
    <option value="XS">Extra Small</option>
    <option value="S">Small</option>
	 <option value="M">Medium</option>
    <option value="L">Large</option>
	 <option value="XL">Extra Large</option>
    <option value="XXL">XXL</option>
	    <option value="XXXL">XXXL</option>
   
  </select></td>
			 <td><input type="text" name="ImpactType" id="ImpactType"  value="" onkeypress="return blockSpecialChar(event);"></td>
  <td><input type="text" name="ImpactDetails"  id="ImpactDetails" value="" onkeypress="return blockSpecialChar(event);"></td>
		
			
				<td style="font-weight:bold;align:center;"><input type="submit" name="view" value="Add "  ></td>
				<input type="hidden" name="componentID" value="<%=id%>">
			<input type="hidden" name="ProjectID" value="<%=viewMap.get("ProjectID")%>">
			</form>	
			</tr>
			
			<%
		}
	}
	%>
    
  </table>	











<script>
	 function sortTable(n,name) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById(name);
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") {
        if (x!=undefined && y!=undefined && x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x!=undefined && y!=undefined && x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
  
  
  
  </script>
</body>
</html>



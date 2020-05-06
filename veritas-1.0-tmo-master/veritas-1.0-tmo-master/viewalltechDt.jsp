<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%


				
				List<Map<Object,Object>> techDebtgraph = new ArrayList<Map<Object,Object>>();

techDebtgraph=(ArrayList) session.getAttribute("techDebtgraph");



Gson gsonObj = new Gson();
 

String dataPoints_techDebt = gsonObj.toJson(techDebtgraph);
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
   
   <link rel="stylesheet" href="styles.css">

 
  
  <script language="javascript">
function editRecord(id){
   
    window.location.href="editServlet/"+id; 
  }


  function deleteRecord(id){
   
    window.location.href="deleteUser/"+id; 
  }
  
  function viewNote(id){
	   
	    window.location.href="/Veritas/viewNoteServlet/"+id; 
	  }
  function addNote(id){
	   
	    window.location.href="addNoteServlet/"+id; 
	  }
	  
	  
	    function filterResult(id,input1) {
  // Declare variables 
  var input, filter, table, tr, td, i, txtValue;
  //input = document.getElementById("myInput");
  filter = input1.value.toUpperCase();
  table = document.getElementById("t01");
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
	  
	  
</script>
<style>
  .bordered {
   
    border: 2px dashed #FF0099;
  }
  table#t01 tr:nth-child(even) {
  background-color: #fce2ec;
}
table#t01 tr:nth-child(odd) {
 background-color: #fff;
}
table#t01 th {
  background-color: FF0099;
   font-family: Arial;
  color: white;
}
table {
	
	 margin: 30px;
}

th {
  cursor: pointer;
}


table#t01 td {
 font-family: Arial;
  text-align: left;
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


  
<script type="text/javascript">
window.onload = function() { 
	
var chart7 = new CanvasJS.Chart("chartContainer_TD", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Technical debt by project"
	},
	axisY: {
		title: "Technical Debt Count",
		labelFormatter: addSymbols
	},
	
	
		data: [{
			type: "bar",
			indexLabel: "{y}",
			indexLabelFontColor: "#444",
			indexLabelPlacement: "inside",
			dataPoints: <%out.print(dataPoints_techDebt);%>
		}]
		

});
chart7.render();
 


function addSymbols(e) {
	var suffixes = ["", "K", "M", "B"];
 
	var order = Math.max(Math.floor(Math.log(e.value) / Math.log(1000)), 0);
	if(order > suffixes.length - 1)
	order = suffixes.length - 1;
 
	var suffix = suffixes[order];
	return CanvasJS.formatNumber(Math.round(e.value / Math.pow(1000, order))) + suffix;
}
} 

</script>


 </HEAD>

 <BODY>
  <%@ include file="viewMenuItem.jsp" %>


 <br>
 <div id="chartContainer_TD" style="height: 370px; width: 100%;"></div><br><br>
 

<div align="center" style="font-family: Arial;" >
<table  align="center" style="border:2px double #FF0099;border-style: solid double;">
  <%@ include file="search.jsp" %>
   <!-- <tr style="border:2px double #FF0099;border-style:  solid double;">

 <td><input type="text" id="myInput" onkeyup="filterResult(0,this)" placeholder="Search for Project ID.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(0,this)" placeholder="Search for Project Tittle.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(1,this)" placeholder="Search for technical Debt ID.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(2,this)" placeholder="Search for technical Debt details .."> </td>
 <td><input type="text" id="myInput" onkeyup="filterResult(3,this)" placeholder="Search for technical Debt Status .."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(4,this)" placeholder="Search for technical Debt source.."> </td>
 	<td> <input type="button" id="btnExport" onclick="Export('Veritas_ProjectTechDebt_Export.xls');" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" value="Export to Excel"> </td>
  </tr> -->
</table>

<table id='t01'  align="center" style="border:2px double #FF0099;border-style:  solid double;">
    <thead> 
    <tr style="border:2px double #FF0099;border-style:  solid double; height:40px">
      <th onclick="sortTable(0)">Project ID </th>
      <th onclick="sortTable(0)">Project Title </th>
      <th onclick="sortTable(1)">Technical Debt ID </th>
      <th onclick="sortTable(2)">Technical Debt details </th>
      <th onclick="sortTable(3)">Technical Debt Status </th>
      <th onclick="sortTable(4)">Technical Debt source </th>
      <th>Action</th>
    </tr>
  </thead>


	<%
	String bgcolor="";
	int count=0;
	List viewList = new ArrayList();
	Iterator  viewItr;
	
	if(session.getAttribute("techDebt")!=null && session.getAttribute("techDebt")!="")
	{
		List userList =  (ArrayList)session.getAttribute("techDebt");
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
			String id = viewList.get(0).toString();
			viewItr = viewList.iterator();
			%>
			<tr style="align:center;">
			
			<%	
			while(viewItr.hasNext())
			{
			
				%>
				
				<td ><%=viewItr.next()%></td>
				
				<%
					
			}
			count++;
			%>
			
				<td style="text-align: center;"><input type="button" name="view" value="View Project" style=" align:center; border:0;background-color: #FF0099;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;" onclick="viewNote(<%=id%>);" ></td>
				
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
  <script>
  
  function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("t01");
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
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
 </BODY>
</HTML>

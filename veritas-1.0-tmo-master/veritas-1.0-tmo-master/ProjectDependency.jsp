<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%


				
				List<Map<Object,Object>> projDep = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> depProj = new ArrayList<Map<Object,Object>>();
			

			
	                projDep=(ArrayList) session.getAttribute("projDep");
	                depProj=(ArrayList) session.getAttribute("depProj");
	       



Gson gsonObj = new Gson();
 

String dataPoints_projDep = gsonObj.toJson(projDep);
String dataPoints_depProj = gsonObj.toJson(depProj);
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
   <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
   
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
  
  <script language="javascript">
  
  
  
  window.onload = function() { 
	  
	  var chart = new CanvasJS.Chart("chartContainer_pDep", {
	  	animationEnabled: true,
	  
	  	title: {
	  		text: "Project dependency Dashboard"
	  	},
	  	axisY: {
	  		title: "Dependency count",
	  		labelFormatter: addSymbols
	  	},
		axisX: {
			title: "Project"
		},
	  	toolTip: {
	  		shared: true
	  	},
	  	legend: {
	  		cursor: "pointer",
	  		itemclick: toggleDataSeries
	  	},
	  	data: [{
			type: "bar",
			indexLabel: "{y}",
			indexLabelFontColor: "#444",
			indexLabelPlacement: "inside",
			dataPoints: <%out.print(dataPoints_projDep);%>
		}]
	  });
	  chart.render();
	   
	  function toggleDataSeries(e) {
	  	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
	  		e.dataSeries.visible = false;
	  	}
	  	else {
	  		e.dataSeries.visible = true;
	  	}
	  	chart.render();
	  }
	   
	  function addSymbols(e) {
			var suffixes = ["", "K", "M", "B"];
		 
			var order = Math.max(Math.floor(Math.log(e.value) / Math.log(1000)), 0);
			if(order > suffixes.length - 1)
			order = suffixes.length - 1;
		 
			var suffix = suffixes[order];
			return CanvasJS.formatNumber(Math.round(e.value / Math.pow(1000, order))) + suffix;
		}
  

  }
  
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
th {
  cursor: pointer;
  font-family: Arial;
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
 
 <div id="chartContainer_pDep" style="height: 370px; width: 100%;"></div>


<div align="center" style="font-family: Arial;" >
  <table align="center" style="border:2px double #E20074;border-style:  solid double;">
    <%@ include file="search.jsp" %>
    <!-- <tr style="border:2px double #E20074;border-style: solid double;">
      <td><input type="text" id="myInput" onkeyup="filterResult(0,this)" placeholder="Project Number.."> </td>
      <td><input type="text" id="myInput" onkeyup="filterResult(1,this)" placeholder="Project Title.."> </td>
      <td><input type="text" id="myInput" onkeyup="filterResult(2,this)" placeholder="Target Deployment.."> </td>
      <td><input type="text" id="myInput" onkeyup="filterResult(3,this)" placeholder="Project Status"> </td>
      <td><input type="text" id="myInput" onkeyup="filterResult(4,this)" placeholder="Dependent Project Number.."> </td>
      <td><input type="text" id="myInput" onkeyup="filterResult(5,this)" placeholder="Dependent Project Title.."> </td>
      <td><input type="text" id="myInput" onkeyup="filterResult(6,this)" placeholder="Dependent Project Status.."> </td>
      <td><input type="text" id="myInput" onkeyup="filterResult(7,this)" placeholder="Nature Of Dependency.."> </td>
      <td><input type="text" id="myInput" onkeyup="filterResult(8,this)" placeholder="Dependency and Mitigation.."> </td>
      <td><input type="button" id="btnExport" onclick="Export('Veritas_ProjectDepndency_Export.xls')" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" value="Export to Excel"></td>
    </tr> -->
  </table>


  <table id='t01'  align="center" style="border:2px double #E20074;border-style:  solid double;">
    <thead>
      <tr style="border:2px double #E20074;border-style:  solid double; height:40px;" >
        <th onclick="sortTable(0)">Project Number </th>
        <th onclick="sortTable(1)"> Project Title </th>
        <th onclick="sortTable(2)">Target Deployment </th>
        <th onclick="sortTable(3)">Project Status</th>
        <th onclick="sortTable(4)">Dependent Project Number </th>
        <th onclick="sortTable(5)">Dependent Project Title </th>
        <th onclick="sortTable(6)">Dependent Project Status </th>
        <th onclick="sortTable(7)">Nature Of Dependency</th>
        <th onclick="sortTable(8)"> Dependency and Mitigation </th>
      </tr>
    </thead>
	<%
	String bgcolor="";
	
	int count=0;
	List viewList = new ArrayList();
	Iterator  viewItr;
	int cs=0;
	
	if(request.getAttribute("projectDependency")!=null && request.getAttribute("projectDependency")!="")
	{
		List userList =  (ArrayList)request.getAttribute("projectDependency");
		Iterator itr = userList.iterator();
		
		while(itr.hasNext())
		{
			
		
			
			viewList = (ArrayList)itr.next();
			String id = viewList.get(0).toString();
			viewItr = viewList.iterator();
			cs=0;
			%>
			<tr>
			
			<%	
			while(viewItr.hasNext())
			{
			
				if(cs<=3)
				{
				%>
				
				<td bgcolor='#fce2ec'><%=viewItr.next()%></td>
				
				<%}
				else{if(cs<=6){
					
					%>
					<td bgcolor=#fcefec><%=viewItr.next()%></td>
					
					<% 
				}else{
					
					%>
					<td bgcolor='#fce2ec'><%=viewItr.next()%></td>
					
					<% 
					
				}
				
				
				}
				cs++;	
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
  
  var tables = document.getElementsByTagName('table');
for (var i=0; i<tables.length;i++){
 resizableGrid(tables[i]);
}

function resizableGrid(table) {
 var row = table.getElementsByTagName('tr')[0],
 cols = row ? row.children : undefined;
 if (!cols) return;
 
 table.style.overflow = 'hidden';
 
 var tableHeight = table.offsetHeight;
 
 for (var i=0;i<cols.length;i++){
  var div = createDiv(tableHeight);
  cols[i].appendChild(div);
  cols[i].style.position = 'relative';
  setListeners(div);
 }

 function setListeners(div){
  var pageX,curCol,nxtCol,curColWidth,nxtColWidth;

  div.addEventListener('mousedown', function (e) {
   curCol = e.target.parentElement;
   nxtCol = curCol.nextElementSibling;
   pageX = e.pageX; 
 
   var padding = paddingDiff(curCol);
 
   curColWidth = curCol.offsetWidth - padding;
   if (nxtCol)
    nxtColWidth = nxtCol.offsetWidth - padding;
  });

  div.addEventListener('mouseover', function (e) {
   e.target.style.borderRight = '2px solid #0000ff';
  })

  div.addEventListener('mouseout', function (e) {
   e.target.style.borderRight = '';
  })

  document.addEventListener('mousemove', function (e) {
   if (curCol) {
    var diffX = e.pageX - pageX;
 
    if (nxtCol)
     nxtCol.style.width = (nxtColWidth - (diffX))+'px';

    curCol.style.width = (curColWidth + diffX)+'px';
   }
  });

  document.addEventListener('mouseup', function (e) { 
   curCol = undefined;
   nxtCol = undefined;
   pageX = undefined;
   nxtColWidth = undefined;
   curColWidth = undefined
  });
 }
 
 function createDiv(height){
  var div = document.createElement('div');
  div.style.top = 0;
  div.style.right = 0;
  div.style.width = '5px';
  div.style.position = 'absolute';
  div.style.cursor = 'col-resize';
  div.style.userSelect = 'none';
  div.style.height = height + 'px';
  return div;
 }
 
 function paddingDiff(col){
 
  if (getStyleVal(col,'box-sizing') == 'border-box'){
   return 0;
  }
 
  var padLeft = getStyleVal(col,'padding-left');
  var padRight = getStyleVal(col,'padding-right');
  return (parseInt(padLeft) + parseInt(padRight));

 }

 function getStyleVal(elm,css){
  return (window.getComputedStyle(elm, null).getPropertyValue(css))
 }
};
  
  </script>
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
 </BODY>
</HTML>

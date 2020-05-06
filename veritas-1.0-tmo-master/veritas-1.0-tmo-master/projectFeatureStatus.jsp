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

.rotate {

/* Safari */
-webkit-transform: rotate(-90deg);

/* Firefox */
-moz-transform: rotate(-90deg);

/* IE */
-ms-transform: rotate(-90deg);

/* Opera */
-o-transform: rotate(-90deg);

float: left;

}

/*th 
{
  vertical-align: bottom;
  text-align: center;
}

th span 
{
  -ms-writing-mode: tb-rl;
  -webkit-writing-mode: vertical-rl;
  writing-mode: vertical-rl;
  transform: rotate(180deg);
  white-space: nowrap;
}*/
</style>

 </HEAD>

 <BODY>
   <%@ include file="viewMenuItem.jsp" %>

 <br>
<div align="center" style="font-size:280%; color:#E20074;font-family: Arial;"; > Project Feature Status </div>
<div align="center" style="font-family: Arial;" >
<table   align="center" style="border:2px double #E20074;border-style:  solid double;width: 130%;">

   <tr style="border:2px double #E20074;border-style:  solid double;">
  	
	
	
 <td><input type="text" id="myInput" onkeyup="filterResult(0,this)" placeholder="Project ID.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(2,this)" placeholder="Project Title.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(1,this)" placeholder="Project Number.."> </td>
   <td><input type="text" id="myInput" onkeyup="filterResult(1,this)" placeholder="Target Date.."> </td>
 <td><input type="text" id="myInput" onkeyup="filterResult(3,this)" placeholder="Feature ID.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(4,this)" placeholder="Feature Code.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(5,this)" placeholder="Feature Title.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(5,this)" placeholder="Feature in Agile Craft.."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(6,this)" placeholder="Reported FLD(LLD) Design Complete %.."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(7,this)" placeholder="Reported Development Complete %.."> </td>
	  <td><input type="text" id="myInput" onkeyup="filterResult(9,this)" placeholder="FLD_Complete.."> </td>
	 <td><input type="text" id="myInput" onkeyup="filterResult(8,this)" placeholder="FLD Document Location."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(9,this)" placeholder="Solution Design (HLSD) Basedlined? .."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(10,this)" placeholder="Swaggers or WSDL Completed?.."> </td>
	 <td><input type="text" id="myInput" onkeyup="filterResult(11,this)" placeholder="Swaggers or WSDL Location.."> </td>
	 	 <td><input type="text" id="myInput" onkeyup="filterResult(12,this)" placeholder="Sequence Diagrams Completed?.."> </td>
	   <td><input type="text" id="myInput" onkeyup="filterResult(13,this)" placeholder="Sequence Diagrams Location."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(14,this)" placeholder="Security Design Verified - Security Section in FLD.."> </td>
	 <td><input type="text" id="myInput" onkeyup="filterResult(15,this)" placeholder="Test Readiness Verified - Perf Section in FLD & Perf Matrix filled etc..."> </td>
	  <td><input type="text" id="myInput" onkeyup="filterResult(16,this)" placeholder="DIT Readiness.."> </td>
	    <td><input type="text" id="myInput" onkeyup="filterResult(17,this)" placeholder="QAT Readiness.."> </td>
		 <td><input type="text" id="myInput" onkeyup="filterResult(0,this)" placeholder="Production Readiness.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(1,this)" placeholder="Network Firewall Rule/Conf.."> </td>
  
  <td><input type="text" id="myInput" onkeyup="filterResult(2,this)" placeholder="Test Data Ready .."> </td>
 <td><input type="text" id="myInput" onkeyup="filterResult(3,this)" placeholder="# of Direct Epics Under Feature.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(4,this)" placeholder="EDP integration .."> </td>
  
  
  <td><input type="text" id="myInput" onkeyup="filterResult(5,this)" placeholder="Status Recorded in Agile Craft/Jira for Design.."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(6,this)" placeholder="Status Recorded in Agile Craft/Jira for development .."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(7,this)" placeholder="Status Recorded in Agile Craft/Jira for test.."> </td>
	 <td><input type="text" id="myInput" onkeyup="filterResult(8,this)" placeholder="Status Recorded in Agile Craft/Jira for deployment .."> </td>
	 
  <td><input type="text" id="myInput" onkeyup="filterResult(9,this)" placeholder="Feature Toggle.."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(10,this)" placeholder="Logging Assessment .."> </td>
	 <td><input type="text" id="myInput" onkeyup="filterResult(11,this)" placeholder="Security (Auth & Authz for API & services, PII Encryption etc.).."> </td>
	 	 <td><input type="text" id="myInput" onkeyup="filterResult(12,this)" placeholder="Telemetry Assessment.."> </td>
	   <td><input type="text" id="myInput" onkeyup="filterResult(13,this)" placeholder="Redundancy /Fail Over.."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(14,this)" placeholder="Other Patterns/Standards Compliance, Traceability, DR Gaps?.."> </td>
	 <td><input type="text" id="myInput" onkeyup="filterResult(15,this)" placeholder="Data Movement Required .."> </td>
	  <td><input type="text" id="myInput" onkeyup="filterResult(16,this)" placeholder="Data Movement initial Load design considered?.."> </td>
	    <td><input type="text" id="myInput" onkeyup="filterResult(17,this)" placeholder="Data Movement Incremental Load design considered.."> </td>
		 <td><input type="text" id="myInput" onkeyup="filterResult(7,this)" placeholder="Data Movement Recon design considered .."> </td>
		 		 <td><input type="text" id="myInput" onkeyup="filterResult(7,this)" placeholder="Notes.."> </td>
	 <td><input type="text" id="myInput" onkeyup="filterResult(8,this)" placeholder="Created on.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(9,this)" placeholder="Created By.."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(10,this)" placeholder="Last Update on.."> </td>
	 <td><input type="text" id="myInput" onkeyup="filterResult(11,this)" placeholder="Last Updated by.."> </td>
	 	
	<td><input type="button" id="btnExport" onclick="Export('Veritas_ProjectStatus_Export.xls')" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" value="Export to Excel"></td>
  </tr>
</table>


  <table id='t01'  align="center" style="border:2px double #E20074;border-style:  solid double;width: 130%;">
  <tr style="border:2px double #E20074;border-style:  solid double;">
 
 <th onclick="sortTable(0)" > <span> Project ID	</span></th>
  <th onclick="sortTable(2)" ><span> Project Title </span></th>
  <th onclick="sortTable(1)"><span>Project Number </span></th>
  	  <th onclick="sortTable(1)"><span>Target Date </span></th>
  <th onclick="sortTable(3)"><span>Feature ID</span></th>
    <th onclick="sortTable(4)"><span>Feature Code</span></th>
    <th onclick="sortTable(5)"><span>Feature Description </span></th>
	    <th onclick="sortTable(5)"><span>Feature in Agile Craft </span></th>
	
	<th onclick="sortTable(6)"><span>Reported FLD(LLD) Design Complete % </span></th>
    <th onclick="sortTable(7)"><span>Reported Development Complete % </span></th>
    <th onclick="sortTable(8)"><span>FLD_Complete </span></th>
	
	
	<th onclick="sortTable(9)"><span>FLD Document Location </span></th>
	 <th onclick="sortTable(10)"><span>Solution Design (HLSD) Basedlined?</span></th>
	 <th onclick="sortTable(11)"><span>Swaggers or WSDL Completed?</span></th>
 <th onclick="sortTable(12)"><span>Swaggers or WSDL Location </span></th>
  <th onclick="sortTable(13)"><span>Sequence Diagrams Completed? </span></th>
	 <th onclick="sortTable(14)"><span>Sequence Diagrams Location </span></th>
 <th onclick="sortTable(15)"><span>Security Design Verified - Security Section in FLD. </span></th>
 
 
 
  <th onclick="sortTable(16)"><span title=' Verified - Perf Section in FLD & Perf Matrix filled etc'>Test Readiness</span></th>
  
  

  
  
  
  
  
 <th onclick="sortTable(17)"><span> DIT Readiness </span></th>
 
	 <th onclick="sortTable(0)"><span>QAT Readiness </span></th>
  <th onclick="sortTable(1)"><span>Production Readiness </span></th>
  	 <th onclick="sortTable(2)"><span> Network Firewall Rule/Conf</span></th>
  <th onclick="sortTable(3)"><span>Test Data Ready </span></th>
    <th onclick="sortTable(4)"><span># of Direct Epics Under Feature </span></th>
    <th onclick="sortTable(5)"><span>EDP integration </span></th>
	
	<th onclick="sortTable(6)"><span title="Status Recorded">Agile Craft/Jira for Design </span></th>
    <th onclick="sortTable(7)"><span title="Status Recorded"> Agile Craft/Jira for development </span></th>
    <th onclick="sortTable(8)"><span title="Status Recorded">Agile Craft/Jira for test</span></th>
	
	
	<th onclick="sortTable(9)"><span title="Status Recorded">Agile Craft/Jira for deployment </span></th>
	 <th onclick="sortTable(10)"><span>Feature Toggle </span></th>
	 <th onclick="sortTable(11)"><span>Logging Assessment </span></th>
 <th onclick="sortTable(12)" ><span title="(Auth & Authz for API & services, PII Encryption etc.)">Security  </span></th>
  <th onclick="sortTable(13)"><span>Telemetry Assessment </span></th>
	 <th onclick="sortTable(14)"><span>Redundancy /Fail Over </span></th>
 <th onclick="sortTable(15)"><span title='Standards Compliance, Traceability, DR Gaps? '>Other Patterns</span></th>
 
 
 
  <th onclick="sortTable(16)"><span>Data Movement Required</span></th>
 <th onclick="sortTable(17)"><span title='Data Movement initial Load design considered?'> Data Movement initial Load  </span></th>
 
  <th onclick="sortTable(0)"><span title='Data Movement Incremental Load design considered'>Data Movement Incremental Load  </span></th>
  <th onclick="sortTable(1)"><span>Data Movement Recon design considered </span></th>
  	 <th onclick="sortTable(2)"><span> Notes </span></th>
  <th onclick="sortTable(3)"><span>Created on </span></th>
    <th onclick="sortTable(4)"><span>Created By </span></th>
    <th onclick="sortTable(5)"><span>Last Update on</span></span></span></span></th>
	
	<th onclick="sortTable(6)"><span>Last Updated by </span></th>
   
   
	

	
	
	
	
	
	
	
	
	
	
	
	
	
  </tr>



	<%

	String bgcolor="";
	
	int count=0;
	List viewList = new ArrayList();
	Iterator  viewItr;
	
	if(request.getAttribute("ProjectFeatureStatus")!=null && request.getAttribute("ProjectFeatureStatus")!="")
	{
		List userList =  (ArrayList)request.getAttribute("ProjectFeatureStatus");
		Iterator itr = userList.iterator();
		
		while(itr.hasNext())
		{
			
		
			
			viewList = (ArrayList)itr.next();
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


  window.addEventListener('load', function () {
    var rotates = document.getElementsByClassName('rotate');
    for (var i = 0; i < rotates.length; i++) {
        rotates[i].style.height = rotates[i].offsetWidth + 'px';
    }
});
  </script>
 </BODY>
</HTML>

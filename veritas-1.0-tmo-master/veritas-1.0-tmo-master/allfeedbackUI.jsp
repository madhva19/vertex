<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%


				List<Map<Object,Object>> hlsdStatus = new ArrayList<Map<Object,Object>>();
List<Map<Object,Object>> assessmentstatus = new ArrayList<Map<Object,Object>>();
				
					hlsdStatus=(ArrayList) request.getAttribute("hlsdStatus");
					assessmentstatus=(ArrayList) request.getAttribute("AssesmentStatus");
					int projectcount=Integer.parseInt(request.getAttribute("projectcount").toString());
					int actionItemcount=Integer.parseInt(request.getAttribute("ActionItemcount").toString());
					int average=actionItemcount/projectcount;
					
					

Gson gsonObj = new Gson();
 String dataPoints_assessmentstatus=gsonObj.toJson(assessmentstatus);
String dataPoints_hlsdStatus = gsonObj.toJson(hlsdStatus);
//AssesmentStatus
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
   


    
    
    
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  <script language="javascript">
  
  window.onload = function() { 
	  

	  var chart8 = new CanvasJS.Chart("chartContainer_Workstream1", {
	 	theme: "light2",
	 	animationEnabled: true,
	 	exportFileName: "Assessment Review Metrics",
	 	exportEnabled: true,
	 	title:{
	 		text: "Assessment Review Metrics",
	 		fontColor: "#E20074",
	 		fontFamily: "Arial",
	 		//fontStyle: "oblique",
 			fontSize: 25
	 	},
	 	legend: {
	 		verticalAlign: "center",
	 		horizontalAlign: "right"
	 	},
	 	data: [{
	 		type: "pie",
	 		showInLegend: true,
	 		legendText: "{label}",
	 		//indexLabelPlacement: "inside",
	 		toolTipContent: "{label}: <strong>{y}</strong>",
	 		indexLabel: "{label} {y}",
	 		dataPoints : <%out.print(dataPoints_hlsdStatus);%>
	 	}]
	 });
	  
	  chart8.render();
	  
	  var chart9 = new CanvasJS.Chart("chartContainer_Workstream2", {
		 	theme: "light2",
		 	animationEnabled: true,
		 	exportFileName: "Action Item count",
		 	exportEnabled: true,
		 	title:{
		 		text: "Action Item count",
		 		fontColor: "#E20074",
		 		fontFamily: "Arial",
		 		//fontStyle: "oblique",
	 			fontSize: 25
	 			
		 	},
		 	legend: {
		 		verticalAlign: "center",
		 		horizontalAlign: "right"
		 	},
		 	data: [{
		 		type: "pie",
		 		showInLegend: true,
		 		legendText: "{label}",
		 		//indexLabelPlacement: "inside",
		 		toolTipContent: "{label}: <strong>{y}</strong>",
		 		indexLabel: "{label} {y}",
		 		dataPoints : <%out.print(dataPoints_assessmentstatus);%>
		 	}]
		 });
		  
		  chart9.render();
  
  
  
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
 
table#t01 th {
  background-color: E20074;
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
   text-align: left;
   font-family: Arial;
}
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
 table#t01 tr:nth-child(even) {
  background-color: #fce2ec;
}
table#t01 tr:nth-child(odd) {
 background-color: #fff;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}
#left {
    width: 40%;

    display: inline-block;
     vertical-align: top;
    white-space: normal;
}
#center {
  
     vertical-align: bottom;
   
      position: fixed;
       
        left: 38%;
      
     
        
        text-align:center;
}
#right {
    width: 38%;

    display: inline-block;
     vertical-align: top;
    white-space: normal;
}
.parent 
{
    white-space: nowrap;
    width: 100%;
 
     margin: 10;
}


#rightest {
    width: 16%;
   text-align:left;
    display: inline-block;
     vertical-align: top;
    white-space: normal;
   
    color: #E20074;
		 		font-Family: Arial;		 		
	 			font-Size: 20;
    
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


 <div class="parent" align="center">
<div id="left" border=2>
 

<div id="chartContainer_Workstream1" style="height: 370px; "></div>

</div>
<div id="right" >
 
 
<div id="chartContainer_Workstream2" style="height: 370px; "></div>

</div>

<div id="rightest" style="height: 10; " >
<fieldset>
  <legend>Summary</legend>
  Reviews Conducted : <%=projectcount %><br>
  Action Items (AI) : <%=actionItemcount %><br>
  Average AIs per Review : <%=average %>

</fieldset>
</div>
</div>
<div align="center" style="font-family: Arial;" >
<table   align="center" style="border:2px double #E20074;border-style:  solid double;" cellpadding="10">
  <%@ include file="search.jsp" %>
<!-- <thead>
   <tr style="border:2px double #E20074;border-style:  solid double;">
    <td width=80% colspan=3>
      <input type="text" id='txt_searchall'  placeholder="Search by Project ID/Number or Project Title " >
    </td>
    <td><i class="fa fa-file-excel-o fa-2x" aria-hidden="true" title="Export to Excel" onclick="Export('Veritas_ProjectFeedback_Export.xls')"></i></td>
  </tr>
</thead> -->
</table>

<table id='t01'  align="center" style="border:2px double #E20074;border-style:  solid double;" cellpadding="10">
  
  <thead>
    <tr style="border:2px double #E20074;border-style:  solid double;height:40px;">
      <th width=6% onclick="SortTable(1,'T');">Veritas ID </th>
      <th width=6% onclick="SortTable(1,'T');">Project ID </th>
      <th width=20% onclick="SortTable(2,'T');">Project Title </th>
      <th onclick="SortTable(3,'T');">Review Comment </th>
      <th width=6% onclick="SortTable(4,'T');">Impact </th>
      <th onclick="SortTable(5,'N')">Notes </th>
      <th width=8.5% >Action</th>
    </tr>
  </thead>

	<%
	String bgcolor="";
	int count=0;
	List viewList = new ArrayList();
	Iterator  viewItr;
	
	if(request.getAttribute("hlsdList")!=null && request.getAttribute("hlsdList")!="")
	{
		List userList =  (ArrayList)request.getAttribute("hlsdList");
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
				
				<td ><%=viewItr.next()%></td>
				
				<%
					
			}
			count++;
			%>
			
				<td><input type="button" name="view" value="View Project" style="border:0;background-color: #E20074;border-radius: 50px;width:90px; font-family: Arial; font-size: 11px; font-weight: bold;height:30px;color:#ffffff;"   onclick="viewNote(<%=id%>);" ></td>
				
			</tr>
			<%
		}
	}
	if(count==0)
	{
		%>
	
            <tr><td colspan="7" align="center">No Record Available</td></tr>
		<%
	}
	%>
     <tr><td align="center" height="2px"></td></tr>
  </table>	
  </div>

  <script>
  /*
  function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("t01");
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:
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
      and mark that a switch has been done:
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
  
  
  
  */
 

var TableIDvalue = "t01";

//
//////////////////////////////////////
var TableLastSortedColumn = -1;
function SortTable() {
var sortColumn = parseInt(arguments[0]);
var type = arguments.length > 1 ? arguments[1] : 'T';
var dateformat = arguments.length > 2 ? arguments[2] : '';
var table = document.getElementById(TableIDvalue);
var tbody = table.getElementsByTagName("tbody")[0];
var rows = tbody.getElementsByTagName("tr");"th"
var arrayOfRows = new Array();
type = type.toUpperCase();
dateformat = dateformat.toLowerCase();
for(var i=0, len=rows.length; i<len; i++) {
	arrayOfRows[i] = new Object;
	arrayOfRows[i].oldIndex = i;
	var celltext="";
	if (rows[i].getElementsByTagName("td")[sortColumn]!=undefined)
	{
	 celltext = rows[i].getElementsByTagName("td")[sortColumn].innerHTML.replace(/<[^>]*>/g,"");
	}
	if( type=='D' ) { arrayOfRows[i].value = GetDateSortingKey(dateformat,celltext); }
	else {
		var re = type=="N" ? /[^\.\-\+\d]/g : /[^a-zA-Z0-9]/g;
		arrayOfRows[i].value = celltext.replace(re,"").substr(0,25).toLowerCase();
		}
	}
if (sortColumn == TableLastSortedColumn) { arrayOfRows.reverse(); }
else {
	TableLastSortedColumn = sortColumn;
	switch(type) {
		case "N" : arrayOfRows.sort(CompareRowOfNumbers); break;
		case "D" : arrayOfRows.sort(CompareRowOfNumbers); break;
		default  : arrayOfRows.sort(CompareRowOfText);
		}
	}
var newTableBody = document.createElement("tbody");
for(var i=0, len=arrayOfRows.length; i<len; i++) {
	newTableBody.appendChild(rows[arrayOfRows[i].oldIndex].cloneNode(true));
	}
table.replaceChild(newTableBody,tbody);
} // function SortTable()

function CompareRowOfText(a,b) {
var aval = a.value;
var bval = b.value;
return( aval == bval ? 0 : (aval > bval ? 1 : -1) );
} // function CompareRowOfText()

function CompareRowOfNumbers(a,b) {
var aval = /\d/.test(a.value) ? parseFloat(a.value) : 0;
var bval = /\d/.test(b.value) ? parseFloat(b.value) : 0;
return( aval == bval ? 0 : (aval > bval ? 1 : -1) );
} // function CompareRowOfNumbers()

function GetDateSortingKey(format,text) {
if( format.length < 1 ) { return ""; }
format = format.toLowerCase();
text = text.toLowerCase();
text = text.replace(/^[^a-z0-9]*/,"");
text = text.replace(/[^a-z0-9]*$/,"");
if( text.length < 1 ) { return ""; }
text = text.replace(/[^a-z0-9]+/g,",");
var date = text.split(",");
if( date.length < 3 ) { return ""; }
var d=0, m=0, y=0;
for( var i=0; i<3; i++ ) {
	var ts = format.substr(i,1);
	if( ts == "d" ) { d = date[i]; }
	else if( ts == "m" ) { m = date[i]; }
	else if( ts == "y" ) { y = date[i]; }
	}
d = d.replace(/^0/,"");
if( d < 10 ) { d = "0" + d; }
if( /[a-z]/.test(m) ) {
	m = m.substr(0,3);
	switch(m) {
		case "jan" : m = String(1); break;
		case "feb" : m = String(2); break;
		case "mar" : m = String(3); break;
		case "apr" : m = String(4); break;
		case "may" : m = String(5); break;
		case "jun" : m = String(6); break;
		case "jul" : m = String(7); break;
		case "aug" : m = String(8); break;
		case "sep" : m = String(9); break;
		case "oct" : m = String(10); break;
		case "nov" : m = String(11); break;
		case "dec" : m = String(12); break;
		default    : m = String(0);
		}
	}
m = m.replace(/^0/,"");
if( m < 10 ) { m = "0" + m; }
y = parseInt(y);
if( y < 100 ) { y = parseInt(y) + 2000; }
return "" + String(y) + "" + String(m) + "" + String(d) + "";
} // function GetDateSortingKey()


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


  
  
  
  
  
  
  
  
  
  
  
var doc = new jsPDF();
var elementHTML = $('#contnet').html();
var specialElementHandlers = {
    '#elementH': function (element, renderer) {
        return true;
    }
};
doc.fromHTML(elementHTML, 15, 15, {
    'width': 170,
    'elementHandlers': specialElementHandlers
});

// Save the PDF
doc.save('sample-document.pdf');
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  </script>
  

  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
 </BODY>
</HTML>

<%@ page language="java" import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
   
 
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
 <script src="jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="daypilot-all.min.js?v=2018.2.232" type="text/javascript"></script>
  
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
<div align="center" style="font-size:280%; color:#E20074; font-family: Arial;" > Review - Calendar and Status  </div>
<br>
<div style="float:left; width: 150px;">
    <div id="nav"></div>
</div>
<div style="margin-left: 150px;">
    <div id="dp"></div>
</div>
<div align="center" style="font-family: Arial;" >
<table  align="center" style="border:2px double #E20074;border-style:  solid double;">

   <tr style="border:2px double #E20074;border-style:  solid double;">
  
 <td><input type="text" id="myInput" onkeyup="filterResult(0,this)" placeholder="Search for Project ID.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(1,this)" placeholder="Search for Project Number.."> </td>
 <td><input type="text" id="myInput" onkeyup="filterResult(2,this)" placeholder="Search for Project Tittle.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(3,this)" placeholder="Search for Review Date.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(4,this)" placeholder="Review Status .."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(5,this)" placeholder="Search for BRD Baslined.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(6,this)" placeholder="Search for HLSD Received.."> </td>
 <td><input type="text" id="myInput" onkeyup="filterResult(7,this)" placeholder="Search for HLSD Review With Biz.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(8,this)" placeholder="Search for Attendees Received.."> </td>
    <td><input type="text" id="myInput" onkeyup="filterResult(9,this)" placeholder="Search for Doc Sent To Reviewer.."> </td>
	<td><input type="text" id="myInput" onkeyup="filterResult(10,this)" placeholder="Search for Review Dec Received.."> </td>
  <td><input type="text" id="myInput" onkeyup="filterResult(11,this)" placeholder="Search for Meeting Notes/AIs Sent.."> </td>
   <td><input type="text" id="myInput" onkeyup="filterResult(12,this)" placeholder="Search for contacts .."> </td>

   	<td><input type="button" id="btnExport" onclick="Export('Veritas_ProjectReview_Export.xls')" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" value="Export to Excel"></td>
  </tr>
</table>


  <table id='t01'  align="center" style="border:2px double #E20074;border-style:  solid double;">
   <thead>
  <tr style="border:2px double #E20074;border-style:  solid double;">
  
  
   <th onclick="SortTable(0,'N')">Project ID </th>
 <th onclick="SortTable(1,'T')">Project Number </th>
 <th onclick="SortTable(2,'T')">Project Type </th>
  <th onclick="SortTable(3,'T')">Project Title </th>
  <th onclick="SortTable(4,'T')">Work Stream  </th>
    <th onclick="SortTable(5,'T')">Review Type </th>
  <th onclick="SortTable(6,'D','ymd')">Review Date </th>
  <th onclick="SortTable(6,'T')">Review Status </th>
   <th onclick="SortTable(7,'T')">BRD Baslined </th>
  <th onclick="SortTable(8,'T')">HLSD Received</th>
  <th onclick="SortTable(9,'T')">HLSD Review With Biz</th>
 <th onclick="SortTable(10,'T')">Attendees Received </th>
  <th onclick="SortTable(11,'T')">Doc Sent To Reviewer</th>
    <th onclick="SortTable(12,'T')">Review Dec Received</th>
	 <th onclick="SortTable(13,,'T')">Meeting Notes/AIs Sent</th>
  <th onclick="SortTable(14,,'T')">Contacts</th>
   
	<th>Action</th>
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
				
				<td><%=viewItr.next()%></td>
			
			
		
				<%
					
			}
			count++;
			%>
			
				<td><input type="button" name="view" value="View Project" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="viewNote(<%=id%>);" ></td>
				
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
  
   var nav = new DayPilot.Navigator("nav");
    nav.showMonths = 3;
    nav.selectMode = "month";
    nav.onTimeRangeSelected = function(args) {
        dp.startDate = args.start;
        dp.update();
    };
    nav.init(); 
  
  
  
   var dp = new DayPilot.Month("dp");
   dp.cellWidth = 40;
   dp.eventHeight = 45;
   dp.headerHeight = 35;
   
			  <%
			  
			 
	List viewList1 = new ArrayList();
	String eventColor="grey";
	
	if(request.getAttribute("hlsdList")!=null && request.getAttribute("hlsdList")!="")
	{
		List userList1 =  (ArrayList)request.getAttribute("hlsdList");
		Iterator itr1 = userList1.iterator();
		
		while(itr1.hasNext())
		{
			viewList1 = (ArrayList)itr1.next();
			if(!viewList1.get(7).toString().equalsIgnoreCase("Record_Added")&& !viewList1.get(7).toString().equalsIgnoreCase("To be Scheduled"))
			{		
			
			String date = viewList1.get(6).toString();
			String ProjectType=viewList1.get(2).toString();
	if(ProjectType.trim().equalsIgnoreCase("TMobileLegacy"))
		{
		
		if(viewList1.get(5)!=null && viewList1.get(5).toString().trim().equalsIgnoreCase("Assessment Review"))
		{
			ProjectType="EAC AD : ";
			eventColor="#c9fde2";
		}else{
		
ProjectType="EAC HLSD : ";
eventColor="#ffdfeb";
		}
	} else
	{
		ProjectType="JRDB : ";
		eventColor="#c6d6fa";
	}		
			  String ProjectTitle =ProjectType+ viewList1.get(3).toString();
			  
			
			%>
			
				
				
			    var e = new DayPilot.Event({
			 			  
            start: new DayPilot.Date("<%=date%>"),
            end: new DayPilot.Date("<%=date%>"),
              id: <%=viewList1.get(0).toString()%>,
            text: "<%=ProjectTitle%>"
            	
        });
			    
			    e.data.backColor = '<%=eventColor%>';
        dp.events.add(e);
  

    // event creating
    
			<%}}}%>
   

  
  dp.onEventClicked = function(args) {
	  viewNote(args.e.id())
  //alert("clicked: " + args.e.text());
};
   
    dp.init();
  
  
  
  
  
  
  
  
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
  
  </script>
 </BODY>
</HTML>

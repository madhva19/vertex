<%@ page language="java" import="java.util.*" errorPage="error.html"%>

<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 


					
		




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
    <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
   
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   
  
  <script language="javascript">

  function viewNote(id){
	   
	    window.location.href="viewNoteServlet/"+id; 
	  }


  function viewEAC(id){
	   
	    window.location.href="queryEACfeedback/"+id; 
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



table#t01 td {
  text-align: center;
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
th {
  cursor: pointer;
  font-family:Arial;
  font-size:12px;
  
}
i {
  cursor: pointer;
  font-family:Arial;
  font-size:12px;
  
}
td {
  
  font-family:Arial;
  font-size:11px;
   
  overflow: hidden;
  text-overflow: ellipsis;
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
.dont-break-out {

  /* These are technically the same, but use both */
  overflow-wrap: break-word;
  word-wrap: break-word;

  -ms-word-break: break-all;
  /* This is the dangerous one in WebKit, as it breaks things wherever */
  word-break: break-all;
  /* Instead use this non-standard one: */
  word-break: break-word;

  /* Adds a hyphen where the word breaks, if supported (No Blink) */
  -ms-hyphens: auto;
  -moz-hyphens: auto;
  -webkit-hyphens: auto;
  hyphens: auto;

}



a.morelink {
color: #0254EB
	text-decoration:none;
	outline: none;
}
.morecontent span {
	display: none;
}
.comment {
	
	
	margin: 10px;
}


</style>

 </HEAD>

 <BODY >
   <%@ include file="viewMenuItem.jsp" %>

 <br>
 
<ul class="breadcrumb" style="background-color:white;">
  <li><a href='/Veritas/home/'>Home</a></li>
  <li><a href="#" style="color:black;">Review Dashboard</a></li>
  
</ul>
<div align="center" style="font-size:280%; color:#E20074; font-family: Arial; " > Review Dashboard </div> 

<div align="center" >

<table   align="center" style="border:2px double #E20074;border-style:  solid double; font-family: Arial;" width=95%>
	<%@ include file="search.jsp" %>
<!-- <thead>
   <tr  style="border:2px double #E20074;border-style:  solid double;">
   <td width=60% colspan=3>
  <input type="text" id='txt_searchall'  placeholder="Search by Project ID/Number or Project Title " >
  </td>

	<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
	<td width=40% align =center>
	<i class="fa fa-file-excel-o fa-2x" aria-hidden="true" title="Export to Excel" onclick="Export('Veritas_Project_Export.xls')"></i></td>
	<%}%>
  </tr>
  </thead> -->
</table>

  <table id='t01'  align="center" style="border-collapse: collapse;" style="overflow-x:auto;">

 <thead>


<tr style="border:2px double #E20074;border-style:  solid double;height:40px;" >
  
 <th  align="left" width=8% onclick="SortTable(0,'N')">Summary Id </th>
  <th  align="left" width=10% onclick="SortTable(1,'T')">Clarity Project Id </th>
 
 <th align="left" width=20% onclick="SortTable(2,'T')">Clarity Project Name </th>
  
  <th align="left" width=15% onclick="SortTable(3,'T')">Lead Architect </th>
  <th align="left" width=15% onclick="SortTable(4,'T')">EAC Architect </th>
   <th align="left" width=10% onclick="SortTable(5,'T')"> Review Type  </th>
 <th align="left" width=10% onclick="SortTable(6,'D','ymd')"> Review Date  </th>
  <th align="left" width=10% onclick="SortTable(7,'T')">Review Status</th>
  <th align="left" width=10%>Feedback </th>
   
 
   
	
	<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
	<th width=5%>Summary</th>
	<%}%>
  </tr>

  </thead>
  
  
  
	<%
	





Gson gsonObj = new Gson();





	
	
	String bgcolor="";
	int count=0;
	List viewList = new ArrayList();
	Iterator  viewItr;
	
	if(request.getAttribute("projectList")!=null && request.getAttribute("projectList")!="")
	{
		List userList =  (ArrayList)request.getAttribute("projectList");
		
		String dataPoints_projDep = gsonObj.toJson(userList);
		dataPoints_projDep=dataPoints_projDep.replace("\\u0026", "&");
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
			
			<tr>
			
			<%	
			while(viewItr.hasNext())
			{
			
				%>
				 
				<td class="dont-break-out" style="text-align: left;"><%=viewItr.next()%>
				</td>
				
				<%
					
			}
			
			count++;
			if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){
			%>
			<td style="text-align: left;"><i class="fa fa-comment-alt fa-2x" aria-hidden="true" onclick="viewEAC(<%=id%>);" ></i></td>
			<td style="text-align: left;"><i class="fa fa-arrow-circle-right fa-2x" aria-hidden="true" onclick="viewNote(<%=id%>);" ></i></td>
				
				<%}%>
	
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
   
	
  </table>	
  </div>
  
  
  
  
  <script type="text/javascript">


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
var rows = tbody.getElementsByTagName("tr");
var arrayOfRows = new Array();
type = type.toUpperCase();
dateformat = dateformat.toLowerCase();
for(var i=0, len=rows.length; i<len; i++) {
	arrayOfRows[i] = new Object;
	arrayOfRows[i].oldIndex = i;
	var celltext = rows[i].getElementsByTagName("td")[sortColumn].innerHTML.replace(/<[^>]*>/g,"");
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
</script>

  
  
  
 </BODY>
</HTML>

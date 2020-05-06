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
   font-family: Arial;
  
  color: white;
}
table {
	
	 margin: 30px;
}



table#t01 td {
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
<div align="center" style="font-size:280%; color:#E20074; font-family: Arial;"; > Feature List </div>

<div align="center" style="font-family: Arial;" >
<table  align="center" style="border:2px double #E20074;border-style:  solid double;" class="bordered">

   <tr style="border:2px double #E20074;border-style:  solid double;">
  
 <td align='center' ><input type="text" id="myInput" onkeyup="filterResult(0,this)" placeholder="Search for Feature ID  .."> </td>
  <td width= 290px align='center'><input type="text" width= 290px id="myInput" onkeyup="filterResult(1,this)" placeholder="Search for Feature Title.."> </td>
  <td width= 415px align='center' ><input type="text" id="myInput" onkeyup="filterResult(2,this)" placeholder="Search for Dependent Feature.."> </td>
 <td width= 295px align='center'><input type="text" id="myInput" onkeyup="filterResult(3,this)" placeholder="Search for Feature Code.."> </td>
  <td width= 215px align='center'><input type="text" id="myInput" onkeyup="filterResult(4,this)" placeholder="Search for ProjectID.."> </td>
 
	<td width= 310px align='center'> <input type="button" id="btnExport" onclick="Export('Veritas_Feature.xls')" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" value="Export to Excel"></td>
  </tr>
</table>



  <table id='t01'   align="center" style="border:2px double #E20074;border-style:  solid double;">
  <tr style="border:2px double #E20074;border-style:  solid double;">
  
  
  
 <th>FeatureID </th>
  <th>Feature Title </th>

 <th>Dependent Feature </th>
  <th>Feature Code</th>
  <th>ProjectID </th>
 
	<th>Action</th>
  </tr>



	<%
	String bgcolor="";
	int count=0;
	List viewList = new ArrayList();
	Iterator  viewItr;
	
	if(request.getAttribute("featureList")!=null && request.getAttribute("featureList")!="")
	{
		List userList =  (ArrayList)request.getAttribute("featureList");
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
			String id = viewList.get(4).toString();
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
			
				<td> <% if(!id.equalsIgnoreCase("0")){%><input type="button" name="view" value="View Project" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="viewNote(<%=id%>);" > <%}%></td>
				
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
 </BODY>
</HTML>

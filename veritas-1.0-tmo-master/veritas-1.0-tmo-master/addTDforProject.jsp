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

    <script src="/Veritas/alert.js"></script>
  <link rel="stylesheet" href="/Veritas/alert.css">
<script>
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


function FormValidation(){
	
	 replaceSpecialChar(document.getElementById('tdDetails'));

    var fn=document.getElementById('tdDetails').value;

    if(fn == ""){
		 swal("Error!","Please Enter Technical Debt Details", "error");
     
        document.getElementById('tdDetails').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('tdDetails').style.borderColor = "green";
    }
	fn=document.getElementById('td_Status').value;
    if(fn == ""){
		 swal("Error!","Please Enter Technical Debt  status","error");
     
        document.getElementById('td_Status').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('td_Status').style.borderColor = "green";
    }
   fn=document.getElementById('td_Org').value;
    if(fn == ""){
		 swal("Error!","Please Enter from which prject stage Technical Debt identified" ,"error");
     
        document.getElementById('td_Org').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('td_Org').style.borderColor = "green";
    }
}



function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }




</script>
<style>
  .bordered {
   
    border: 2px dashed #FF0099;
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
	HashMap feature=new HashMap();
	Iterator  viewItr;
	
	if(session.getAttribute("projectDescription")!=null && session.getAttribute("projectDescription")!="")
	{
		 viewMap =  (HashMap)session.getAttribute("projectDescription");
		 count=1;
	}
	
	
	String tdDetails ="";
	String td_Status ="";
	String td_Org ="";
	String td_Just ="";
	String td_team ="";
	String tdid="";

	
	
	if(request.getParameter("tdDetails") !=null && !request.getParameter("tdDetails").toString().equalsIgnoreCase("null"))
	{
		tdDetails=request.getParameter("tdDetails");
	}
	
	if(request.getParameter("td_Status") !=null && !request.getParameter("td_Status").toString().equalsIgnoreCase("null"))
	{
		td_Status=request.getParameter("td_Status");
	}
	
	if(request.getParameter("td_Org") !=null  && !request.getParameter("td_Org").toString().equalsIgnoreCase("null"))
	{
		td_Org=request.getParameter("td_Org");
	}if(request.getParameter("td_Just") !=null  && !request.getParameter("td_Just").toString().equalsIgnoreCase("null"))
	{
		td_Just=request.getParameter("td_Just");
	}if(request.getParameter("td_team") !=null  && !request.getParameter("td_team").toString().equalsIgnoreCase("null"))
	{
		td_team=request.getParameter("td_team");
	}
	if(request.getParameter("tdid") !=null  && !request.getParameter("tdid").toString().equalsIgnoreCase("null"))
	{
		tdid=request.getParameter("tdid");
	}

	
	
	
	
	
	
	
	
	
	%>
	
<ul class="breadcrumb" style="background-color:white;">
  <li><a href='/Veritas/home/'>Home</a></li>
  <li><a href="/Veritas/ViewAllProject">Review Dashboard</a></li>
    <li><a href="/Veritas/viewNoteServlet/<%=viewMap.get("ProjectID") %>" ><%=viewMap.get("ProjectTitle")%></a></li>
    <li><a href="#" style="color:black;">Technical Debt</a></li>
</ul>	 


<div align="center" style="font-size:280%; color:#FF0099"; > Technical Debt for the Project : <%=viewMap.get("ProjectTitle")%></div>
<br><br><br>
<table align="center" width="1000px" style="border:2px double #FF0099;width:50%; border-style:  solid double;" id="newlink"  class=bordered cellpadding="15" >



<form name="userform" method="get" action="addTD" onsubmit="return FormValidation();"  >



<tr>
		<td style="font-weight:bold; text-align:left;font-size:15px;color:#e20074;" >Project Number: </td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"> <%=viewMap.get("ProjectNumber")%></td>
		<input type=hidden name="projectID" Value= '<%=viewMap.get("ProjectID")%>'> 
	</tr>
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;" >Project Tittle: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"> <%=viewMap.get("ProjectTitle")%></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;">Project Description: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"> <%=viewMap.get("ProjectDescription")%></td>
	</tr>
	


	
	
	
		
		<tr class=trbordered>
		 <td style="font-weight:bold;text-align:left;" >Technical Debt Details
		 </td> <td style="font-weight:bold;text-align:left;">
		  <textarea name="tdDetails" id="tdDetails"
          rows="3" cols="33" onkeypress="return blockSpecialChar(event);" placeholder=" this will be the example text to show how to capture nd write TD details.."><%=tdDetails %></textarea>
          
          </tr>
          <tr>
	
		  <td style="font-weight:bold;text-align:left;" ><div class="tooltip"> Status <font style="font-weight:bold; text-align:left;color:#e20074;">?
		  <span class="tooltiptext">Fixing it or New Technical debt</span></div>
		
		  </td> <td style="font-weight:bold;text-align:left;"><input type="text" id="td_Status" name="td_Status" value="<%=td_Status%>"> </td>
		  </tr>
		  <tr>
		  <td style="font-weight:bold;text-align:left;" >
		  
		   <div class="tooltip"> Identified <font style="font-weight:bold; text-align:left;color:#e20074;">?
		  <span class="tooltiptext">During HLSD,Assessment or LLD</span></div>
		  
		 
		  </td> <td style="font-weight:bold;text-align:left;"><input type="text" name="td_Org" value="<%=td_Org %>"> </td>  
			
	</tr>
  <tr>
		  <td style="font-weight:bold;text-align:left;" >
		  
		Justification 
		  </td> <td style="font-weight:bold;text-align:left;"><input type="text" name="td_Just" value="<%=td_Just %>" placeholder="Template.."> </td>  
			
	</tr>
	  <tr>
		  <td style="font-weight:bold;text-align:left;" >
		  
		    <div class="tooltip"> Team <font style="font-weight:bold; text-align:left;color:#e20074;">?
		  <span class="tooltiptext">Name of team who will own it</span></div>
		
		
		  </td> <td style="font-weight:bold;text-align:left;"><input type="text" name="td_team" value="<%=td_team %>"> </td>  
			
	</tr>
	
	
	
	
	
	<%if(request.getParameter("action")!=null)
			
			{%>
				<input type=hidden name="action" value="update">
				<input type=hidden name="tdid" value="<%=tdid%>">
			<%}%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Save" style="border:0;background-color: #FF0099;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;" ></td>
	</tr>
	<tr><td colspan=2 align="center" height="10px"></td></tr>
	
</form>
</table>



</body>
</html>



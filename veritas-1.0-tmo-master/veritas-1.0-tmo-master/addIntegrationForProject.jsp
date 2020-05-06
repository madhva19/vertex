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

 function blockSpecialChar(e)
{
var k;
document.all ? k = e.keyCode : k = e.which;
//alert(k);
return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57) || k == 190 || k == 188 || k==44 || k==46);
} 
function FormValidation(){

    var fn=document.getElementById('trdDetails').value;

    if(fn == ""){
		 swal("Error!","Please Enter Delivery Risk Details", "error");
     
        document.getElementById(trdDetails).style.borderColor = "red";
        return false;
    }else{
        document.getElementById(trdDetails).style.borderColor = "green";
    }
	fn=document.getElementById('dr_Status').value;
    if(fn == ""){
		 swal("Error!","Please Enter Delivery Risk  status","error");
     
        document.getElementById('dr_Status').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('dr_Status').style.borderColor = "green";
    }
   fn=document.getElementById('td_Org').value;
    if(fn == ""){
		 swal("Error!","Please Enter from which prject stage Delivery Risk identified" ,"error");
     
        document.getElementById('dr_Org').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('dr_Org').style.borderColor = "green";
    }
	
	fn=document.getElementById('dr_type').value;
    if(fn == ""){
		 swal("Error!","Please Enter  Delivery Risk Type" ,"error");
     
        document.getElementById('dr_type').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('dr_type').style.borderColor = "green";
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
   
    border: 2px dashed #E20074;
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
	%>
	<ul class="breadcrumb" style="background-color:white;">
  <li><a href='/Veritas/home/'>Home</a></li>
  <li><a href="/Veritas/ViewAllProject">Review Dashboard</a></li>
    <li><a href="/Veritas/viewNoteServlet/<%=viewMap.get("ProjectID") %>" ><%=viewMap.get("ProjectTitle")%></a></li>
    <li><a href="#" style="color:black;">Integration Point</a></li>
</ul>	 
	

<div align="center" style="font-size:280%; color:#E20074;" > Integration Point for  : <%=viewMap.get("ProjectNumber")%></div>

<table align="center"  style="border:2px double #E20074;border-style:  solid double;width:40%" id="newlink"  >



<form name="userform" method="get" action="addIntegration" onsubmit="return FormValidation();"  >


	<tr>
		<td style="font-weight:bold; text-align:left;font-size:15px;color:#e20074;" >Project Number: </td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"> <%=viewMap.get("ProjectNumber")%>
		<input type=hidden name="projectID" Value= '<%=viewMap.get("ProjectID")%>'> </td>
	</tr>
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;" >Project Tittle: </td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"> <%=viewMap.get("ProjectTitle")%></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;">Project Description: </td> 
		
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"> <%=viewMap.get("ProjectDescription")%></td>
	</tr>
	

  
		
		<%
	
	String ProjectID  ="";
	String iTDID ="";
	String IT_Type ="";
	String IT_Method ="";
	String ITC_Name ="";
	String ITC_Owner ="";
	String ITC_Consumer ="";
	String ITC_add_details="";

	if(request.getParameter("ProjectID") !=null)
	{
		ProjectID=request.getParameter("ProjectID");
	}
	if(request.getParameter("iTDID") !=null)
	{
		iTDID=request.getParameter("iTDID");
	}
	if(request.getParameter("IT_Type") !=null)
	{
		IT_Type=request.getParameter("IT_Type");
	}
	
	if(request.getParameter("IT_Method") !=null)
	{
	IT_Method=request.getParameter("IT_Method");
	}
	
	if(request.getParameter("ITC_Name") !=null)
	{
	ITC_Name=request.getParameter("ITC_Name");
	}if(request.getParameter("ITC_Owner") !=null)
	{
	ITC_Owner=request.getParameter("ITC_Owner");
	}if(request.getParameter("ITC_Consumer") !=null)
	{
	ITC_Consumer=request.getParameter("ITC_Consumer");
	}
	if(request.getParameter("ITC_add_details") !=null)
	{
	ITC_add_details=request.getParameter("ITC_add_details");
	}
	
	%>
		
			
		
		
		<tr >
		  <td style="font-weight:bold;text-align:left;">Integration Type</td>
		  <td style="font-weight:bold;text-align:left;">
		  <select name="IT_Type" >
		  <option value="<%=IT_Type%>" selected><%=IT_Type%></option>
		 <option value="File">File</option>
		  <option value="REST_API">REST_API</option>
		 <option value="Service">Service</option>
    <option value="Event">Event</option>
    <option value="UI_Handoff">UI_Handoff</option>
    
          </select>  </td>
          
          	</tr><tr>
		  
		 <td style="font-weight:bold;text-align:left;">Method</td>
		 <td style="font-weight:bold;text-align:left;">
		 <select name="IT_Method" >
		  <option value="<%=IT_Method%>" selected><%=IT_Method%></option>
		 <option value="SFG">SFG</option>
		 <option value="SFG">EDI</option>
		  <option value="Informatica">Informatica</option>
		 <option value="GoldenGate">GoldenGate</option>
    <option value="S3">S3</option>
    <option value="Rest">Rest</option>
    <option value="SOAP">SOAP</option>
	 <option value="Deep">Deep</option>
	 	 <option value="OtherEvent">OtherEvent</option>
		 <option value="Azure_Data_Factory">Azure Data Factory</option> 
		 <option value="Sqoop">Sqoop</option>
		 
		  
		  <option value="handoff">handoff</option>
          </select> 

		 
	</td>
	
		</tr><tr>
	
		 <td style="font-weight:bold;text-align:left;">Integration Component  Name</td>
		 <td style="font-weight:bold;text-align:left;">
		 <input type="text" id="ITC_Name" name="ITC_Name" value="<%=ITC_Name%>" onkeypress="return blockSpecialChar(event);"> </td>
		  
		  </tr><tr>
		 <td style="font-weight:bold;text-align:left;">Integration Component Owner</td>
		 <td style="font-weight:bold;text-align:left;">
		 <input type="text" name="ITC_Owner" id="ITC_Owner" value="<%=ITC_Owner%>" onkeypress="return blockSpecialChar(event);"> </td>
		 
		 	</tr><tr>
		 
		<td style="font-weight:bold;text-align:left;">Integration Component Consumer </td>
		<td style="font-weight:bold;text-align:left;">
		<input type="text" name="ITC_Consumer" id="ITC_Consumer" value="<%=ITC_Consumer%>" onkeypress="return blockSpecialChar(event);"> 
		
			<%if(request.getParameter("action")!=null)
			
			{%>
				<input type=hidden name="action" value="update">
				<input type=hidden name="iTDID" value="<%=iTDID%>">
			<%}%>
		<input type=hidden name="projectID" Value='<%=viewMap.get("ProjectID")%>' >
		
		  </td>
			
	</tr>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
	<tr>
		 <td style="font-weight:bold;text-align:left;">Firewall Port/Rule (Optional) </td>
		 <td style="font-weight:bold;text-align:left;">
		 <input type="text" name="ITC_add_details" id="ITC_add_details" value="<%=ITC_add_details%>" onkeypress="return blockSpecialChar(event);"> </td>
		
		</tr><tr>
		
		
		<td colspan=2><input type="submit" name="Submit" value="Save" ></td>
	</tr>
	
	
</form>
</table>



</body>
</html>



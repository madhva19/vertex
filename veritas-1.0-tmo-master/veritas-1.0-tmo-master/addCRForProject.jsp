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

    var fn=document.getElementById('cr_num').value;

    if(fn == ""){
		 swal("Error!","Please Enter CR Number", "error");
     
        document.getElementById('cr_num').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('cr_num').style.borderColor = "green";
    }
	fn=document.getElementById('crDetails').value;
    if(fn == ""){
		 swal("Error!","Please Enter CR Details","error");
     
        document.getElementById('crDetails').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('crDetails').style.borderColor = "green";
    }
   fn=document.getElementById('cr_size').value;
    if(fn == ""){
		 swal("Error!","Please Enter CR Size" ,"error");
     
        document.getElementById('cr_size').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('cr_size').style.borderColor = "green";
    }
	
	
	fn=document.getElementById('cr_System').value;
    if(fn == ""){
		 swal("Error!","Please Enter  CR Impcated System" ,"error");
     
        document.getElementById('cr_System').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('cr_System').style.borderColor = "green";
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
    <li><a href="#" style="color:black;">Add CR</a></li>
</ul>	 
	

<div align="center" style="font-size:280%; color:#E20074"; > Add CR for : <%=viewMap.get("ProjectTitle")%></div>

<table align="center"  style="border:2px double #E20074;width:40%; border-style:  solid double;" id="newlink"  class=bordered cellpadding="6" >




<form name="userform" method="get" action="addCR" onsubmit="return FormValidation();"  >


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
	String crID ="";
	String crDetails ="";
	String cr_add ="";
	String JRDBDetails ="";
	String cr_num ="";
	String cr_Recom ="";
	String cr_size="";
	String cr_System="";
	String cr_loc="";

	if(request.getParameter("ProjectID") !=null)
	{
		ProjectID=request.getParameter("ProjectID");
	}
	if(request.getParameter("crID") !=null)
	{
		crID=request.getParameter("crID");
	}
	if(request.getParameter("crDetails") !=null)
	{
		crDetails=request.getParameter("crDetails");
	}
	
	if(request.getParameter("cr_add") !=null)
	{
	cr_add=request.getParameter("cr_add");
	}
	
	if(request.getParameter("JRDBDetails") !=null)
	{
	JRDBDetails=request.getParameter("JRDBDetails");
	}if(request.getParameter("cr_num") !=null)
	{
	cr_num=request.getParameter("cr_num");
	}if(request.getParameter("cr_Recom") !=null)
	{
	cr_Recom=request.getParameter("cr_Recom");
	}
	
	if(request.getParameter("cr_size") !=null)
	{
	cr_size=request.getParameter("cr_size");
	}
	
	if(request.getParameter("cr_System") !=null)
	{
	cr_System=request.getParameter("cr_System");
	}if(request.getParameter("cr_loc") !=null)
	{
	cr_loc=request.getParameter("cr_loc");
	}
	
	
	
	%>

	
	
		
		

		<tr >
		
		
		
		<td style="font-weight:bold;text-align:left;">CR Number</td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;">
		<input type="text" id="cr_num" name="cr_num" value="<%=cr_num%>" onkeypress="return blockSpecialChar(event);"> </td>
		</tr>
<tr>
		<td style="font-weight:bold;text-align:left;">CR Size/Effort 
		</td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"><input type="text" id="cr_size" name="cr_size" value="<%=cr_size%>" onkeypress="return blockSpecialChar(event);"> </td>
		</tr>
<tr>
		<td style="font-weight:bold;text-align:left;">CR document Location </td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;">
		<input type="text" name="cr_loc" id="cr_loc" value="<%=cr_loc%>" onkeypress="return blockSpecialChar(event);"> </td>
		
		</tr>
<tr>
		
		 <td style="font-weight:bold;text-align:left;">CR Details</td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;">
		  <textarea name="crDetails" id="crDetails"
          rows="5" cols="33" onkeypress="return blockSpecialChar(event);"><%=crDetails%></textarea></td>
</tr>
<tr>

		
	
		  <td style="font-weight:bold;text-align:left;"> <div class="tooltip"> System <font style="font-weight:bold; text-align:left;color:#e20074;">?
		  <span class="tooltiptext">System & Flows activation,aal</span></div>
		 </td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;">
		 <input type="text" id="cr_System" name="cr_System" value="<%=cr_System%>" onkeypress="return blockSpecialChar(event);"> </td>
		   
		   </tr>
<tr>
		   
		   
		    <td style="font-weight:bold;text-align:left;">Additional Info 
		    </td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;"><input type="text" name="cr_add" id="cr_add" value="<%=cr_add%>" onkeypress="return blockSpecialChar(event);"> </td>
			</tr>
<tr>
		  <td style="font-weight:bold;text-align:left;">Recommendation

</td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;">
<select name="cr_Recom" >
		<option value="<%=cr_Recom%>" selected><%=cr_Recom%></option>
    <option value="Review_Pending">Review Pending</option>
    <option value="Approved">Approved</option>
    <option value="ReturnwithComment">Return with Comment</option>
	 <option value="ReviewInProgress">Review In Progress</option>
          </select> 


</tr>
<tr>



		 
		    <td style="font-weight:bold;text-align:left;">EAC Comment</td> 
		<td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;">
		  <textarea name="JRDBDetails" id="JRDBDetails"
          rows="5" cols="33" onkeypress="return blockSpecialChar(event);"><%=JRDBDetails%></textarea> </td>
		
		</tr><tr>
		<tr>	
		 <td style="font-weight:bold;text-align:left;">Review By Date</td>
		 
		  <td style="font-weight:bold;text-align:left;" >  <input type="date" name="ReviewDate" id="ReviewDate" value="<%=request.getParameter("reviewDate")%>" min="2019-01-01" max="2021-12-31">  </td></tr>
		  
			
	
		<td>
		<%if(request.getParameter("action")!=null)
			
			{%>
				<input type=hidden name="action" value="update">
			<%}%>
		<input type=hidden name="projectID" Value='<%=viewMap.get("ProjectID")%>' >
		<input type=hidden name="crID" value="<%=crID%>">
		</td>
		<td><input type="submit" name="Submit" value="Save" style="float:right;" ></td>
	</tr>
	<tr><td colspan=2 align="center" height="10px"></td></tr>
	
</form>
</table>



</body>
</html>



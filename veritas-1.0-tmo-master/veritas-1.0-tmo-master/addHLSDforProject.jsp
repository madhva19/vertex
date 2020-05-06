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
function errorMessage(){
	swal("WARNING!"," Please DO NOT use this page to update 'Review Status'. Reach out to EACSIGMA@T-Mobile.com, if you need help to update review status", "warning");
}
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
    //First Name Validation 
    replaceSpecialChar(document.getElementById('ExecutiveSummary'));
    var fn=document.getElementById('ExecutiveSummary').value;
    if(fn == ""){
		 swal("Error!","Please Enter Executive Summary", "error");
     
        document.getElementById('ExecutiveSummary').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('ExecutiveSummary').style.borderColor = "green";
    }
    if(document.getElementsByName('ReviewsType')[0].checked == false && document.getElementsByName('ReviewsType')[1].checked == false){
		 swal("Error!","Please select if Project Review is for assessment or HLSD  ", "error");
		 document.getElementsByName('ReviewsType')[0].parentNode.style.backgroundColor="red"
			 document.getElementsByName('ReviewsType')[1].parentNode.style.backgroundColor="red"
       
       return false;
   }else{
   	 document.getElementsByName('ReviewsType')[0].parentNode.style.backgroundColor="transparent"
			 document.getElementsByName('ReviewsType')[1].parentNode.style.backgroundColor="transparent"
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

input[type=text], select {
width:50%;
  height:15px;
  }
  textarea {
 
width:50%;
  height:55px;
  }
  
  select {

  height:20px;
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
    <li><a href="#" style="color:black;">Add HLSD</a></li>
</ul>	 
	
	<br><br>

<div align="center" style="font-size:280%; color:#E20074"; > Add HLSD to Project : <%=viewMap.get("ProjectTitle")%></div>

<table align="center"  style="border:2px double #E20074;border-style:  solid double; width:50%;" id="newlink" cellpadding="5" >



<form name="userform" method="get" action="addHLSD" onsubmit="return FormValidation();"  >


	
<tr>
		<td style="font-weight:bold; text-align:left;font-size:15px;color:#e20074;" >Project Number: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;" > <%=viewMap.get("ProjectNumber")%></td>
		<input type=hidden name="projectID" Value= '<%=viewMap.get("ProjectID")%>'> 
	</tr>
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;" >Project Tittle: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;" > <%=viewMap.get("ProjectTitle")%></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;">Project Description: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;" > <%=viewMap.get("ProjectDescription")%></td>
	</tr>
	
	<tr>
		<td colspan=3> &nbsp;<br> </td> 
	</tr>
	<br><br>
	
		
		<tr class=trbordered>
		<td style="font-weight:bold;text-align:left;">HLSD TShirt </td><td style="font-weight:bold;text-align:left;" colspan=2><select name="HLSD_TShirt" >
		    <option value="TBD">TBD</option>
    <option value="XS">Extra Small</option>
    <option value="S">Small</option>
	 <option value="M">Medium</option>
    <option value="L">Large</option>
	 <option value="XL">Extra Large</option>
    <option value="XXL">XXL</option>
	    <option value="XXXL">XXXL</option>
   
  </select> </td></tr>
  <tr>

		<td style="font-weight:bold;text-align:left;"> Review Status</td><td style="font-weight:bold;" colspan=2> <input type="text" value="Pending Review" name="ReviewStatus" readonly> <!-- <select name="ReviewStatus" >
	<option value="Record_Added">To be Scheduled </option>
    <option value="Review_Pending">Pending Review</option>
    <option value="Approved">Approved</option>
    <option value="ReturnwithComment">Return with Feedback</option>
	 <option value="ReviewInProgress">Review In Progress</option>
	 <option value="hold">Put on Hold</option>
	 <option value="ApprovedWithAI">Approved with AIs</option>
	   <option value="EAC Review Not Needed">EAC Review Not Needed</option>
          </select>  --></td></tr>
          <tr>
		  <td style="font-weight:bold;text-align:left;">Action Items Count (Number Only)</td><td style="font-weight:bold;" colspan=2><input type="text" name="ActionItems" onkeypress="return isNumberKey(event)" value="0"> </td>
		  </tr><tr>
		  
		  <td style="font-weight:bold;text-align:left;">Impacted Domains Count (Number Only)</td><td style="font-weight:bold;" colspan=2> <input type="text" name="ImpactedDomains" onkeypress="return isNumberKey(event)" value="0"> </td>
		  </tr><tr><td style="font-weight:bold;text-align:left;">Impacted Capabilities Count (Number Only)</td><td style="font-weight:bold;" colspan=2> <input type="text" name="ImpactedCapabilities" onkeypress="return isNumberKey(event)" value="0"> </td>
		 
		  </tr><tr><td style="font-weight:bold;text-align:left;">Axiom Score  (Number Only)</td><td style="font-weight:bold;" colspan=2> <input type="text" name="AxiomScore" onkeypress="return isNumberKey(event)" value="0"> </td>
 </tr><tr>		   
		   <td style="font-weight:bold;text-align:left;">Proposed  SDO review date</td><td style="font-weight:bold;" colspan=2> <input type="date" name="SDOReview" id="SDOReview" min="2019-01-01" max="2021-12-31"> </td>
		 </tr><tr> <td style="font-weight:bold;text-align:left;">API Count (Number Only) </td><td style="font-weight:bold;" colspan=2><input type="text" name="APICount" onkeypress="return isNumberKey(event)" value="0"> </td>
	 </tr><tr>		  <td style="font-weight:bold;text-align:left;">Feature Count(Number Only) </td><td style="font-weight:bold;" colspan=2><input type="text" name="FeatureCount" onkeypress="return isNumberKey(event)" value="0"> </td>
 </tr><tr>		 
		 <td style="font-weight:bold;text-align:left;">Review Feedback Link </td><td style="font-weight:bold;" colspan=2><input type="text" name="ReviewFeedbackLink" value=""> </td>
	 </tr><tr>		  <td style="font-weight:bold;text-align:left;">Executive Summary </td><td style="font-weight:bold;" colspan=2>
		  <textarea name="ExecutiveSummary" id="ExecutiveSummary"
          rows="5" cols="33" onkeypress="return blockSpecialChar(event);" ></textarea>
		  
	</td></tr>
		
		  
			
	

	
	<tr>
	 <td style="font-weight:bold;text-align:left;"> <input type="radio" name="ReviewsType" value="Assessment Review">Assessment Review</td>
	
		<td style="font-weight:bold;text-align:left;"> <input type="radio" name="ReviewsType" value="HLSD Review"> HLSD Review</td>
		
		<td style="font-weight:bold;text-align:left;"> <input type="checkbox" name="Reviews" value="HLSD Received"> HLSD Received</td>
		</tr>
		<tr>
		
		<td style="font-weight:bold;text-align:left;"> <input type="checkbox" name="Reviews" value="BRD Baselined">BRD Baselined</td>
		
		  <td style="font-weight:bold;text-align:left;"> <input type="checkbox" name="Reviews" value="HLSD Reviewed with Biz"> HLSD Reviewed with Biz</td>
		  <td style="font-weight:bold;text-align:left;"><input type="checkbox" name="Reviews" value="Attendees Received">Attendees Received</td>
		  
		  
		   </tr><tr>
		  <td style="font-weight:bold;text-align:left;"><input type="checkbox" name="Reviews" value="Docs Sent to Reviewers">Docs Sent to Reviewers</td>
		 
		  <td style="font-weight:bold;text-align:left;"> <input type="checkbox" name="Reviews" value="Review Deck Received">Review Deck Received</td>
		  <td style="font-weight:bold;text-align:left;"><input type="checkbox" name="Reviews" value="Meeting NotesAIs Sent">Meeting NotesAIs Sent</td>
		</tr>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
	<tr>
		
		<td colspan=3 ><input type="submit" name="Submit" value="Save" style="border:0;background-color: #E20074;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;"></td>
	</tr>
	
	
</form>
</table>

<script type="text/javascript">
errorMessage();
var d1 = new Date();
var y1= d1.getFullYear();
var m1 = d1.getMonth()+1;
if(m1<10)
    m1="0"+m1;
var dt1 = d1.getDate();
if(dt1<10)
dt1 = "0"+dt1;
var d2 = y1+"-"+m1+"-"+dt1;
document.getElementById("SDOReview").value=d2;
</script>


</body>
</html>



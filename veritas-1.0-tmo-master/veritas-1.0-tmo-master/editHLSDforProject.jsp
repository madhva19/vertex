<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.nio.charset.Charset"%>
<html>
<head>
   <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="logo.png"/>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
 

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
    //First Name Validation 
    var fn=document.getElementById('ExecutiveSummary').value;
    
    replaceSpecialChar(document.getElementById('ExecutiveSummary'));
    if(fn == ""){
        alert('Please Enter Executive Summary');
        document.getElementById('ExecutiveSummary').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('firstname').style.borderColor = "green";
    }
    if (/^[0-9]+$/.test(document.getElementById("firstname").value)) {
        alert("First Name Contains Numbers!");
        document.getElementById('firstname').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('firstname').style.borderColor = "green";
    }
    if(fn.length <=2){
        alert('Your Name is To Short');
        document.getElementById('firstname').style.borderColor = "red";
        return false;
    }else{
        document.getElementById('firstname').style.borderColor = "green";
    }
    
  replaceSpecialChar(document.getElementById('ExecutiveSummary'));
}


function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }

function check()
{
	var BRDbaslined="<%=request.getParameter("BRDbaslined")%>";
	var HLSDReceived="<%=request.getParameter("HLSDReceived")%>";
	var HLSDReviewWithBiz="<%=request.getParameter("HLSDReviewWithBiz")%>";
	var AttendeesReceived="<%=request.getParameter("AttendeesReceived")%>";
	var DocSentToReviewer="<%=request.getParameter("DocSentToReviewer")%>";
	var ReviewDecReceived="<%=request.getParameter("ReviewDecReceived")%>";
	var MOMSent="<%=request.getParameter("MOMSent")%>";
 var check=document.getElementsByTagName('input');
 for(var i=0;i<check.length;i++)
 {
  if(check[i].type=='checkbox')
  {
	  if(check[i].value=='BRD Baselined' && BRDbaslined=='true' )
	  {
		   check[i].checked=true;
	  }
  
   if(check[i].value=='HLSD Received' && HLSDReceived=='true' )
	  {
		   check[i].checked=true;
	  }
	   if(check[i].value=='HLSD Reviewed with Biz' && HLSDReviewWithBiz=='true' )
	  {
		   check[i].checked=true;
	  }
	   if(check[i].value=='Attendees Received' && AttendeesReceived=='true' )
	  {
		   check[i].checked=true;
	  }
	   if(check[i].value=='Docs Sent to Reviewers' && DocSentToReviewer=='true' )
	  {
		   check[i].checked=true;
	  }
	   if(check[i].value=='Review Deck Received' && ReviewDecReceived=='true' )
	  {
		   check[i].checked=true;
	  }
	   if(check[i].value=='Meeting NotesAIs Sent' && MOMSent=='true' )
	  {
		   check[i].checked=true;
	  }
  }
 }
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
<body onload="check();">
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
    <li><a href="#" style="color:black;">Edit HLSD</a></li>
</ul>	 
	

<div align="center" style="font-size:280%; color:#FF0099"; > Edit EAC Feedback For : <%=viewMap.get("ProjectTitle")%></div>

<table align="center"  style="border:2px double #FF0099;border-style:  solid double;width:50%" id="newlink" class=bordered cellpadding="5" >



<form name="userform" method="get" action="addHLSD" onsubmit="return FormValidation();" onchange="return FormValidation();" >


	
	
	<tr>
		<td style="font-weight:bold; text-align:left;font-size:15px;color:#e20074;" >Project Number: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;" colspan=2> <%=viewMap.get("ProjectNumber")%></td>
		<input type=hidden name="projectID" Value= '<%=viewMap.get("ProjectID")%>'> 
		<input type=hidden name="reviewID" Value= '<%=request.getParameter("reviewID")%>'> 
	</tr>
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;" >Project Tittle: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;" colspan=2> <%=viewMap.get("ProjectTitle")%></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;font-size:15px;color:#e20074;">Project Description: </td> <td style="font-weight:bold;text-align:left;font-size:12px;color:#e20074;" colspan=2> <%=viewMap.get("ProjectDescription")%></td>
	</tr>
	
	
	
	
	<tr><td>&nbsp;</td><%
if(request.getParameter("ReviewsType")!=null && request.getParameter("ReviewsType").toString().equalsIgnoreCase("Assessment Review"))
{
	
%>
	<td>
<input type="radio" name="ReviewsType" value="<%=request.getParameter("ReviewsType")%>" checked><%=request.getParameter("ReviewsType")%></td>
<td > <input type="radio" name="ReviewsType" value="HLSD Review"> HLSD Review</td>
	<%}else { if(request.getParameter("ReviewsType")!=null && request.getParameter("ReviewsType").toString().equalsIgnoreCase("HLSD Review")){ %>
		<td>
<input type="radio" name="ReviewsType" value="<%=request.getParameter("ReviewsType")%>" checked><%=request.getParameter("ReviewsType")%></td>
	 <td style="font-weight:bold;" > <input type="radio" name="ReviewsType" value="Assessment Review">Assessment Review</td>
	<%}else{ %>
	
	<td style="font-weight:bold;" > <input type="radio" name="ReviewsType" value="Assessment Review">Assessment Review</td>
	
		<td style="font-weight:bold;"> <input type="radio" name="ReviewsType" value="HLSD Review" checked> HLSD Review</td>
	<%}} %><br><br><br></tr>
	
		<tr><td colspan=3><br><br></td></tr>		
		<tr >
		<td style="font-weight:bold;text-align:left;" >LOE </td>
		<td style="font-weight:bold;text-align:left;" colspan="2" > 
		
		<input type="text" name="HLSD_TShirt" 		 value="<%=request.getParameter("HLSD_TShirt")%>">
		
	 </td>
	</tr><tr>
		<td style="font-weight:bold;text-align:left;" > Review Status </td>
		<td style="font-weight:bold;text-align:left;" colspan="2"><select name="ReviewStatus" >
					<option value="<%=request.getParameter("ReviewStatus")%>" selected><%=request.getParameter("ReviewStatus")%></option>
					
					<option value="To be Scheduled">To be Scheduled </option>
    <option value="Pending Review">Pending Review</option>
    <option value="Approved">Approved</option>
    <option value="Returned with Feedback">Returned with Feedback</option>
	 <option value="Review In Progress">Review In Progress</option>
	 <option value="On Hold">On Hold</option>
	  <option value="EAC Review Not Needed">EAC Review Not Needed</option>
	 <option value="Approved with AIs">Approved with AIs</option>
	 
					  </select> </td>
					  
				 </tr><tr>	  
		  <td style="font-weight:bold;text-align:left;" >Action Items Count (Number Only)</td>
		  <td style="font-weight:bold;text-align:left;"c olspan="2" ><input type="text" name="ActionItems" 		onkeypress="return isNumberKey(event)" value="<%=request.getParameter("ActionItems")%>"> </td>
		 
		  </tr><tr>
		  
		  <td style="font-weight:bold;text-align:left;" >Impacted Domains Count (Number Only) </td>
		  <td style="font-weight:bold;text-align:left;" colspan="2"><input type="text" name="ImpactedDomains" onkeypress="return isNumberKey(event)" value="<%=request.getParameter("ImpactedDomains")%>"> </td>
		  </tr><tr>	
		  <td style="font-weight:bold;text-align:left;" >Impacted Capabilities Count (Number Only) </td>
		  <td style="font-weight:bold;text-align:left;" colspan="2" ><input type="text" name="ImpactedCapabilities" onkeypress="return isNumberKey(event)" value="<%=request.getParameter("ImpactedCapabilities")%>"> </td>
		    </tr><tr>
		  <td style="font-weight:bold;text-align:left;" >Axiom Score  (Number Only)</td>
		  <td style="font-weight:bold;text-align:left;" colspan="2"> <input type="text" name="AxiomScore" onkeypress="return isNumberKey(event)" value="<%=request.getParameter("AxiomScore")%>"> </td>
		  </tr><tr>
		  
		  <td style="font-weight:bold;text-align:left;" >API Count (Number Only)</td>
		  <td style="font-weight:bold;text-align:left;" colspan="2"> <input type="text" name="APICount" onkeypress="return isNumberKey(event)" value="<%=request.getParameter("APICount")%>"> </td>
		  </tr><tr>
		  <td style="font-weight:bold;text-align:left;" >Feature Count(Number Only) </td>
		  <td style="font-weight:bold;text-align:left;" colspan="2"><input type="text" name="FeatureCount" onkeypress="return isNumberKey(event)" value="<%=request.getParameter("FeatureCount")%>"> </td>
		  
		  </tr><tr>	
		  <td style="font-weight:bold;text-align:left;" >Review Feedback Link </td>
		  <td style="font-weight:bold;text-align:left;" colspan="2"><input type="text" name="ReviewFeedbackLink" value="<%=request.getParameter("ReviewFeedbackLink")%>"> </td>
		 
		  </tr><tr>
		
		  <%
		  
		// String eSummery= new String( Base64.getDecoder().decode(request.getParameter("ExecutiveSummary").toString().getBytes()),Charset.forName("UTF-8"));
		  String eSummery=request.getParameter("ExecutiveSummary").toString();
		  %>
		
		  
			

	<td style="font-weight:bold;text-align:left;">Executive Summary </td>
		  <td style="font-weight:bold;text-align:left;" colspan="2">
		  <textarea name="ExecutiveSummary" id="ExecutiveSummary"
          rows="3" cols="33" onkeypress="return blockSpecialChar(event);"><%=eSummery%></textarea></td>
		  </tr><tr>	
	

		<td style="font-weight:bold;text-align:left;"> <input type="checkbox" name="Reviews" value="HLSD Received"> HLSD Received</td>
		  <td style="font-weight:bold;text-align:left;"> <input type="checkbox" name="Reviews" value="HLSD Reviewed with Biz"> HLSD Reviewed with Biz</td>
		  <td style="font-weight:bold;text-align:left;"><input type="checkbox" name="Reviews" value="Attendees Received">Attendees Received</td>
		  
		   </tr><tr>
		  <td style="font-weight:bold;text-align:left;"><input type="checkbox" name="Reviews" value="Docs Sent to Reviewers">Docs Sent to Reviewers</td>
		 
		  <td style="font-weight:bold;text-align:left;"> <input type="checkbox" name="Reviews" value="Review Deck Received">Review Deck Received</td>
		  <td style="font-weight:bold;text-align:left;"colspan=2><input type="checkbox" name="Reviews" value="Meeting NotesAIs Sent">Meeting NotesAIs Sent</td>
		 </tr><tr>	
		 <td style="font-weight:bold;text-align:left;">Review Date</td>
		 
		  <td style="font-weight:bold;text-align:left;" colspan="2">  <input type="date" name="ReviewDate" id="ReviewDate" value="<%=request.getParameter("ReviewDate")%>" min="2019-01-01" max="2021-12-31">  </td>
	

	<input type=hidden name="action" Value="update"> 
	
	</td></tr>
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
	<tr>
		
		<td colspan=2><input type="submit" name="Submit" value="Save" style="border:0;background-color: #FF0099;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;" ></td>
	</tr>
	
	
</form>
</table>
<script>


if(window.attachEvent) {
    window.attachEvent('onload', check);
} else {
    if(window.onload) {
        var curronload = window.onload;
        var newonload = function(evt) {
            curronload(evt);
            check(evt);
        };
        window.onload = newonload;
    } else {
        window.onload = check;
    }
}


/script>
</body>
</html>



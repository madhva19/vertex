<html>
<head>
 <TITLE>SDO Integration </TITLE>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
     <script src="/Veritas/alert.js"></script>
  <link rel="stylesheet" href="/Veritas/alert.css">

<script>

function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }


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
function new_Feature()
{

ct1++;
 var newRow=document.getElementById('newlink1').insertRow();
  	//var te=document.getElementById('newlink').innerHTML;
	var te1='<td style="font-weight:bold;">Feature Code:  <input type="text" name="FeatureCode'+ct1+'" value=""></td><td style="font-weight:bold;">Feature Description:  <input type="text" name="FeatureDescription'+ct1+'" value=""></td><td style="font-weight:bold;">Dependent Feature :  <input type="text" name="DependentFeature'+ct1+'" value=""></td>';
	//var Final =te.append(te1);
	
	
	newRow.innerHTML = te1;
}
function FormValidation(){
    //First Name Validation getElementsByName
    var fn=document.getElementsByName('ProjectNumber')[0].value;
    if(fn == ""){
		 swal("Error!","Please Enter Project Number", "error");
     
        document.getElementsByName('ProjectNumber')[0].style.borderColor = "red";
        return false;
    }else{
        document.getElementsByName('ProjectNumber')[0].style.borderColor = "green";
    }
  
    var fn1=document.getElementsByName('ProjectTittle')[0].value;
    if(fn1 == ""){
		 swal("Error!","Please Enter Projec Tittle", "error");
     
        document.getElementsByName('ProjectTittle')[0].style.borderColor = "red";
        return false;
    }else{
        document.getElementsByName('ProjectTittle')[0].style.borderColor = "green";
    }
	
	 if(document.getElementsByName('ProjectDescription')[0].value == ""){
		 swal("Error!","Please Enter Project Description", "error");
     
        document.getElementsByName('ProjectDescription')[0].style.borderColor = "red";
        return false;
    }else{
        document.getElementsByName('ProjectDescription')[0].style.borderColor = "green";
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



td {
    padding-top: .5em;
    padding-bottom: .5em;
}

table#t01 td {
  text-align: center;
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

<div align="center" style="font-size:280%; color:#E20074"; > Add Project  </div>


<form name="userform" method="get" action="addUser"  onsubmit="return FormValidation();" >
<br><br><br>
<table align="center" width="1400px" style="border:2px double #E20074;border-style:  solid double;">



	<tr>
		<td style="font-weight:bold;" colspan=7>Project Number:  <input type="text" name="ProjectNumber" value=""></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">Project Tittle:  <input type="text" name="ProjectTittle" value=""></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;">Project Description: <input type="text" name="ProjectDescription" value=""></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;">Project Type:  <select name="ProjectType" >
    <option value="Integration">Integration</option>
    <option value="TMobileLegacy">T-Mobile Legacy</option>
    <option value="SprintLegacy">Sprint Legacy</option>
    
  </select></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">ProjectSite:  <input type="text" name="ProjectSite" value=""></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;">Project Status:<select name="ProjectStatus" >
    <option value="Approve">Approve</option>
    <option value="Design">Design</option>
    <option value="Development">Development</option>
	 <option value="Test">Test</option>

 <option value="Cancelled">Cancelled</option>
	 <option value="Completed">Completed</option>
	</td>
	</tr>
	

 

	<tr>
		<td style="font-weight:bold;">Work Stream:  <select name="WorkStream" >
    <option value="B2B">B2B</option>
    <option value="BackOffice">Back Office</option>
    <option value="Billing">Billing</option>
	 <option value="Care">Care</option>
    <option value="Commissions">Commissions</option>
	  <option value="Credit">Credit / Collections</option>
    <option value="Cross \Provisioning">Cross Provisioning</option>
    <option value="DeviceFinancing">Device Financing</option>
	 <option value="Digital">Digital</option>
    <option value="Engineering">Engineering</option>
	 <option value="GeneralReporting ">General Reporting </option>
    <option value="HomeonRoam">Home on Roam</option>
    <option value="IoT">IoT</option>
	 <option value="Migration">Migration</option>
    <option value="MVNO">MVNO</option>
	  <option value="NewValue">New Value Prop</option>
    <option value="Offers">Offers / Eligibility</option>
    <option value="Sales">Sales</option>
	 <option value="SupplyChain">Supply Chain</option>
    <option value="Technology">Technology</option>
      </select>




  
  
</td>
	</tr>
	<tr>
		<td style="font-weight:bold;">Target Deployment : <select name="TargetDeployment" >
    <option value="DAY0">Day 0</option>
    <option value="DAY1">DAY 1</option>
    
	</tr>
	<tr><td>
	<table  id="newlink1" class=bordered>
	
	<tr>
		<td style="font-weight:bold;">Feature Code:  <input type="text" name="FeatureCode" value=""></td>
	
		<td style="font-weight:bold;">Feature Description:  <input type="text" name="FeatureDescription" value=""></td>
	
		<td style="font-weight:bold;">Dependent Feature :(Number Only)  <input type="text" name="DependentFeature" onkeypress="return isNumberKey(event)" value="0"></td>
		<td><p id="addnew">
		<input type="button" name="Add" value="Add Feature" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="new_Feature();">
	
</p></td>
	</tr>
	</table>
	
	
	
		
		</td>
		</tr>
	
	
	<tr><td>
	<table  id="newlink" class=bordered >
		<tr class=trbordered>
		<td style="font-weight:bold;">Project Resource  <input type="text" name="ProjectResource" value=""> </td>
	
		<td style="font-weight:bold;"> Project Role  <select name="ProjectRole" >
    <option value="SolutionCaptain">Solution Captain</option>
    <option value="ProductOwner">Product Owner</option>
    <option value="LeadArchitect">Lead Architect</option>
	 <option value="EACArchitect">EAC Architect</option>
    <option value="LeadAnalyst">Lead Analyst</option>
      </select> </td>
			<td style="font-weight:bold;"> Company   <select name="Company" >
    <option value="TMOBILE">T-Mobile</option>
    <option value="Sprint">Sprint</option>
   
  </select></td><td><p id="addnew1">
		<input type="button" name="Add" value="Add Resource" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="new_Leadership();">
	
</p></td>
	</tr>
	</table>
	
	
	
		
		</td>
		</tr>
		
		
		
		
		
		
		
		<tr><td>
	<table  id="newlink" class=bordered >
		<tr class=trbordered>
		<td style="font-weight:bold;">HLSD TShirt <select name="HLSD_TShirt" >
    <option value="XS">Extra Small</option>
    <option value="S">Small</option>
	 <option value="M">Medium</option>
    <option value="L">Large</option>
	 <option value="XL">Extra Large</option>
    <option value="XXL">XXL</option>
	    <option value="XXXL">XXXL</option>
   
  </select> </td>
	
		<td style="font-weight:bold;"> Review Status <select name="ReviewStatus" >
    <option value="Review_Pending">Review Pending</option>
    <option value="Approved">Approved</option>
    <option value="ReturnwithComment">Return with Comment</option>
	 <option value="ReviewInProgress">Review In Progress</option>
          </select> </td>
		  <td style="font-weight:bold;">Action Items Count (Number Only)<input type="text" name="ActionItems" onkeypress="return isNumberKey(event)" value="0"> </td>
		  <td style="font-weight:bold;">Impacted Domains Count (Number Only) <input type="text" name="ImpactedDomains" onkeypress="return isNumberKey(event)" value="0"> </td>
		  <td style="font-weight:bold;">Impacted Capabilities Count (Number Only) <input type="text" name="ImpactedCapabilities" onkeypress="return isNumberKey(event)" value="0"> </td>
		  </tr><tr>
		  <td style="font-weight:bold;">Axiom Score  (Number Only) <input type="text" name="AxiomScore" onkeypress="return isNumberKey(event)" value="0"> </td>
		  <td style="font-weight:bold;">API Count (Number Only) <input type="text" name="APICount" onkeypress="return isNumberKey(event)" value="0"> </td>
		  <td style="font-weight:bold;">Feature Count(Number Only) <input type="text" name="FeatureCount" onkeypress="return isNumberKey(event)" value="0"> </td>
		  <td style="font-weight:bold;">Review Feedback Link <input type="text" name="ReviewFeedbackLink" value=""> </td>
		  <td style="font-weight:bold;">Executive Summary 
		  <textarea name="ExecutiveSummary" id="ExecutiveSummary"
          rows="5" cols="33"></textarea>
		  
		
		  
			
	</tr>
	</table>
	

		
		</td>
		</tr>
		
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Save" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;"></td>
	</tr>
	<tr><td colspan=2 align="center" height="10px"></td></tr>
</table>

</form>


</body>
</html>



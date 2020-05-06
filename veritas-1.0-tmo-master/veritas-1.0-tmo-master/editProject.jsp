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
	  
	  
	  function check()
{
	var wave1="<%=request.getParameter("wave1")%>";
	var wave2="<%=request.getParameter("wave2")%>";
	var wave3="<%=request.getParameter("wave3")%>";
	var check=document.getElementsByTagName('input');
 for(var i=0;i<check.length;i++)
 {
  if(check[i].type=='checkbox')
  {
	  if(check[i].value=='wave1' && wave1=='true' )
	  {
		   check[i].checked=true;
	  }
  
   if(check[i].value=='wave2' && wave2=='true' )
	  {
		   check[i].checked=true;
	  }
	   if(check[i].value=='wave3' && wave3=='true' )
	  {
		   check[i].checked=true;
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
<body >
  <%@ include file="viewMenuItem.jsp" %>

<div align="center" style="font-size:280%; color:#E20074"; > Edit Project  </div>


<form name="userform" method="get" action="addUser"  onsubmit="return FormValidation();" onchange="return FormValidation();">
<br><br><br>
<table align="center"  style="border:2px double #E20074;border-style:  solid double;width: 40%;">


<tr>
		<td style="font-weight:bold;text-align:left;" >Project ID:</td><td >  <input type="text" name="ProjectID" disabled  value="<%=request.getParameter("ProjectID")%>"></td>
	</tr>
	<input type="hidden" name="ProjectID"   value="<%=request.getParameter("ProjectID")%>">
	<tr>
		<td style="font-weight:bold;text-align:left;" >Project Number: </td><td> <input type="text" name="ProjectNumber" value="<%=request.getParameter("ProjectNumber")%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;text-align:left;">Project Title: </td><td> <input type="text" name="ProjectTittle" value="<%=request.getParameter("projectTittle")%>"></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;">Project Description:</td><td> <input type="text" name="ProjectDescription" value="<%=request.getParameter("ProjectDescription")%>"></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;">Target Deployment:</td><td>
      <select name="TargetDeployment" >
	   <option value="<%=request.getParameter("TargetDeployment")%>"><%=request.getParameter("TargetDeployment")%></option>
    <option value="DAY0">Day 0</option>
    <option value="DAY1">DAY 1</option>
	  <option value="Q1">Q1</option>
    <option value="Q2">Q2</option>
	  <option value="Q3">Q3</option>
    <option value="Q4">Q4</option>
    
	</td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;">Project Type:</td><td>  <select name="ProjectType" >
		 <option value="<%=request.getParameter("ProjectType")%>"><%=request.getParameter("ProjectType")%></option>
    <option value="Integration">Integration</option>
    <option value="TMobileLegacy">T-Mobile Legacy</option>
    <option value="SprintLegacy">Sprint Legacy</option>
    
  </select></td>
	</tr>
	<tr>
		<td style="font-weight:bold;text-align:left;">ProjectSite: </td><td> <input type="text" name="ProjectSite" value="<%=request.getParameter("ProjectSite")%>"></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;text-align:left;">Project Status:</td><td><select name="ProjectStatus" >
		 <option value="<%=request.getParameter("ProjectStatus")%>"><%=request.getParameter("ProjectStatus")%></option>
		  <option value="Dependency">Dependency tracking Only </option>
		  <option value="Proposed">Proposed</option>
    <option value="Confirmed">Confirmed</option>
    <option value="Approve">Approve</option>
    <option value="Design">Design</option>
    <option value="Development">Development</option>
	 <option value="Test">Test</option>

 <option value="Cancelled">Cancelled</option>
	 <option value="Completed">Completed</option>
	</td>
	</tr>
	

 

	<tr>
		<td style="font-weight:bold;text-align:left;">Work Stream: </td><td> <select name="WorkStream" >
		 <option value="<%=request.getParameter("Workstream")%>"><%=request.getParameter("Workstream")%></option>
		 <option value="BAU">BAU</option>
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
	
	
	
	<tr><td style="font-weight:bold;" >
 <input type="checkbox" name="wave" value="wave1">Wave1</td>
	
		<td style="font-weight:bold;"> <input type="checkbox" name="wave" value="wave2"> Wave2</td>
		
		
		
		  
	
		</tr>
	
		
			
		
	

		
	<tr>
		<td style="font-weight:bold;"> <input type="checkbox" name="wave" value="wave3"> isRestricted</td>
		<td><input type="submit" name="Submit" value="Update" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;"></td>
		<input type="hidden" name="action" value="update">
	</tr>
	
</table>

</form>
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


</script>
</body>
</html>



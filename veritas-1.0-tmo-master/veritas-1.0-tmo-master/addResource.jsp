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
   <script src="script.js"></script>
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
function new_Feature()
{

ct1++;
 var newRow=document.getElementById('newlink1').insertRow();
  	//var te=document.getElementById('newlink').innerHTML;
	var te1='<td style="font-weight:bold;">Feature Code:  <input type="text" name="FeatureCode'+ct1+'" value=""></td><td style="font-weight:bold;">Feature Description:  <input type="text" name="FeatureDescription'+ct1+'" value=""></td><td style="font-weight:bold;">Dependent Feature :  <input type="text" name="DependentFeature'+ct1+'" value=""></td>';
	//var Final =te.append(te1);
	
	
	newRow.innerHTML = te1;
}
function getAll()
{
	  
	  window.location.href="ViewAllProject/"; 
}
  function FormValidation(){
 
	
	 if(document.getElementsByName('ProjectResource')[0].value == ""){
		 swal("Error!","Please Enter Project Resource Name", "error");
     
        document.getElementsByName('ProjectResource')[0].style.borderColor = "red";
        return false;
    }else{
        document.getElementsByName('ProjectResource')[0].style.borderColor = "green";
    }
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



<div align="center" style="font-size:280%; color:#E20074"; > Add Resource </div>


<form name="userform" method="get" action="/Veritas/addUser" onsubmit="return FormValidation();" >
<br><br><br>
<table align="center" width="1000px" style="border:2px double #E20074;border-style:  solid double;">


	
		<tr class=trbordered>
		<td>Project Resource  <input type="text" name="ProjectResource" value=""> </td>
	
		<td> Project Role  <select name="ProjectRole" >
		<option value="PM">PM</option>
    <option value="SolutionCaptain">Solution Captain</option>
    <option value="ProductOwner">Product Owner</option>
    <option value="LeadArchitect">Lead Architect</option>
	 <option value="EACArchitect">EAC Architect</option>
    <option value="LeadAnalyst">Lead Analyst</option>
      </select> </td>
			<td> Company   <select name="Company" >
    <option value="TMOBILE">T-Mobile</option>
    <option value="Sprint">Sprint</option>
   
  </select></td>
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



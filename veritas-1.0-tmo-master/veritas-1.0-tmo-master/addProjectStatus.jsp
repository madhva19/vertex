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
	var te1='<td style="font-weight:bold;text-align:left;">Project Resource:   <input type="text" name="ProjectResource'+ct+'" value=""> </td> <td style="font-weight:bold;text-align:left;"> Project Role    <select name="ProjectRole'+ct+'" > <option value="SolutionCaptain">Solution Captain</option> <option value="ProductOwner">Product Owner</option> <option value="LeadArchitect">Lead Architect</option><option value="EACArchitect">EAC Architect</option><option value="LeadAnalyst">Lead Analyst</option></select> </td <td style="font-weight:bold;text-align:left;"> Company   <select name="Company'+ct+'" > <option value="TMOBILE">T-Mobile</option><option value="Sprint">Sprint</option></select></td>';
	//var Final =te.append(te1);
	
	
	newRow.innerHTML = te1;
}


function FormValidation(){

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

			 
			  table#t01 tr:nth-child(even) {
			  background-color: #fce2ec;
			}
			table#t01 tr:nth-child(odd) {
			 background-color: #fff;
			}


.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #e20074;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}



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

			input[type="text"] {
				width: 200px;
			}
			</style>
</head>
<body>
  <%@ include file="viewMenuItem.jsp" %>

<%

HashMap status= new HashMap(); 
	
								String FLD_Design="";
				 		 	  String FLD_Dev="";
				 			  String FLD_Loc="";
				 			  String SD_Loc="";
				 			  String num_epic="0";
				 			  String AC_Design="";
				 			  String AC_Dev="";
				 			  String AC_Test="";
				 			  String AC_Dep="";
				 			  String Logging="";
				 			  String targetDate="";
				 			  String Telemetry="";
				 			  String FO="";
				 			  String OP="";
				 			  String Data_Mov_Init="";
				 			  String Data_Mov_In="";
				 			  String Data_Mov_Recon="";
				 			  String DIT_Check="";
				 			  String QAT_Check="";
				 			  String PRD_Check="";
				 			  String Network_Check="";
				 			  String SD="";
				 			  String Security_Check="";
				 			  String Test_Check="";
				 			  String FeatureInAC="";
				 			  String HLSD_Baslined="";
				 			  String FLD_Complete="";
				 			  String Swagger="";
				 			  String Test_Data_Check="";
				 			  String EDP_Check="";
				 			  String feature_toggele_check="";
				 			  String Data_Mov_Check="";
				 			  String Create_DTM="";
				 			  String Create_By="";
				 			  String Update_DTM="";
				 			  String Update_By="";			
				 			  String Swagger_Loc="";
				 			  String securityauth="";
							  String notes="";
	if(session.getAttribute(request.getParameter("featureID").toString())!=null)
	{
	status=(HashMap)session.getAttribute(request.getParameter("featureID").toString());
	
	
	

	
						 FLD_Design= status.get("FLD_Design").toString();
				 		 	 FLD_Dev= status.get("FLD_Dev").toString();
				 			 FLD_Loc= status.get("FLD_Loc").toString();
				 			 SD_Loc= status.get("SD_Loc").toString();
				 			  num_epic=status.get("num_epic").toString();
				 			  AC_Design=status.get("AC_Design").toString();
				 			 AC_Dev= status.get("AC_Dev").toString();
				 			 AC_Test= status.get("AC_Test").toString();
				 		 AC_Dep= status.get("AC_Dep").toString();
				 					 Logging= status.get("Logging").toString();
				 			 targetDate= status.get("targetDate").toString();
				 			  Telemetry=status.get("Telemetry").toString();
				 			 FO= status.get("FO").toString();
				 			  OP=status.get("OP").toString();
				 			 Data_Mov_Init=status.get("Data_Mov_Init").toString();
				 			 Data_Mov_In= status.get("Data_Mov_In").toString();
				 			  Data_Mov_Recon=status.get("Data_Mov_Recon").toString();
				 			  DIT_Check=status.get("DIT_Check").toString();
				 			  QAT_Check=status.get("QAT_Check").toString();
				 			  PRD_Check=status.get("PRD_Check").toString();
							  //
				 			  Network_Check=status.get("Network_Check").toString();
				 			 SD= status.get("SD").toString();
				 			  Security_Check=status.get("Security_Check").toString();
				 			  Test_Check=status.get("Test_Check").toString();
				 			  FeatureInAC=status.get("FeatureInAC").toString();
							 
				 			  HLSD_Baslined=status.get("HLSD_Baslined").toString();
				 			  FLD_Complete=status.get("FLD_Complete").toString();
				 			  Swagger=status.get("Swagger").toString();
				 			  Test_Data_Check=status.get("Test_Data_Check").toString();
				 			 EDP_Check= status.get("EDP_Check").toString();
				 			  feature_toggele_check=status.get("feature_toggele_check").toString();
				 			  Data_Mov_Check=status.get("Data_Mov_Check").toString();
				 			  //status.get("Create_DTM").toString();
				 			  //status.get("Create_By").toString();
				 			 // status.get("Update_DTM").toString();
				 			 // status.get("Update_By").toString();			
				 			  Swagger_Loc=status.get("Swagger_Loc").toString();
				 			  securityauth=status.get("securityauth").toString();
							 notes=status.get("notes").toString();
							  
	}
	
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
	

<div  align=center  style="font-size:280%; color:#E20074;" > Add /Edit Feature Status  : <%=viewMap.get("ProjectNumber")%></div>
<form name="userform" method="get" action="AddProjectStatus" onsubmit="return FormValidation();"  >

<table align=center  style="border:2px double #E20074;border-style:  solid double; width:70%;align:center;" id="t01"  >






	<tr>
		<td  colspan=2 style="font-weight:bold; text-align:left;">Project Number: </td> <td colspan=2> <%=viewMap.get("ProjectNumber")%>
		<input type=hidden name="projectID" Value='<%=viewMap.get("ProjectID")%>' ></td>
	</tr>
	<tr>
		<td colspan=2 style="font-weight:bold; text-align:left;">Project Tittle: </td> <td colspan=2> <%=viewMap.get("ProjectTitle")%></td>
	</tr>
	
	<tr>
		<td colspan=2 style="font-weight:bold;text-align:left;">Project Description: </td> <td colspan=2> <%=viewMap.get("ProjectDescription")%></td>
	</tr>
	
	<tr>
		<td colspan=2 style="font-weight:bold;text-align:left;">Feature ID: </td> <td colspan=2> <%=request.getParameter("featureID")%>
		<input type=hidden name="featureID" Value='<%=request.getParameter("featureID")%>' ></td>
	</tr>
	<tr>
		<td colspan=2 style="font-weight:bold;text-align:left;">Feature Code: </td> <td colspan=2> <%=request.getParameter("featureCode")%>
		<input type=hidden name="featureCode" Value='<%=request.getParameter("featureCode")%>' ></td>
	</tr>
	<tr>
		<td colspan=2 style="font-weight:bold;text-align:left;">Feature Description: </td> <td colspan=2> <%=request.getParameter("featureDesc")%></td>
	</tr>
	<tr>
		<td colspan=2 style="font-weight:bold;text-align:left;">Target Date: </td> <td colspan=2>
<%
if (session.getAttribute(request.getParameter("featureID").toString())!=null)
{%>
	<%=targetDate%>
	<input type=hidden name="action" Value='update' ></td>
	<input type="hidden" id="targetDate" name="targetDate" value="<%=targetDate%>">
<%}else {%>
		<input type="date" id="targetDate" name="targetDate" value="">


<%}%>		</td>
	</tr>
	
		
		<tr >
		 <td style="font-weight:bold;text-align:left;">Feature Created in Agile Craft</td><td><select name="featureinAC" >
		 <option value="<%=FeatureInAC%>"><%=FeatureInAC%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select></td>
	
		 <td style="font-weight:bold;text-align:left;">HLSD Base lined</td><td><select name="HLSD_Baslined" >
		 <option value="<%=HLSD_Baslined%>"><%=HLSD_Baslined%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select></td>
		  </tr><tr>
		   <td style="font-weight:bold;text-align:left;">Reported FLD design Complete</td><td><input type="text" id="FLD_Design" name="FLD_Design" value="<%=FLD_Design%>"> </td>
		  <td style="font-weight:bold;text-align:left;">Reported Development Complete</td><td><input type="text" name="FLD_Dev" value="<%=FLD_Dev%>"> </td>
		 
		 
</tr><tr>		  
		  <td style="font-weight:bold;text-align:left;">FLD completed </td><td><select name="FLD_Complete" >
		 <option value="<%=FLD_Complete%>"><%=FLD_Complete%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select></td>
	
		<td style="font-weight:bold;text-align:left;">FLD document location/link</td><td><input type="text" id="FLD_Loc" name="FLD_Loc" value="<%=FLD_Loc%>"></td>
	</tr><tr>
		  <td style="font-weight:bold;text-align:left;">Swagger Completed</td><td><select name="Swagger" >
		<option value="<%=Swagger%>"><%=Swagger%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select>  </td>
	 
		  <td style="font-weight:bold;text-align:left;">Swagger location </td><td><input type="text" name="Swagger_Loc" value="<%=Swagger_Loc%>"> </td>
		 
</tr><tr>	
		 <td style="font-weight:bold;text-align:left;">Sequence Diagram Completed </td><td><select name="SD" >
		 <option value="<%=SD%>"><%=SD%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select> </td>
	
		  <td style="font-weight:bold;text-align:left;">Sequence Diagram location </td><td><input type="text" name="SD_Loc" value="<%=SD_Loc%>"> </td>
</tr><tr>	
	<td style="font-weight:bold;text-align:left;">Security Design Verified in security section of FLD</td><td>
	
	<select name="security_check" >
		 <option value="<%=Security_Check%>"><%=Security_Check%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select>
	
</td>
	  
		  <td style="font-weight:bold;text-align:left;">Test Readiness Verified - Perf Section in FLD & Perf Matrix filled etc.</td><td>
		  
		  <select name="Test_check" >
		 <option value="<%=Test_Check%>"><%=Test_Check%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select>
		  
		  
		 </td>
		  </tr><tr>	
		  
		  
		  
		  
		   <td style="font-weight:bold;text-align:left;">DIT allocation and is Ready?</td><td><select name="DIT_check" >
		    <option value="<%=DIT_Check%>"><%=DIT_Check%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select></td>
	
		  <td style="font-weight:bold;text-align:left;">QAT allocation and is Ready?</td><td><<select name="QAT_check" >
		 <option value="<%=QAT_Check%>"><%=QAT_Check%></option>
		
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select> </td>
	</tr><tr>	  
		  <td style="font-weight:bold;text-align:left;">Prod  readiness verified?</td><td><select name="prd_check" >
		 <option value="<%=PRD_Check%>"><%=PRD_Check%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select> </td>

		 <td style="font-weight:bold;text-align:left;">Network Firewall Rule Configured?</td><td> <select name="network_check" >
		 <option value="<%=Network_Check%>"><%=Network_Check%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select> </td>
		  </tr><tr>	
		  <td style="font-weight:bold;text-align:left;">Test Data Ready </td><td><select name="Test_data_check" >
		   <option value="<%=Test_Data_Check%>"><%=Test_Data_Check%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select> </td>
		
		<td style="font-weight:bold;text-align:left;"># of Direct Epics Under Feature</td><td><input type="text" id="num_epic" name="num_epic" value="<%=num_epic%>"></td>
	</tr><tr>
		  <td style="font-weight:bold;text-align:left;">EDP integration </td><td> <select name="edp_check" >
		 <option value="<%=EDP_Check%>"><%=EDP_Check%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select></td>
		  
		  <td style="font-weight:bold;text-align:left;">AC status for Design </td><td><input type="text" name="ac_design" value="<%=AC_Design%>"> </td>
		  </tr><tr>	
		  
		  
		  
		  <td style="font-weight:bold;text-align:left;">AC status for Dev</td><td> <input type="text" id="ac_dev" name="ac_dev" value="<%=AC_Dev%>"> </td>
		  
		  <td style="font-weight:bold;text-align:left;">AC Status for Test</td><td> <input type="text" name="ac_test" value="<%=AC_Test%>"> </td>
</tr><tr>	
	<td style="font-weight:bold;text-align:left;">AC status for deployment </td><td><input type="text" id="ac_dep" name="ac_dep" value="<%=AC_Dep%>"> </td>
	 
		  <td style="font-weight:bold;text-align:left;">Feature toggle</td><td> 
		  
		  <select name="feature_toggele_check" >
		  <option value="<%=feature_toggele_check%>"><%=feature_toggele_check%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select>
		    
		  </td>
		  </tr><tr>	
		  
		  
		  
		  
		  
		   <td style="font-weight:bold;text-align:left;">Logging assessment</td><td><input type="text" id="logging" name="logging" value="<%=Logging%>"></td>

		  <td style="font-weight:bold;text-align:left;">Security (Auth & Authz for API & services,  PII Encryption etc.)</td><td><input type="text" id="securityauth" name="securityauth" value="<%=securityauth%>"> </td>
	</tr><tr>	  
		  <td style="font-weight:bold;text-align:left;">Telemetry assessment</td><td><input type="text" name="telemetry" value="<%=Telemetry%>"> </td>
		
		<td style="font-weight:bold;text-align:left;">Redundancy /Fail Over design </td><td><input type="text" id="fo" name="fo" value="<%=FO%>"> </td>
		  </tr><tr>	
		  <td colspan= 2 style="font-weight:bold;text-align:left;">Other Patterns/Standards Compliance, Traceability, DR Gaps? </td><td><input type="text" name="op" value="<%=OP%>"> </td>
		
		
	</tr>
	
	<tr>	
		  <td colspan= 2 style="font-weight:bold;text-align:left;">Other Notes</td><td><input type="text" name="notes" value="<%=notes%>"> </td>
		
		
	</tr>
	
	
	<tr><td colspan=4>
	
	<div align=center>
	<table  id="newlink1" class=bordered>
	
	<tr>
	
	<td  style="font-weight:bold;text-align:left;">Data Movement Required</td><td>  <select name="data_mov_check" >
		  <option value="<%=Data_Mov_Check%>"><%=Data_Mov_Check%></option>
		<option value="NA">NA</option>
    <option value="Yes">Yes</option>
    <option value="No">No</option>
    
      </select></td>
	 <td  style="font-weight:bold;text-align:left;">Data Movement Recon design considered </td><td > <input type="text" id="data_mov_recon" name="data_mov_recon" value="<%=Data_Mov_Recon%>"> </td>
	</tr>
	<tr>
		  <td style="font-weight:bold;text-align:left;">Data Movement Initial Load design considered </td><td><input type="text" id="data_mov_init" name="data_mov_init" value="<%=Data_Mov_Init%>"> </td>
  
		  <td style="font-weight:bold;text-align:left;"> Data Movement Incremental Load design considered </td><td><input type="text" name="data_mov_in" value="<%=Data_Mov_In%>"> </td>
		  
		  </tr><tr>	
		 
		  
		 
		  
		
		
		  
			
	</tr>
</table>
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
	<tr>
		
		<td colspan=4><input type="submit" name="Submit" value="Save" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" ></td>
	</tr>
	
	

</table>

</form>

</body>
</html>



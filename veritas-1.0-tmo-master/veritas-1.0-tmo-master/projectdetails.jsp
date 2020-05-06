


<%@ page language="java" import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
   
  
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">

   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

     
    <style>html { font-size: 14px; font-family: Arial, Helvetica, sans-serif; }</style>
    <title></title>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.2.621/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.2.621/styles/kendo.material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.2.621/styles/kendo.material.mobile.min.css" />

    <script src="https://kendo.cdn.telerik.com/2017.2.621/js/jquery.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2017.2.621/js/jszip.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2017.2.621/js/kendo.all.min.js"></script>
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
   
    <script src="/Veritas/alert.js"></script>
  <link rel="stylesheet" href="/Veritas/alert.css">
  <script language="javascript">
  
  
  function addFeature(id){
   
    window.location.href="/Veritas/addFeatureforProject/"+id; 
  }
    function addComponent(id){
   
    window.location.href="/Veritas/addComponentforProject/"+id; 
  }
   function addDependency(id){
   
    window.location.href="/Veritas/addDependencyforProject/"+id; 
  }
  
  function addResource(id){
   
    window.location.href="/Veritas/addResourceforProject?id="+id; 
  }
  
    function addHLSD(id){
   
    window.location.href="/Veritas/addHLSDforProject?id="+id; 
  }
  
  function addDt(id){
   
    window.location.href="/Veritas/addTDforProject?id="+id; 
  }
  
  
  
  function addcr(id){
   
    window.location.href="/Veritas/addCRForProject?id="+id; 
  }
  
   function addpdr(id){
   
    window.location.href="/Veritas/pdrUI?id="+id; 
  }
  
  
  
    function addITD(id){
   
    window.location.href="/Veritas/addIntegrationForProject?id="+id; 
  }
  
  
  
  
  
  function editcr(id,crID,crDetails,JRDBDetails,cr_add,cr_num,cr_Recom,cr_size,cr_System,cr_loc,reviewDate){
   
    window.location.href="/Veritas/addCRForProject?ProjectID="+id+"&crID="+crID+"&crDetails="+crDetails+"&cr_add="+cr_add+"&JRDBDetails="+JRDBDetails+"&cr_num="+cr_num+"&cr_Recom="+cr_Recom+"&cr_size="+cr_size+"&cr_System="+cr_System+"&cr_loc="+cr_loc+"&action=update &reviewDate="+reviewDate;
  }


  
  function edititc(id,iTDID,IT_Type,IT_Method,ITC_Name,ITC_Owner,ITC_Consumer,ITC_add_details){
   
    window.location.href="/Veritas/addIntegrationForProject?ProjectID="+id+"&iTDID="+iTDID+"&IT_Type="+IT_Type+"&IT_Method="+IT_Method+"&ITC_Name="+ITC_Name+"&ITC_Owner="+ITC_Owner+"&ITC_Consumer="+ITC_Consumer+"&ITC_add_details="+ITC_add_details+"&action=update";
  }
  


  
  
  function editResource(ProjectID,ProjectResource,ProjectRole,Company){
      window.location.href="/Veritas/editResourceforProject?ProjectID="+ProjectID+"&ProjectResource="+ProjectResource+"&ProjectRole="+ProjectRole+"&Company="+Company; 
  }
    function editHLSD(ProjectID,ReviewDate,HLSD_TShirt,ReviewStatus,ActionItems,ImpactedDomains,ImpactedCapabilities,AxiomScore,APICount, FeatureCount,ExecutiveSummary,ReviewFeedbackLink,BRDbaslined,HLSDReceived,HLSDReviewWithBiz,AttendeesReceived,DocSentToReviewer,ReviewDecReceived,MOMSent,reviewID){
   ExecutiveSummary=encodeURIComponent(ExecutiveSummary);
  ReviewFeedbackLink=encodeURIComponent(ReviewFeedbackLink);
			
      window.location.href="/Veritas/editHLSDforProject?ProjectID="+ProjectID+"&ReviewDate="+ReviewDate+"&HLSD_TShirt="+HLSD_TShirt+"&ReviewStatus="+ReviewStatus+"&ActionItems="+ActionItems+"&ImpactedDomains="+ImpactedDomains+"&ImpactedCapabilities="+ImpactedCapabilities+"&AxiomScore="+AxiomScore+"&APICount="+APICount+"&FeatureCount="+FeatureCount+"&ExecutiveSummary="+ExecutiveSummary+"&ReviewFeedbackLink="+ReviewFeedbackLink+"&BRDbaslined="+BRDbaslined+"&HLSDReceived="+HLSDReceived+"&HLSDReviewWithBiz="+HLSDReviewWithBiz+"&AttendeesReceived="+AttendeesReceived+"&DocSentToReviewer="+DocSentToReviewer+"&ReviewDecReceived="+ReviewDecReceived+"&MOMSent="+MOMSent+"&reviewID="+reviewID; 
  }
  
  
   function editComponent(ProjectID,ComponentID,ComponentName,ComponentType,ComponentOwner,Impact,TShirt,ImpactType,ImpactDetails){
   ComponentName=encodeURIComponent(ComponentName);
  ComponentOwner=encodeURIComponent(ComponentOwner);
   ImpactType=encodeURIComponent(ImpactType);
  ImpactDetails=encodeURIComponent(ImpactDetails);
   
    window.location.href="/Veritas/editComponentforProject.jsp?ProjectID="+ProjectID+"&ComponentID="+ComponentID+"&ComponentName="+ComponentName+"&ComponentType="+ComponentType+"&ComponentOwner="+ComponentOwner+"&Impact="+Impact+"&TShirt="+TShirt+"&ImpactType="+ImpactType+"&ImpactDetails="+ImpactDetails;
  }
  
  
function editFeature(ProjectID,FeatureID,FeatureTitle,dependency,FeatureCode){
   FeatureTitle=encodeURIComponent(FeatureTitle);
      FeatureCode=encodeURIComponent(FeatureCode);
   
    window.location.href="/Veritas/editFeatureforProject?ProjectID="+ProjectID+"&FeatureID="+FeatureID+"&FeatureTitle="+FeatureTitle+"&FeatureCode="+FeatureCode; 
  }

 function AddStatus(featureID,featureCode,featureDesc,StatusData)
 
 
 {
	 StatusData=encodeURIComponent(StatusData);
	  featureDesc=encodeURIComponent(featureDesc);
      featureCode=encodeURIComponent(featureCode);
   
    window.location.href="/Veritas/addProjectStatusUI?featureID="+featureID+"&featureDesc="+featureDesc+"&featureCode="+featureCode+"&StatusData="+StatusData; 
 }

  function deleteRecord(id){
   
    swal("Error!"," You don't have permision to delete Record!", "error");
  }
  
  function viewNote(id){
	   
	    window.location.href="viewNoteServlet/"+id; 
	  }
  
  function editProject(ProjectID,ProjectNumber,ProjectDescription,ProjectType,Workstream,ProjectSite,projectTittle,ProjectStatus,wave1,wave2,wave3,TargetDeployment)
  {
  ProjectNumber=encodeURIComponent(ProjectNumber);
  ProjectDescription=encodeURIComponent(ProjectDescription);
    projectTittle=encodeURIComponent(projectTittle);
  ProjectSite=encodeURIComponent(ProjectSite);
  
	  window.location.href="/Veritas/editProject?ProjectID="+ProjectID+"&ProjectNumber="+ProjectNumber+"&ProjectDescription="+ProjectDescription+"&ProjectType="+ProjectType+"&Workstream="+Workstream+"&ProjectSite="+ProjectSite+"&projectTittle="+projectTittle+"&ProjectStatus="+ProjectStatus+"&wave1="+wave1+"&wave2="+wave2+"&wave3="+wave3+"&TargetDeployment="+TargetDeployment;
  }
  
  function insertText () {
   var details= document.getElementById('comDetail').innerHTML;
   details=details.replace('""')
}



</script>


<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
/* Tablet Landscape */
@media screen and (max-width: 1060px) {
    #primary { width:67%; }
    #secondary { width:30%; margin-left:3%;}  
}
/* Tabled Portrait */
@media screen and (max-width: 768px) {
    #primary { width:100%; }
    #secondary { width:100%; margin:0; border:none; }
}
* {
  box-sizing: border-box;
}
  .bordered {
   
    border: 2px dashed #E20074;
	 margin: 100px;
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






table#t01 td {
  text-align: center;
  font-family: Arial;
}
td {
  text-align: center;
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

.accordion {
  background-color: white;
  color: blue;
  cursor: pointer;
  padding: 28px;
   
  width: 90%;
  border: none;
  text-align: left;
   text-decoration: underline;
  text-decoration-color: blue;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #fce2ec; 
}

.panel {
  padding: 0 18px;
  

  background-color: white;
  overflow: hidden;
}
html{
    width:100%;
    height:100%;
}


body{
  overflow-x: scroll;
}


.sidebar {
  height: 100%;
  width: 70px;
  position: fixed;
  z-index: 1;
  top: 60;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 16px;
}

.sidebar a {
  display: inline-block;
  color: white;
  text-align: center;
 
  text-decoration: none;
}

.sidebar a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
</style>

 </HEAD>

 <BODY>
 
 <%@ include file="viewMenuItem.jsp" %>
<style>
   
   
  .wrapper{
  padding: 10px 0;
  
    
 
 
  
    </style>
  
  
  
  
  <%
   String c="";
   String HDetails="";
   String fc="";
   String ft="";
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
	
  



<div align="center" style="font-family: Arial;" >
<div class="wrapper" id="myCanvas">


	
	
			
			
		

	


<div class="sidebar">
  <a href="#" onclick="addFeature(<%=viewMap.get("ProjectID")%>);"><i class="fa fa-tasks" onclick="addFeature(<%=viewMap.get("ProjectID")%>);"></i> Add Feature</a>
  <a href="#" onclick="addResource(<%=viewMap.get("ProjectID")%>);"><i class="fa fa-users" onclick="addResource(<%=viewMap.get("ProjectID")%>);"></i> Add </a>
  <a href="#" onclick="addcr(<%=viewMap.get("ProjectID")%>);"><i class="fa fa-handshake-o" onclick="addcr(<%=viewMap.get("ProjectID")%>);"></i> Add CR</a>
  <a href="#" onclick="addComponent(<%=viewMap.get("ProjectID")%>);"><i class="fa fa-cubes" onclick="addComponent(<%=viewMap.get("ProjectID")%>);"></i> Add New application </a>
    <a href="#" onclick="addDt(<%=viewMap.get("ProjectID")%>);">><i class="fa  fa-money" onclick="addDt(<%=viewMap.get("ProjectID")%>);">></i> Add Tech Debt </a>
  <a href="#" onclick="addpdr(<%=viewMap.get("ProjectID")%>);"><i class="fa fa-exclamation-triangle onclick="addpdr(<%=viewMap.get("ProjectID")%>);""></i> Add Delivery Risk</a>
  <a href="#" onclick="addHLSD(<%=viewMap.get("ProjectID")%>);"><i class="fa fa-sitemap" onclick="addHLSD(<%=viewMap.get("ProjectID")%>);"></i> Add HLSD </a>
  <a href="#" onclick="addITD(<%=viewMap.get("ProjectID")%>);"><i class="fa fa-cloud" onclick="addITD(<%=viewMap.get("ProjectID")%>);"></i> Add connection points </a>
   <a href="#" onclick="addDependency(<%=viewMap.get("ProjectID")%>);"><i class=" fa fa-link" onclick="addDependency(<%=viewMap.get("ProjectID")%>);" ></i> Add dependency </a>
   <a href="#" onclick="editProject(<%=viewMap.get("ProjectID")%>,'<%=viewMap.get("ProjectNumber")%>','<%=viewMap.get("ProjectDescription")%>','<%=viewMap.get("ProjectType")%>','<%=viewMap.get("Workstream")%>','<%=viewMap.get("ProjectSite")%>','<%=viewMap.get("ProjectTitle")%>','<%=viewMap.get("ProjectStatus")%>','<%=viewMap.get("wave1")%>','<%=viewMap.get("wave2")%>','<%=viewMap.get("isRestricted")%>','<%=viewMap.get("TargetDeployment")%>');"> 
   <i class="fa fa-pencil" editProject(<%=viewMap.get("ProjectID")%>,'<%=viewMap.get("ProjectNumber")%>','<%=viewMap.get("ProjectDescription")%>','<%=viewMap.get("ProjectType")%>','<%=viewMap.get("Workstream")%>','<%=viewMap.get("ProjectSite")%>','<%=viewMap.get("ProjectTitle")%>','<%=viewMap.get("ProjectStatus")%>','<%=viewMap.get("wave1")%>','<%=viewMap.get("wave2")%>','<%=viewMap.get("isRestricted")%>','<%=viewMap.get("TargetDeployment")%>');"></i> Edit Project </a>
  <a href="#" onclick="AddStatus('101','Project Status', 'This is to track project','');"><i class="fa fa-search" onclick="AddStatus('101','Project Status', 'This is to track project','');"></i> Audit Project </a>

  
</div>
<div align="center" style="font-size:280%; color:#E20074;font-family: Arial;"; > Project Summary </div>
  <table   align="center" style="border:2px double #E20074;border-style:  solid double;">

	 
	 
	
    <tr >
		 <td style="font-weight:bold;font-family: Arial;text-align=left;">Project ID :</td> 
		 <td> <%=viewMap.get("ProjectID")%> </td> 
		 <td style="font-weight:bold;">Project Code : </td>
		 <td><%=viewMap.get("ProjectNumber")%></td> 
		 
		 <td style="font-weight:bold;">Project Tittle : </td>
		 <td><%=viewMap.get("ProjectTitle")%></td> 
		 <td style="font-weight:bold;">Project Description : </td>
		 <td><%=viewMap.get("ProjectDescription")%></td>
	</tr>
	<tr><br></tr>
	<tr>
	 <td style="font-weight:bold;">Project Type :</td>  <td><%=viewMap.get("ProjectType")%></td>
	  <td style="font-weight:bold;">Project WorkStream :</td> <td><%=viewMap.get("Workstream")%></td>
	  <td style="font-weight:bold;">Project Link :</td> <td><%=viewMap.get("ProjectSite")%></td>
	<td style="font-weight:bold;">Target Deployment  :</td>  <td><%=viewMap.get("TargetDeployment")%></td>
</tr>
	<tr ></tr>
	
	<%
	String waveInfo="";
	if(viewMap.get("wave1").toString().equalsIgnoreCase("true"))
	{
		waveInfo="Wave 1";
	}
	if(viewMap.get("wave2").toString().equalsIgnoreCase("true"))
	{
		if (viewMap.get("wave1").toString().equalsIgnoreCase("true"))
		{
			waveInfo=waveInfo+", Wave 2";
		}else{
		waveInfo=waveInfo+"Wave 2";
		}
	}
	if(viewMap.get("isRestricted").toString().equalsIgnoreCase("true"))
	{
		
		if (viewMap.get("wave1").toString().equalsIgnoreCase("true") || viewMap.get("wave2").toString().equalsIgnoreCase("true"))
		{
			waveInfo=waveInfo+", Wave 3";
		}else{
		waveInfo=waveInfo+"Wave 3";
		}
		
		
	}
	
	
	%>
		<tr>
	<td style="font-weight:bold;">Project Wave  :</td>  <td><%=waveInfo%></td> 
	  <td style="font-weight:bold;">Project Status :</td> <td><%=viewMap.get("ProjectStatus")%></td><% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin") ){%>
	  <td></td>
	 <td> 
	 
	 
<%if(viewMap.get("ProjectStatus")!=null && !viewMap.get("ProjectStatus").toString().equalsIgnoreCase("Dependency")){%>	 


	 
	  <%}}
	  
	  session.setAttribute("101",viewMap.get("status"));
	  
	  %>
	 <td><i class="fas fa-file-pdf" title="Export to PDF" aria-hidden="true" onclick="ExportPdf()"></i></td>
	 	<td>   </td>
	 


	 
	 
  </tr>
  </table>
  <%  
  if(viewMap.get("hlsd") !=null)
 {
	 
	 HashMap hlsdMap=new HashMap();
 ArrayList hlsdList=(ArrayList)viewMap.get("hlsd");
 Iterator itrhlsd = hlsdList.iterator();
		
		if(itrhlsd.hasNext())
		{
  
  	
		%>
		
		<button class="accordion">HLSD Review Details</button>
	<div class="panel">
	<p>
		
		 <table id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th width=5%>Review Date</th>

		<th >HLSD TShirt </th>
	
		<th>Review Status </th>
		<th >Action Items count</th>
		<th >Impacted Domains Count </th>

<th >Impacted Capabilities count</th>

		<th >Axiom Score</th>
	
		<th >API Count </th>
		<th >Feature Count </th>
		<th width=52%>Executive Summary</th>	
		<th> ReviewFeedbackLink</th>
			<th >BRD Baselined</th>

<th >HLSD Received</th>

		<th >HLSD Reviewed with Biz</th>
	
		<th >Attendees Received</th>
		<th >Docs Sent to Reviewers</th>
		<th>Review Deck Received</th>	
		<th> Meeting Notes/AIs Sent</th>
	
		


		
		
		
<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>	  
	  <th colspan="1"></th> 		  <%}%>			
	 			</tr>
 
		<%
		
			while(itrhlsd.hasNext())
		{
			 hlsdMap=(HashMap)itrhlsd.next();
    
  if( hlsdMap.get("ReviewDate")!=null){
		
		if(hlsdMap.get("ExecutiveSummary")!=null && !hlsdMap.get("ExecutiveSummary").toString().equalsIgnoreCase("NULL")) {
		
		 HDetails= hlsdMap.get("ExecutiveSummary").toString();
      
       HDetails=HDetails.replaceAll("[^a-zA-Z0-9\\s+]", "");
		HDetails=HDetails.replaceAll("\n", "");
		}
		
		
		%>
	
    
	<tr>
	
		<td width=5% > <%=hlsdMap.get("ReviewDate")%></td>

		<td width=2%><%=hlsdMap.get("HLSD_TShirt")%></td>
	
		<td width=5%><%=hlsdMap.get("ReviewStatus")%></td>
		<td width=2%> <%=hlsdMap.get("ActionItems")%></td>
		<td width=2%><%=hlsdMap.get("ImpactedDomains")%></td>

<td width=2% ><%=hlsdMap.get("ImpactedCapabilities")%></td>

		<td width=2%><%=hlsdMap.get("AxiomScore")%></td>
	
		<td width=2%><%=hlsdMap.get("APICount")%></td>
		<td width=2%> <%=hlsdMap.get("FeatureCount")%></td>
		<td width=52% ><%=HDetails%></td>	
		<td width=2%><%=hlsdMap.get("ReviewFeedbackLink")%></td>	
		
			<td width=2%><%=hlsdMap.get("BRDbaslined")%></td>
		<td width=2% > <%=hlsdMap.get("HLSDReceived")%></td>
		<td width=2% ><%=hlsdMap.get("HLSDReviewWithBiz")%></td>

<td width=2%><%=hlsdMap.get("AttendeesReceived")%></td>

		<td width=2%><%=hlsdMap.get("DocSentToReviewer")%></td>
	
		<td width=2% ><%=hlsdMap.get("ReviewDecReceived")%></td>
		<td width=2%> <%=hlsdMap.get("MOMSent")%></td>
		
		
		
		<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
	<td width=2%><i class="fa fa-pencil" aria-hidden="true"  title="Edit HLSD " onclick="editHLSD('<%=viewMap.get("ProjectID")%>','<%=hlsdMap.get("ReviewDate")%>','<%=hlsdMap.get("HLSD_TShirt")%>','<%=hlsdMap.get("ReviewStatus")%>','<%=hlsdMap.get("ActionItems")%>','<%=hlsdMap.get("ImpactedDomains")%>','<%=hlsdMap.get("ImpactedCapabilities")%>','<%=hlsdMap.get("AxiomScore")%>','<%=hlsdMap.get("APICount")%>','<%=hlsdMap.get("FeatureCount")%>','<%=HDetails%>','<%=hlsdMap.get("ReviewFeedbackLink")%>','<%=hlsdMap.get("BRDbaslined")%>','<%=hlsdMap.get("HLSDReceived")%>','<%=hlsdMap.get("HLSDReviewWithBiz")%>','<%=hlsdMap.get("AttendeesReceived")%>','<%=hlsdMap.get("DocSentToReviewer")%>','<%=hlsdMap.get("ReviewDecReceived")%>','<%=hlsdMap.get("MOMSent")%>','<%=hlsdMap.get("reviewID")%>');" ></i> </td>
				
  <%}}%>
					
			</tr>
		<%}%>
	
  </table>
		
		</p></div>
		
 <%}}%>	 
 <%
 if(viewMap.get("featureList") !=null)
 {
 ArrayList featureList=(ArrayList)viewMap.get("featureList");
 Iterator itrFeature = featureList.iterator();
		
		if(itrFeature.hasNext())
		{%>
	
	<button class="accordion">Feature List</button>
	<div class="panel">
	<p>
	
 <table  id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
 	<tr>
<th >Feature ID </th>
		<th >Feature Code </th>

		<th >Feature Description </th>
	
		<th>Dependent Feature  </th>
		<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
		<th colspan="3"></th> 		  <%}%>			
	 			</tr>
 
 
 <%

		
		while(itrFeature.hasNext())
		{
			 feature=(HashMap)itrFeature.next();
			 
			 
			 if(feature.get("FeatureCode")!=null && !feature.get("FeatureCode").toString().equalsIgnoreCase("NULL")) {
		
		 fc= feature.get("FeatureCode").toString();
      
        fc=fc.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		fc=fc.replaceAll("\n", "");
		}else
		{
		fc="";
		}
			 
			 if(feature.get("FeatureTitle")!=null && !feature.get("FeatureTitle").toString().equalsIgnoreCase("NULL")) {
		
		 ft= feature.get("FeatureTitle").toString();
      
        ft=ft.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		ft=ft.replaceAll("\n", "");
		}else
		{
		ft="";
		} 
			 
 %>
    
	<tr>
	 
		<td > <%=feature.get("FeatureID")%></td>
		<td > <%=fc%></td>
	
		<td > <%=ft%></td>
	
		<td >  <%=feature.get("DependentFeature")%></td><% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
	 <td align="center"><i align=center; class="fa fa-pencil"  title="Edit Feature " aria-hidden="true" onclick="editFeature(<%=viewMap.get("ProjectID")%>,<%=feature.get("FeatureID")%>,'<%=feature.get("FeatureTitle")%>','<%=feature.get("DependentFeature")%>','<%=feature.get("FeatureCode")%>');" ></i></td>
				
				
					<td>   <i class="fa fa-trash-o" aria-hidden="true"  title="Delete Feature " onclick="deleteRecord(<%=feature.get("FeatureID")%>);"></i></td>
					<% request.setAttribute(feature.get("FeatureID").toString(),feature.get("status"));
					session.setAttribute(feature.get("FeatureID").toString(),feature.get("status"));
					
					
					%>
					<td>   <i class="fas fa-door-open" aria-hidden="true"  title="Add or Edit Feature Status" onclick="AddStatus('<%=feature.get("FeatureID")%>','<%=fc%>', '<%=ft%>','<%=feature.get("status")%>');"></i></td>
		<%}%>
		
			</tr>
		<%}%>
  </table>
 </p> </div><br>
 <%}}
	if(viewMap.get("componentList")!=null){
 ArrayList componentList=(ArrayList)viewMap.get("componentList");
  Iterator itrcompnent = componentList.iterator();	
  if(itrcompnent!=null && itrcompnent.hasNext())
  {
 
 %>
 
 <button class="accordion">Impacted  Application </button>
	<div class="panel">
	<p>
 <table id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th >Component ID </th>

		<th >Component Name </th>
	
		<th>Component Type </th>
		<th >Component Owner </th>
		

<th >Impact </th>

	
		<th >TShirt Size </th>
		
		<th >Impact Type </th>

	
		<th >Impact Details </th>
		
		
		<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
		
	       <th colspan="2"></th> 			  <%}%>		
	 			</tr>
  
<%
	
		while(itrcompnent.hasNext())
		{
			HashMap component=(HashMap)itrcompnent.next();
 %>
    
	
		
	
    
	<tr>
	
		<td > <%=component.get("ComponentID")%></td>

		<td ><%=component.get("ComponentName")%></td>
	
		<td ><%=component.get("ComponentType")%></td>
		<td > <%=component.get("ComponentOwner")%></td>
		

<td ><%=component.get("Impact")%></td>

		
		<td ><%=component.get("TShirt_Size")%></td>
		
		<td ><%if(component.get("ImpactType")!=null && !component.get("ImpactType").toString().equalsIgnoreCase("NULL")) {%> <%=component.get("ImpactType")%> <%}%></td>

		
		<td><%if(component.get("ImpactDetails")!=null && !component.get("ImpactDetails").toString().equalsIgnoreCase("NULL")) {
		
		 c= component.get("ImpactDetails").toString();
      
        c=c.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		c=c.replaceAll("\n", "");
		
		%><%=c%> <%}%></td>
		
		
		
		
<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
  
	<td><i align=center; class="fa fa-pencil" aria-hidden="true" onclick="editComponent(<%=viewMap.get("ProjectID")%>, <%=component.get("ComponentID")%>,'<%=component.get("ComponentName")%>','<%=component.get("ComponentType")%>','<%=component.get("ComponentOwner")%>','<%=component.get("Impact")%>','<%=component.get("TShirt_Size")%>','<%=component.get("ImpactType")%>','<%=c%>');" > </i></td>
				
				
					<td > <i class="fa fa-trash-o" aria-hidden="true" onclick="deleteRecord(<%=component.get("ComponentID")%>);"></i></td><%}%>
			</tr>
		<%}%>
  </table>

 </p></div>
	<%}}%>
	
	
	
	 <%
	if (viewMap.get("itd")!=null)
	{
 ArrayList itdList=(ArrayList)viewMap.get("itd");
 Iterator itd1 = itdList.iterator();
		String ITC_add_details="";
		if(itd1.hasNext())
		{%>
  
  <button class="accordion">Integration Touch point Details</button>
	<div class="panel">
	<p>
   <table id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th >Integration Component Id </th>
		<th >Integration Type </th>

		<th >Integration Method </th>
	
		<th>Integration Component Name </th>
		
		<th >Integration Component Owner</th>
		<th >Integration Component Consumer</th>	
		
		<th >Firewall Port/Rule (Optional)</th>
		
		
		<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
	       <th colspan="2"></th> 			  <%}%>		
	 			</tr>
  
  <%

		
		while(itd1.hasNext())
		{
			HashMap itdmap=(HashMap)itd1.next();
 %>
    
	
		
   
	<tr>
	
		<td > <%=itdmap.get("iTDID")%></td>

		<td ><%=itdmap.get("IT_Type")%></td>
	
		<td ><%=itdmap.get("IT_Method")%></td>
		
		<td > <%=itdmap.get("ITC_Name")%></td>
		<td ><%=itdmap.get("ITC_Owner")%></td>	
		<td ><%=itdmap.get("ITC_Consumer")%></td>	
		
		<%if(itdmap.get("ITC_add_details")!=null && !itdmap.get("ITC_add_details").toString().equalsIgnoreCase("NULL")) {
		
		 ITC_add_details= itdmap.get("ITC_add_details").toString();
      
        ITC_add_details=ITC_add_details.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		ITC_add_details=ITC_add_details.replaceAll("\n", "");
		}
		%>
		<td ><%=ITC_add_details%></td>
		
		
		<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
	<td><i align=center; class="fa fa-pencil" aria-hidden="true" onclick="edititc(<%=viewMap.get("ProjectID")%>,'<%=itdmap.get("iTDID")%>','<%=itdmap.get("IT_Type")%>','<%=itdmap.get("IT_Method")%>','<%=itdmap.get("ITC_Name")%>','<%=itdmap.get("ITC_Owner")%>','<%=itdmap.get("ITC_Consumer")%>','<%=ITC_add_details%>');" ></i></td>
				
			
					<td><i class="fa fa-trash-o" aria-hidden="true" onclick="deleteRecord('<%=itdmap.get("iTDID")%>');"></i></td><%}%>
			</tr>
		<%}%>
		
		</table>
		
		</p></div>
	<%}}%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    <%
	if (viewMap.get("leadershipList")!=null)
	{
 ArrayList leadershipList=(ArrayList)viewMap.get("leadershipList");
 Iterator itrleadership = leadershipList.iterator();
		
		if(itrleadership.hasNext())
		{%>
  
  <button class="accordion">Project Leadership</button>
	<div class="panel">
	<p>
   <table id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th >Name </th>

		<th >Project Role </th>
	
		<th>Company </th>
		
		<th >Start Date </th>
		<th >End Date </th>	
		<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
	       <th colspan="2">Action</th> 			  <%}%>		
	 			</tr>
  
  <%

		
		while(itrleadership.hasNext())
		{
			HashMap leadership=(HashMap)itrleadership.next();
 %>
    
	
		
	
    
	<tr>
	
		<td > <%=leadership.get("ProjectResource")%></td>

		<td ><%=leadership.get("ProjectRole")%></td>
	
		<td ><%=leadership.get("Company")%></td>
		
		<td > <%=leadership.get("StartDate")%></td>
		<td ><%=leadership.get("EndDate")%></td>	
		<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
	<td><i align=center; class="fa fa-pencil" aria-hidden="true" onclick="editResource(<%=viewMap.get("ProjectID")%>,'<%=leadership.get("ProjectResource")%>','<%=leadership.get("ProjectRole")%>','<%=leadership.get("Company")%>');" ></i></td>
				
			
					<td><i class="fa fa-trash-o" aria-hidden="true" onclick="deleteRecord('<%=leadership.get("ProjectResource")%>');"></i></td><%}%>
			</tr>
		<%}%>
		
		</table>
		
		</p></div>
	<%}}%>
	
					
		<%
	if(viewMap.get("cr")!=null){
 ArrayList cr=(ArrayList)viewMap.get("cr");
  Iterator itrcr = cr.iterator();	
  String crDetails="";
  String JRDBDetails="";
  String cr_add="";
    String cr_Recom="";
	String cr_loc="";
  if(itrcr!=null && itrcr.hasNext())
  {
 
 %>
 
 <button class="accordion">CR List and Status</button>
	<div class="panel" >
	<p>
 
 <table id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>
	
		<th >CR ID </th>
		<th >CR Number </th>
		<th >CR Details </th>
	
		<th>CR Effort Size </th>
		<th >CR Impacted Systems</th>
		<th >JRDB Review Comments </th>
	
		<th>CR Additional Information </th>
		<th >CR Recommendation </th>
		<th >CR Location </th>
		<th >CR Review Due date </th>
		
<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
		
<th colspan="1"></th> 		<%}%>		
	 			</tr>
  
<%
	
		while(itrcr.hasNext())
		{
			HashMap crrmap=(HashMap)itrcr.next();
 %>
    
	
		
	
    
	<tr>
	
		<td > <%=crrmap.get("crID")%></td>
		<td > <%=crrmap.get("cr_num")%></td>
		
	

		
		<% if(crrmap.get("crDetails")!=null && !crrmap.get("crDetails").toString().equalsIgnoreCase("NULL")) {
		
		crDetails= crrmap.get("crDetails").toString();
      
        crDetails=crDetails.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		crDetails=crDetails.replaceAll("\n", "");
		}else{
			crDetails="";
		}
		if(crrmap.get("JRDBDetails")!=null && !crrmap.get("JRDBDetails").toString().equalsIgnoreCase("NULL")) {
		
		JRDBDetails= crrmap.get("JRDBDetails").toString();
      
        JRDBDetails=JRDBDetails.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		JRDBDetails=JRDBDetails.replaceAll("\n", "");
		}else{
			JRDBDetails="";
		}
	if(crrmap.get("cr_add")!=null && !crrmap.get("cr_add").toString().equalsIgnoreCase("NULL")) {
		
		cr_add= crrmap.get("cr_add").toString();
      
        cr_add=cr_add.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		cr_add=cr_add.replaceAll("\n", "");
		}else{
			cr_add="";
		}
		if(crrmap.get("cr_Recom")!=null && !crrmap.get("cr_Recom").toString().equalsIgnoreCase("NULL")) {
		
		cr_Recom= crrmap.get("cr_Recom").toString();
      
        cr_Recom=cr_Recom.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		cr_Recom=cr_Recom.replaceAll("\n", "");
		}else{
			cr_Recom="";
		}
  
		
		
		%>
		<td><%=crDetails%></td>
		<td > <%=crrmap.get("cr_size")%></td>
		<td > <%=crrmap.get("cr_System")%></td>

		
	<td><%=JRDBDetails%></td>
		
		
		<td><%=cr_add%></td>
		<td><%=cr_Recom%></td>
		
		<td><%=cr_loc%></td>
		<td > <%=crrmap.get("reviewDate")%></td>

  <% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
  <td><i align=center; class="fa fa-pencil" aria-hidden="true" onclick="editcr(<%=viewMap.get("ProjectID")%>, <%=crrmap.get("crID")%>,'<%=crDetails%>','<%=JRDBDetails%>','<%=cr_add%>','<%=crrmap.get("cr_num")%>','<%=cr_Recom%>','<%=crrmap.get("cr_size")%>','<%=crrmap.get("cr_System")%>','<%=cr_loc%>','<%=crrmap.get("reviewDate")%>');" ></i></td><%}%>
				
				
					
			</tr>
		<%}%>
  </table>
</p></div>
 
	<%}}%>
	
	
	
	
		
		
		
		<%
	if(viewMap.get("techDebt")!=null){
 ArrayList techDebt=(ArrayList)viewMap.get("techDebt");
  Iterator itrtechDebt = techDebt.iterator();	
  String t_details="";
  String t_status="";
  String t_org="";
  if(itrtechDebt!=null && itrtechDebt.hasNext())
  {
 
 %>
 
 
		
 <button class="accordion">Technical Debt</button>
	<div class="panel">
	<p>
 
 <table id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th >Technical Debt ID </th>

		<th >Technical Debt Details </th>
	
		<th>Technical Debt Status </th>
		<th >Technical Debt Identified from</th>
		
<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
		
<th colspan="1"></th> 		<%}%>		
	 			</tr>
  
<%
	
		while(itrtechDebt.hasNext())
		{
			HashMap techDebtmap=(HashMap)itrtechDebt.next();
 %>
    
	
		
	
    
	<tr>
	
		<td > <%=techDebtmap.get("techdebtID")%></td>

	

		
		<% if(techDebtmap.get("techdebt_Details")!=null && !techDebtmap.get("techdebt_Details").toString().equalsIgnoreCase("NULL")) {
		
		t_details= techDebtmap.get("techdebt_Details").toString();
      
        t_details=t_details.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		t_details=t_details.replaceAll("\n", "");
		}else{
			t_details="";
		}
		if(techDebtmap.get("Techdebt_origination")!=null && !techDebtmap.get("Techdebt_origination").toString().equalsIgnoreCase("NULL")) {
		
		t_org= techDebtmap.get("Techdebt_origination").toString();
      
        t_org=t_org.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		t_org=t_org.replaceAll("\n", "");
		}else{
			t_org="";
		}
	if(techDebtmap.get("Techdebt_status")!=null && !techDebtmap.get("Techdebt_status").toString().equalsIgnoreCase("NULL")) {
		
		t_status= techDebtmap.get("Techdebt_status").toString();
      
        t_status=t_status.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		t_status=t_status.replaceAll("\n", "");
		}else{
			t_status="";
		}
  
		
		
		%><td><%=t_details%></td>
		
		<td><%=t_status%></td>
		<td><%=t_org%></td>
		

  <% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
  <td><i align=center; class="fa fa-pencil" aria-hidden="true" onclick="edittd(<%=viewMap.get("ProjectID")%>, <%=techDebtmap.get("techdebtID")%>,'<%=t_details%>','<%=t_status%>','<%=t_org%>');" ></i></td><%}%>
				
				
					
			</tr>
		<%}%>
  </table>
</p></div>
 
	<%}}%>
		
	
	<%
	if(viewMap.get("pdr")!=null){
 ArrayList pdr=(ArrayList)viewMap.get("pdr");
  Iterator itrpdr = pdr.iterator();	
  String pdr_details="";
  String pdr_status="";
  String pdr_org="";
  if(itrpdr!=null && itrpdr.hasNext())
  {
 
 %>
 
 
		
 <button class="accordion">Project Delivery Risk </button>
	<div class="panel" >
	<p>
 
 <table id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th >Project Delivery Risk ID </th>
		<th >Project Delivery Risk Type </th>
		<th >Project Delivery Risk Details </th>
	
		<th>Project Delivery Risk Status </th>
		<th >Project Delivery Risk Identified from</th>
		
<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
		
<th colspan="1"></th> 		<%}%>		
	 			</tr>
  
<%
	
		while(itrpdr.hasNext())
		{
			HashMap pdrmap=(HashMap)itrpdr.next();
 %>
    
	
		
	
    
	<tr>
	
		<td > <%=pdrmap.get("pdrID")%></td>

	

		
		<% if(pdrmap.get("prd_details")!=null && !pdrmap.get("prd_details").toString().equalsIgnoreCase("NULL")) {
		
		pdr_details= pdrmap.get("prd_details").toString();
      
        pdr_details=pdr_details.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		pdr_details=pdr_details.replaceAll("\n", "");
		}else{
			pdr_details="";
		}
		if(pdrmap.get("prd_org")!=null && !pdrmap.get("prd_org").toString().equalsIgnoreCase("NULL")) {
		
		pdr_org= pdrmap.get("prd_org").toString();
      
        pdr_org=pdr_org.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		pdr_org=pdr_org.replaceAll("\n", "");
		}else{
			pdr_org="";
		}
	if(pdrmap.get("prd_status")!=null && !pdrmap.get("prd_status").toString().equalsIgnoreCase("NULL")) {
		
		pdr_status= pdrmap.get("prd_status").toString();
      
        pdr_status=pdr_status.replaceAll("[^a-zA-Z0-9\\s+]", "");
      
		pdr_status=pdr_status.replaceAll("\n", "");
		}else{
			pdr_status="";
		}
  
		
		
		%>
		<td><%=pdrmap.get("prd_type")%></td>
		<td><%=pdr_details%></td>
		
		<td><%=pdr_status%></td>
		<td><%=pdr_org%></td>
		

  <% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
  <td><i align=center; class="fa fa-pencil" aria-hidden="true" onclick="edittd(<%=viewMap.get("ProjectID")%>, <%=pdrmap.get("techdebtID")%>,'<%=pdr_details%>','<%=pdr_status%>','<%=pdr_org%>','<%=pdrmap.get("prd_type")%>');" ></i></td><%}%>
				
				
					
			</tr>
		<%}%>
  </table>
</p></div>
 
	<%}}%>




<%
	if(viewMap.get("dependencyList")!=null){
 ArrayList dependencyList=(ArrayList)viewMap.get("dependencyList");
  Iterator itrdependencyList = dependencyList.iterator();	
  
  if(itrdependencyList!=null && itrdependencyList.hasNext())
  {
 
 %>
 
 
		
 <button class="accordion">Project Dependency List </button>
	<div class="panel" >
	<p>
 
 <table id="t01"   align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th >Dependency ID </th>
		<th >Project ID </th>

		<th >Project Number </th>
	
		<th>Project Title </th>
		<th >Project Description </th>
		<th >Workstream </th>

		<th >Project Status </th>
		
		
		<th >Nature of Dependency </th>
		
		
		<th >Dependency and Mitigation</th>
		
	 			</tr>
  
<%
	
		while(itrdependencyList.hasNext())
		{
			HashMap demap=(HashMap)itrdependencyList.next();
 %>
    
	
		
	
    
	<tr>
	
		
		<td > <%=demap.get("DependencyID")%></td>
		<td > <%=demap.get("ProjectID")%></td>

		<td ><%=demap.get("ProjectNumber")%></td>
	
		<td ><%=demap.get("ProjectTitle")%></td>
		<td > <%=demap.get("ProjectDescription")%></td>
		<td ><%=demap.get("Workstream")%></td>
	<td ><%=demap.get("ProjectStatus")%></td>

		<td ><%=demap.get("nature")%></td>
	

		<td><%=demap.get("strategies")%></td>
		

				
				
					
			</tr>
		<%}%>
  </table>
</p></div>
 
	<%}}%>








<br><br>
	
	  
  </div>   	
		<% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
		
		
   <table id="t01" align="center" >
		
		<tr>
		<td><input type="button" name="add"  value="Add New Feature" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;padding: 15px 32px;white-space: normal;height:60px;width:150px;" onclick="addFeature(<%=viewMap.get("ProjectID")%>);"></td>
			<td><input type="button" name="add"  value="Add New Resource" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;padding: 15px 32px;white-space: normal;height:60px;width:150px;" onclick="addResource(<%=viewMap.get("ProjectID")%>);"></td>
			<% if( viewMap.get("hlsd")==null){%>
			
			<td><input type="button" name="add"  value="Add HLSD" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;padding: 15px 32px;white-space: normal;height:60px;width:150px;" onclick="addHLSD(<%=viewMap.get("ProjectID")%>);"></td>
		
			<%}%>
			<td><input type="button" name="add2"  value="Add CR " style="background-color:#ff7faf;font-weight:bold;color:#ffffff;padding: 15px 30px;white-space: normal;height:60px;width:150px;" onclick="addcr(<%=viewMap.get("ProjectID")%>);"></td>
	
			
			
			
			<td><input type="button" name="add"  value="Add New Component" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;padding: 15px 30px;white-space: normal;height:60px;width:150px;" onclick="addComponent(<%=viewMap.get("ProjectID")%>);"></td>
		
			
		<td><input type="button" name="add"  value="Add New Tech Debt " style="background-color:#ff7faf;font-weight:bold;color:#ffffff;padding: 15px 30px;white-space: normal;height:60px;width:150px;" onclick="addDt(<%=viewMap.get("ProjectID")%>);"></td>
	<td><input type="button" name="add3"  value="Add Project Delivery Risk " style="background-color:#ff7faf;font-weight:bold;color:#ffffff;padding: 15px 30px;white-space: normal;height:60px;width:150px;" onclick="addpdr(<%=viewMap.get("ProjectID")%>);"></td>

	<% if( viewMap.get("hlsd")!=null){
			%>
			
			<td><input type="button" name="add"  value="Add Additional HLSD Review" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;padding: 15px 30px;white-space: normal;height:60px;width:150px;" onclick="addHLSD(<%=viewMap.get("ProjectID")%>);"></td> <%}%>
	
	<td><input type="button" name="add1"  value="Add Integration Details " style="background-color:#ff7faf;font-weight:bold;color:#ffffff; padding: 15px 32px;white-space: normal;height:60px;width:150px;" onclick="addITD(<%=viewMap.get("ProjectID")%>);"></td>
	
		</tr>
  </table>
		<%}%>
  
  
  <%
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
  
  </div>   

   

 

     

    <script>
     function ExportPdf(){ 
	kendo.drawing
    .drawDOM("#myCanvas", 
    { 
        forcePageBreak: ".page-break", 
        paperSize: "a4",
        margin: { top: "1cm", bottom: "1cm" },
        scale: 0.5,
        height: 500, 
        template: $("#page-template").html(),
        keepTogether: ".prevent-split"
    })
        .then(function(group){
        kendo.drawing.pdf.saveAs(group, "<%=viewMap.get("ProjectTitle")%>.pdf")
    });
}
    </script>
   
</div>

  
  
  
  
  
  <script>
  var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}

var tables = document.getElementsByTagName('table');
for (var i=0; i<tables.length;i++){
 resizableGrid(tables[i]);
}

function resizableGrid(table) {
 var row = table.getElementsByTagName('tr')[0],
 cols = row ? row.children : undefined;
 if (!cols) return;
 
 table.style.overflow = 'hidden';
 
 var tableHeight = table.offsetHeight;
 
 for (var i=0;i<cols.length;i++){
  var div = createDiv(tableHeight);
  cols[i].appendChild(div);
  cols[i].style.position = 'relative';
  setListeners(div);
 }

 function setListeners(div){
  var pageX,curCol,nxtCol,curColWidth,nxtColWidth;

  div.addEventListener('mousedown', function (e) {
   curCol = e.target.parentElement;
   nxtCol = curCol.nextElementSibling;
   pageX = e.pageX; 
 
   var padding = paddingDiff(curCol);
 
   curColWidth = curCol.offsetWidth - padding;
   if (nxtCol)
    nxtColWidth = nxtCol.offsetWidth - padding;
  });

  div.addEventListener('mouseover', function (e) {
   e.target.style.borderRight = '2px solid #0000ff';
  })

  div.addEventListener('mouseout', function (e) {
   e.target.style.borderRight = '';
  })

  document.addEventListener('mousemove', function (e) {
   if (curCol) {
    var diffX = e.pageX - pageX;
 
    if (nxtCol)
     nxtCol.style.width = (nxtColWidth - (diffX))+'px';

    curCol.style.width = (curColWidth + diffX)+'px';
   }
  });

  document.addEventListener('mouseup', function (e) { 
   curCol = undefined;
   nxtCol = undefined;
   pageX = undefined;
   nxtColWidth = undefined;
   curColWidth = undefined
  });
 }
 
 function createDiv(height){
  var div = document.createElement('div');
  div.style.top = 0;
  div.style.right = 0;
  div.style.width = '5px';
  div.style.position = 'absolute';
  div.style.cursor = 'col-resize';
  div.style.userSelect = 'none';
  div.style.height = height + 'px';
  return div;
 }
 
 function paddingDiff(col){
 
  if (getStyleVal(col,'box-sizing') == 'border-box'){
   return 0;
  }
 
  var padLeft = getStyleVal(col,'padding-left');
  var padRight = getStyleVal(col,'padding-right');
  return (parseInt(padLeft) + parseInt(padRight));

 }

 function getStyleVal(elm,css){
  return (window.getComputedStyle(elm, null).getPropertyValue(css))
 }
};




  </script>
  
 </BODY>
</HTML>

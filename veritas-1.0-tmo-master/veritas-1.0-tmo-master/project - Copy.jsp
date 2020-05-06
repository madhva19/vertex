<%@ page language="java" import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
   <TITLE>SDO Integration </TITLE>
   
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
    <script src="/Veritas/alert.js"></script>
  <link rel="stylesheet" href="/Veritas/alert.css">
  <script language="javascript">
  
  
  function addFeature(id){
   
    window.location.href="addFeatureforProject/"+id; 
  }
    function addComponent(id){
   
    window.location.href="addComponentforProject/"+id; 
  }
  
  
  function addResource(id){
   
    window.location.href="addResourceforProject.jsp?id="+id; 
  }
  
    function addHLSD(id){
   
    window.location.href="addHLSDforProject.jsp?id="+id; 
  }
  
  
  
  
  
  function editResource(ProjectID,ProjectResource,ProjectRole,Company){
       window.location.href="editResourceforProject.jsp?ProjectID="+ProjectID+"&ProjectResource="+ProjectResource+"&ProjectRole="+ProjectRole+"&Company="+Company; 
  }
    function editHLSD(ProjectID,ReviewDate,HLSD_TShirt,ReviewStatus,ActionItems,ImpactedDomains,ImpactedCapabilities,AxiomScore,APICount, FeatureCount,ExecutiveSummary,ReviewFeedbackLink	
){
			
      window.location.href="editHLSDforProject.jsp?ProjectID="+ProjectID+"&ReviewDate="+ReviewDate+"&HLSD_TShirt="+HLSD_TShirt+"&ReviewStatus="+ReviewStatus+"&ActionItems="+ActionItems+"&ImpactedDomains="+ImpactedDomains+"&ImpactedCapabilities="+ImpactedCapabilities+"&AxiomScore="+AxiomScore+"&APICount="+APICount+"&FeatureCount="+FeatureCount+"&ExecutiveSummary="+ExecutiveSummary+"&ReviewFeedbackLink="+ReviewFeedbackLink; 
  }
  
  
   function editComponent(ProjectID,FeatureID,FeatureTitle,ComponentID,ComponentName,ComponentType,ComponentOwner,ImpactLow,ImpactHigh,TShirt,StartDate,EndDate){
   
    window.location.href="editComponentforProject.jsp?ProjectID="+ProjectID+"&FeatureID="+FeatureID+"&FeatureTitle="+FeatureTitle+"&ComponentID="+ComponentID+"&ComponentName="+ComponentName+"&ComponentType="+ComponentType+"&ComponentOwner="+ComponentOwner+"&ImpactLow="+ImpactLow+"&ImpactHigh="+ImpactHigh+"&TShirt="+TShirt+"&StartDate="+StartDate+"&EndDate="+EndDate;
  }
  
  
function editFeature(ProjectID,FeatureID,FeatureTitle,FeatureCode){
   
    window.location.href="editFeatureforProject.jsp?ProjectID="+ProjectID+"&FeatureID="+FeatureID+"&FeatureTitle="+FeatureTitle+"&FeatureCode="+FeatureCode; 
  }


  function deleteRecord(id){
   
    swal("Error!"," You don't have permision to delete Record!", "error");
  }
  
  function viewNote(id){
	   
	    window.location.href="viewNoteServlet/"+id; 
	  }
  
  function editProject(ProjectID,ProjectNumber,ProjectDescription,ProjectType,Workstream,ProjectSite,projectTittle,ProjectStatus)
  {
	  window.location.href="editProject.jsp?ProjectID="+ProjectID+"&ProjectNumber="+ProjectNumber+"&ProjectDescription="+ProjectDescription+"&ProjectType="+ProjectType+"&Workstream="+Workstream+"&ProjectSite="+ProjectSite+"&projectTittle="+projectTittle+"&ProjectStatus="+ProjectStatus;
  }
  
  
</script>
<style>
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
  color: white;
}
table {
	
	 margin: 30px;
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

 </HEAD>

 <BODY>
 
 <%@ include file="viewMenuItem.jsp" %>

<div align="center" style="font-size:280%; color:#E20074"; > Project Summary </div>
  <table width="1800px"  align="center" style="border:2px double #E20074;border-style:  solid double;">
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
	
	
	 
	
    <tr>
		 <td style="font-weight:bold;">Project ID :</td> 
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
	
</tr>
	<tr colspan=6></tr>
	
	<tr>
	<td style="font-weight:bold;">Target Deployment  :</td>  <td><%=viewMap.get("TargetDeployment")%></td>
	  <td style="font-weight:bold;">Project Status :</td> <td><%=viewMap.get("ProjectStatus")%></td>
	 <td><input type="button" name="edit" value="Edit Project" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="editProject(<%=viewMap.get("ProjectID")%>,'<%=viewMap.get("ProjectNumber")%>','<%=viewMap.get("ProjectDescription")%>','<%=viewMap.get("ProjectType")%>','<%=viewMap.get("Workstream")%>','<%=viewMap.get("ProjectSite")%>','<%=viewMap.get("ProjectTitle")%>','<%=viewMap.get("ProjectStatus")%>');" ></td>
  </tr>
  </table>
   
 <%
 if(viewMap.get("featureListFinal") !=null)
 {
 ArrayList featureList=(ArrayList)viewMap.get("featureListFinal");
 Iterator itrFeature = featureList.iterator();
		
		if(itrFeature.hasNext())
		{%>
 <table  id="t01" width="1800px"  align="center" style="border:2px double #E20074;border-style:  solid double;">
 	<tr>

		<th >Feature Code </th>

		<th >Feature Description </th>
	
		<th>Dependent Feature  </th>
		<th colspan="3">Action</th> 				
	 			</tr>
 
 
 <%

		
		while(itrFeature.hasNext())
		{
			 feature=(HashMap)itrFeature.next();
 %>
    
	<tr>
	   
		<td > <%=feature.get("FeatureID")%></td>
	
		<td > <%=feature.get("FeatureTitle")%></td>
	
		<td >  <%=feature.get("DependentFeature")%></td>
	 <td><input type="button" name="edit" value="Edit Feature" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="editFeature(<%=viewMap.get("ProjectID")%>,<%=feature.get("FeatureID")%>,'<%=feature.get("FeatureTitle")%>','<%=feature.get("DependentFeature")%>');" ></td>
				
				
					<td><input type="button" name="delete" style="background-color:#ff7faf;font-weight:bold;;color:#ffffff;" value="Delete Feature" onclick="deleteRecord(<%=feature.get("FeatureID")%>);"></td>
					<td><input type="button" name="add"  value="Add New Component" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="addComponent(<%=feature.get("FeatureID")%>);"></td>
		
			</tr>
		<%}%>
  </table>
  
 <%}}
	if(viewMap.get("componentList")!=null){
 ArrayList componentList=(ArrayList)viewMap.get("componentList");
  Iterator itrcompnent = componentList.iterator();	
  if(itrcompnent!=null && itrcompnent.hasNext())
  {
 
 %>
 <table id="t01" width="1800px"  align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th >Component ID </th>

		<th >Component Name </th>
	
		<th>Component Type </th>
		<th >Component Owner </th>
		<th >Feature code for Project </th>

<th >Impact Low</th>

		<th >Impact High</th>
	
		<th >TShirt Size </th>
		<th >Start Date </th>
		<th >End Date </th>	
	       <th colspan="3">Action</th> 				
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
		<td ><%=component.get("FeatureID")%></td>

<td ><%=component.get("ImpactLow")%></td>

		<td ><%=component.get("ImpactHigh")%></td>
	
		<td ><%=component.get("TShirt_Size")%></td>
		<td > <%=component.get("StartDate")%></td>
		<td ><%=component.get("EndDate")%></td>	

  
	<td><input type="button" name="edit" value="Edit Component" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="editComponent(<%=viewMap.get("ProjectID")%>,<%=component.get("FeatureID")%>,'<%=feature.get("FeatureTitle")%>', <%=component.get("ComponentID")%>,'<%=component.get("ComponentName")%>','<%=component.get("ComponentType")%>','<%=component.get("ComponentOwner")%>','<%=component.get("ImpactLow")%>',<%=component.get("ImpactHigh")%>,'<%=component.get("TShirt_Size")%>','<%=component.get("StartDate")%>','<%=component.get("EndDate")%>');" ></td>
				
				
					<td><input type="button" name="delete" style="background-color:#ff7faf;font-weight:bold;;color:#ffffff;" value="Delete Component" onclick="deleteRecord(<%=component.get("ComponentID")%>);"></td>
			</tr>
		<%}%>
  </table>

 
	<%}}%>
    <%
	if (viewMap.get("leadershipList")!=null)
	{
 ArrayList leadershipList=(ArrayList)viewMap.get("leadershipList");
 Iterator itrleadership = leadershipList.iterator();
		
		if(itrleadership.hasNext())
		{%>
  
   <table id="t01" width="1800px"  align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th >Name </th>

		<th >Project Role </th>
	
		<th>Company </th>
		
		<th >Start Date </th>
		<th >End Date </th>	
	       <th colspan="2">Action</th> 				
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
		
	<td><input type="button" name="edit" value="Edit Resource" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="editResource(<%=viewMap.get("ProjectID")%>,'<%=leadership.get("ProjectResource")%>','<%=leadership.get("ProjectRole")%>','<%=leadership.get("Company")%>');" ></td>
				
			
					<td><input type="button" name="delete" style="background-color:#ff7faf;font-weight:bold;;color:#ffffff;" value="Delete Resource" onclick="deleteRecord('<%=leadership.get("ProjectResource")%>');"></td>
			</tr>
		<%}%>
		
		</table>
		
		
	<%}}%>
		<% if( viewMap.get("ReviewDate")!=null){%>
		
		 <table id="t01" width="1800px"  align="center" style="border:2px double #E20074;border-style:  solid double;">
  	<tr>

		<th >Review Date</th>

		<th >HLSD TShirt </th>
	
		<th>Review Status </th>
		<th >Action Items count</th>
		<th >Impacted Domains Count </th>

<th >Impacted Capabilities count</th>

		<th >Axiom Score</th>
	
		<th >API Count </th>
		<th >Feature Count </th>
		<th>Executive Summary</th>	
		<th> ReviewFeedbackLink</th>
	       <th colspan="1">Action</th> 				
	 			</tr>
 
		
	
    
	<tr>
	
		<td > <%=viewMap.get("ReviewDate")%></td>

		<td ><%=viewMap.get("HLSD_TShirt")%></td>
	
		<td ><%=viewMap.get("ReviewStatus")%></td>
		<td > <%=viewMap.get("ActionItems")%></td>
		<td ><%=viewMap.get("ImpactedDomains")%></td>

<td ><%=viewMap.get("ImpactedCapabilities")%></td>

		<td ><%=viewMap.get("AxiomScore")%></td>
	
		<td ><%=viewMap.get("APICount")%></td>
		<td > <%=viewMap.get("FeatureCount")%></td>
		<td ><%=viewMap.get("ExecutiveSummary")%></td>	
		<td ><%=viewMap.get("ReviewFeedbackLink")%></td>	
		
	<td><input type="button" name="edit" value="Edit HLSD Details" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="editHLSD('<%=viewMap.get("ProjectID")%>','<%=viewMap.get("ReviewDate")%>','<%=viewMap.get("HLSD_TShirt")%>','<%=viewMap.get("ReviewStatus")%>','<%=viewMap.get("ActionItems")%>','<%=viewMap.get("ImpactedDomains")%>','<%=viewMap.get("ImpactedCapabilities")%>','<%=viewMap.get("AxiomScore")%>','<%=viewMap.get("APICount")%>','<%=viewMap.get("FeatureCount")%>','<%=viewMap.get("ExecutiveSummary")%>','<%=viewMap.get("ReviewFeedbackLink")%>'	);" ></td>
				
				
					
			</tr>
	
  </table>
		
		
		
		<%}%>	
		
		
		
		
		
		
		
		
		
   <table id="t01" align="center" >
		
		<tr>
		<td><input type="button" name="add"  value="Add New Feature" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="addFeature(<%=viewMap.get("ProjectID")%>);"></td>
			<td><input type="button" name="add"  value="Add New Resource" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="addResource(<%=viewMap.get("ProjectID")%>);"></td>
			<% if( viewMap.get("ReviewDate")==null){%>
			
			<td><input type="button" name="add"  value="Add HLSD" style="background-color:#ff7faf;font-weight:bold;color:#ffffff;" onclick="addHLSD(<%=viewMap.get("ProjectID")%>);"></td>
		
			<%}%>
		
		</tr>
  </table>
  
  
  
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
 </BODY>
</HTML>

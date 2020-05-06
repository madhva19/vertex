<%@ page language="java" import="java.util.*"%>


<html>
<head>
  <TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
<style>


html { font-size:100%; }

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
@media only screen and (max-width: 1024px){ // only from ipads down
  body{
    padding-bottom: 60px; // push your whole site same height upwards. ;)
  }
}

/* Set a style for the submit button */
.btn {
  background-color: #E20074;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 29%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}

.input-container{
	text-align:left;
}



</style>
<script>

  var tablesToExcel = (function() {
    var uri = 'data:application/vnd.ms-excel;base64,'
    , tmplWorkbookXML = '<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?><Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">'
      + '<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office"><Author>Axel Richter</Author><Created>{created}</Created></DocumentProperties>'
      + '<Styles>'
      + '<Style ss:ID="Currency"><NumberFormat ss:Format="Currency"></NumberFormat></Style>'
      + '<Style ss:ID="Date"><NumberFormat ss:Format="Medium Date"></NumberFormat></Style>'
      + '</Styles>' 
      + '{worksheets}</Workbook>'
    , tmplWorksheetXML = '<Worksheet ss:Name="{nameWS}"><Table>{rows}</Table></Worksheet>'
    , tmplCellXML = '<Cell{attributeStyleID}{attributeFormula}><Data ss:Type="{nameType}">{data}</Data></Cell>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
    return function(tables, wsnames, wbname, appname) {
      var ctx = "";
      var workbookXML = "";
      var worksheetsXML = "";
      var rowsXML = "";

      for (var i = 0; i < tables.length; i++) {
        if (!tables[i].nodeType) tables[i] = document.getElementById(tables[i]);
        for (var j = 0; j < tables[i].rows.length; j++) {
          rowsXML += '<Row>'
          for (var k = 0; k < tables[i].rows[j].cells.length; k++) {
            var dataType = tables[i].rows[j].cells[k].getAttribute("data-type");
            var dataStyle = tables[i].rows[j].cells[k].getAttribute("data-style");
            var dataValue = tables[i].rows[j].cells[k].getAttribute("data-value");
            dataValue = (dataValue)?dataValue:tables[i].rows[j].cells[k].innerHTML;
            var dataFormula = tables[i].rows[j].cells[k].getAttribute("data-formula");
            dataFormula = (dataFormula)?dataFormula:(appname=='Calc' && dataType=='DateTime')?dataValue:null;
            ctx = {  attributeStyleID: (dataStyle=='Currency' || dataStyle=='Date')?' ss:StyleID="'+dataStyle+'"':''
                   , nameType: (dataType=='Number' || dataType=='DateTime' || dataType=='Boolean' || dataType=='Error')?dataType:'String'
                   , data: (dataFormula)?'':dataValue
                   , attributeFormula: (dataFormula)?' ss:Formula="'+dataFormula+'"':''
                  };
            rowsXML += format(tmplCellXML, ctx);
          }
          rowsXML += '</Row>'
        }
        ctx = {rows: rowsXML, nameWS: wsnames[i] || 'Sheet' + i};
        worksheetsXML += format(tmplWorksheetXML, ctx);
        rowsXML = "";
      }

      ctx = {created: (new Date()).getTime(), worksheets: worksheetsXML};
      workbookXML = format(tmplWorkbookXML, ctx);

console.log(workbookXML);

      var link = document.createElement("A");
      link.href = uri + base64(workbookXML);
      link.download = wbname || 'Workbook.xls';
      link.target = '_blank';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }
  })();
</script>

</head>
<body align="center">
 <%@ include file="viewMenuItem.jsp" %>
<div style="display:none">

<table id="projectDependency" >
  <tr>
   <td>Dependency ID </td>
  <td>Project Number </td>
  	 <td> Project Title </td>
  <td>Project Description </td>
    <td>Target Deployment </td>
    <td>Work stream </td>
	<td>Dependent Project Number </td>
	 <td>Dependent Project Title </td>
	 <td>Dependent Project Type </td>
 <td>Dependent Project Status </td>
  <td>Nature Of Dependency</td>
 <td>Mitigation Strategies</td>
  </tr>
  	<%
	
	List viewList = new ArrayList();
	Iterator  viewItr;
	
	if(request.getAttribute("projectDependency")!=null && request.getAttribute("projectDependency")!="")
	{
		List userList =  (ArrayList)request.getAttribute("projectDependency");
		Iterator itr = userList.iterator();
		
		while(itr.hasNext())
		{
			
			
			
			viewList = (ArrayList)itr.next();
			String id = viewList.get(0).toString();
			viewItr = viewList.iterator();
			%>
			<tr>
			
			<%	
			while(viewItr.hasNext())
			{
			
				%>
				
				<td><%=viewItr.next()%></td>
				
				<%
					
			}
			
			%>
			
				
				
			</tr>
			<%
		}
	}
	
		%>
  
</table>

</div>


<div style="display:none">
<hr>
<table id="projectTD">
  <tr>
  <td>Project ID </td>
  <td>Project Title </td>
  <td>Technical Debt ID </td>
  <td>Technical Debt details </td>
 <td>Technical Debt Status </td>
  <td>Technical Debt source </td>
    </tr>
	<%
	
	List projectTD = new ArrayList();
	List TD = new ArrayList();
	Iterator  projectTDItr;
	Iterator  TDItr;
	
	if(request.getAttribute("projectTD")!=null && request.getAttribute("projectTD")!="")
	{
		projectTD=  (ArrayList)request.getAttribute("projectTD");
		projectTDItr = projectTD.iterator();
		
		while(projectTDItr.hasNext())
		{
			
			
			TD = (ArrayList)projectTDItr.next();
			
			TDItr = TD.iterator();
			%>
			<tr>
			
			<%	
			while(TDItr.hasNext())
			{
			
				%>
				
				<td><%=TDItr.next()%></td>
				
				<%
					
			}
			
			%>
			
				
			</tr>
			<%
		}
	}
	
		%>

</table>
</div>
	    
				




<div style="display:none">
<hr>
<table id="projectHLSD">
  <tr>
   <td>Project ID </td>
  <td>Project Title </td>
  <td>Review Date </td>
  <td>HLSD TShirt </td>
 <td>Review Status </td>
  <td>Action Items </td>
  <td>Impacted Domains </td>
 <td>Impacted Capabilities </td>
  <td>Axiom Score </td>
    <td>API Count </td>
	 <td>Feature Count </td>
  <td>Executive Summary </td>
    <td>Review Feedback Link</td>
    </tr>
	<%
	
	List viewHLSDList = new ArrayList();
	Iterator  viewHLSDItr;
	
	if(request.getAttribute("projectHLSD")!=null && request.getAttribute("projectHLSD")!="")
	{
		List userHLSDList =  (ArrayList)request.getAttribute("projectHLSD");
		Iterator HLSDitr = userHLSDList.iterator();
		
		while(HLSDitr.hasNext())
		{
			
			
			viewHLSDList = (ArrayList)HLSDitr.next();
			
			viewHLSDItr = viewHLSDList.iterator();
			%>
			<tr>
			
			<%	
			while(viewHLSDItr.hasNext())
			{
			
				%>
				
				<td><%=viewHLSDItr.next()%></td>
				
				<%
					
			}

			%>
			</tr>
			<%
		}
	}

		%>

</table>
</div>

				



<div style="display:none">
<hr>
<table id="projectFeatureList">
  <tr>
  
  
   <td>FeatureID </td>
  <td>Feature Title </td>

 <td>Dependent Feature </td>
  <td>Feature Code</td>
  <td>ProjectID </td>

    </tr>
	<%
	
	List viewFeatureList = new ArrayList();
	Iterator  viewFeatureItr;
	
	if(request.getAttribute("projectFeatureList")!=null && request.getAttribute("projectFeatureList")!="")
	{
		List userFeatureList =  (ArrayList)request.getAttribute("projectFeatureList");
		Iterator featureitr = userFeatureList.iterator();
		
		while(featureitr.hasNext())
		{
			
			viewFeatureList = (ArrayList)featureitr.next();
			viewFeatureItr = viewFeatureList.iterator();
			%>
			<tr>
			
			<%	
			while(viewFeatureItr.hasNext())
			{
			
				%>
				
				<td><%=viewFeatureItr.next()%></td>
				
				<%
					
			}
			
			%>
			
				
				
			</tr>
			<%
		}
	}
	
		%>

</table>
</div>





<div style="display:none">
<hr>
<table id="apiList">
  <tr>
 
  
   <td>component ID </td>
  <td>Project ID</td>

 <td>Impact Type</td>
  <td>TShirt Size</td>
  <td>Impact Details </td>

    </tr>
	<%
	
	List viewAPIList = new ArrayList();
	Iterator  viewAPIItr;
	
	if(request.getAttribute("apiList")!=null && request.getAttribute("apiList")!="")
	{
		List userAPIList =  (ArrayList)request.getAttribute("apiList");
		Iterator apiitr = userAPIList.iterator();
		
		while(apiitr.hasNext())
		{
			
			viewAPIList = (ArrayList)apiitr.next();
			viewAPIItr = viewAPIList.iterator();
			%>
			<tr>
			
			<%	
			while(viewAPIItr.hasNext())
			{
			
				%>
				
				<td><%=viewAPIItr.next()%></td>
				
				<%
					
			}
			
			%>
			
				
				
			</tr>
			<%
		}
	}
	
		%>

</table>
</div>



<div style="display:none">
<hr>
<table id="appList">
  <tr>
 
  
   <td>component ID </td>
  <td>Project ID</td>

 <td>Impact Type</td>
  <td>TShirt Size</td>
  <td>Impact Details </td>

    </tr>
	<%
	
	List viewAPList = new ArrayList();
	Iterator  viewAPItr;
	
	if(request.getAttribute("appList")!=null && request.getAttribute("appList")!="")
	{
		List userAPList =  (ArrayList)request.getAttribute("appList");
		Iterator apitr = userAPList.iterator();
		
		while(apitr.hasNext())
		{
			
			viewAPList = (ArrayList)apitr.next();
			viewAPItr = viewAPList.iterator();
			%>
			<tr>
			
			<%	
			while(viewAPItr.hasNext())
			{
			
			
			
				%>
				
				<td><%=viewAPItr.next()%></td>
				
				<%
					
			}
			
			%>
			
				
				
			</tr>
			<%
		}
	}
	
		%>

</table>
</div>








<div >
 <table width="700" border="0" align="center" oncontextmenu="return false;">
	<tr border="0">
		 <td >&nbsp;</td>
	   
	    
	 </tr>
	 	<tr border="0">
		 <td >&nbsp;</td>
	   
	    
	 </tr>
	 	<tr border="0">
		 <td >&nbsp;</td>
	   
	    
	 </tr>
	 	<tr border="0">
		 <td >&nbsp;</td>
	   
	    
	 </tr>
	 </table>
 
 <table style="width:40%;" border="2" align="center" bordercolor="fce2ec">
	<tr >
		 <td >
<table style="width:100%;" border="0" align="center">
	<tr border="0">
		 <td >&nbsp;</td>
	   
	    
	 </tr>

 <tr>
		<strong>
	    <td ><font color ="red"></font></td>
	    
		<font color ="red">
	  </strong>
	 </tr>
	 
	  <tr>
		
	    <td >&nbsp;</td>
	    
	 </tr>
	  <tr>
		
	    <td align="center"><strong> <font color="E20074"  size="6">Data which will get exported</font></strong></td>
	    
	 </tr>
	  <tr>
		
	    <td >&nbsp;</td>
	    
	 </tr>
	  <tr>
		
	    <td >&nbsp;</td>
	    
	 </tr>
	<tr>
		<td>
		
<table style="width:100%;" border="0" style="text-align:center;"  >


<tr>

<td>
<div class="input-container" style="text-align:left;"  >
    <i class="fa fa-info-circle"></i>&nbsp; Project Dependency 

</div>
</td>

</tr>

<tr>

<td>
<div class="input-container">
    <i class="fa fa-exclamation-circle"></i>&nbsp; All Technical Debt

</div>

</td>
</tr>
<tr>
<td>
<div class="input-container">
    <i class="fa fa-info-circle"></i>&nbsp; All HLSD status

</div>

</td>
</tr>
<tr>
<td>
<div class="input-container">
    <i class="fa fa-info-circle"></i>&nbsp;
  All Feature Project Mapping

</div>

</td>
</tr>
<tr>
<td>
<div class="input-container">
    <i class="fa fa-info-circle "></i>&nbsp;
All API

</div>

</td>
</tr>
<tr>
<td>
<div class="input-container">
    <i class="fa  fa-info-circle "></i>&nbsp;
All Application / Component 

</div>

</td>
</tr>

<tr>

<td align="center">
 <button class="btn" onclick="tablesToExcel(['projectDependency','projectTD','projectHLSD','projectFeatureList','apiList','appList'], ['Project Dependency ','Project Technical Debt','Project HLSD','Project Feature Map','API Impact','Application Impact'], 'VeritasProjectExport.xls', 'Excel')">Export to Excel</button>

</td>

</tr>

</table>
</form>
</td>
<tr border="0">
		 <td >&nbsp;</td>
	   
	    
	 </tr>
	 
	 <tr>
		
	    <td >&nbsp;</td>
	    
	 </tr>
	 
	  <tr>
		
	    <td >&nbsp;</td>
	    
	 </tr>
		
</table>
</td>

		
</table>
</div>




</body>
</Html>

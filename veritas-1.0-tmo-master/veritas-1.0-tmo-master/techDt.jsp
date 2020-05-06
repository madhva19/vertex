<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%


				List<Map<Object,Object>> workStream = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> feature = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> projectComp = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> compProj = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> projDep = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> depProj = new ArrayList<Map<Object,Object>>();
				List<Map<Object,Object>> techDebt = new ArrayList<Map<Object,Object>>();

					workStream=(ArrayList) session.getAttribute("workStream");
	                feature=(ArrayList) session.getAttribute("feature");
	                projectComp= (ArrayList) session.getAttribute("projectComp");
	                compProj=(ArrayList) session.getAttribute("compProj");
	                projDep=(ArrayList) session.getAttribute("projDep");
	                depProj=(ArrayList) session.getAttribute("depProj");
	                techDebt=(ArrayList) session.getAttribute("techDebt");



Gson gsonObj = new Gson();
 
String dataPoints_workStream = gsonObj.toJson(workStream);
String dataPoints_feature = gsonObj.toJson(feature);
String dataPoints_projectComp = gsonObj.toJson(projectComp);
String dataPoints_compProj = gsonObj.toJson(compProj);
String dataPoints_projDep = gsonObj.toJson(projDep);
String dataPoints_depProj = gsonObj.toJson(depProj);
String dataPoints_techDebt = gsonObj.toJson(techDebt);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<TITLE>Veritas - Design Review Tool</TITLE>
   <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
<script type="text/javascript">
window.onload = function() { 
 

 var chart8 = new CanvasJS.Chart("chartContainer_Workstream1", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "Project By WorkStream",
	exportEnabled: true,
	title:{
		text: "Project By WorkStream"
	},
	legend: {
		verticalAlign: "center",
		horizontalAlign: "right"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		//indexLabelPlacement: "inside",
		toolTipContent: "{label}: <strong>{y}</strong>",
		indexLabel: "{label} {y}",
		dataPoints : <%out.print(dataPoints_workStream);%>
	}]
});
 
 chart8.render();
 
 
/*var chart = new CanvasJS.Chart("chartContainer_Workstream", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Project By WorkStream"
	},
	axisX: {
		title: "Work Stream"
	},
	axisY: {
		title: "Project Count"
	},
	data: [{
		type: "column",
		
		dataPoints: <%out.print(dataPoints_workStream);%>
	}]
});
chart.render();*/

var chart1 = new CanvasJS.Chart("chartContainer_feature", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Feature count by project"
	},
	axisX: {
		title: "Project"
	},
	axisY: {
		title: "Feature Count"
	},
	data: [{
		type: "column",

		//indexLabel: "{label} {y}",
		dataPoints: <%out.print(dataPoints_feature);%>
	}]
});
chart1.render();

var chart3 = new CanvasJS.Chart("chartContainer_project", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "project impacting applicaiton count"
	},
	axisX: {
		title: "Project"
	},
	axisY: {
		title: "Application Count"
	},
	data: [{
		type: "column",
		
		dataPoints: <%out.print(dataPoints_projectComp);%>
	}]
});
chart3.render();

var chart4 = new CanvasJS.Chart("chartContainer_comp", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Application project count     (includes only application which have more then 6 Project impact)"
	},
	axisX: {
		title: "Application"
	},
	axisY: {
		title: "Project Count"
	},
	data: [{
		type: "column",
		
		dataPoints: <%out.print(dataPoints_compProj);%>
	}]
});
chart4.render();

var chart5 = new CanvasJS.Chart("chartContainer_pDep", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Project dependency count"
	},
	axisX: {
		title: "Project"
	},
	axisY: {
		title: "Dependent Project count for delivery "
	},
	data: [{
		type: "column",
		
		dataPoints: <%out.print(dataPoints_projDep);%>
	}]
});
chart5.render();

var chart6 = new CanvasJS.Chart("chartContainer_depP", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Project dependent upon delivery"
	},
	axisX: {
		title: "Project"
	},
	axisY: {
		title: "Dependent Project Count"
	},
	data: [{
		type: "column",
		
		dataPoints: <%out.print(dataPoints_depProj);%>
	}]
});
chart6.render();

var chart7 = new CanvasJS.Chart("chartContainer_TD", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Technical debt by project"
	},
	axisX: {
		title: "Project"
	},
	axisY: {
		title: "Technical Debt Count"
	},
	data: [{
		type: "column",
		
		dataPoints: <%out.print(dataPoints_techDebt);%>
	}]
});
chart7.render();
 
}
</script>
</head>
<body>
  <%@ include file="viewMenuItem.jsp" %>
  
<div id="chartContainer_Workstream1" style="height: 370px; width: 100%;"></div>


<br><br>
<div id="chartContainer_feature" style="height: 370px; width: 100%;"></div><br><br>
<div id="chartContainer_project" style="height: 370px; width: 100%;"></div><br><br>
<br><br>
<div id="chartContainer_pDep" style="height: 370px; width: 100%;"></div>
<div id="chartContainer_depP" style="height: 370px; width: 100%;"></div><br><br>
<div id="chartContainer_TD" style="height: 370px; width: 100%;"></div><br><br>
<div id="chartContainer_comp" style="height: 370px; width: 100%;"></div><br><br>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%



					List<Map<Object,Object>> projDep = new ArrayList<Map<Object,Object>>();
		
		
	                 projDep=(ArrayList) session.getAttribute("projDep");
	          



Gson gsonObj = new Gson();
 

String dataPoints_projDep = gsonObj.toJson(projDep);

dataPoints_projDep=dataPoints_projDep.replace("\\u0026", "&");
      
		

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
<script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js?hcode=a0c21fc77e1449cc86299c5faa067dc4"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-pert.min.js?hcode=a0c21fc77e1449cc86299c5faa067dc4"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-exports.min.js?hcode=a0c21fc77e1449cc86299c5faa067dc4"></script>
  <script src="https://cdn.anychart.com/releases/v8/js/anychart-ui.min.js?hcode=a0c21fc77e1449cc86299c5faa067dc4"></script>

<link href="https://cdn.anychart.com/releases/v8/css/anychart-ui.min.css?hcode=a0c21fc77e1449cc86299c5faa067dc4" rel="stylesheet" type="text/css">

<style>
html, body, #container {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}
</style>




</head>
<body>
  <%@ include file="viewMenuItem.jsp" %>
  
 <div id="container"></div>
 
  
  <script type="text/javascript">
  
  anychart.onDocumentReady(function () {
   
    // data
    var data = <%out.print(dataPoints_projDep);%>;

    // create a PERT chart
    var chart = anychart.pert();

    // set chart data
    chart.data(data, "as-table");

    // set the title of the chart
    chart.title("Project Dependency");

    // set the container id for the chart
    chart.container("container");

    // initiate drawing the chart
    chart.draw();
});
  </script>
</body>
</html>
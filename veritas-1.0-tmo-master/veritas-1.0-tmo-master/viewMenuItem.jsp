


<%@ page language="java" import="java.util.*"%>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.7.1/css/all.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
     <script src="/Veritas/table2excel.js" type="text/javascript"></script>
  <script>
  
   var lastActiveTime = new Date().getTime();
    $(document).ready(function() {
        $('body').bind('click mousemove keypress scroll resize', function() {
           lastActiveTime = new Date().getTime();
           });
           setInterval(checkIdleTime, 30000); // 30 sec
    });

     function checkIdleTime(){
     var diff = new Date().getTime() - lastActiveTime;
           if( diff > 3480000){//1 hour of inactivity
            window.location.href ="/Veritas/index.html?message=Session time out! Please Log-in again"
           }
    }
	

 function Export(filename) {
            $("#t01").table2excel({
                filename: filename
            });
        }
// 		$(document).ready(function(){

//   // Search all columns
//   $('#txt_searchall').keyup(function(){
//     // Search Text
//     var search = $(this).val();
// if(search.length> 0){
//     // Hide all table tbody rows
//     $('table tbody tr').hide();

//     // Count total search result
//     var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;

//     if(len > 0){
//       // Searching text in columns and show match row
//       $('table tbody tr:not(.notfound) td:contains('+search+')').each(function(){
//         $(this).closest('tr').show();
//       });
//     }else{
//       $('.notfound').show();
//     }
// }
//   });

  

// });

// Case-insensitive searching (Note - remove the below script for Case sensitive search )
// $.expr[":"].contains = $.expr.createPseudo(function(arg) {
//    return function( elem ) {
	   
// 	   //return $.trim(elem.innerHTML.toLowerCase()).indexOf(arg.toLowerCase())>=0;
//      return $(elem).text().indexOf(arg) >= 0;
//    };
// });
		
		
		

function blockSpecialChar(e)
{
var k;
document.all ? k = e.keyCode : k = e.which;
//alert(k);
return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57) || k == 190 ||k==63 ||k==45 ||k==40 ||k==41 || k == 188 || k==44 || k==46);
} 

function replaceSpecialChar(e)
{
	
e.value=e.value.replace(/[&\/\\#+()$~%'":*?<>{}]/g, '');
return e;
} 


		
	</script>
   
   
   
   
   
   
   
 
<style>
 th {
  cursor: pointer;
  font-family:Arial;
  font-size:11px;
  
}
td {
  
  font-family:Arial;
  font-size:12px;
  
}
a {
  
  font-family:Arial;
  font-size:14px;
  
}

.aa {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #E20074;
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
legend { 
  display: block;
  padding-left: 2px;
  padding-right: 2px;
  border: 1;
  font-weight:bold;
}
li a:hover, .dropdown:hover .dropbtn {
 border:1px solid #ea0a8e;
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
#container{
   
}


button{
    display:block;
    height:20px;
    margin-top:10px;
    margin-bottom:10px;
}
.drag{
  width:40px;
  height:20px;
  background-color:blue;
  z-index:100000;
  margin-top:10px;
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
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  height:30px;
 /* padding: 12px; */
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
   font-family:Arial;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
  
}

input[type=submit] {
border:0;
background-color: #E20074;
border-radius: 50px;
width:80px;
height:30px;
font-weight:bold;
color:#ffffff;


  
}



.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

/* Add a black background color to the top navigation */
.topnav {

    overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  
  color: white;
}

/* Right-aligned section inside the top navigation */
.topnav-right {
  float: right;
}
body{
  overflow-x: scroll;
}

.dont-break-out {

  /* These are technically the same, but use both */
  overflow-wrap: break-word;
  word-wrap: break-word;

  -ms-word-break: break-all;
  /* This is the dangerous one in WebKit, as it breaks things wherever */
  word-break: break-all;
  /* Instead use this non-standard one: */
  word-break: break-word;

  /* Adds a hyphen where the word breaks, if supported (No Blink) */
  -ms-hyphens: auto;
  -moz-hyphens: auto;
  -webkit-hyphens: auto;
  hyphens: auto;

}

table, button {
	table-layout: fixed;
	
width: 90%;
font-size:18px;
  align:center;
 text-align: center;
  /* These are technically the same, but use both */
  overflow-wrap: break-word;
  word-wrap: break-word;

  -ms-word-break: break-all;
  /* This is the dangerous one in WebKit, as it breaks things wherever */
  word-break: break-all;
  /* Instead use this non-standard one: */
  word-break: break-word;

  /* Adds a hyphen where the word breaks, if supported (No Blink) */
  -ms-hyphens: auto;
  -moz-hyphens: auto;
  -webkit-hyphens: auto;
  hyphens: auto;

}
i {
  padding: 10px;
 
  color: E20074;
  min-width: 50px;
  text-align: center;
}
 
 
 a.morelink {
	text-decoration:none;
	outline: none;
}
.morecontent span {
	display: none;
}
.comment {
	
	margin: 10px;
}
li a, .dropbtn {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.vertical-center {
  margin: 0;
  position: absolute;
  top: 50%;
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}

 br {
    line-height: 8px;
 }
 
 ul.breadcrumb {
  padding: 8px 10px;
  list-style: none;
  background-color: white;
}
ul.breadcrumb li {
 
}
ul.breadcrumb li+li:before {
  padding: 6px;
  color: #E20074;
  content: "/\00a0";
}
ul.breadcrumb li a {
  color: #0275d8;
  text-decoration: none;
}
ul.breadcrumb li a:hover {
  color: #01447e;
  text-decoration: underline;
}
 
.tooltip {
  position: relative;
  display: inline-block;
  
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 220px;
  background-color: ffb8ff;
  color: black;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  top: -5px;
  left: 110%;


  
}

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 50%;
  right: 100%;
  margin-top: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: transparent #ffb8ff transparent transparent;
}

  
/* Show the tooltip text when you mouse over the tooltip container */
.tooltip:hover .tooltiptext {
  visibility: visible;
 
}

.buttonLayout{

border:0;
background-color: #E20074;
border-radius: 50px;
width:80px;
height:30px;
font-weight:bold;
color:#ffffff;

}


</style>


 
 <%

   String sessionId   = request.getParameter("sessionid")!=null ? (String)request.getParameter("sessionid") : (String)request.getAttribute("sessionid");
   String validateURL = request.getParameter("validateurl")!=null ? (String)request.getParameter("validateurl") : (String)request.getAttribute("validateurl");
   
   if(session.getAttribute("sessionid")==null)
   {
	   response.sendRedirect("/Veritas/");
   }
   
 
%>

<div >

<ul class ="aa" class="vertical-center">

<!--     <li class="topnav-left" > &nbsp;&nbsp;&nbsp;&nbsp;
 <img class="grid__1-0-3__grid__img-icon lazyloaded" class="vertical-center" alt="" width="46" src="/Veritas/VeritasBlack.png"> &nbsp;</li-->
 <li> <a href='/Veritas/home/'><i class="fa fa-fw fa-home" style="color:#2f353a"></i>Home</a></li>
 
 <% if (session.getAttribute("userRole") !=null && !session.getAttribute("userRole").toString().equalsIgnoreCase("basicUser")){%>
 
 <% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn"><i class="fa fa-file-o" style="color:#2f353a"></i> Projects</a>
    <div class="dropdown-content">
      <a href="/Veritas/addProject/">Add Project</a>
      <a href="/Veritas/ViewAllProject">View All Project</a>
	   <a href="/Veritas/ViewAllProjectDependency">View All Project Dependency</a>
     
    </div>
  </li>
  
 <%}%>
 
 
 <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn"><i class="fa fa-pie-chart" style="color:#2f353a"></i> Metrics</a>
    <div class="dropdown-content">
      <a href="/Veritas/ViewAllHLSD">HLSD Reviews</a>
	  	<a href="/Veritas/viewAllFeedback">Assessment Reviews</a>
	  	<a href="/Veritas/ViewMetricsDashboard">Metrics Dashboard</a>
     
    </div>
  </li>
 
   <!-- <li class="dropdown"><a href="javascript:void(0)" class="dropbtn"><i class="fa fa-list-ul" style="color:#2f353a"></i> Capability </a>
   --> <div class="dropdown-content">
 <% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
      <a href="/Veritas/addFeature/">Add Capability</a>
	 <%}%>
	 <% if (session.getAttribute("userRole") !=null && !session.getAttribute("userRole").toString().equalsIgnoreCase("basicUser")){%>
    <a href="/Veritas/ViewAllFeature">View All Capability</a>
       
     <%}%>
    </div>
   </li>
 <% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%> 
	
	 <%}%>
	  <!--  <li class="dropdown"><a href="javascript:void(0)" class="dropbtn"><i class="fa fa-server" style="color:#2f353a" aria-hidden="true"></i> Application </a> -->
	   <div class="dropdown-content">
 <% if (session.getAttribute("userRole") !=null && session.getAttribute("userRole").toString().equalsIgnoreCase("admin")){%>
      <a href="/Veritas/addComponent/">Add Application </a>
	  
	  <%}%>
	  
	   <% if (session.getAttribute("userRole") !=null && !session.getAttribute("userRole").toString().equalsIgnoreCase("basicUser")){%>
        <a href="/Veritas/ViewAllComponent">View Application</a>
       <%}%>
    </div></li>
	       <%}%>
	 
	 <li class="dropdown">
<!--     <a href="javascript:void(0)" class="dropbtn"><i class="fa fa-life-ring" style="color:#2f353a" aria-hidden="true"></i> Project Lifecycle</a>
 -->    <div class="dropdown-content">
	  <% if (session.getAttribute("userRole") !=null && !session.getAttribute("userRole").toString().equalsIgnoreCase("basicUser")){%>
        <a href="/Veritas/ViewAllProject"> View All Project</a>
	  	
	  	
		<a href="/Veritas/ViewAllUnusedFeature">View All Unused Feature</a>
		<a href="/Veritas/ViewAllReviewStatus">Review - Calendar and Status</a>
		<a href="/Veritas/viewAllCR">CR Review - Calendar and Status</a>
		<a href="/Veritas/ExportAlltheData">Export all the data to Microsoft Excel </a>
		  <%}%>
		
		
		
		
     
    </div>
  </li>
  
   <li class="dropdown">
<!--     <a href="javascript:void(0)" class="dropbtn"><i class="fa fa-medkit" style="color:#2f353a" aria-hidden="true"></i> Health Reports</a>
 -->    <div class="dropdown-content">
	  <% if (session.getAttribute("userRole") !=null && !session.getAttribute("userRole").toString().equalsIgnoreCase("basicUser")){%>
       
	   <a href="/Veritas/ViewAllProjectDependency">View All Project Dependency</a>
	    <a href="/Veritas/ViewAllComponent">View Component and dependency </a>
		<a href="/Veritas/ViewAllTechDebt">View All Technical Debt</a>
		<a href="/Veritas/ViewPDR">View All Project Delivery Risk</a>
		<a href="/Veritas/ProjectDGraph">View All Project Dependency Chart</a>
		<a href="/Veritas/ViewAllReviewStatus">View All Review Status</a>
		<a href="/Veritas/viewAllIntegration">View All Project Integration Component</a>
		<a href="/Veritas/ViewAllProjectFeatureStatus">View All Project Feature Audit Status</a>
		
		
		
			
		  <%}%>
		
<a href="/Veritas/ReportData">Reports in graph</a>
		<a href="/Veritas/heatmap">Heatmap</a>
		
		
     
    </div>
  </li>
	
  		
  
  
  

	
  

	
    <li class="topnav-right" ><a href='/Veritas/'> <i class="fa fa-sign-out" style="color:#2f353a"></i>Welcome to Veritas</a>
 </li>
	 
</div>
</ul>







</div>



  

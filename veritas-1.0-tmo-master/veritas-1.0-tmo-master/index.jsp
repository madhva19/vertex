<!--  jsp:forward page="" />-->


<html>
<head>
 <TITLE>Veritas - Design Review Tool</TITLE>
 
 <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">
  <link rel="icon" type="image/png" href="/Veritas/logo.png"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: #FF0099;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid #fce2ec;
}

/* Set a style for the submit button */
.btn {
  background-color: #FF0099;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}

.text1 {display:none;color:red}




</style>

<script>
function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

function getInternetExplorerVersion() {
   var ua = window.navigator.userAgent;
        var msie = ua.indexOf("MSIE ");
        var rv = -1;

        if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer, return version number
        {               

            if (isNaN(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))))) {
                //For IE 11 >
                if (navigator.appName == 'Netscape') {
                    var ua = navigator.userAgent;
                    var re = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
                    if (re.exec(ua) != null) {
                        rv = parseFloat(RegExp.$1);
                        alert(rv);
                    }
                }
                else {
                    alert('otherbrowser');
                }
            }
            else {
                //For < IE11
                alert(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))));
            }
            return false;
        }}

</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body  link="#3300FF"
 vlink="#3300FF"
 alink="#3300FF" >
 <div class="alert alert-danger" id="dwar" style="display:none;">
    <strong>WARNING!</strong>          Chrome and Safari browsers are supported for this version. IE and Edge support shall come with next release.

  </div>
 <div class="container">
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
 
 <table width="700" border="2" align="center" bordercolor="fce2ec">
	<tr >
		 <td >
<table width="700" border="0" align="center">
	<tr border="0">
		 <td >&nbsp;</td>
	   
	    
	 </tr>
	 
	 <tr>
		<strong>
	    <td ><font color ="red"><%=request.getAttribute("message")!=null ?request.getAttribute("message"):"" %></font></td>
	    <%  request.setAttribute("message",null);%>
		<font color ="red"><%=request.getParameter("message")!=null ?request.getParameter("message"):"" %>
	    <%  request.getParameter("message");%></strong>
	 </tr>
	 
	  <tr>
		
	    <td >&nbsp;</td>
	    
	 </tr>
	  <tr>
		
	    <td align="center"><strong> <font color="FF0099"  size="4">Design Review Tracker (Veritas)</font></strong></td>
	    
	 </tr>
	  <tr>
		
	    <td >&nbsp;</td>
	    
	 </tr>
	  <tr>
		
	    <td >&nbsp;</td>
	    
	 </tr>
	<tr>
		<td>
		<form name="form1" method="post" action="LandingPage">
<table width="500" border="0" align="center"  >


<tr>

<td>
<div class="input-container">
    <i class="fa fa-user icon"></i>
<input name="userName" type="text" placeholder="Username" class="input-field" >
</div>
</td>

</tr>

<tr>

<td>
<div class="input-container">
    <i class="fa fa-key icon"></i>
<input name="password" id ="password" type="password" placeholder="Password" class="input-field" >

</div>
<p id="text1" style="display:none">WARNING! Caps lock is ON.</p>
<input type="checkbox" onclick="myFunction()">Show Password
</td>

</tr>

<tr>

<td align="center">
 <button type="submit" class="btn">Submit</button>

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
<script>
var input = document.getElementById("password");
var text = document.getElementById("text1");
input.addEventListener("keyup", function(event) {

if (event.getModifierState("CapsLock")) {
    text.style.display = "block";
  } else {
    text.style.display = "none"
  }
});
if (document.documentMode || /Edge/.test(navigator.userAgent)) {

    dwar.style.display = 'inline';
}



</script>
</body>
</html>
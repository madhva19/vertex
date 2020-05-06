<%@ page language="java" import="java.util.*;"%>
<html>
<head>
</head>
<body>
<%!
String p_id = "";
String p_code = "";
String p_name = "";
String link = "";
String r_date = "";
String p_health = "";
String epopm = "";
String eitpm = "";
String testpm = "";
String bsa = "";
String lead_arch = "";
String sa = "";
String dev = "";
String tdm ="";

List  userList=null;
%>

<%

if(request.getAttribute("userList")!=null && request.getAttribute("userList")!="")
{
		userList = (ArrayList)request.getAttribute("userList");
		 p_id = userList.get(0).toString();
		 p_code = userList.get(1).toString();
		 p_name = userList.get(2).toString();
		 link = userList.get(3).toString();
		 r_date = userList.get(4).toString();
		 p_health = userList.get(5).toString();
		 epopm = userList.get(6).toString();
		 eitpm = userList.get(7).toString();
		 testpm = userList.get(8).toString();
		 bsa = userList.get(10).toString();
		 lead_arch = userList.get(13).toString();
		 sa = userList.get(11).toString();
		 dev = userList.get(12).toString();
		 tdm = userList.get(9).toString();
	
		//out.println(id);
}
%>

<form name="userform" method="post" action="../editUser">
<br><br><br>
<table align="center" width="300px" style="background-color:#EDF6EA;border:1px solid #000000;">
<input type="hidden" name="id" value="<%=p_id%>">
<tr><td colspan=2 style="font-weight:bold;" align="center">Edit User</td></tr>
<tr><td colspan=2 align="center" height="10px"></td></tr>
	<tr>
		<td style="font-weight:bold;">Project Code</td>
		<td><input type="text" name="p_code" value="<%=p_code%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">Project Name</td>
		<td><input type="text" name="p_name" value="<%=p_name%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">SharePoint link</td>
		<td><input type="text" name="link" value="<%=link%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">Release Date</td>
		<td><input type="text" name="r_date" value="<%=r_date%>"></td>
	</tr>
	
	<tr>
		<td style="font-weight:bold;">Project Health</td>
		<td><input type="text"  name="p_health" value="<%=p_health%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">EPO PM</td>
		<td><input type="text" name="epopm" value="<%=epopm%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">EIT PM</td>
		<td><input type="text" name="eitpm" value="<%=eitpm%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">Test PM</td>
		<td><input type="text" name="testpm" value="<%=testpm%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">TDM</td>
		<td><input type="text" name="tdm" value="<%=tdm%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">Lead Arch</td>
		<td><input type="text" name="lead_arch" value="<%=lead_arch%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">BSA</td>
		<td><input type="text" name="bsa" value="<%=bsa%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">Lead SA</td>
		<td><input type="text" name="lead_sa" value="<%=p_id%>"></td>
			</tr>
	<tr>
	<tr>
		<td style="font-weight:bold;">SA</td>
		<td><input type="text" name="sa" value="<%=sa%>"></td>
	</tr>
	<tr>
		<td style="font-weight:bold;">Lead Dev</td>
		<td><input type="text" name="dev" value="<%=dev%>"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Edit" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
	</tr>
	<tr><td colspan=2 align="center" height="10px"></td></tr>
</table>
</form>
</body>
</html>



<%@ page language="java" import="java.util.*"%>
<html>

<head>
	<TITLE>Veritas - Design Review Tool</TITLE>
	<link rel="icon" type="image/png" href="/Veritas/logo.png" />
	<meta charset='utf-8'>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>

		/*
		This script is identical to the above JavaScript function.
		*/
		var ct = 1;
		var ct1 = 1;

		function new_Feature() {

			ct1++;
			var newRow = document.getElementById('newlink1').insertRow();
			//var te=document.getElementById('newlink').innerHTML;
			var te1 = '<td style="font-weight:bold;">Feature Code:  <input type="text" name="FeatureCode' + ct1 + '" value=""></td><td style="font-weight:bold;">Feature Description:  <input type="text" name="FeatureDescription' + ct1 + '" value=""></td><td style="font-weight:bold;">Dependent Feature :  <input type="text" name="DependentFeature' + ct1 + '" value=""></td>';
			//var Final =te.append(te1);


			newRow.innerHTML = te1;
		}

		function editDependency(id) {
			var btn = "editD" + id;
			document.getElementById(btn).style.display = 'none';
			var Strategies = "comment" + id;
			document.getElementById(Strategies).disabled = false;
			var commentby = "commentby" + id;
			document.getElementById(commentby).disabled = false;
			var hlsds = "hlsds" + id;
			document.getElementById(hlsds).disabled = false;
			var notes = "notes" + id;
			document.getElementById(notes).disabled = false;
			var priority = "priority" + id;
			document.getElementById(priority).disabled = false;
			var save = "saveD" + id;
			document.getElementById(save).style.display = 'inline';
			

			//Hide textarea
			var potentialImpactTextarea = "potentialImpactTextarea"+id;
			document.getElementById(potentialImpactTextarea).style.display = 'none';
			
			// show select
			var potentialImpact = "potential-impact"+id;
			document.getElementById(potentialImpact).style.display = 'inline';
		}
		function saveDependency(id) {
			// Show textarea
			var potentialImpactTextarea = "potentialImpactTextarea"+id;
			document.getElementById(potentialImpactTextarea).style.display = 'inline';
	
			// Hide select
			var potentialImpact = "potential-impact"+id;
			document.getElementById(potentialImpact).style.display = 'none';

			var btn = 'editD' + id;
			document.getElementById(btn).style.display = 'inline';

			var save = "saveD" + id;
			document.getElementById(save).style.display = 'none';
			var i = 0;
			for (i = 0; i < document.getElementsByName('comment').length; i++) {
				if (document.getElementsByName('comment')[i].value != "") {
					replaceSpecialChar(document.getElementsByName('comment')[i]);
					replaceSpecialChar(document.getElementsByName('note')[i]);
				}

			}
			
			return;
		}

		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;

			return true;
		}

		function FormValidation() {
			var impact = document.getElementById('potential-impact').value;
			 if(impact === "") {
				swal("Error!","Please select projects impact", "error");
			 document.getElementById('potential-impact').style.borderColor = "red";
			 return false
			}else {
				 document.getElementById('potential-impact').style.borderColor = "green";
			}
			
			//First Name Validation getElementsByName
			var fn=document.getElementById('comment').value;
			if(fn.trim() === ""){
				swal("Error!","Please Enter Comment", "error");
				document.getElementById('comment').style.borderColor = "red";
				return false;
			}else{
				document.getElementById('comment').style.borderColor = "green";
			}
		
			var fn1=document.getElementById('commentby').value;
			if(fn1.trim() === ""){
				swal("Error!","Please Enter Your Name", "error");
				document.getElementById('commentby').style.borderColor = "red";
				return false;
			}else{
				document.getElementById('commentby').style.borderColor = "green";
			}
			
			if(document.getElementsByName('ReviewsType')[0].checked == false && document.getElementsByName('ReviewsType')[1].checked == false){
				swal("Error!","Please select if Project Review is for assessment or HLSD  ", "error");
				document.getElementsByName('ReviewsType')[0].parentNode.style.backgroundColor="red"
				document.getElementsByName('ReviewsType')[1].parentNode.style.backgroundColor="red"
				return false;
			}else{
				document.getElementsByName('ReviewsType')[0].parentNode.style.backgroundColor="transparent"
				document.getElementsByName('ReviewsType')[1].parentNode.style.backgroundColor="transparent"
				localStorage.setItem('ReviewsType',  document.getElementById('ReviewsType').checked );
				localStorage.setItem('ReviewsType1',  document.getElementById('ReviewsType1').checked );
				localStorage.setItem('commentby',  document.getElementById('commentby').value );
			}
		}

		function blockSpecialChar(e) {
			var k;
			document.all ? k = e.keyCode : k = e.which;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57) || k == 190 || k == 188 || k == 44 || k == 46 || k == 45 || k == 13);
		}

	</script>


	<style>
		.bordered {

			border: 2px dashed #E20074;
		}

		table#t01 th {
			background-color: E20074;
			color: white;
			cursor: pointer;
			font-family: Arial;
			font-size: 12px;
		}

		table {

			margin: 30px;
		}

		th {
			cursor: pointer;
			font-family: Arial;
			font-size: 12px;

		}

		table#t02 th {
			background-color: E20074;
			color: white;
			cursor: pointer;
			font-family: Arial;
			font-size: 12px;
		}

		table#t02 td {
			text-align: center;
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

		li a,
		.dropbtn {
			display: inline-block;
			color: white;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
		}

		li a:hover,
		.dropdown:hover .dropbtn {
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
			box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
			z-index: 1;
		}

		.dropdown-content a {
			color: black;
			padding: 12px 16px;
			text-decoration: none;
			display: block;
			text-align: left;
		}

		.dropdown-content a:hover {
			background-color: #f1f1f1
		}

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

		.active,
		.accordion:hover {
			background-color: #fce2ec;
			content: '\002B';
		}

		.accordion::after {
			content: "\2796";
			/* Unicode character for "minus" sign (-) */

			font-size: 13px;
			color: #777;
			float: right;
			margin-left: 5px;
		}

		.active:after {
			content: '\02795';
			/* Unicode character for "plus" sign (+) */
		}

		.panel {
			padding: 0 18px;


			background-color: white;
			overflow: hidden;
		}
	</style>
</head>

<body>
	<%@ include file="viewMenuItem.jsp" %>



	<%
	String bgcolor="";
	int count=0;
	HashMap viewMap = new HashMap();
	
	
	
	
	if(request.getAttribute("project")!=null && request.getAttribute("project")!="")
	{
		 viewMap =  (HashMap)request.getAttribute("project");
		 count=1;
	}
	
	
	
	ArrayList feedbacklist=null;
	int projectid=0;
	ArrayList feedbackHLSDList=null;
	ArrayList ProjectList=new ArrayList();
	Iterator  viewItr;
	int hlsd=0;
	int assessment=0;
	

	
	if(session.getAttribute("projectid")!=null && session.getAttribute("projectid")!="")
	{
		projectid =  Integer.parseInt(request.getAttribute("projectid").toString());
		
	}
	
	if(request.getAttribute("feedbacklist")!=null && request.getAttribute("feedbacklist")!="")
	{
		feedbacklist=new ArrayList();
		feedbacklist =  (ArrayList)request.getAttribute("feedbacklist");
		assessment=1;
		 count=1;
	}
	
	if(request.getAttribute("feedbackHLSDList")!=null && request.getAttribute("feedbackHLSDList")!="")
	{
		feedbackHLSDList=new ArrayList();
		feedbackHLSDList =  (ArrayList)request.getAttribute("feedbackHLSDList");
		hlsd=1;
	}
	
	
	%>


	<br>
	<br>
	<ul class="breadcrumb" style="background-color:white;">
		<li><a href='/Veritas/home/'>Home</a></li>
		<li><a href="/Veritas/ViewAllProject">Review Dashboard</a></li>
		<li><a href="/Veritas/viewNoteServlet/<%=viewMap.get("ProjectID") %>"><%=viewMap.get("ProjectTitle")%></a></li>
		<li><a href="#" style="color:black;">EAC Feedback</a></li>
	</ul>
	<div>
		<div align="center" style="font-size:280%; color:#E20074; font-family: Arial; "> EAC Feedback <br>
		</div>
		<div align="center" style="font-size:200%; color:#E20074; font-family: Arial; "> Project:
			<%=viewMap.get("ProjectTitle")%></font>
		</div>



		<br><br><br>
		<form name="userform" method="get" action="/Veritas/AddEACFeedback" onsubmit="return FormValidation();">
			<table id="newlink1" class=bordered>

				<tr>
					<td style="font-weight:bold;"> <input type="radio" name="ReviewsType" id="ReviewsType"
							value="Assessment Review" checked>Assessment Review</td>

					<td style="font-weight:bold;"> <input type="radio" name="ReviewsType" id="ReviewsType1"
							value="HLSD Review"> HLSD Review</td>


				</tr>
			</table>

			<table id='t02' width="1600px" align="center"
				style="border:2px double #E20074;border-style:  solid double;">
				<thead>
					<tr style=" height:40px;">
						<th>Comment </th>
						<th>HLSD Section </th>
						<th>Comment By</th>
						<th>Action Item </th>
						<th>Priority</th>
						<th >Potential Impact</th>
						<th width=15%>Action</th>
					</tr>
				</thead>

				<tr style="align: center;">


					<td> <textarea style=" resize: none;height:50px; background-color:white;" name="comment"
							id="comment" onkeypress=" return blockSpecialChar(event);" rows="5" cols="33"></textarea>


					</td>
					<td bgcolor='white'> <textarea style=" resize: none ;background-color:white;height:50px;"
							name="hlsds" id="hlsds" onkeypress=" return blockSpecialChar(event);" rows="5"
							cols="33"></textarea>


					</td>
					<td bgcolor='white'> <textarea style="resize: none;background-color:white;height:50px;"
							name="commentby" id="commentby" onkeypress=" return blockSpecialChar(event);" rows="5"
							cols="33"></textarea>

					</td>
					<td> <textarea name="notes" style="resize: none ;background-color:white;height:50px;" id="notes"
							onkeypress=" return blockSpecialChar(event);" rows="5" cols="33"></textarea>


					</td>
					<td bgcolor='white'> <textarea style="resize: none;background-color:white;height:50px;"
							name="priority" id="priority" onkeypress=" return blockSpecialChar(event);" rows="5"
							cols="33">Medium</textarea>

					</td>







					<td>
						<select style="padding: 1px;"; name="potential-impact" id="potential-impact">
							<option value="" disabled selected>Select Impact</option>
							<option value="Documentation Gap">Documentation Gap</option>
							<option value="Security Vulnerability">Security Vulnerability</option>
							<option value="Business Continuity Risk">Business Continuity Risk</option>
							<option value="Compliance Violation">Compliance Violation</option>
							<option value="Time to Market Delay">Time to Market Delay</option>
							<option value="Higher Cost of Ownership">Higher Cost of Ownership</option>
							<option value="Other Impact (For Pilot only)">Other Impact(For Pilot only)</option>
						</select>
					</td>
					<input type="hidden" name="ProjectID" value="<%=viewMap.get("ProjectID")%>">

					<td bgcolor='white'><input type="submit" name="view" value="Add"></td>
		</form>
		<!-- </tr>
			
	
     <tr><td align="center" height="2px"></td></tr> -->


		</table>

		</form>
		<% if(!feedbacklist.isEmpty()) { %>


		<button type="button" class="accordion">Assessment Feedback</button>
		<div class="panel">
			<p>
				<table id="t01" width="1800px" align="center" style="border-collapse: collapse;">
					<thead>

						<tr style="height:40px;background-color:black" bgcolor=black>
							<th width=10% onclick="SortTable(0,'N')">Comment Id </th>
							<th onclick="SortTable(1,'T')">&nbsp;&nbsp;&nbsp;Comment </th>
							<th width=10% align=left onclick="SortTable(2,'T')">&nbsp;&nbsp;&nbsp;HLSD Section </th>
							<th width=10% align=left onclick="SortTable(3,'T')">&nbsp;&nbsp;&nbsp;Comment By</th>
							<th width=15% align=left onclick="SortTable(4,'T')">&nbsp;&nbsp;&nbsp; Action Item </th>
							<th width=10% align=left onclick="SortTable(5,'T')">&nbsp;&nbsp;&nbsp;Priority </th>
							<th width=15% align=left onclick="SortTablet(6,'T')">&nbsp;&nbsp;&nbsp;Potential Impact</th>
							<th width=10%>Action</th>
						</tr>
					</thead>

					<%
 
 Iterator itrcompnent = feedbacklist.iterator();
		
		while(itrcompnent.hasNext())
		{
			HashMap feedback=(HashMap)itrcompnent.next();
 %>



					<form name="userform" method="get" action="/Veritas/AddEACFeedback"
						onsubmit="return saveDependency(<%=feedback.get("DependencyID")%>)">

						<tr>
							<td> <textarea
									style="border: none; height:50px;resize: none;background-color:white; align:middle;"
									name="comment" onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
									disabled><%=feedback.get("commentID")%></textarea></td>
							<td> <textarea
									style="border: none;height:50px; resize: none;background-color:white; align:middle;"
									name="comment" id="comment<%=feedback.get("commentID")%>"
									onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
									onkeypress="return blockSpecialChar(event);"
									disabled><%=feedback.get("commen")%></textarea></td>

							<td> <textarea style="border: none; resize: none;background-color:white;" name="hlsds"
									id="hlsds<%=feedback.get("commentID")%>"
									onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
									onkeypress="return blockSpecialChar(event);"
									disabled><%=feedback.get("hlsds")%></textarea></td>

							<td> <textarea style="border: none; resize: none;background-color:white;" name="commentby"
									id="commentby<%=feedback.get("commentID")%>"
									onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
									onkeypress="return blockSpecialChar(event);"
									disabled><%=feedback.get("commentby")%></textarea></td>
							<td> <textarea style="border: none; resize: none;background-color:white;" name="notes"
									id="notes<%=feedback.get("commentID")%>"
									onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
									onkeypress="return blockSpecialChar(event);"
									disabled><%=feedback.get("notes")%></textarea></td>
							<td> <textarea style="border: none; resize: none;background-color:white;" name="priority"
									id="priority<%=feedback.get("commentID")%>"
									onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
									onkeypress="return blockSpecialChar(event);"
									disabled><%=feedback.get("priority")%>
								</textarea>
							</td>
	<% if(feedback.get("potentialImpact")!=null && !feedback.get("potentialImpact").toString().equalsIgnoreCase("null") )
												{
													
												}else
												{
													feedback.put("potentialImpact"," ");
												}
												%>
							<td>
								<textarea
										style="border: none; resize: none; background-color: white;"
										name="potentialImpactTextarea" id="potentialImpactTextarea<%=feedback.get("commentID")%>"
										onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
										onkeypress="return blockSpecialChar(event);" disabled><%=feedback.get("potentialImpact")%>
								</textarea>
								
								<select name="potential-impact" id="potential-impact<%=feedback.get("commentID")%>" style="display: none;padding:1px">
									<option value="Documentation Gap">Documentation Gap</option>
									<option value="Security Vulnerability">Security Vulnerability</option>
									<option value="Business Continuity Risk">Business Continuity Risk</option>
									<option value="Compliance Violation">Compliance Violation</option>
									<option value="Time to Market Delay">Time to Market Delay</option>
									<option value="Higher Cost of Ownership">Higher Cost of Ownership</option>
									<option value="Other (For Pilot only)">Other (For Pilot only)</option>
								</select>
							</td>

							<input type="hidden" name="action" value="update">

							<input type=hidden name="commentID" Value=<%=feedback.get("commentID")%>>
							<input type=hidden name="ProjectID" Value=<%=feedback.get("projectID")%>>



							<td><input type="button" name="editD" id="editD<%=feedback.get("commentID")%>" value="Edit "
									style=" border:0;background-color: #E20074;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;"
									onclick="editDependency(<%=feedback.get("commentID")%>);">
								<input type="submit" name="saveD" id="saveD<%=feedback.get("commentID")%>" value="Save "
									style="background-color: #E20074;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;display:none;">
							</td>




						</tr>
					</form>
					<%}%>
  </table>
  </div>

  <%
}

if(!feedbackHLSDList.isEmpty())
{
 Iterator itrcompnent1 = feedbackHLSDList.iterator();
		
  
 %>
					<button type="button" class="accordion">HLSD Feedback</button>


					<div class="panel">
						<p>
							<table id="t02" width="1800px" align="center" style="border-collapse: collapse;">
								<thead>
									<tr style="height:40px;background-color:black" bgcolor=black>


										<th width=10% onclick="SortTablet(0,'N')">Comment Id </th>
										<th onclick="SortTablet(1,'T')">&nbsp;&nbsp;&nbsp;Comment </th>
										<th width=10% align=left onclick="SortTablet(2,'T')">&nbsp;&nbsp;&nbsp;HLSD Section</th>
										<th width=10% align=left onclick="SortTablet(3,'T')">&nbsp;&nbsp;&nbsp;Comment By</th>
										<th width=15% align=left onclick="SortTablet(4,'T')">&nbsp;&nbsp;&nbsp; Action Item</th>
										<th width=10% align=left onclick="SortTablet(5,'T')">&nbsp;&nbsp;&nbsp;Priority</th>
										
										<th width=15% align=left onclick="SortTablet(6,'T')">&nbsp;&nbsp;&nbsp;Potential Impact</th>
										<th width=10%>Action</th>
									</tr>
								</thead>

								<%
 

		
		while(itrcompnent1.hasNext())
		{
			HashMap feedback=(HashMap)itrcompnent1.next();
 %>

								<form name="userform" method="get" action="/Veritas/AddEACFeedback"
									onsubmit="return saveDependency(<%=feedback.get("DependencyID")%>)">

									<tr height="100px">
										<td> <textarea
												style="border: none;padding: 1px; resize: none;background-color:white; align:middle;"
												name="comment" onkeypress="return blockSpecialChar(event);" rows="5"
												cols="33" disabled><%=feedback.get("commentID")%></textarea></td>
										<td> <textarea
												style="border: none;padding: 1px; height:80px;resize: none;background-color:white;"
												name="comment" id="comment<%=feedback.get("commentID")%>"
												onkeypress="return blockSpecialChar(event);" 
												onkeypress="return blockSpecialChar(event);"
												disabled><%=feedback.get("commen")%></textarea></td>

										<td> <textarea
												style="border: none; padding: 1px;height:80px;resize: none;background-color:white;"
												name="hlsds" id="hlsds<%=feedback.get("commentID")%>"
												onkeypress="return blockSpecialChar(event);" rows="5" cols="33" disabled
												onkeypress="return blockSpecialChar(event);"><%=feedback.get("hlsds")%></textarea>
										</td>

										<td> <textarea style="border: none;padding: 1px;height:60px; resize: none;background-color:white;"
												name="commentby" id="commentby<%=feedback.get("commentID")%>"
												onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
												onkeypress="return blockSpecialChar(event);"
												disabled><%=feedback.get("commentby")%></textarea></td>
										<td> <textarea style="border: none;padding: 1px; resize: none;background-color:white;"
												name="notes" id="notes<%=feedback.get("commentID")%>"
												onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
												onkeypress="return blockSpecialChar(event);"
												disabled><%=feedback.get("notes")%></textarea></td>
										<td> <textarea style="border: none;padding: 1px;height:80px;display: block; margin: 0 auto;resize: none;background-color:white;"
												name="priority" id="priority<%=feedback.get("commentID")%>"
												onkeypress="return blockSpecialChar(event);"
												onkeypress="return blockSpecialChar(event);"
												disabled><%=feedback.get("priority").toString().trim()%>
											</textarea>
										</td>

										<td>
										<% if(feedback.get("potentialImpact")!=null && !feedback.get("potentialImpact").toString().equalsIgnoreCase("null") )
												{
													
												}else
												{
													feedback.put("potentialImpact"," ");
												}
												%>
											<textarea
												style="border: none;padding: 1px; resize: none; background-color: white;"
												name="potentialImpactTextarea" id="potentialImpactTextarea<%=feedback.get("commentID")%>"
												onkeypress="return blockSpecialChar(event);" rows="5" cols="33"
												
												
												onkeypress="return blockSpecialChar(event);" disabled><%=feedback.get("potentialImpact")%>
											</textarea>
											
											<select name="potential-impact" id="potential-impact<%=feedback.get("commentID")%>" style="display: none;padding: 1px;" >
												<option value="Documentation Gap">Documentation Gap</option>
												<option value="Security Vulnerability">Security Vulnerability</option>
												<option value="Business Continuity Risk">Business Continuity Risk</option>
												<option value="Compliance Violation">Compliance Violation</option>
												<option value="Time to Market Delay">Time to Market Delay</option>
												<option value="Higher Cost of Ownership">Higher Cost of Ownership</option>
												<option value="Other (For Pilot only)">Other (For Pilot only)</option>
											</select>
										</td>
											
										<input type="hidden" name="action" value="update">
										<input type=hidden name="ReviewsType" Value=<%=feedback.get("ReviewsType")%>>

										<input type=hidden name="commentID" Value=<%=feedback.get("commentID")%>>
										<input type=hidden name="ProjectID" Value=<%=feedback.get("projectID")%>>



										<td><input type="button" name="editD" id="editD<%=feedback.get("commentID")%>"
												value="Edit "
												style=" border:0;background-color: #E20074;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;"
												onclick="editDependency(<%=feedback.get("commentID")%>);">
											<input type="submit" name="saveD" id="saveD<%=feedback.get("commentID")%>"
												value="Save "
												style="background-color: #E20074;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;display:none;">
										</td>




									</tr>
								</form>
								<%}%>
  </table>
  </div>

<%} %>









</body>
<script>

	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function () {
			this.classList.toggle("active");

			var panel = this.nextElementSibling;
			if (panel.style.display === "none") {
				panel.style.display = "block";
			} else {
				panel.style.display = "none";
			}

		});

	}

	document.getElementById('ReviewsType').checked = localStorage.ReviewsType == "true";//localStorage.getItem("ReviewsType");
	document.getElementById('ReviewsType1').checked = localStorage.ReviewsType1 == "true";//localStorage.getItem("ReviewsType1");
	if (localStorage.commentby != undefined) {
		document.getElementById('commentby').value = localStorage.commentby;
	}




	var TableIDvalue = "t01";

	//
	//////////////////////////////////////
	var TableLastSortedColumn = -1;
	function SortTable() {
		var sortColumn = parseInt(arguments[0]);
		var type = arguments.length > 1 ? arguments[1] : 'T';
		var dateformat = arguments.length > 2 ? arguments[2] : '';
		var table = document.getElementById(TableIDvalue);
		var tbody = table.getElementsByTagName("tbody")[0];
		var rows = tbody.getElementsByTagName("tr");
		var arrayOfRows = new Array();
		type = type.toUpperCase();
		dateformat = dateformat.toLowerCase();
		for (var i = 0, len = rows.length; i < len; i++) {
			arrayOfRows[i] = new Object;
			arrayOfRows[i].oldIndex = i;
			var celltext = rows[i].getElementsByTagName("td")[sortColumn].innerHTML.replace(/<[^>]*>/g, "");
			if (type == 'D') { arrayOfRows[i].value = GetDateSortingKey(dateformat, celltext); }
			else {
				var re = type == "N" ? /[^\.\-\+\d]/g : /[^a-zA-Z0-9]/g;
				arrayOfRows[i].value = celltext.replace(re, "").substr(0, 25).toLowerCase();
			}
		}
		if (sortColumn == TableLastSortedColumn) { arrayOfRows.reverse(); }
		else {
			TableLastSortedColumn = sortColumn;
			switch (type) {
				case "N": arrayOfRows.sort(CompareRowOfNumbers); break;
				case "D": arrayOfRows.sort(CompareRowOfNumbers); break;
				default: arrayOfRows.sort(CompareRowOfText);
			}
		}
		var newTableBody = document.createElement("tbody");
		for (var i = 0, len = arrayOfRows.length; i < len; i++) {
			newTableBody.appendChild(rows[arrayOfRows[i].oldIndex].cloneNode(true));
		}
		table.replaceChild(newTableBody, tbody);
	} // function SortTable()


	var TableIDvalue1 = "t02";


	function SortTablet() {
		var sortColumnt = parseInt(arguments[0]);
		var typet = arguments.length > 1 ? arguments[1] : 'T';
		var dateformatt = arguments.length > 2 ? arguments[2] : '';
		var tablet = document.getElementById(TableIDvalue1);
		var tbodyt = tablet.getElementsByTagName("tbody")[0];
		var rowst = tbodyt.getElementsByTagName("tr");
		var arrayOfRowst = new Array();
		typet = typet.toUpperCase();
		dateformatt = dateformatt.toLowerCase();
		for (var i = 0, len = rowst.length; i < len; i++) {
			arrayOfRowst[i] = new Object;
			arrayOfRowst[i].oldIndex = i;
			if (rowst[i].getElementsByTagName("td") != undefined) {
				var celltextt = rowst[i].getElementsByTagName("td")[sortColumnt].innerHTML.replace(/<[^>]*>/g, "");
				if (typet == 'D') { arrayOfRowst[i].value = GetDateSortingKey(dateformatt, celltextt); }
				else {
					var ret = typet == "N" ? /[^\.\-\+\d]/g : /[^a-zA-Z0-9]/g;
					arrayOfRowst[i].value = celltextt.replace(re, "").substrt(0, 25).toLowerCase();
				}
			}
		}
		if (sortColumnt == TableLastSortedColumn) { arrayOfRowst.reverse(); }
		else {
			TableLastSortedColumnt = sortColumn;
			switch (type) {
				case "N": arrayOfRowst.sort(CompareRowOfNumbers); break;
				case "D": arrayOfRowst.sort(CompareRowOfNumbers); break;
				default: arrayOfRowst.sort(CompareRowOfText);
			}
		}
		var newTableBody = document.createElement("tbody");
		for (var i = 0, len = arrayOfRowst.length; i < len; i++) {
			newTableBodyt.appendChild(rows[arrayOfRows[i].oldIndex].cloneNode(true));
		}
		tablet.replaceChild(newTableBody, tbody);
	}


	function CompareRowOfText(a, b) {
		var aval = a.value;
		var bval = b.value;
		return (aval == bval ? 0 : (aval > bval ? 1 : -1));
	} // function CompareRowOfText()

	function CompareRowOfNumbers(a, b) {
		var aval = /\d/.test(a.value) ? parseFloat(a.value) : 0;
		var bval = /\d/.test(b.value) ? parseFloat(b.value) : 0;
		return (aval == bval ? 0 : (aval > bval ? 1 : -1));
	} // function CompareRowOfNumbers()

	function GetDateSortingKey(format, text) {
		if (format.length < 1) { return ""; }
		format = format.toLowerCase();
		text = text.toLowerCase();
		text = text.replace(/^[^a-z0-9]*/, "");
		text = text.replace(/[^a-z0-9]*$/, "");
		if (text.length < 1) { return ""; }
		text = text.replace(/[^a-z0-9]+/g, ",");
		var date = text.split(",");
		if (date.length < 3) { return ""; }
		var d = 0, m = 0, y = 0;
		for (var i = 0; i < 3; i++) {
			var ts = format.substr(i, 1);
			if (ts == "d") { d = date[i]; }
			else if (ts == "m") { m = date[i]; }
			else if (ts == "y") { y = date[i]; }
		}
		d = d.replace(/^0/, "");
		if (d < 10) { d = "0" + d; }
		if (/[a-z]/.test(m)) {
			m = m.substr(0, 3);
			switch (m) {
				case "jan": m = String(1); break;
				case "feb": m = String(2); break;
				case "mar": m = String(3); break;
				case "apr": m = String(4); break;
				case "may": m = String(5); break;
				case "jun": m = String(6); break;
				case "jul": m = String(7); break;
				case "aug": m = String(8); break;
				case "sep": m = String(9); break;
				case "oct": m = String(10); break;
				case "nov": m = String(11); break;
				case "dec": m = String(12); break;
				default: m = String(0);
			}
		}
		m = m.replace(/^0/, "");
		if (m < 10) { m = "0" + m; }
		y = parseInt(y);
		if (y < 100) { y = parseInt(y) + 2000; }
		return "" + String(y) + "" + String(m) + "" + String(d) + "";
	} // function GetDateSortingKey()



</script>

</html>
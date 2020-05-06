<html>

<head>
  <TITLE>Veritas - Design Review Tool</TITLE>
  <link rel="icon" type="image/png" href="/Veritas/logo.png" />
  <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="styles.css">
  <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
  <script src="/Veritas/alert.js"></script>
  <link rel="stylesheet" href="/Veritas/alert.css">

  <script>

    function isNumberKey(evt) {
      var charCode = (evt.which) ? evt.which : event.keyCode
      if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

      return true;
    }Ÿ
    var ct = 1;
    var ct1 = 1;
    function new_Leadership() {

      ct++;
      var newRow = document.getElementById('newlink').insertRow();
      //var te=document.getElementById('newlink').innerHTML;
      var te1='<td style="font-weight:bold;">Project Stakeholders <input type="text" name="ProjectResource'+ct+'" value=""> </td> <td style="font-weight:bold;"> Project Role  <select name="ProjectRole'+ct+'" > <option value="SolutionCaptain">Solution Captain</option> <option value="ProductOwner">Product Owner</option> <option value="LeadArchitect">Lead Architect</option><option value="EACArchitect">EAC Architect</option><option value="LeadAnalyst">Lead Analyst</option><option value="Add A Line MTS">Add A Line MTS</option><option value="New Activation MTS">New Activation MTS</option><option value="Payment MTS">Payment MTS</option><option value="Trade-in MTS">Trade-in MTS</option><option value="Upgrades MTS">Upgrades MTS</option></select> </td <td style="font-weight:bold;"> Company   <select name="Company'+ct+'" > <option value="TMOBILE">T-Mobile</option><option value="Sprint">Sprint</option></select></td>';
      //var Final =te.append(te1);

      newRow.innerHTML = te1;
    }
    function new_Feature() {

      ct1++;
      var newRow = document.getElementById('newlink1').insertRow();
      //var te=document.getElementById('newlink').innerHTML;
      var te1 = '<td style="font-weight:bold;">Feature Code:  <input type="text" name="FeatureCode' + ct1 + '" value=""></td><td style="font-weight:bold;">Feature Description:  <input type="text" name="FeatureDescription' + ct1 + '" value=""></td><td style="font-weight:bold;">Dependent Feature :  <input type="text" name="DependentFeature' + ct1 + '" value=""></td>';
      //var Final =te.append(te1);


      newRow.innerHTML = te1;
    }
    function FormValidation() {
      //First Name Validation getElementsByName
      var errorMessage = document.getElementById('errorMessage');
	  var result = true;
	  
      if (document.getElementsByName('ProjectNumber')[0].value == "") {
        document.getElementsByName('ProjectNumber')[0].style.borderColor = "red";
        document.getElementsByName('ProjectNumber')[0].style.borderWidth = "medium";
        errorMessage.style.display="block";
        result = false;
      } else {
        document.getElementsByName('ProjectNumber')[0].style.borderColor = "green";
        result = true;
      }

      if (document.getElementsByName('ProjectTittle')[0].value == "") {
        document.getElementsByName('ProjectTittle')[0].style.borderColor = "red";
        document.getElementsByName('ProjectTittle')[0].style.borderWidth = "medium";
        errorMessage.style.display="block";
        result = false;
      } else {
        document.getElementsByName('ProjectTittle')[0].style.borderColor = "green";
        result = true;
      }
      
      if (document.getElementsByName('ProjectType')[0].value == "NA") {
    	  document.getElementsByName('ProjectType')[0].style.borderColor = "red";
    	  document.getElementsByName('ProjectType')[0].style.borderWidth = "medium";
    	  errorMessage.style.display="block";
    	  result = false;
    	}else {
            document.getElementsByName('ProjectType')[0].style.borderColor = "green";
            result = true;
        }
		
      if (document.getElementsByName('ReviewsType')[0].value == "NA") {
    	  document.getElementsByName('ReviewsType')[0].style.borderColor = "red";
    	  document.getElementsByName('ReviewsType')[0].style.borderWidth = "medium";
    	  errorMessage.style.display="block";
    	  result = false;
    	}else {
            document.getElementsByName('ReviewsType')[0].style.borderColor = "green";
            result = true;
        }
      if (document.getElementsByName('ProjectCategory')[0].value == "NA") {
    	  document.getElementsByName('ProjectCategory')[0].style.borderColor = "red";
    	  document.getElementsByName('ProjectCategory')[0].style.borderWidth = "medium";
    	  errorMessage.style.display="block";
    	  result = false;
    	}else {
            document.getElementsByName('ProjectCategory')[0].style.borderColor = "green";
            result = true;
        }
      if (document.getElementsByName('ProjectNumber')[0].value == "" || document.getElementsByName('ProjectTittle')[0].value == "" ||
    	  document.getElementsByName('ProjectType')[0].value == "NA" || document.getElementsByName('ReviewsType')[0].value == "NA" ||	
    		  document.getElementsByName('ProjectCategory')[0].value == "NA"){
    	  errorMessage.style.display="block";
    	  result = false;  
      }else{
    	  errorMessage.style.display="none";
      }
      return result;
    }



    function isNumberKey(evt) {
      var charCode = (evt.which) ? evt.which : event.keyCode
      if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

      return true;
    }


  </script>
  <style>
    .bordered {

      border: 2px dashed #E20074;
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

    #left {
      width: 50%;

      display: inline-block;
      vertical-align: top;
      white-space: normal;
    }

    #center {

      vertical-align: bottom;

      position: fixed;

      left: 40%;



      text-align: center;
    }

    #right {
      width: 50%;

      display: inline-block;
      vertical-align: top;
      white-space: normal;
    }

    .parent {
      white-space: nowrap;
      width: 100%;
    }

    td {
      padding-top: .5em;
      padding-bottom: .5em;
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
  </style>
</head>

<body>
  <%@ include file="viewMenuItem.jsp" %>

  <div align="center" style="font-size:280%; color:#E20074" ;> Add Project </div>


  <form name="userform" method="get" action="/Veritas/addUser" onsubmit="return FormValidation();">
    <br><br><br>
    <div class="parent">
      <div id="left">
        <table class=bordered cellpadding="15">
          <tr class=trbordered>



<!-- TODO: Change the input name from ProjectNumber to projectId and projectTittle to ProjectName when refactoring -->
            <td style="font-weight:bold;text-align:left;" style="">
              <div class="row">
                <div class="col-25">
                  Clarity Project Id *:
                </div>
                <div class="col-75"><input type="text" name="ProjectNumber" value=""> </div>
              </div>
            </td>
          </tr>
          <tr>
            <td style="font-weight:bold;text-align:left;">
              <div class="row">
                <div class="col-25">Clarity Project Name *: </div>
                <div class="col-75"> <input type="text" name="ProjectTittle" value=""></div>
              </div>
            </td>
          </tr>

          <tr>
            <td style="font-weight:bold;text-align:left;">
              <div class="row">
                <div class="col-25">Project Description: </div>
                <div class="col-75"> <input type="text" name="ProjectDescription" value=""></div>
              </div>
            </td>
          </tr>
          <tr>
            <td style="font-weight:bold;text-align:left;">
              <div class="row">
                <div class="col-25">Project Category *: </div>
                <div class="col-75"><select name="ProjectCategory">
                <option value="NA">----Select----</option>
                    <option value="T-Mobile">T-Mobile</option>
                    <option value="Sprint">Sprint</option>
                    <option value="Both Stacks">Both Stacks</option>
                    <option value="Integration">Integration</option>

                  </select></div>
              </div>
            </td>
          </tr>
          <tr>
            <td style="font-weight:bold;text-align:left;">
              <div class="row">
                <div class="col-25">Project Type *: </div>
                <div class="col-75"><select name="ProjectType">
                <option value="NA">----Select----</option>
                    <option value="BAU">BAU</option>
                    <option value="Journey">Journey</option>
					<option value="Run">Run</option>
                    <option value="Operate">Operate</option>
                    <option value="Digital Transformation">Digital Transformation</option>

                  </select></div>
              </div>
            </td>
          </tr>


          <tr>
            <td style="font-weight:bold;text-align:left;">
              <div class="row">
                <div class="col-25">ProjectSite: </div>
                <div class="col-75"> <input type="text" name="ProjectSite" value=""></div>
              </div>
            </td>
          </tr>

          <tr>
            <td style="font-weight:bold;text-align:left;">
              <div class="row">
                <div class="col-25">Project Status:</div>
                <div class="col-75"> <select name="ProjectStatus">

                    <option value="Proposed">Proposed</option>
                    <option value="Confirmed">Confirmed</option>
                    <option value="Approve">Approve</option>
                    <option value="Design">Design</option>
                    <option value="Development">Development</option>
                    <option value="Test">Test</option>
                    <option value="Dependency">Dependency tracking Only </option>
                    <option value="Cancelled">Cancelled</option>
                    <option value="Completed">Completed</option>
                </div>
              </div>
            </td>
          </tr>




          <tr>
            <td style="font-weight:bold;text-align:left;">
              <div class="row">
                <div class="col-25">Work Stream:</div>
                <div class="col-75"> <select name="WorkStream">
                    <option value="BAU">BAU</option>
                    <option value="B2B">B2B</option>
                    <option value="BackOffice">Back Office</option>
                    <option value="Billing">Billing</option>
                    <option value="Care">Care</option>
                    <option value="Commissions">Commissions</option>
                    <option value="Credit">Credit / Collections</option>
                    <option value="Cross \Provisioning">Cross Provisioning</option>
                    <option value="DeviceFinancing">Device Financing</option>
                    <option value="Digital">Digital</option>
                    <option value="Engineering">Engineering</option>
                    <option value="GeneralReporting ">General Reporting </option>
                    <option value="HomeonRoam">Home on Roam</option>
                    <option value="IoT">IoT</option>
                    <option value="Migration">Migration</option>
                    <option value="MVNO">MVNO</option>
                    <option value="NewValue">New Value Prop</option>
                    <option value="Offers">Offers / Eligibility</option>
                    <option value="Sales">Sales</option>
                    <option value="SupplyChain">Supply Chain</option>
                    <option value="Technology">Technology</option>
                  </select>

                </div>
              </div>




            </td>
          </tr>
          <tr>
            <td style="font-weight:bold;text-align:left;left-padding:1px;">
              <div class="row">
                <div class="col-25">Target Deployment :</div>
                <div class="col-75"> <select name="TargetDeployment">
                    <option value="DAY0">Day 0</option>
                    <option value="DAY1">DAY 1</option>
                    <option value="Q1">Q1</option>
                    <option value="Q2">Q2</option>
                    <option value="Q3">Q3</option>
                    <option value="Q4">Q4</option>
                </div>
              </div>
            </td>
          </tr>
          <tr>
            <td style="font-weight:bold;"> <input type="checkbox" name="wave" value="wave3"> isRestricted</td>
          </tr>
          <tr>
            <td style="font-weight:bold;">
              <div align=center>



              </div>


            </td>
          </tr>












          <tr>
            <td style="font-weight:bold;">
              <div align=center>

              </div>

            </td>
          </tr>














        </table>
      </div>

      <div id="right">
        <table id="newlink1" class=bordered cellpadding="15">

          <tr>
            <td style="font-weight:bold;">Capability Code: <input type="text" name="FeatureCode" value=""></td>

            <td style="font-weight:bold;">Capability Description: <input type="text" name="FeatureDescription" value="">
            </td>

            <td>
              <p id="addnew">
                <input type="button" name="Add" value="Add Capability"
                  style=" border:0;background-color: #E20074;border-radius: 50px;width:120px;height:30px;font-weight:bold;color:#ffffff;"
                  onclick="new_Feature();">

              </p>
            </td>
          </tr>
        </table>
        <br><br><br><br><br>
        <table id="newlink" class=bordered cellpadding="15">
          <tr class=trbordered>
            <td style="font-weight:bold;">Project Stakeholders <input type="text" name="ProjectResource" value=""> </td>

            <td style="font-weight:bold;"> Project Role <select name="ProjectRole">
                <option value="PM">PM</option>
                <option value="SolutionCaptain">Solution Captain</option>
                <option value="ProductOwner">Product Owner</option>
                <option value="LeadArchitect">Lead Architect</option>
                <option value="EACArchitect">EAC Architect</option>
                <option value="LeadAnalyst">Lead Analyst</option>
                <option value="Add A Line MTS">Add A Line MTS (Phi)</option>
								<option value="New Activation MTS">New Activation MTS (GK, Himanshu)</option>
								<option value="Payment MTS">Payment MTS (Senthil, Anurag)</option>
								<option value="Trade-in MTS">Trade-in MTS (Joe)</option>
								<option value="Upgrades MTS">Upgrades MTS (Vinay)</option>
              </select> </td>
            <td style="font-weight:bold;">Company <select name="Company">
                <option value="TMOBILE">T-Mobile</option>
                <option value="Sprint">Sprint</option>

              </select></td>
            <td>
              <p id="addnew1">
                <input type="button" name="Add" value="Add Stakeholders"
                  style=" border:0;background-color: #E20074;border-radius: 50px;width:120px;height:30px;font-weight:bold;color:#ffffff;"
                  onclick="new_Leadership();">

              </p>
            </td>
          </tr>
        </table>
        <br><br><br><br><br><br>
        <table id="newlink" class=bordered cellpadding="15">
          <tr class=trbordered>
          
           
            <td style="font-weight:bold;text-align:left;">
              <div class="row">
                <div class="col-50">Review Type *: </div>
                <div class="col-50"><select name="ReviewsType">
                <option value="NA">----Select----</option>
                    <option value="Assessment Review">Assessment</option>
                    <option value="HLSD Review">HLSD</option>
                  </select></div>
              </div>
            </td>

            </td>

            <td style="font-weight:bold;"> Review Status <select name="ReviewStatus">
                <option value="Pending Review">Pending Review</option>
                <option value="To be Scheduled">To be Scheduled </option>
                <option value="Pending Review">Pending Review</option>
                <option value="Approved">Approved</option>
                <option value="Returned with Feedback">Returned with Feedback</option>
                <option value="Review In Progress">Review In Progress</option>
                <option value="On Hold">On Hold</option>
                <option value="EAC Review Not Needed">EAC Review Not Needed</option>
                <option value="Approved with AIs">Approved with AIs</option>
              </select> </td>

          </tr>
          <tr>

            <td style="font-weight:bold;"><input type="checkbox" name="Reviews"
                value="Assessment Document Received">Assessment Document Received</td>
            <td style="font-weight:bold;"> <input type="checkbox" name="Reviews" value="BRD Baselined">BRD Baselined
            </td>

            <td style="font-weight:bold;"> <input type="checkbox" name="Reviews" value="HLSD Received"> HLSD Received
            </td>
            <td style="font-weight:bold;"> <input type="checkbox" name="Reviews" value="HLSD Reviewed with Biz"> HLSD
              Reviewed with Biz</td>




          </tr>
          <tr>
            <td style="font-weight:bold;"><input type="checkbox" name="Reviews" value="Attendees Received">Attendees
              Received</td>
            <td style="font-weight:bold;"><input type="checkbox" name="Reviews" value="Docs Sent to Reviewers">Docs Sent
              to Reviewers</td>

            <td style="font-weight:bold;">Proposed SDO review date <input type="date" name="SDOReview" id="SDOReview"
                min="2019-01-01" max="2021-12-31"> </td>


          </tr>
        </table>
      </div>
      <br><br><br>
      <div id=errorMessage style="display:none"> <font color="red">Please enter all the mandatory(*) fields.</font></div>
      <div>
        <input type="submit" name="Submit" value="Save"
          style=" float:left;border:0;background-color: #E20074;border-radius: 50px;width:80px;height:30px;font-weight:bold;color:#ffffff;">
      </div>
    </div>
  </form>
  <script type="text/javascript">
    var d1 = new Date();
    var y1 = d1.getFullYear();
    var m1 = d1.getMonth() + 1;
    if (m1 < 10)
      m1 = "0" + m1;
    var dt1 = d1.getDate();
    if (dt1 < 10)
      dt1 = "0" + dt1;
    var d2 = y1 + "-" + m1 + "-" + dt1;
    document.getElementById("SDOReview").value = d2;
  </script>

</body>

</html>
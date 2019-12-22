<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="multi-step-form.aspx.cs" Inherits="SmartConcepcion.Portal.Beta.multi_step_form" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Register:</h1>
    <hr />

    <style>
        /* Style the form */
        #regForm {
            background-color: #ffffff;
            margin: 100px auto;
            padding: 40px;
            width: 70%;
            min-width: 300px;
        }

        /* Style the input fields */
        input {
            padding: 10px;
            width: 100%;
            font-size: 17px;
            font-family: Raleway;
            border: 1px solid #aaaaaa;
        }

        /* Mark input boxes that gets an error on validation: */
        input.invalid {
            background-color: #ffdddd;
        }

        /* Hide all steps by default: */
        .tab {
            display: none;
        }

        /* Make circles that indicate the steps of the form: */
        .step {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbbbbb;
            border: none;
            border-radius: 50%;
            display: inline-block;
            opacity: 0.5;
        }

        /* Mark the active step: */
        .step.active {
            opacity: 1;
        }

        /* Mark the steps that are finished and valid: */
        .step.finish {
            background-color: #4CAF50;
        }
    </style>
    <!-- One "tab" for each step in the form: -->
    <div class="tab">
        <h3>Personal Information</h3>
        <div class="form-group">
            <label class="col-md-4 text-right">Firstname</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtFnam" placeholder="Firstname" CssClass="form-control sign-up-ctrl" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Middlename</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtMnam" placeholder="Middlename" CssClass="form-control sign-up-ctrl" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Lastname</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtLnam" placeholder="Lastname" CssClass="form-control sign-up-ctrl" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Suffix</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtSuffix" placeholder="Suffix" CssClass="form-control sign-up-ctrl" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Birthddate</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtBday" placeholder="Birthdate" autocomplete="off" CssClass="form-control sign-up-ctrl" TextMode="Date" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Gender</label>
            <div class="col-md-8">
                <asp:DropDownList runat="server" ID="ddGender" placeholder="Sex" CssClass="form-control sign-up-ctrl">
                    <asp:ListItem Text="Male" Value="male" />
                    <asp:ListItem Text="Female" Value="female" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Voter's ID</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtVotersID" placeholder="Voter's ID" autocomplete="off" CssClass="form-control sign-up-ctrl" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Nationality</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtNationality" placeholder="Nationality" CssClass="form-control sign-up-ctrl" />
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-md-4 text-right">Civil Status</label>
            <div class="col-md-8">
                <asp:DropDownList runat="server" ID="ddCivilStatus" CssClass="form-control sign-up-ctrl">
                    <asp:ListItem Text="Single" />
                    <asp:ListItem Text="Married" />
                    <asp:ListItem Text="Widowed" />
                    <asp:ListItem Text="Seperated" />
                    <asp:ListItem Text="Divorced" />
                </asp:DropDownList>
            </div>
        </div>
    </div>

    <div class="tab">
        <h3>Present Address</h3>
        <div class="form-group">
            <label class="col-md-4 text-right">Brgy</label>
            <div class="col-md-8">
                <asp:DropDownList runat="server" ID="ddBrgy" placeholder="Barangay" CssClass="form-control sign-up-ctrl"
                    DataValueField="ID" DataTextField="Description" OnSelectedIndexChanged="ddBrgy_SelectedIndexChanged" AutoPostBack="true" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Zone/Purok</label>
            <div class="col-md-4">
                <asp:DropDownList runat="server" ID="ddZone" placeholder="Barangay" CssClass="form-control sign-up-ctrl"
                    DataValueField="ID" DataTextField="Description" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">St. Bldg No.</label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="txtStbldgno" placeholder="St. Bldg No." CssClass="form-control sign-up-ctrl" />
            </div>
        </div>
        <h3>Contact Information</h3>
        <div class="form-group">
            <label class="col-md-4 text-right">Email</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control sign-up-ctrl" TextMode="Email" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Contact No.</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtContact" placeholder="Contact No." CssClass="form-control sign-up-ctrl" />
            </div>
        </div>
        
    </div>

    <div class="tab">
       <h3>Educational Attainment</h3>
        <!-- Elementary -->
        <div class="form-group">
            <label class="col-md-4 text-right">Preschool</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtPreschool" placeholder="Preschool" CssClass="form-control sign-up-ctrl"  />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Preschool Date</label>
            <div class="col-md-8">
                <div class="input-daterange input-group" style="z-index: 0">
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtPreFrom" />
                    <span class="input-group-addon">to</span>
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtPreTo" />
                </div>
            </div>
        </div>

        <!-- Highschool -->
        <div class="form-group">
            <label class="col-md-4 text-right">Highschool</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtHS" placeholder="Highschool" CssClass="form-control sign-up-ctrl"  />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Highschool Date</label>
            <div class="col-md-8">
                <div class="input-daterange input-group" style="z-index: 0">
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtHSStart" />
                    <span class="input-group-addon">to</span>
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtHSEnd" />
                </div>
            </div>
        </div>

        <!-- College -->
        <div class="form-group">
            <label class="col-md-4 text-right">College</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtCollege" placeholder="College" CssClass="form-control sign-up-ctrl"  />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Course</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtCourse" placeholder="Course" CssClass="form-control sign-up-ctrl"  />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">College Date</label>
            <div class="col-md-8">
                <div class="input-daterange input-group" style="z-index: 0">
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtCollegeStart" />
                    <span class="input-group-addon">to</span>
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtCollegeEnd" />
                </div>
            </div>
        </div>
    </div>

    <div class="tab">
        <div class="form-group">
            <label class="col-md-4 text-right">Password</label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtRUserpass" placeholder="Password" autocomplete="off" CssClass="form-control sign-up-ctrl" TextMode="Password" />
            </div>
        </div>
        
        <div class="col-md-12" style="color: red">
            <span><i class="fa fa-exclamation-circle" aria-hidden="true"></i>Note: You need an Admin approval after signing up, Ask for assistance</span>
        </div>
    </div>

    <div class="container">
        <div style="float: right;">
            <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
            <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
        </div>
    </div>

    <!-- Circles which indicates the steps of the form: -->
    <div style="text-align: center; margin-top: 40px;">
        <span class="step"></span>
        <span class="step"></span>
        <span class="step"></span>
        <span class="step"></span>
    </div>

    <script>
        var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab

        function showTab(n) {
          // This function will display the specified tab of the form ...
          var x = document.getElementsByClassName("tab");
          x[n].style.display = "block";
          // ... and fix the Previous/Next buttons:
          if (n == 0) {
            document.getElementById("prevBtn").style.display = "none";
          } else {
            document.getElementById("prevBtn").style.display = "inline";
          }
          if (n == (x.length - 1)) {
            document.getElementById("nextBtn").innerHTML = "Submit";
          } else {
            document.getElementById("nextBtn").innerHTML = "Next";
          }
          // ... and run a function that displays the correct step indicator:
          fixStepIndicator(n)
        }

        function nextPrev(n) {
          // This function will figure out which tab to display
          var x = document.getElementsByClassName("tab");
          // Exit the function if any field in the current tab is invalid:
          if (n == 1 && !validateForm()) return false;
          // Hide the current tab:
          x[currentTab].style.display = "none";
          // Increase or decrease the current tab by 1:
          currentTab = currentTab + n;
          // if you have reached the end of the form... :
          if (currentTab >= x.length) {
            //...the form gets submitted:
            document.getElementById("regForm").submit();
            return false;
          }
          // Otherwise, display the correct tab:
          showTab(currentTab);
        }

        function validateForm() {
          // This function deals with validation of the form fields
          var x, y, i, valid = true;
          x = document.getElementsByClassName("tab");
          y = x[currentTab].getElementsByTagName("input");
          // A loop that checks every input field in the current tab:
          for (i = 0; i < y.length; i++) {
            // If a field is empty...
            if (y[i].value == "") {
              // add an "invalid" class to the field:
              y[i].className += " invalid";
              // and set the current valid status to false:
              valid = false;
            }
          }
          // If the valid status is true, mark the step as finished and valid:
          if (valid) {
            document.getElementsByClassName("step")[currentTab].className += " finish";
          }
          return valid; // return the valid status
        }

        function fixStepIndicator(n) {
          // This function removes the "active" class of all steps...
          var i, x = document.getElementsByClassName("step");
          for (i = 0; i < x.length; i++) {
            x[i].className = x[i].className.replace(" active", "");
          }
          //... and adds the "active" class to the current step:
          x[n].className += " active";
        }
    </script>

</asp:Content>

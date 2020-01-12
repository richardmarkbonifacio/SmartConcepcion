<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Default" %>


<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Concepcion</title>
</head>
    
    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
           <link href="Content/Site.css" rel="stylesheet" />
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <style>

            html,body {
                background: linear-gradient( rgba(0,0,0,.5), rgba(0,0,0,.5) ), url('../images/Rose-Petals.svg') no-repeat center center fixed;
                background-size: cover;
                height: 100%;
            }
    
            input:-webkit-autofill,
            input:-webkit-autofill:hover, 
            input:-webkit-autofill:focus,
            textarea:-webkit-autofill,
            textarea:-webkit-autofill:hover,
            textarea:-webkit-autofill:focus,
            select:-webkit-autofill,
            select:-webkit-autofill:hover,
            select:-webkit-autofill:focus {
                -webkit-text-fill-color: #fff;
                -webkit-box-shadow: inset 0px 0px 0px rgba(0, 0, 0, 0.5);
                transition: background-color 5000s ease-in-out 0s;
            }
            .create {
                text-align: center;
                color: #ffd800;
                font-weight: 600;
                  
            }
            .create:hover{
                color:#06d96b;
                text-decoration:none;
                 transition: 0.3s;
            }
            .create:focus{
            color:#06d96b;
            text-decoration:none;
                transition: 0.3s;
            }
            .notreg{
                 color:#fff;
            }
            .forgot:hover {
                color: #ffd800;
                text-decoration: none;
                transition: 0.3s;
            }
            .forgot:focus{
                color: #ffd800;
                text-decoration:none;
                transition: 0.3s;
             }
            ::placeholder{
                 color:#fff;
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
     
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server">
                <Scripts>

                    <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                    <%--Framework Scripts--%>
                    <asp:ScriptReference Name="MsAjaxBundle" />
                    <asp:ScriptReference Name="jquery" />
                    <asp:ScriptReference Name="bootstrap" />
                    <asp:ScriptReference Path="~/Scripts/menumaker.js" />
                    <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                    <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                    <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                    <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                    <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                    <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                    <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                    <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                    <asp:ScriptReference Name="WebFormsBundle" />
                    <%--Site Scripts--%>
                </Scripts>
            </asp:ScriptManager>
            <div class="container">
                <div class="col-md-6 col-md-offset-3">
                    <img src="../images/logo2020.png" style="width: 100%" />
                    <div class="col-md-8 col-md-offset-2">
                        <div class="row">
                            <div class="inputWithIcon">
                                <%--       <input type="text" placeholder="Username" />--%>
                                <asp:TextBox runat="server" ID="txtUserid" placeholder="UserID" CssClass="btnsign" />
                                <i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
                            </div>

                            <div class="inputWithIcon">
                                <%--<input type="text" placeholder="Password" />--%>
                                <asp:TextBox runat="server" ID="txtUserpass" placeholder="Password" TextMode="Password" CssClass="btnsign" />
                                <i class="fa fa-key fa-lg fa-fw" aria-hidden="true"></i>
                            </div>

                            <div class="text-center">
                                <asp:Button runat="server" CssClass="btn btn-signin" Text="GET STARTED" OnClick="btnSignIn" />
                            </div>

                            <div class="row text-left">
                                <asp:Label runat="server" ID="lblErr" Font-Size="0.75em" Font-Italic="true" ForeColor="Red" />
                            </div>

                            <div class="row" style="vertical-align: middle">
                                <div class="col-md-6 col-xs-6 hidden">
                                    <label class="switch">
                                        <%--   <input type="checkbox" />--%>
                                        <asp:CheckBox runat="server" ID="RememberMe" />
                                        <span class="slider round"></span>
                                    </label>
                                    <div class="labeltoggle">Remember Me</div>
                                </div>

                                <div class="row">
                                    <div class="container-fluid text-center">
                                        <asp:LinkButton runat="server" id="lnkForgot" Text="Forgot Password?" CssClass="forgot" OnClick="lnkForgot_Click" />
                                    </div>
                                    <div class="container-fluid text-center">
                                        <span class="notreg">Not registered?</span> <a class="create" href="#" data-toggle="modal" data-target="#myModal">CREATE ACCOUNT</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Sign Up</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <asp:UpdatePanel runat="server" ID="upSignup" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="container-fluid">
                                        <div class="tab">
                                            <h3>Personal Information</h3>
                                            <div class="form-group">
                                                <label class="col-md-4 text-right">Firstname</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" ID="txtFnam" placeholder="Firstname" CssClass="form-control sign-up-ctrl required" />
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
                                                    <asp:TextBox runat="server" ID="txtLnam" placeholder="Lastname" CssClass="form-control sign-up-ctrl required" />
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
                                                    <asp:TextBox runat="server" ID="txtVotersID" placeholder="Voter's ID" autocomplete="off" CssClass="form-control sign-up-ctrl required" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-4 text-right">Nationality</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" ID="txtNationality" placeholder="Nationality" CssClass="form-control sign-up-ctrl required" />
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
                                                        DataValueField="ID" DataTextField="Description" OnSelectedIndexChanged="ddBrgy_SelectedIndexChanged" AutoPostBack="true" onchange="ddbrgy();" />
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-4 text-right">Zone/Purok</label>
                                                <div class="col-md-8">
                                                    <asp:DropDownList runat="server" ID="ddZone" placeholder="Barangay" CssClass="form-control sign-up-ctrl"
                                                        DataValueField="ID" DataTextField="Description" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-4 text-right">St. Bldg No.</label>
                                                <div class="col-md-8">
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
                                                    <asp:TextBox runat="server" ID="txtContact" placeholder="Contact No." CssClass="form-control sign-up-ctrl required" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="tab">
                                            <h3>Educational Attainment</h3>
                                            <!-- Preschool -->
                                            <div class="container-fluid">
                                                <label class="col-md-4 text-right">Preschool</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" ID="txtPreschool" placeholder="Preschool" CssClass="form-control sign-up-ctrl" />
                                                </div>
                                            </div>
                                            <div class="container-fluid">
                                                <label class="col-md-4 text-right">Preschool Date</label>
                                                <div class="col-md-8">
                                                    <div class="input-daterange input-group" style="z-index: 0">
                                                        <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtPreFrom" />
                                                        <span class="input-group-addon">to</span>
                                                        <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtPreTo" />
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Elementary -->
                                            <div class="container-fluid">
                                                <label class="col-md-4 text-right">Elementary</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" ID="txtElem" placeholder="Elementary" CssClass="form-control sign-up-ctrl" />
                                                </div>
                                            </div>
                                            <div class="container-fluid">
                                                <label class="col-md-4 text-right">Elementary Date</label>
                                                <div class="col-md-8">
                                                    <div class="input-daterange input-group" style="z-index: 0">
                                                        <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtElemStart" />
                                                        <span class="input-group-addon">to</span>
                                                        <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtElemEnd" />
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Highschool -->
                                            <div class="container-fluid">
                                                <label class="col-md-4 text-right">Highschool</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" ID="txtHS" placeholder="Highschool" CssClass="form-control sign-up-ctrl" />
                                                </div>
                                            </div>
                                            <div class="container-fluid">
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
                                            <div class="container-fluid">
                                                <label class="col-md-4 text-right">College</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" ID="txtCollege" placeholder="College" CssClass="form-control sign-up-ctrl" />
                                                </div>
                                            </div>
                                            <div class="container-fluid">
                                                <label class="col-md-4 text-right">Course</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" ID="txtCourse" placeholder="Course" CssClass="form-control sign-up-ctrl" />
                                                </div>
                                            </div>
                                            <div class="container-fluid">
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

                                        <div class="container-fluid">
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
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <asp:Button runat="server" CssClass="btn btn-acct" Text="Sign Up" OnClick="btnSignUp" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            
        </form>
        <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
        <script src="Scripts/custom/jquery-dialog.js"></script> 
        <script>
            var current_tab = 0;
            
            function ddbrgy() {
                current_tab = 1;
            }

            function pageLoad() { showTab(current_tab); }
        </script>
</body>
</html>


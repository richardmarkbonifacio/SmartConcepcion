﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Default" %>


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
        </style>
     
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server">
                <Scripts>

                    <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                    <%--Framework Scripts--%>
                    <asp:ScriptReference Name="MsAjaxBundle" />
                    <asp:ScriptReference Name="jquery" />
                    <asp:ScriptReference Name="bootstrap" />
                    <%--<script src="~/Scripts/menumaker.js" runat="server"></script>--%>
                    <%--<asp:ScriptReference Name="menumaker.js" Assembly="System.Web" Path="~/Scripts/menumaker.js" />--%>
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
                    <img src="../images/logo3.png" style="width: 100%" />
                    <div class="col-md-8 col-md-offset-2">
                        <div class="row">
                            <div class="inputWithIcon">
                                <%--       <input type="text" placeholder="Username" />--%>
                                <asp:TextBox runat="server" TextMode="number" ID="txtUserid" placeholder="UserID" CssClass="btnsign" />
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
                                    <a class="forgot" href="#">Forgot Password?</a>
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
                            <div class="container-fluid">
                                <div class="form-group">
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" ID="txtFnam" placeholder="Firstname" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" ID="txtMnam" placeholder="Middlename" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" ID="txtLnam" placeholder="Lastname" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control sign-up-ctrl" TextMode="Email" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" ID="txtContact" placeholder="Contact No." CssClass="form-control sign-up-ctrl" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList runat="server" ID="ddBrgy" placeholder="Barangay" CssClass="form-control sign-up-ctrl" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" ID="txtBday" placeholder="Birthdate" autocomplete="off" CssClass="form-control sign-up-ctrl" TextMode="Date" />
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList runat="server" ID="ddGender" placeholder="Gender" CssClass="form-control sign-up-ctrl">
                                            <asp:ListItem Text="Male" />
                                            <asp:ListItem Text="Female" />
                                            <asp:ListItem Text="Alien" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" ID="txtRUserpass" placeholder="Password" autocomplete="off" CssClass="form-control sign-up-ctrl" TextMode="Password" />
                                    </div>
                                </div>
                            </div>


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
      
</body>
</html>


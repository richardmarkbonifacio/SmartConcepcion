<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logintesting.aspx.cs" Inherits="SmartConcepcion.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    
    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        <style>

            body {
                background: linear-gradient( rgba(0,0,0,.5), rgba(0,0,0,.5) ), url('../images/bglogin.jpg') no-repeat center center fixed;
                background-size: cover;
            }
            .logologin {
            }

            /*Don't forget to add Font Awesome CSS : "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"*/
            input[type="text"] {
              width: 100%;
              border: 2px solid #aaa;
              border-radius: 4px;
              margin: 8px 0;
              outline: none;
              padding: 8px;
              box-sizing: border-box;
              transition: 0.3s;
            }

            input[type="text"]:focus {
              border-color: dodgerBlue;
              box-shadow: 0 0 8px 0 dodgerBlue;
            }

            .inputWithIcon input[type="text"] {
              padding-left: 40px;
            }

            .inputWithIcon {
              position: relative;
            }

            .inputWithIcon i {
              position: absolute;
              left: 0;
              top: 8px;
              padding: 9px 8px;
              color: #aaa;
              transition: 0.3s;
            }

            .inputWithIcon input[type="text"]:focus + i {
              color: dodgerBlue;
            }

            .inputWithIcon.inputIconBg i {
              background-color: #aaa;
              color: #fff;
              padding: 9px 4px;
              border-radius: 4px 0 0 4px;
            }

            .inputWithIcon.inputIconBg input[type="text"]:focus + i {
              color: #fff;
              background-color: dodgerBlue;
            }

        </style>
        <link href="Content/bootstrap.css" rel="stylesheet" />
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
                    <div class="row">
                                        <div class="inputWithIcon">
                  <input type="text" placeholder="Your name"/>
                  <i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
                </div>

                <div class="inputWithIcon">
                  <input type="text" placeholder="Email"/>
                  <i class="fa fa-key fa-lg fa-fw" aria-hidden="true"></i>
                </div>
                    </div>
                </div>
            </div>
        </form>
</body>
</html>

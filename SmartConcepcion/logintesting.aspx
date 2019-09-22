<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logintesting.aspx.cs" Inherits="SmartConcepcion.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>




  
    <body>
            <style>
            body { 


   background: 
    linear-gradient( rgba(0,0,0,.5), rgba(0,0,0,.5) ),
    url('../images/bglogin.jpg') no-repeat center center fixed; 
    background-size: cover;
}
            .logologin{
              
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
        <div>

     <div class="logologin"><img src="../images/logo3.png" style="width:500px"/>  </div>
      
                

        </div>
    </form>
</body>
</html>

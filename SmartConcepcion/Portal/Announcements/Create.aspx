<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="upPostAnnouncement">
        <ContentTemplate>
            <div class="container">

                <div class="img-banner text-center" runat="server" id="imgbanner">
                    <asp:FileUpload runat="server" accept="image/*" multiple="false" ID="fuBanner" ClientIDMode="Static" />
                    <asp:Button runat="server" CssClass="btn btn-default btn-lg" Text="Refresh"  ID="btnRefresh" OnClick="btnRefresh_Click"/>
                </div>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Title" ID="txtTitle" />
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Subtitle" ID="txtSubtitle" />
                <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="txtDate" />

                <asp:TextBox runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Write something" ID="txtContent" />

                <asp:Button runat="server" Text="POST" ID="btnPost" OnClick="btnPost_Click" CssClass="btn btn-default" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnRefresh" />
            <asp:PostBackTrigger ControlID="btnPost" />
        </Triggers>
    </asp:UpdatePanel>
    
</asp:Content>

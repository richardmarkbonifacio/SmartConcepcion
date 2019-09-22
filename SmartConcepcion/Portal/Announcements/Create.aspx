<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="upPostAnnouncement">
        <ContentTemplate>
            <div class="container create-announcement">

                <asp:TextBox runat="server" CssClass="form-control" placeholder="Title" ID="txtTitle" />
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Subtitle" ID="txtSubtitle" />
                <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="txtDate" />

                <asp:TextBox runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control" placeholder="Write something" ID="txtContent" />
                <asp:FileUpload runat="server" accept="image/*" multiple="false" ID="fuBanner" ClientIDMode="Static" />
                <hr />
                <asp:Button runat="server" Text="P O S T" ID="btnPost" OnClick="btnPost_Click" CssClass="btn btn-danger pull-right" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPost" />
        </Triggers>
    </asp:UpdatePanel>
    
</asp:Content>

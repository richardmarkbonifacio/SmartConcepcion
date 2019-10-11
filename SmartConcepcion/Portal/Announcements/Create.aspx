<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Create" %>
<%@ Register
            Assembly="AjaxControlToolkit"
            Namespace="AjaxControlToolkit"
            TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="upPostAnnouncement">
        <ContentTemplate>
       
            <div class="header-banner">CREATE NEWS</div>
            <div class="container create-announcement">

                <asp:TextBox runat="server" CssClass="form-control" placeholder="Title" ID="txtTitle" />
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Subtitle" ID="txtSubtitle" />
                <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="txtDate" />
                
                
                <asp:HtmlEditorExtender runat="server" EnableSanitization="false" BehaviorID="editor_txtContent" TargetControlID="txtContent" id="editor_txtContent" ></asp:HtmlEditorExtender>

                <asp:TextBox runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control" placeholder="Write something" ID="txtContent" />
                <img id="imgpreview" class="img-responsive" src="http://placehold.it/180" alt="your image"  Height="300"   />
                <asp:FileUpload runat="server" accept="image/*" multiple="false" ID="fuBanner" ClientIDMode="Static" onchange="readURL(this);" />
                <hr />
                
                <asp:Button runat="server" Text="P O S T" ID="btnPost" OnClick="btnPost_Click" CssClass="btn btnload pull-right" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPost" />
        </Triggers>
    </asp:UpdatePanel>
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgpreview')
                        .attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

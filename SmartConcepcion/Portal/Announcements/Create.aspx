<%@ Page Title="Create News" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Create" %>
<%@ Register
            Assembly="AjaxControlToolkit"
            Namespace="AjaxControlToolkit"
            TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .ajax__html_editor_extender_popupDiv {
                display:none;
            }
    </style>

    <asp:UpdatePanel runat="server" ID="upPostAnnouncement" >
        <ContentTemplate>
       
            <div class="header-banner">CREATE NEWS</div>
            <div class="container create-announcement">
                
                <div class="container-fluid">
                    <label class="col-md-2 text-right">Title</label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Title" ID="txtTitle" />
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContent" SetFocusOnError="true" ErrorMessage="Title must not be blank!" ForeColor="Red" />
                    </div>
                </div>

                <div class="container-fluid">
                    <label class="col-md-2 text-right">Subtitle</label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Subtitle" ID="txtSubtitle"/>
                          <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContent" SetFocusOnError="true" ErrorMessage="Subtitle must not be blank!" ForeColor="Red" />
                    </div>
                </div>

                <div class="container-fluid">
                    <label class="col-md-2 text-right">Event Date</label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" CssClass="form-control" TextMode="DateTimeLocal" ID="txtDate" width="250" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDate" SetFocusOnError="true" ErrorMessage="Please put Time and Date" ForeColor="Red" />
                    </div>
                </div>
                <div class="container-fluid">
                    <label class="col-md-2 text-right">Category</label>
                    <div class="col-md-10">
                        <asp:DropDownList runat="server" ID="ddCategory" DataValueField="code" DataTextField="description" CssClass="form-control" 
                            OnSelectedIndexChanged="ddCategory_SelectedIndexChanged" CausesValidation="false" width="250" AutoPostBack="true"/>
                    </div>
                </div>
                
                <div class="container-fluid">
                    <%--<img id="imgpreview" class="img-responsive" src="http://placehold.it/180" alt="your image" height="300" />--%>
                    <asp:FileUpload runat="server" accept="image/*" multiple="false" ID="fuBanner" ClientIDMode="Static"  CssClass="form-control-file" onchange="readURL(this)" />
                </div>
                <div class="container-fluid">
                    <asp:HtmlEditorExtender runat="server" EnableSanitization="false" BehaviorID="editor_txtContent"
                        TargetControlID="txtContent" ID="editor_txtContent"  />

                    <asp:TextBox runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control" placeholder="Write something" ID="txtContent" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContent" SetFocusOnError="true" ErrorMessage="Input some Details" ForeColor="Red" />
                </div>

                <asp:Panel runat="server" ID="pnlZone">
                    <div class="container-fluid">
                        <asp:CheckBoxList DataTextField="Description" DataValueField="ID" runat="server" ID="chkZone" />
                    </div>
                </asp:Panel>

                <asp:LinkButton runat="server" ID="btnsave" OnClick="btnPost_Click" CssClass="btn btnload pull-right" >P O S T <i class="fa fa-check" aria-hidden="true"></i> </asp:LinkButton>
            </div>
        </ContentTemplate>
       <Triggers>
           <asp:PostBackTrigger ControlID="btnsave" />
           <asp:PostBackTrigger ControlID="ddCategory" />
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

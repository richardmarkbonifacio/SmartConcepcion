
<%@ Page Title="Announcements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Default" %>
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
    <asp:UpdatePanel ID="upAnnouncements" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <script src="../../Scripts/custom/sidenav.js"></script>
           
            <div class="container-fluid">
                <asp:ListView runat="server" ID="lvAnnouncement" OnItemDataBound="lvAnnouncement_ItemDataBound">
                    <ItemTemplate>
                        <asp:Image runat="server" ID="imgbanner" ToolTip='<%#Eval("ID") %>' CssClass="img-responsive hidden" Height="300px"/>
                        <asp:Panel runat="server" ID="panelItem">
                            <asp:Panel runat="server" ID="panelbgContainer">
                                <div class="container-fluid top-news-overlay">
                                    <div class="col-md-12 annoucement-pinned-items">
                                        <h5>
                                            <asp:LinkButton runat="server" ID="lnkAnnouncement" OnClick="lnkAnnouncement_Click" ToolTip='<%#Eval("ID") %>'> <%# Eval("title") %></asp:LinkButton>
                                        </h5>
                                        <div class="row">
                                            <div class="col-md-6"><b>by </b><%# Eval("createdByName") %></div>
                                            <div class="col-md-6 text-center"><%# Eval("datecreated", "{0:MMMM dd yyyy}") %></div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:ListView>
            </div>
           
            <hr />

            <div class="container-fluid">
                <asp:GridView runat="server" AutoGenerateColumns="false" OnRowDataBound="gvAnnouncements_RowDataBound" ID="gvAnnouncements" CssClass="gvAnnouncements">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Panel runat="server" ID="panelRow" CssClass="panelRow">
                                    <div class="col-md-4">
                                        <asp:Image runat="server" ID="imgbanner" ToolTip='<%#Eval("ID") %>' CssClass="img-responsive" Width="460" />
                                    </div>
                                    <div class="col-md-8">
                                        <h3><%# Eval("title") %></h3>
                                        <p class="mb-0"><%# Eval("subtitle") %></p>
                                        Published by <cite title="Source Title"><%# Eval("createdByName") %>
                                        <span>
                                            <%# Eval("preview") %>
                                        </span>
                                    </div>

                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
            <div class="container text-center ">
           <%-- <asp:LinkButton runat="server" OnClick="LoadMore_Click" Text="Load More" Cssclass="btnload" />--%>
                <asp:button runat="server" id="btnLoadmore" Text="Load More" CssClass="btn btnload"/>
                </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    

    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">
                                <asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="container" style="min-height: 100vh; background: white;">
            <asp:UpdatePanel runat="server" ID="upPostAnnouncement">
                <ContentTemplate>
                    <div class="create-announcement">
                        <h2>Create Announcement</h2>
                        <div class="container-fluid">
                            <label class="col-md-2 text-right">Title</label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="Title" ID="txtTitle" />
                            </div>
                        </div>
                        <div class="container-fluid">
                            <label class="col-md-2 text-right">Subtitle</label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="Subtitle" ID="txtSubtitle" />
                            </div>
                        </div>
                        <div class="container-fluid">
                            <label class="col-md-2 text-right">Event Date</label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="DateTimeLocal" ID="txtDate" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDate" SetFocusOnError="true" ErrorMessage="Input some Details" ForeColor="Red" />
                            </div>
                        </div>
                        
                        <div class="container-fluid">
                            <asp:HtmlEditorExtender runat="server" EnableSanitization="false" BehaviorID="editor_txtContent" 
                            TargetControlID="txtContent" ID="editor_txtContent"  />

                            <asp:TextBox runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control" placeholder="Write something" ID="txtContent" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContent" SetFocusOnError="true" ErrorMessage="Input some Details" ForeColor="Red" />
                        </div>

                        <hr />
                        <div class="container-fluid">
                            <%--<img id="imgpreview" class="img-responsive" src="http://placehold.it/180" alt="your image" height="300" />--%>
                            <asp:FileUpload runat="server" accept="image/*" multiple="false" ID="fuBanner" ClientIDMode="Static"  CssClass="form-control-file" />
                        </div>

                        <hr />
                        
                        <asp:Button runat="server" Text="P O S T" ID="btnPost" OnClick="btnPost_Click" CssClass="btn btn-post pull-right" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnPost" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>

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

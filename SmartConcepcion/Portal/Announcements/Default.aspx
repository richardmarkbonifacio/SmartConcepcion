
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Default" %>
<%@ Register
            Assembly="AjaxControlToolkit"
            Namespace="AjaxControlToolkit"
            TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGvAnnouncements" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid hidden">
                <asp:GridView runat="server" AutoGenerateColumns="false" OnRowDataBound="gvAnnouncements_RowDataBound" ID="gvAnnouncements" CssClass="table gvAnnouncements">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="hidden">
                            <ItemTemplate>
                                
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
            <div class="container-fluid">
                <asp:ListView runat="server" ID="lvAnnouncement" OnItemDataBound="lvAnnouncement_ItemDataBound">
                    <ItemTemplate>
                        <asp:Panel runat="server" ID="panelItem" >
                        <asp:Panel runat="server" ID="panelbgContainer">
                                    <div class="col-md-12 announcement-row hidden" >
                                        <div class="hovereffect">
                                            <asp:Image runat="server" ID="imgbanner" ToolTip='<%#Eval("ID") %>' CssClass="img-responsive" Height="300px"/>
                                            <div class="overlay">
                                                <h2><%# Eval("title") %></h2>
                                                <asp:LinkButton runat="server" CssClass="info" OnClick="lnkAnnouncement_Click" ToolTip='<%#Eval("ID") %>'> Read More</asp:LinkButton>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-12 annoucement-pinned-items">
                                        <div class="row">
                                            <div class="col-md-6"><b>by </b><%# Eval("createdByName") %></div>
                                            <div class="col-md-6 text-center"><i class="fa fa-calendar" aria-hidden="true"></i><%# Eval("datecreated") %></div>
                                        </div>
                                        <h5>
                                            <asp:LinkButton runat="server" ID="lnkAnnouncement" OnClick="lnkAnnouncement_Click" ToolTip='<%#Eval("ID") %>'> <%# Eval("title") %></asp:LinkButton>

                                        </h5>
                                    </div>

                                </asp:Panel>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="container-fluid">
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modalPostAnnouncement" runat="server" id="btnOpenAnnouncementDlg">
            Open Large Modal
        </button>

        <!-- Modal -->
        <div class="modal fade" id="modalPostAnnouncement" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Create Announcement</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            
                            <img id="imgpreview" class="img-responsive" src="http://placehold.it/180" alt="your image"  Height="300"  />
                            
                            <asp:FileUpload runat="server" accept="image/*" multiple="false" ID="fuBanner" ClientIDMode="Static" onchange="readURL(this);" />
                            <asp:TextBox runat="server" CssClass="form-control" placeholder="Title" ID="txtTitle" />
                            <asp:TextBox runat="server" CssClass="form-control" placeholder="Subtitle" ID="txtSubtitle" />
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="Date" ID="txtDate" />
                            <div class="container">
                                <asp:HtmlEditorExtender runat="server" EnableSanitization="false" BehaviorID="editor_txtContent" TargetControlID="txtContent" id="editor_txtContent" ></asp:HtmlEditorExtender>
                            <asp:TextBox runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Write something" ID="txtContent" Width="500px" />
                            </div>
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" CssClass="btn btn-default" Text="POST" ID="btnPost" OnClick="btnPost_Click" />
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                    </div>
                </div>
            </div>
        </div>

    </div>

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

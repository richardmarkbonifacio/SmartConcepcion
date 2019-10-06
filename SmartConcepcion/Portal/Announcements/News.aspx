<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.News" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .ajax__html_editor_extender_popupDiv {
                display:none;
            }
        .announcement-row{
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
    <asp:UpdatePanel ID="upAnnouncements" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <script src="../../Scripts/custom/sidenav.js"></script>
            <div class="container-fluid">
                <asp:GridView runat="server" AutoGenerateColumns="false" OnRowDataBound="gvAnnouncements_RowDataBound" ID="GridView1" CssClass="gvAnnouncements">
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
                                            <%# Eval("body_content") %>
                                        </span>
                                    </div>

                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
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
                                            <%# Eval("body_content") %>
                                        </span>
                                    </div>

                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
</asp:Content>

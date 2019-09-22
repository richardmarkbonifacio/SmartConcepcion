<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        

    </style>
        <div class="container-fluid">
            <asp:GridView runat="server" AutoGenerateColumns="false" OnRowDataBound="gvAnnouncements_RowDataBound" ID="gvAnnouncements" CssClass="table gvAnnouncements">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden">
                        <ItemTemplate>
                                <asp:Panel runat="server" ID="panelRow" CssClass="panelRow">
                                    <div class="col-md-4"> 
                                        <div class="hovereffect">
                                            <asp:Image runat="server" ID="imgbanner" ToolTip='<%#Eval("ID") %>' CssClass="img-responsive" />
                                            <div class="overlay">
                                               <h2><%# Eval("title") %></h2>
                                               <asp:LinkButton runat="server" CssClass="info" OnClick="lnkAnnouncement_Click" ToolTip='<%#Eval("ID") %>'> Read More</asp:LinkButton>
                                            </div>
                                        </div>
                                        
                                    </div> 
                                    <div class="col-md-8">
                                        <div class="row">
                                            <div class="col-md-6"><b>by </b><%# Eval("createdByName") %></div>
                                            <div class="col-md-6 text-center"><i class="fa fa-calendar" aria-hidden="true"></i> <%# Eval("datecreated") %></div>
                                        </div> 
                                        <h3><asp:LinkButton runat="server" ID="lnkAnnouncement" OnClick="lnkAnnouncement_Click" ToolTip='<%#Eval("ID") %>'> <%# Eval("title") %></asp:LinkButton></h3>
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
        <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label></h4>
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
</asp:Content>

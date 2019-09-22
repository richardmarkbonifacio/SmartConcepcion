<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .panelRow{
            background-size:cover;
            height:300px;
        }
        .gvAnnouncements{

        }
    </style>
        <div class="container-fluid">
            <asp:GridView runat="server" AutoGenerateColumns="false" OnRowDataBound="gvAnnouncements_RowDataBound" ID="gvAnnouncements" CssClass="gvAnnouncements">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden">
                        <ItemTemplate>
                                <asp:Panel runat="server" ID="panelRow" CssClass="panelRow">
                                    <div class="col-md-4"> 
                                        <asp:Image runat="server" ID="imgbanner" ToolTip='<%#Eval("ID") %>' CssClass="img-responsive" Width="460" />
                                    </div> 
                                    <div class="col-md-8">
                                        <h3 class="text-center"><%# Eval("title") %></h3>
                                        <blockquote class="blockquote">
                                          <p class="mb-0"><%# Eval("subtitle") %></p>
                                          <footer class="blockquote-footer">Published by <cite title="Source Title"><%# Eval("createdByName") %></cite></footer>
                                        </blockquote>
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

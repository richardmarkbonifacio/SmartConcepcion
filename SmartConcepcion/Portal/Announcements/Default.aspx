<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-6 col-md-offset-3">
    <asp:GridView runat="server" AutoGenerateColumns="false" OnRowDataBound="gvAnnouncements_RowDataBound" ID="gvAnnouncements">
        <Columns>
            <asp:TemplateField HeaderStyle-CssClass="hidden">
                <ItemTemplate>
                    <div class="container-fluid">
                            <div class="row">
                                <asp:Image runat="server" ID="imgbanner" ToolTip='<%#Eval("ID") %>' CssClass="img-responsive" Width="460" />
                            </div> 
                        <h3 class="text-center"><%# Eval("title") %></h3>
                        <blockquote class="blockquote">
                          <p class="mb-0"><%# Eval("subtitle") %></p>
                          <footer class="blockquote-footer">Published by <cite title="Source Title"><%# Eval("createdByName") %></cite></footer>
                        </blockquote>
                        <span>
                            <%# Eval("body_content") %>
                         </span>
                    </div>
                    
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>
        </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="SmartConcepcion.Portal.Community.Notifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table{
            border-color:transparent;
            width:100%;
        }
        td{
            padding:5px;
        }
        
    </style>
    <asp:UpdatePanel runat="server" ID="upNotif">
        <ContentTemplate>
            <asp:GridView runat="server" ID="gvNotifDates" AutoGenerateColumns="false" OnRowDataBound="gvNotifDates_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text=<%# Eval("groupdate", "{0:MMMM dd yyyy}") %> ID="txtDate" />
                            <asp:GridView runat="server" ID="gvNotifDetails" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderStyle-CssClass="hidden">
                                        <ItemTemplate>
                                            <a href="../Announcements/view?" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

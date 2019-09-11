<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.WebForm1" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="upAnnouncements">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="container-fluid announce-header">
                    <h5>Create Announcement</h5>
                </div>
                <asp:TextBox runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Write something"/>
            </div>

            <asp:GridView runat="server" AutoGenerateColumns="false" ID="gvAnnouncements">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="hidden">
                        <ItemTemplate>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

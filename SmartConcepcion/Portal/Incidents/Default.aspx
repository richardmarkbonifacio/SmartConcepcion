<%@ Page Title="Incident Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Incidents.Default" %>
<asp:Content ID="content_report" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/custom/sidenav.js"></script>
    <asp:UpdatePanel ID="upIncidentReport" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <a onclick="openNav()">New Incident Report</a>
                <%--<asp:LinkButton runat="server" Text="New Incident Report" ID="lnkCreate" OnClick="lnkCreate_Click"/>--%>
                <asp:GridView runat="server" AutoGenerateColumns="false" 
                    ID="gvIncidentReport" CssClass="table" PageSize="20" 
                    AllowPaging="true" OnPageIndexChanging="gvIncidentReport_PageIndexChanging">

                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="hidden" DataField="ID" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" DataField="accusedByName" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" DataField="complainantByName" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" DataField="complainantByName" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" DataField="incident_details" />
                    </Columns>

                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="col-md-6 col-md-offset-3" style="height:100vh; background:white;">

        </div>
    </div>

</asp:Content>

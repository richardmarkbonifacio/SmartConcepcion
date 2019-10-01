<%@ Page Title="Incident Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Incidents.Default" %>
<asp:Content ID="content_report" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/custom/sidenav.js"></script>
    <asp:UpdatePanel ID="upIncidentReport" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <a onclick="openNav()">New Incident Report</a>
                <%--<asp:LinkButton runat="server" Text="New Incident Report" ID="lnkCreate" OnClick="lnkCreate_Click"/>--%>
                <asp:GridView runat="server" AutoGenerateColumns="false" 
                    ID="gvIncidentReport" CssClass="table table-hover table-responsive table-dark" PageSize="20" 
                    AllowPaging="true" OnPageIndexChanging="gvIncidentReport_PageIndexChanging">

                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Accused" DataField="accusedByName" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Complainant" DataField="complainantByName" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Accused" DataField="complainantByName" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Details" DataField="incident_details" />
                    </Columns>

                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="col-md-6 col-md-offset-3" style="min-height: 100vh; background: white;">
            <div class="container-fluid">
                <h2>Create Incident Report</h2>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label>Incident</label>
                        <asp:TextBox ID="txtTitle" runat="server" placeholder="Incident Title" CssClass="form-control" autocomplete="off" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTitle" SetFocusOnError="true" ErrorMessage="Title must not be blank" ForeColor="Red" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Accused</label>
                        <asp:DropDownList ID="ddAccused" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Complainant</label>
                        <asp:DropDownList ID="ddComplainant" runat="server" CssClass="form-control" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label>Incident Date</label>
                    <asp:TextBox ID="txtIncidentDate" runat="server" TextMode="DateTimeLocal" CssClass="form-control"/>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtIncidentDate" SetFocusOnError="true" ErrorMessage="Incident date must not be blank" ForeColor="Red"/>
                </div>

                <div class="form-group">
                    <label>Details</label>
                    <asp:TextBox ID="txtDetails" runat="server" TextMode="MultiLine" Rows="10" placeholder="Write the details of the incident" CssClass="form-control" autocomplete="off" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDetails" SetFocusOnError="true" ErrorMessage="Details must not be blank" ForeColor="Red" />
                </div>
                
                <div class="form-group">
                    <label>Confrontation Date</label>
                    <asp:TextBox ID="txtConfrontation" runat="server" TextMode="DateTimeLocal" CssClass="form-control"/>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfrontation" SetFocusOnError="true" ErrorMessage="Confrontation must not be blank" ForeColor="Red"/>
                </div>

                <div class="form-group">
                    <label>Remarks</label>
                    <asp:TextBox ID="txtRemarks" runat="server" placeholder="Remarks" CssClass="form-control" />
                </div>
                
                <asp:Button runat="server" CssClass="btn btn-danger" Text="POST" ID="btnPostIR" OnClick="btnPostIR_Click" />
            </div>
        </div>
    </div>

</asp:Content>

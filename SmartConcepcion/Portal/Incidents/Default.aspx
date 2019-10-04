<%@ Page Title="Incident Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Incidents.Default" %>
<asp:Content ID="content_report" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        table{
            background:#fff;
        }
        .thead-dark{
            background:#454d55;
            color:white;
            font-weight:500;
            text-align:center;
        }
        .ui-effects-wrapper{
            /*cnflict on dialog box*/
            display:none;
        }
    </style>
    <asp:UpdatePanel ID="upIncidentReport" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <a onclick="openNav()" class="pull-right" style="cursor:pointer">New Incident Report</a>
                <hr />
                <%--<asp:LinkButton runat="server" Text="New Incident Report" ID="lnkCreate" OnClick="lnkCreate_Click"/>--%>
                <asp:GridView runat="server" AutoGenerateColumns="false" 
                    ID="gvIncidentReport" CssClass="table table-hover table-responsive table-dark" PageSize="20" 
                    AllowPaging="true" OnPageIndexChanging="gvIncidentReport_PageIndexChanging">

                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Title" DataField="title" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Details" DataField="incident_details" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Incident Date" DataField="incident_details" />
                        
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Accused" DataField="accusedByName" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Complainant" DataField="complainantByName" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Confrontation Date" DataField="incident_details" />
                        <asp:TemplateField HeaderStyle-CssClass="thead-dark">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ToolTip='<%# Eval("ID") %>' CssClass="glyphicon glyphicon-edit" OnClick="Unnamed_Click" OnClientClick="openNav()" CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <asp:UpdatePanel runat="server" ID="upIncidentInfo" UpdateMode="Conditional">
            <ContentTemplate>
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
                                <asp:TextBox runat="server" ID="txtAccused" CssClass="form-control" onclick="openNameSuggestion()"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Complainant</label>
                                <asp:DropDownList ID="ddComplainant" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Incident Date</label>
                            <asp:TextBox ID="txtIncidentDate" runat="server" TextMode="DateTimeLocal" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtIncidentDate" SetFocusOnError="true" ErrorMessage="Incident date must not be blank" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Details</label>
                            <asp:TextBox ID="txtDetails" runat="server" TextMode="MultiLine" Rows="10" placeholder="Write the details of the incident" CssClass="form-control" autocomplete="off" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDetails" SetFocusOnError="true" ErrorMessage="Details must not be blank" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Confrontation Date</label>
                            <asp:TextBox ID="txtConfrontation" runat="server" TextMode="DateTimeLocal" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfrontation" SetFocusOnError="true" ErrorMessage="Confrontation must not be blank" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Remarks</label>
                            <asp:TextBox ID="txtRemarks" runat="server" placeholder="Remarks" CssClass="form-control" />
                        </div>

                        <asp:Button runat="server" CssClass="btn btn-danger" Text="POST" ID="btnPostIR" OnClick="btnPostIR_Click" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>


    <div id="dlgNameSuggestion" title="Residences" class="" style="display:none;">
        <asp:UpdatePanel runat="server" ID="upNameSuggestion" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="container-fluid">
                    <div class="col-md-8">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" />
                    </div>
                    <div class="col-md-4">
                        <asp:Button runat="server" CssClass="btn btn-warning" Text="search" ID="btnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false"/>
                    </div>
                </div>
                <hr />
                <asp:GridView ID="gvTemplateError" runat="server"
                    CssClass="table table-striped table-bordered table-hover"
                    AutoGenerateColumns="false"
                    AllowPaging="true" PageSize="10">
                    <Columns>
                        <asp:BoundField DataField="Fullname" HeaderText="Fullname" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="../../Scripts/custom/sidenav.js"></script>
    <script src="../../Scripts/custom/jquery-dialog.js"></script>
</asp:Content>

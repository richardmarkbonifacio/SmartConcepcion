<%@ Page Title="Incident Report" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Incidents.Default" %>
<asp:Content ID="content_report" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <div class="header-banner">INCIDENT REPORT</div>
    <style>
        .filter{
            display:none;
        }
    </style>
    <script>
        function FilterBox() {
            $(".filter").toggle(500, "linear");
        }
    </script>
    <asp:UpdatePanel ID="upIncidentReport" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-6">
                    <i class="fa fa-sliders" aria-hidden="true" style="cursor:pointer" onclick="FilterBox()" >Filter</i>
                </div>
                <div class="col-md-6 text-right">
                    <asp:LinkButton runat="server" OnClientClick="openNav()" OnClick="lnkCreate_Click" Text="New Incident Report" CausesValidation="false"  />
                </div>
            </div>

            <div class="row filter">
                <div class="col-md-2">
                    <asp:DropDownList runat="server" ID="ddStatus" CssClass="form-control" DataTextField="Description" DataValueField="code" />
                </div>
                <div class="col-md-5">
                    <div class="input-daterange input-group" style="z-index: 0">
                        <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtFrom" />
                        <span class="input-group-addon">to</span>
                        <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txtTo" />
                    </div>
                </div>
                <div class="col-md-3">
                    <asp:TextBox runat="server" placeholder="Search by name" CssClass="form-control" ID="txtName" />
                </div>
                <div class="col-md-2">
                    <button runat="server" onserverclick="Filter_Text" causesvalidation="false" class="btn btn-mini btn-warning form-control" title="Search">
                        <i class="fa fa-search" aria-hidden="true"></i>Search
                    </button>
                </div>
            </div>

            <hr />
            <div class="container-fluid">
                <div style="overflow-x: scroll">
                    <asp:GridView runat="server" AutoGenerateColumns="false"
                        ID="gvIncidentReport" CssClass="table table-default table-hover table-responsive table-dark" PageSize="20"
                        AllowPaging="true" AllowCustomPaging="true" OnPageIndexChanging="gvIncidentReport_PageIndexChanging">

                        <Columns>
                            <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Title" DataField="title" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Status" DataField="status" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Incident Date" DataFormatString="{0:MMMM dd, yyyy}" DataField="incidentdate" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Location" DataField="incident_location" />

                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Accused" DataField="accusedByName" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Complainant" DataField="complainantByName" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Confrontation Date" DataFormatString="{0:MMMM dd, yyyy}" DataField="confrontation_date" />
                            <asp:TemplateField HeaderStyle-CssClass="thead-dark" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ToolTip='<%# Eval("ID") %>' CssClass="glyphicon glyphicon-edit" OnClick="Unnamed_Click" OnClientClick="openNav()" CausesValidation="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerTemplate>

                            <ul class="pagination pagination-md">
                                <li class="page-item">
                                    <asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Prev" Text="Previous" CausesValidation="false" /></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Next" Text="Next" CausesValidation="false" /></li>
                            </ul>

                        </PagerTemplate>
                        <PagerSettings Mode="NextPrevious" Position="Bottom" PreviousPageText="Previous" NextPageText="Next" FirstPageText="First" LastPageText="Last" />
                        <PagerStyle HorizontalAlign="Right" />
                    </asp:GridView>
                    <asp:Label runat="server" ID="norecord" Visible="false" Text="NO RECORD FOUND" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <asp:UpdatePanel runat="server" ID="upIncidentInfo" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-md-6 col-md-offset-3" style="min-height: 100vh; background: white;">
                    <div class="container-fluid">
                        <h2 runat="server" id="header">Create Incident Report</h2>
                        <asp:HiddenField runat="server" ID="hfFrom" />
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
                                <asp:TextBox runat="server" ID="txtAccused" CssClass="form-control" onclick="openNameSuggestion('accsd')" ReadOnly="true"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Complainant</label>
                                <asp:TextBox runat="server" ID="txtComplainant" CssClass="form-control" onclick="openNameSuggestion('cmplnnt')" ReadOnly="true"/>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label>Incident Location</label>
                                <asp:TextBox ID="txtLocation" runat="server" placeholder="Incident Location" CssClass="form-control" autocomplete="off" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLocation" SetFocusOnError="true" ErrorMessage="Location must not be blank" ForeColor="Red" />
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
                        <div class="row text-right">
                            <asp:Button runat="server" CssClass="btn btn-red" Text="CASE CLOSED" ID="btnCaseClose" OnClick="btnCaseClose_Click" OnClientClick="closeNav()" /><br />
                            <asp:Button runat="server" CssClass="btn btn-send" Text="SAVE" ID="btnPostIR" OnClick="btnPostIR_Click" OnClientClick="closeNav()"/>
                        </div>
                        
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
                        
                        <asp:TemplateField HeaderText="Fullname" >
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%# Eval("Fullname") %>' ToolTip='<%# Eval("ID") %>' OnClick="lnkSelectResident_Click" CausesValidation="false"/>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <asp:LinkButton runat="server" Text="Not a resident" OnClick="lnkNotAResident_Click" CausesValidation="false" />
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="../../Scripts/custom/sidenav.js"></script>
    <script src="../../Scripts/custom/jquery-dialog.js"></script>
</asp:Content>

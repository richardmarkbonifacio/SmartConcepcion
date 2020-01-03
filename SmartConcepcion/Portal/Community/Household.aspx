<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Household.aspx.cs" Inherits="SmartConcepcion.Portal.Community.Household" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        .filter{
            display:none;
        }
    </style>
    
    <div class="header-banner">HOUSEHOLD</div>
    <asp:UpdatePanel ID="upHousehold" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        
                    </div>
                    <div class="col-md-6 text-right">
                        <i class="fa fa-sliders" aria-hidden="true" style="cursor:pointer" onclick="FilterBox()" >Filter</i>
                    </div>
                </div>
                <div class="row filter">
                    <div class="col-md-3 col-xs-3 col-md-offset-3">
                        <asp:DropDownList runat="server" ID="ddVerified" CssClass="form-control">
                            <asp:ListItem Text="Select One" Value="-1" />
                            <asp:ListItem Text="Verified" Value="1" />
                            <asp:ListItem Text="Not Verified" Value="0" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 col-xs-3">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" autocomplete="false" placeholder="Search for name" />
                    </div>
                    <div class="col-md-3 col-xs-3">
                        <asp:Button runat="server" CssClass="btn btn-send" Text="SEARCH" ID="btnSearchHead" OnClick="btnSearchHead_Click" CausesValidation="false" />
                    </div>
                </div>
                
                <hr />
                <%--<asp:LinkButton runat="server" Text="New Incident Report" ID="lnkCreate" OnClick="lnkCreate_Click"/>--%>
                <div style="overflow-x: scroll">
                    <asp:GridView runat="server" AutoGenerateColumns="false"
                        ID="gvHouseholdHead" CssClass="table table-default table-hover table-responsive table-dark table-striped" PageSize="20"
                        AllowPaging="true" AllowCustomPaging="true" OnPageIndexChanging="gvHouseholdHead_PageIndexChanging">

                        <Columns>
                            <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Email" DataField="email" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Fullname" DataField="fullname" />

                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Birthday" DataFormatString="{0:d}" DataField="birthday" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Contact No." DataField="contactno" />

                            <asp:TemplateField HeaderStyle-CssClass="thead-dark" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ToolTip='<%# Eval("ID") %>' CssClass="glyphicon glyphicon-edit" OnClick="SelectHead_Click" OnClientClick="openNav();" CausesValidation="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        
                        
                        <PagerSettings mode="NumericFirstLast" Position="Bottom" PreviousPageText="Previous" NextPageText="Next" FirstPageText="First" LastPageText="Last" />
                        <PagerStyle HorizontalAlign="Right" />
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <asp:UpdatePanel runat="server" ID="upHouseholdInfo" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-md-6 col-md-offset-3" style="min-height: 100vh; background: white;">
                    <div class="container-fluid">
                        <h2 runat="server" id="header">Household Members</h2>
                        <%--<asp:LinkButton runat="server" OnClientClick="openGeneric()" Text="Add Member" CausesValidation="false" />--%>
                        <a onclick="openGeneric()">Add Member</a>
                        <asp:GridView runat="server" ID="gvHouseholdMembers" AutoGenerateColumns="false"
                            CssClass="table table-default table-hover table-responsive table-dark table-striped" PageSize="20">
                            <Columns>
                                <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Fullname" DataField="fullname" />
                                <asp:TemplateField HeaderStyle-CssClass="thead-dark"  HeaderText="">
                                    <ItemTemplate>
                                        <asp:DropDownList runat="server" ID="ddHouseholdPos" CssClass="form-control">
                                            
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    </div>
                        
                    
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>

    <div id="dlgGeneric" title="Add Record" style="display:none;">
        <asp:UpdatePanel runat="server" ID="upNameSuggestion" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="container-fluid">
                    <div class="col-md-8">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtMemberSearch" />
                    </div>
                    <div class="col-md-4">
                        <asp:Button runat="server" CssClass="btn btn-warning" Text="search" ID="btnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false"/>
                    </div>
                </div>
                
                <asp:GridView ID="gvSearchMember" runat="server"
                    CssClass="table table-striped table-bordered table-hover"
                    AutoGenerateColumns="false" OnRowDataBound="gvSearchMember_RowDataBound"
                    AllowPaging="true" PageSize="10">
                    <Columns>
                        
                        <asp:TemplateField HeaderText="Fullname" >
                            <ItemTemplate>
                                <asp:CheckBox ID="chkResident" runat="server" Text='<%# Eval("Fullname") %>' ToolTip='<%# Eval("ID") %>' 
                                    OnCheckedChanged="lnkSelectResident_Click" CausesValidation="false" AutoPostBack="true" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                
                <hr />
                <asp:Button runat="server" ID="btnSaveMember" CssClass="btn btn-warning btn-sm" Text="Save changes" OnClick="btnSaveMember_Click"  />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="../../Scripts/custom/sidenav.js"></script>
    <script src="../../Scripts/custom/jquery-dialog.js"></script>
    <script>
        function FilterBox() {
            $(".filter").toggle(500, "linear");
        }
    </script>
</asp:Content>

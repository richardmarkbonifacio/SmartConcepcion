<%@ Page Title="Community" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Community.Default" %>
<asp:Content ID="content_report" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        .fa-check-circle-o{
            color:green;
        }
        .fa-times-circle{
            color:red;
        }
    </style>
    <div class="header-banner">COMMUNITY</div>
    <asp:UpdatePanel ID="upIncidentReport" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <asp:LinkButton runat="server" OnClientClick="openNav()" OnClick="lnkCreate_Click" Text="New User Profile" CausesValidation="false" />
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-9 col-xs-9">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" autocomplete="false"/>
                    </div>
                        <div class="col-md-3 col-xs-3">
                            <asp:Button runat="server" CssClass="btn btn-warning" Text="search" ID="btnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false" />
                        </div>
                    </div>
                </div>
                
                
                <hr />
                <%--<asp:LinkButton runat="server" Text="New Incident Report" ID="lnkCreate" OnClick="lnkCreate_Click"/>--%>
                <div style="overflow-x: scroll">
                    <asp:GridView runat="server" AutoGenerateColumns="false"
                        ID="gvUserProfiles" CssClass="table table-default table-hover table-responsive table-dark" PageSize="5"
                        AllowPaging="true" AllowCustomPaging="true" OnPageIndexChanging="gvUserProfiles_PageIndexChanging">

                        <Columns>
                            <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                            <asp:TemplateField HeaderStyle-CssClass="thead-dark" ItemStyle-CssClass="text-center" HeaderText="Verified">
                                <ItemTemplate>
                                    <i class='<%# ((bool)Eval("verified")) ? "fa fa-check-circle-o" : "fa fa-times-circle" %>'></i>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Email" DataField="email" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Fullname" DataField="fullname" />

                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Birthday" DataFormatString="{0:d}" DataField="birthday" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Contact No." DataField="contactno" />

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
                        <div class="container-fluid">
                            <h3><asp:Label runat="server" ID="lblAccountNo" /></h3>
                            <div class="form-group">
                                            <div class="col-md-4">
                                                <asp:TextBox runat="server" ID="txtFnam" placeholder="Firstname" CssClass="form-control sign-up-ctrl" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:TextBox runat="server" ID="txtMnam" placeholder="Middlename" CssClass="form-control sign-up-ctrl" />
                                            </div>
                                            <div class="col-md-3">
                                                <asp:TextBox runat="server" ID="txtLnam" placeholder="Lastname" CssClass="form-control sign-up-ctrl" />
                                            </div>
                                            <div class="col-md-2">
                                                <asp:TextBox runat="server" ID="txtSuffix" placeholder="Suffix" CssClass="form-control sign-up-ctrl" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-md-4">
                                                <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control sign-up-ctrl" TextMode="Email" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:TextBox runat="server" ID="txtContact" placeholder="Contact No." CssClass="form-control sign-up-ctrl" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:TextBox runat="server" ID="txtNationality" placeholder="Nationality" CssClass="form-control sign-up-ctrl" />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            
                                            <div class="col-md-4">
                                                <asp:DropDownList runat="server" ID="ddZone" placeholder="Barangay" CssClass="form-control sign-up-ctrl"
                                                    DataValueField="ID" DataTextField="Description" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:TextBox runat="server" ID="txtStbldgno" placeholder="St. Bldg No." CssClass="form-control sign-up-ctrl" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-4">
                                                <asp:TextBox runat="server" ID="txtBday" placeholder="Birthdate" autocomplete="off" CssClass="form-control sign-up-ctrl" TextMode="Date" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:DropDownList runat="server" ID="ddGender" placeholder="Gender" CssClass="form-control sign-up-ctrl">
                                                    <asp:ListItem Text="Male" />
                                                    <asp:ListItem Text="Female" />
                                                    <asp:ListItem Text="Alien" />
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:TextBox runat="server" ID="txtVotersID" placeholder="Voter's ID" autocomplete="off" CssClass="form-control sign-up-ctrl" />
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-4">
                                                <asp:DropDownList runat="server" ID="ddCivilStatus" CssClass="form-control sign-up-ctrl">
                                                    <asp:ListItem Text="Single" />
                                                    <asp:ListItem Text="Married" />
                                                    <asp:ListItem Text="Widowed" />
                                                    <asp:ListItem Text="Seperated" />
                                                    <asp:ListItem Text="Divorced" />
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:TextBox runat="server" ID="txtRUserpass" placeholder="Password" autocomplete="off" CssClass="form-control sign-up-ctrl" TextMode="Password" />
                                            </div>
                                        </div>
                            <div class="form-group">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" ID="chkIndigent" CssClass="form-check-input" Checked="true" />
                                    <label class="form-check-label" for="chkIndigent">Indigent</label>
                                </div>
                                <div class="col-md-3">
                                    
                                    <asp:CheckBox runat="server" ID="chkSenir" Checked="true" />
                                    <label class="form-check-label" for="chkSenir">Senior Citizen</label>
                                </div>
                                <div class="col-md-3">
                                    
                                        <asp:CheckBox runat="server" ID="chkPwd" Checked="true" />
                                        <label class="form-check-label" for="chkPwd">PWD</label>

                                </div>
                                <div class="col-md-3">
                                    
                                        <asp:CheckBox runat="server" ID="chk4ps" Checked="true" />
                                        <label class="form-check-label" for="chk4ps">4PS</label>
                                </div>
                            </div>
                        </div>
                        <div class="text-right container-fluid">
                            <asp:Button runat="server" CssClass="btn btn-warning" Text="VERIFY" ID="btnVerify" OnClick="btnVerify_Click" OnClientClick="closeNav()" />
                            <asp:Button runat="server" CssClass="btn btn-danger" Text="SAVE" ID="btnPostIR" OnClick="btnPostIR_Click" OnClientClick="closeNav()" />
                        </div>
                        
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>


    
    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="../../Scripts/custom/sidenav.js"></script>
    <script src="../../Scripts/custom/jquery-dialog.js"></script>
</asp:Content>

<%@ Page Title="Incident Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Community.Default" %>
<asp:Content ID="content_report" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        table{
            background:#fff;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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
            height:0px !important;
        }
        .labeltoggle{
            color:rgba(0, 0, 0, 0.19);
        }
        
    </style>
    
    <asp:UpdatePanel ID="upIncidentReport" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <asp:LinkButton runat="server" OnClientClick="openNav()" OnClick="lnkCreate_Click" Text="New User Profile" CausesValidation="false" />
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-9">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" />
                    </div>
                        <div class="col-md-3">
                            <asp:Button runat="server" CssClass="btn btn-warning" Text="search" ID="btnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false" />
                        </div>
                    </div>
                </div>
                
                
                <hr />
                <%--<asp:LinkButton runat="server" Text="New Incident Report" ID="lnkCreate" OnClick="lnkCreate_Click"/>--%>
                <asp:GridView runat="server" AutoGenerateColumns="false" 
                    ID="gvUserProfiles" CssClass="table table-hover table-responsive table-dark" PageSize="5" 
                    AllowPaging="true" AllowCustomPaging="true"  OnPageIndexChanging="gvUserProfiles_PageIndexChanging">
                    
                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Email" DataField="email" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Fullname" DataField="fullname" />
                        
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Birthday" dataformatstring="{0:d}" DataField="birthday" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Contact No." DataField="contactno" />
                        
                        <asp:TemplateField HeaderStyle-CssClass="thead-dark" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ToolTip='<%# Eval("ID") %>' CssClass="glyphicon glyphicon-edit" OnClick="Unnamed_Click" OnClientClick="openNav()" CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerTemplate>
                        
                        <ul class="pagination pagination-md">
                            <li class="page-item"><asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Prev" Text="Previous" CausesValidation="false" /></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Next" Text="Next" CausesValidation="false" /></li>
                        </ul>
                        
                    </PagerTemplate>
                    <PagerSettings mode="NextPrevious" Position="Bottom" PreviousPageText="Previous" NextPageText="Next" FirstPageText="First" LastPageText="Last"   />
                <PagerStyle HorizontalAlign="Right" />   
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
                        <h2 runat="server" id="header">Create Incident Report</h2>
                        <asp:HiddenField runat="server" ID="hfFrom" />
                        <div class="container-fluid">
                            <div class="form-group">
                                <div class="col-md-4 text-center">
                                    <asp:TextBox runat="server" ID="txtFnam" placeholder="Firstname" CssClass="form-control sign-up-ctrl" />
                                    <label>Firstname</label>
                                </div>
                                <div class="col-md-4 text-center">
                                    <asp:TextBox runat="server" ID="txtMnam" placeholder="Middlename" CssClass="form-control sign-up-ctrl" />
                                    <label>Middlename</label>
                                </div>
                                <div class="col-md-4 text-center">
                                    <asp:TextBox runat="server" ID="txtLnam" placeholder="Lastname" CssClass="form-control sign-up-ctrl" />
                                    <label>Lastname</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 text-center">
                                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control sign-up-ctrl" TextMode="Email" />
                                    <label>Email</label>
                                </div>
                                <div class="col-md-6 text-center">
                                    <asp:TextBox runat="server" ID="txtContact" placeholder="Contact No." CssClass="form-control sign-up-ctrl" />
                                    <label>Contact No.</label>
                                </div>
                                
                            </div>
                            <div class="form-group">
                                <div class="col-md-4 text-center">
                                    <asp:TextBox runat="server" ID="txtBday" placeholder="Birthdate" CssClass="form-control sign-up-ctrl" TextMode="Date" />
                                    <label>Birthday</label>
                                </div>
                                <div class="col-md-4 text-center">
                                    <asp:DropDownList runat="server" ID="ddGender" placeholder="Gender" CssClass="form-control sign-up-ctrl">
                                        <asp:ListItem Text="Male" />
                                        <asp:ListItem Text="Female" />
                                        <asp:ListItem Text="Alien" />
                                    </asp:DropDownList>
                                    <label>Gender</label>
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList runat="server" ID="ddBrgy" placeholder="Barangay" CssClass="form-control sign-up-ctrl" />
                                    <label>Barangay</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-3">
                                    <div class="labeltoggle">Indigent</div>
                                    <label class="switch">
                                        <asp:CheckBox runat="server" ID="chkIndigent" Checked="true" />
                                        <span class="slider round"></span>

                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <div class="labeltoggle">Senior Citizen</div>
                                    <label class="switch">
                                        <asp:CheckBox runat="server" ID="chkSenir" Checked="true" />
                                        <span class="slider round"></span>

                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <div class="labeltoggle">PWD</div>
                                    <label class="switch">
                                        <asp:CheckBox runat="server" ID="chkPwd" Checked="true" />
                                        <span class="slider round"></span>

                                    </label>
                                </div>
                                <div class="col-md-3">
                                    <div class="labeltoggle">4PS</div>
                                    <label class="switch">
                                        <asp:CheckBox runat="server" ID="chk4ps" Checked="true" />
                                        <span class="slider round"></span>

                                    </label>
                                </div>
                            </div>
                        </div>

                        <asp:Button runat="server" CssClass="btn btn-danger" Text="POST" ID="btnPostIR" OnClick="btnPostIR_Click" OnClientClick="closeNav()" />
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

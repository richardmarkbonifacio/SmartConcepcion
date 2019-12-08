<%@ Page Title="Business" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Business.Default" %>
<asp:Content ID="content_report" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <div class="header-banner">BUSINESS DIRECTORY</div>
    <asp:UpdatePanel ID="upBusiness" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <asp:LinkButton runat="server" OnClientClick="openNav()" OnClick="lnkCreate_Click" Text="New Business Profile" CausesValidation="false" />
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-9 col-xs-9">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" />
                    </div>
                        <div class="col-md-3 col-xs-3">
                            <asp:Button runat="server" CssClass="btn btn-send" Text="SEARCH" ID="btnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false" />
                        </div>
                    </div>
                </div>
                
                
                <hr />
                <%--<asp:LinkButton runat="server" Text="New Incident Report" ID="lnkCreate" OnClick="lnkCreate_Click"/>--%>
                <div style="overflow-x: scroll">
                    <asp:GridView runat="server" AutoGenerateColumns="false" 
                    ID="gvBusinessProfiles" CssClass="table table-default table-hover table-responsive table-dark table-striped" PageSize="5" 
                    AllowPaging="true" AllowCustomPaging="true"  OnPageIndexChanging="gvBusinessProfiles_PageIndexChanging">
                    
                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Email" DataField="email" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Business Name" DataField="businessname" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Type" DataField="businesstype" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Owner" DataField="owner" />
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
                                <div class="col-md-12 text-center">
                                    <asp:TextBox runat="server" ID="txtBusiness" placeholder="Business Name" CssClass="form-control sign-up-ctrl" />
                                </div>
                                
                            </div>
                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <asp:TextBox runat="server" ID="txtDescription" placeholder="Business Name" CssClass="form-control sign-up-ctrl" />
                                </div>
                                
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 text-center">
                                    <asp:TextBox runat="server" ID="txtOwner" placeholder="Owner" CssClass="form-control sign-up-ctrl" TextMode="Email" />
                                    <label>Owner</label>
                                </div>
                                <div class="col-md-6 text-center">
                                    <asp:TextBox runat="server" ID="txtPermit" placeholder="Permit no." CssClass="form-control sign-up-ctrl" />
                                    <label>Permit No.</label>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <asp:TextBox runat="server" ID="txtStbldgno" placeholder="St Bldg No" CssClass="form-control sign-up-ctrl" />
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

                        </div>
<%-- <asp:Button runat="server" CssClass="btn btn-send" Text="POST"  ID="btnPostIR" OnClick="btnPostIR_Click" OnClientClick="closeNav()" />--%>
                       <asp:LinkButton runat="server" CssClass="btn btn-send"  ID="btnPost" OnClick="btnPostIR_Click" OnClientClick="closeNav()" > UPDATE <i class="fa fa-check" ></i></asp:LinkButton>
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

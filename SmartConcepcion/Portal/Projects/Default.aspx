<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Projects.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .filter{
            display:none;
        }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <div class="header-banner">PROJECTS</div>
    <asp:UpdatePanel ID="upProject" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-6">
                    <i class="fa fa-sliders" aria-hidden="true" style="cursor: pointer" onclick="FilterBox()">Filter</i>
                </div>
                <div class="col-md-6 text-right">
                    <asp:LinkButton runat="server" OnClientClick="openNav()" OnClick="lnkCreate_Click" Text="New Project" CausesValidation="false" />
                </div>
            </div>

            <div class="container-fluid">
                <div class="row filter">
                    <div class="col-md-12">
                        
                        <div class="col-md-3 col-xs-3">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtdtFrom" TextMode="Date" />
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtdtTo" TextMode="Date" />

                        </div>
                        <div class="col-md- col-xs-3">
                            <asp:TextBox runat="server" CssClass="form-control" placeholder="search..." ID="txtProjectname" />
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <asp:Button runat="server" CssClass="btn btn-send" Text="SEARCH" ID="btnProject" OnClick="btnProject_Click" CausesValidation="false" />
                        </div>
                    </div>
                </div>

                <hr />
                
                <div style="overflow-x: scroll">
                    <asp:GridView runat="server" AutoGenerateColumns="false"
                        ID="gvProjects" CssClass="table table-default table-hover table-responsive table-dark  table-striped" PageSize="20"
                        AllowPaging="true" AllowCustomPaging="true" OnPageIndexChanging="gvProjects_PageIndexChanging">

                        <Columns>
                            <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                            
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Title" DataField="title" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Description" DataField="description" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Status" DataField="status" />

                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Start" DataFormatString="{0:MMMM dd yyyy}" DataField="startdate"  />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="End" DataFormatString="{0:MMMM dd yyyy}" DataField="enddate"  />

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
        <asp:UpdatePanel runat="server" ID="upProjectInfo" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-md-6 col-md-offset-3" style="min-height: 100vh; background: white;">
                    <div class="container-fluid">
                        <h2 runat="server" id="header">Create Incident Report</h2>
                        <asp:HiddenField runat="server" ID="hfFrom" />
                        <div class="container-fluid">
                            <div class="form-group">
                                <label class="col-md-4 text-right" for="txtTitle">Title</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtTitle" placeholder="Title" CssClass="form-control sign-up-ctrl" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 text-right">Description</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtDesc" placeholder="Description" CssClass="form-control sign-up-ctrl" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 text-right">Start</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtStart" TextMode="Date" CssClass="form-control sign-up-ctrl" />
                                </div>  
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 text-right">End</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtEnd" TextMode="Date" CssClass="form-control sign-up-ctrl" />
                                </div>  
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 text-right">Budget</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtBudget" TextMode="Number" CssClass="form-control sign-up-ctrl" />
                                </div>  
                            </div>
                        </div>
                        <div class="text-right container-fluid">
                            <asp:Button runat="server" CssClass="btn btn-send" Text="SAVE" ID="btnPostProject" OnClick="btnPostProject_Click" OnClientClick="closeNav()" />
                        </div>
                        
                        <hr />

                        <div class="container-fluid">
                            
                            <div style="overflow-x: scroll">
                                <asp:GridView runat="server" AutoGenerateColumns="false"
                                    ID="gvProjectLeader" CssClass="table table-default table-hover table-responsive table-dark" PageSize="5"
                                    AllowPaging="true" AllowCustomPaging="true" OnPageIndexChanging="gvProjectLeader_PageIndexChanging">

                                    <Columns>
                                        <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />

                                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Findings" DataField="Fullname" />
                                        
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
                        
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div id="dlgNameSuggestion" title="Select Project Leader" class="" style="display:none;">
        <asp:UpdatePanel runat="server" ID="upNameSuggestion" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="container-fluid">
                    <div class="col-md-8">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" />
                    </div>
                    <div class="col-md-4">
                        <asp:Button runat="server" CssClass="btn btn-send" Text="SEARCH" ID="btnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false"/>
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

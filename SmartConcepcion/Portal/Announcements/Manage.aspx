<%@ Page Title="Manage Announcement" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="SmartConcepcion.Portal.Announcements.Manage" %>
<asp:Content ID="ManageAnnouncement" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        .fa-check-circle-o{
            color:green;
        }
        .fa-times-circle{
            color:red;
        }
        .filter{
            display:none;
        }
    </style>
    <script>
        function FilterBox() {
            $(".filter").toggle(500, "linear");
        }
    </script>

    <div class="header-banner">MANAGE ANNOUNCEMENTS</div>
    <asp:UpdatePanel ID="upannouncement" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <asp:LinkButton runat="server" OnClientClick="openNav()" OnClick="lnkCreate_Click" Text="Create Announcement" CausesValidation="false" />
                    </div>
                    <div class="col-md-6 text-right">
                        <i class="fa fa-sliders" aria-hidden="true" style="cursor:pointer" onclick="FilterBox()" >Filter</i>
                    </div>
                </div>
                
                <div class="row filter">
                    <div class="col-md-3 col-xs-3 col-md-offset-3">
                        <asp:DropDownList runat="server" ID="ddFilterannouncementType" DataValueField="code" DataTextField="Description" CssClass="form-control" />
                    </div>
                    <div class="col-md-3 col-xs-3">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" />
                    </div>
                    <div class="col-md-3 col-xs-3">
                        <asp:Button runat="server" CssClass="btn btn-send" Text="SEARCH" ID="btnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false" />
                    </div>
                </div>
                
                <hr />
                <div style="overflow-x: scroll">
                    <asp:GridView runat="server" AutoGenerateColumns="false" 
                    ID="gvannouncementProfiles" CssClass="table table-default table-hover table-responsive table-dark table-striped" PageSize="5" 
                    AllowPaging="true" AllowCustomPaging="true"  OnPageIndexChanging="gvannouncementProfiles_PageIndexChanging">
                    
                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Title" DataField="title" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Subtitle" DataField="subtitle" />
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Published Date" DataField="publisheddate" />
                        
                        <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Content" DataField="preview" />
                        
                        <asp:TemplateField HeaderStyle-CssClass="thead-dark" ItemStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ToolTip='<%# Eval("ID") %>' CssClass="glyphicon glyphicon-edit" OnClick="Unnamed_Click" CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerTemplate>
                        
                        <ul class="pagination pagination-md">
                            <li class="page-item"><asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Prev" Text="Previous" CausesValidation="false" /></li>
                            <%--
                            
                            --%>
                            <li class="page-item"><asp:LinkButton runat="server" CssClass="page-item" CommandName="Page" CommandArgument="Next" Text="Next" CausesValidation="false" /></li>
                        </ul>
                        
                    </PagerTemplate>
                    <PagerSettings mode="NextPrevious" Position="Bottom" PreviousPageText="Previous" NextPageText="Next" FirstPageText="First" LastPageText="Last" />
                <PagerStyle HorizontalAlign="Right" />   
                </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="../../Scripts/custom/sidenav.js"></script>
    <script src="../../Scripts/custom/jquery-dialog.js"></script>
</asp:Content>

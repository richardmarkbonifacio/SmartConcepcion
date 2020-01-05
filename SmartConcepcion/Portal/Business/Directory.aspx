<%@ Page Title="Business Directory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Directory.aspx.cs" Inherits="SmartConcepcion.Portal.Business.Directory" %>
<asp:Content ID="content_report" ContentPlaceHolderID="MainContent" runat="server">
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

    <div class="header-banner">BUSINESS DIRECTORY</div>
    <asp:UpdatePanel ID="upBusiness" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <i class="fa fa-sliders" aria-hidden="true" style="cursor:pointer" onclick="FilterBox()" >Filter</i>
                    </div>
                </div>
                
                <div class="row filter">
                    <div class="col-md-3 col-xs-12 col-md-offset-3">
                        <asp:DropDownList runat="server" ID="ddFilterBusinessType" DataValueField="ID" DataTextField="Description" CssClass="form-control" />
                    </div>
                    <div class="col-md-3 col-xs-12">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUserSearch" placeholder="Businessname" />
                    </div>
                    <div class="col-md-3 col-xs-12">
                        <asp:Button runat="server" CssClass="btn btn-send" Text="SEARCH" ID="btnSearchUser" OnClick="btnSearchUser_Click" CausesValidation="false" />
                    </div>
                </div>
                
                <hr />
                <h3 runat="server" id="norecord">No Record Found</h3>
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

<%@ Page Title="Budget" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Budget.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        .fa-caret-up{
            color:green;
        }
        .fa-caret-down{
            color:red;
        }
        .filter{
            display:none;
        }
    </style>

    <div class="header-banner">BUDGET</div>
    <asp:UpdatePanel ID="upProject" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <asp:LinkButton runat="server" OnClientClick="openGeneric()" OnClick="lnkCreate_Click" Text="Add budget" CausesValidation="false" />
                    </div>
                    <div class="col-md-6 text-right">
                        <i class="fa fa-sliders" aria-hidden="true" style="cursor:pointer" onclick="FilterBox()" >Filter</i>
                    </div>
                </div>
                <div class="row filter">
                    <div class="col-md-12">
                        <div class="col-md-3 col-xs-3">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtProjectname" />
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtdtFrom" TextMode="Date" />
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtdtTo" TextMode="Date" />
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <asp:Button runat="server" CssClass="btn btn-warning" Text="search" ID="btnBudget" OnClick="btnBudget_Click" CausesValidation="false" />
                        </div>
                    </div>
                </div>

                <hr />
                
                <div style="overflow-x: scroll">
                    <asp:GridView runat="server" AutoGenerateColumns="false"
                        ID="gvBudget" CssClass="table table-default table-hover table-responsive table-dark" PageSize="20"
                        AllowPaging="true" AllowCustomPaging="true" OnPageIndexChanging="gvBudget_PageIndexChanging">

                        <Columns>
                            <asp:BoundField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" DataField="ID" />
                            <asp:TemplateField HeaderStyle-CssClass="thead-dark" ItemStyle-CssClass="text-center" HeaderText="Cash flow">
                                <ItemTemplate>
                                    <i class='<%# ((bool)Eval("cashflow")) ? "fa fa-caret-up" : "fa fa-caret-down" %>'></i>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Description" DataField="description" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Reference" DataField="referenceno" />
                            <asp:BoundField HeaderStyle-CssClass="thead-dark" HeaderText="Filed by" DataFormatString="{0:MMMM dd yyyy}" DataField="createdByName"  />
                            
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

    <div id="dlgGeneric" title="Budget Details" class="" style="display:none;">
        <asp:UpdatePanel runat="server" ID="upNameSuggestion" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="container-fluid">
                        
                        <asp:HiddenField runat="server" ID="hfFrom" />
                        <div class="container-fluid">
                            <div class="container-fluid">
                                <label class="col-md-4 text-right" for="txtTitle">Reference</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtRefNo" placeholder="Reference No." CssClass="form-control sign-up-ctrl" />
                                </div>
                            </div>
                            <div class="container-fluid">
                                <label class="col-md-4 text-right">Description</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtDesc" placeholder="Description" CssClass="form-control sign-up-ctrl" />
                                </div>
                            </div>
                            <div class="container-fluid">
                                <label class="col-md-4 text-right">Cashflow</label>
                                <div class="col-md-8 text-center">
                                    <asp:CheckBox runat="server" ID="chkFlow" />
                                </div>  
                            </div>
                            <div class="container-fluid">
                                <label class="col-md-4 text-right">Budget</label>
                                <div class="col-md-8 text-center">
                                    <asp:TextBox runat="server" ID="txtBudget" TextMode="Number" CssClass="form-control sign-up-ctrl" />
                                </div>  
                            </div>
                        </div>
                        <div class="text-right container-fluid">
                            <asp:Button runat="server" CssClass="btn btn-danger" Text="SAVE" ID="btnPostProject" OnClick="btnPostProject_Click" OnClientClick="closeNav()" />
                        </div>
                        
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>

    <script>
        function FilterBox() {
            $(".filter").toggle(500, "linear");
        }
    </script>

    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="../../Scripts/custom/sidenav.js"></script>
    <script src="../../Scripts/custom/jquery-dialog.js"></script>
</asp:Content>

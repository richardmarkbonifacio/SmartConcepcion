<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Board.aspx.cs" Inherits="SmartConcepcion.Portal.Officials.Board" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <asp:UpdatePanel runat="server" ID="upBoard" UpdateMode="Conditional">
        <ContentTemplate>
            <h2>BRGY CHAIRMAN</h2>
            <asp:HiddenField runat="server" ID="hfFrom" />
            <asp:HiddenField runat="server" ID="hfReplaceID" />
            <div class="row">
                <div class="col-md-12">
                    <asp:TextBox runat="server" placeholder="Chairman" CssClass="form-control" ID="txtChairman" onclick="openNameSuggestion('capt')" ReadOnly="true" />
                </div>
            </div>
            <h2>COUNCILOR</h2>
            <div class="row">
                <div class="col-md-12">
                    <asp:TextBox runat="server" placeholder="Councilor" CssClass="form-control" ReadOnly="true" onclick="openNameSuggestion('coun')" />
                </div>
            </div>
            <div class="container-fluid">
                <asp:ListView runat="server" ID="lvCouncilor">
                    <ItemTemplate>
                        <asp:TextBox runat="server" placeholder="Councilor" Text='<%# Eval("officialName") %>' CssClass="form-control" 
                            ReadOnly="true" onclick='<%# "setReplaceID(" + Eval("userID") + ");" %> '  />
                    </ItemTemplate>
                </asp:ListView>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    
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

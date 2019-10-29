<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Official.aspx.cs" Inherits="SmartConcepcion.Portal.Barangay.Official" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>BRGY CHAIRMAN</h2>
    <asp:HiddenField runat="server" ID="hfFrom" />
    <div class="row">
        <div class="col-md-12">
            <asp:TextBox runat="server" placeholder="Chairman" CssClass="form-control" ID="txtChairman" onclick="openNameSuggestion('chairman')"  ReadOnly="true" />
        </div>
    </div>
    <h2>COUNCILOR</h2>
    <div class="row">
        <div class="col-md-12">
            <asp:TextBox runat="server" placeholder="Councilor" CssClass="form-control" ReadOnly="true" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:TextBox runat="server" placeholder="Councilor" CssClass="form-control" ReadOnly="true" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:TextBox runat="server" placeholder="Councilor" CssClass="form-control" ReadOnly="true" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:TextBox runat="server" placeholder="Councilor" CssClass="form-control" ReadOnly="true" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:TextBox runat="server" placeholder="Councilor" CssClass="form-control" ReadOnly="true" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:TextBox runat="server" placeholder="Councilor" CssClass="form-control" ReadOnly="true" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:TextBox runat="server" placeholder="Councilor" CssClass="form-control" ReadOnly="true" />
        </div>
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

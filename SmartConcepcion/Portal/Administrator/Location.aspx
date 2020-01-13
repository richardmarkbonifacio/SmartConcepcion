<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Location.aspx.cs" Inherits="SmartConcepcion.Portal.Administrator.Location" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upLocation">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hfMode" />
            <div class="container-fluid">
                <label class="col-md-3">Province</label>
                <div class="col-md-8">
                    <asp:DropDownList runat="server" ID="ddProvince" DataTextField="Description" DataValueField="ID" CssClass="form-control" />
                </div>
                <i class="fa fa-plus-circle" aria-hidden="true"></i>
            </div>
            <div class="container-fluid">
                <label class="col-md-3">City</label>
                <div class="col-md-8">
                    <asp:DropDownList runat="server" ID="DropDownList1" DataTextField="Description" DataValueField="ID" CssClass="form-control" />
                </div>
                <i class="fa fa-plus-circle" aria-hidden="true"></i>
            </div>
            <div class="container-fluid">
                <label class="col-md-3">Brgy</label>
                <div class="col-md-8">
                    <asp:DropDownList runat="server" ID="ddBrgy" DataTextField="Description" DataValueField="ID" CssClass="form-control" OnSelectedIndexChanged="ddBrgy_SelectedIndexChanged" AutoPostBack="true"/>
                </div>
                <i class="fa fa-plus-circle" aria-hidden="true" style="cursor:pointer" onclick="setDataMode('brgy')"></i>
            </div>
            <div class="container-fluid">
                <label class="col-md-3">Zone</label>
                <div class="col-md-8">
                    <asp:DropDownList runat="server" ID="ddZone" DataTextField="Description" DataValueField="ID" CssClass="form-control" />
                </div>
                <i class="fa fa-plus-circle" aria-hidden="true" style="cursor:pointer" onclick="setDataMode('zone')"></i>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="dlgGeneric" title="Add Record" class="" style="display:none;">
        <asp:UpdatePanel runat="server" ID="upHealtRecord" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="container-fluid">
                    <label class="col-md-4 text-right">Description</label>
                    <div class="col-md-8 text-center">
                        <asp:TextBox runat="server" ID="txtDescrition" placeholder="Description" CssClass="form-control sign-up-ctrl" />
                    </div>
                </div>
                

                <div class="container-fluid text-right">
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="S A V E" ID="btnSave" OnClick="btnSave_Click" />
                </div>
               
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="../../Scripts/custom/sidenav.js"></script>
    <script src="../../Scripts/custom/jquery-dialog.js"></script>
</asp:Content>

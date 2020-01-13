<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Barangay.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="header-banner">BARANGAY INFORMATION</div>
    <div class="container-fluid">
        <label class="col-md-3">MISSION</label>
        <div class="col-md-9">
            <asp:TextBox runat="server" ID="txtMission" TextMode="MultiLine" Columns="10" CssClass="form-control" />
        </div>
    </div>
    <div class="container-fluid">
        <label class="col-md-3">VISION</label>
        <div class="col-md-9">
            <asp:TextBox runat="server" ID="txtVision" TextMode="MultiLine" Columns="10" CssClass="form-control" />
        </div>
    </div>
    <div class="container-fluid">
        <asp:LinkButton runat="server" ID="btnsave" OnClick="btnsave_Click" CssClass="btn btnload pull-right" >P O S T <i class="fa fa-check" aria-hidden="true"></i> </asp:LinkButton>
    </div>
</asp:Content>

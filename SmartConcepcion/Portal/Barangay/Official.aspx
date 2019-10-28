<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Official.aspx.cs" Inherits="SmartConcepcion.Portal.Barangay.Official" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-group">
        <label class="col-md-3 text-right" for="txtChairman">BRGY CHAIRMAN :</label>
        <div class="col-md-9">
            <asp:TextBox runat="server" placeholder="Chairman" CssClass="form-control" ID="txtChairman" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 text-right">Counselor :</label>
        <div class="col-md-9">
            <asp:TextBox runat="server" placeholder="Chairman" CssClass="form-control" />
        </div>
    </div>

</asp:Content>

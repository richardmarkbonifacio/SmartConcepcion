<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="SmartConcepcion.Portal.Profile" %>
<asp:Content ID="Profile" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="col-md-4">

        </div>
        <div class="col-md-8">
            <div class="container-fluid">
                <label class="col-md-3">Email</label>
                <div class="col-md-9">
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control" autocomplete="off" />
                </div>
            </div>
            <div class="container-fluid">
                <label class="col-md-3">Current Password</label>
                <div class="col-md-9">
                    <asp:TextBox runat="server" ID="txtCurrPassword" placeholder="Current Password" CssClass="form-control" TextMode="Password" autocomplete="off" />
                </div>
            </div>
            <div class="container-fluid">
                <label class="col-md-3">Password</label>
                <div class="col-md-9">
                    <asp:TextBox runat="server" ID="txtNewPassword" placeholder="Password" CssClass="form-control" TextMode="Password" autocomplete="off" />
                </div>
            </div>
            <div class="container-fluid">
                <label class="col-md-3">Confirm Password</label>
                <div class="col-md-9">
                    <asp:TextBox runat="server" ID="txtConfirm" placeholder="Confirm Password" CssClass="form-control" TextMode="Password" autocomplete="off"/>
                </div>
            </div>
            <div class="container-fluid">
                <div class="col-md-12">
                    <asp:Button runat="server" Text="Update" CssClass="btn btn-warning pull-right" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SmartConcepcion.Portal.Barangay.Dashboard" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/custom/sidenav.js"></script>
    <style>
        .sidenav {
            background: #f0f0f0;
            color: white;
        }
    </style>
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="~/Portal/Announcements/News" runat="server">NEWS & ANNOUNCEMENTS</a>
        <a href="~/Portal/Business/" runat="server">BUSINESS</a>
        <a href="~/Portal/Healthcare/" runat="server">HEALTHCARE</a>
        <a href="~/Portal/Incidents/" runat="server">INCIDENT REPORT</a>
        <a href="~/Portal/Community/" runat="server">COMMUNITY</a>
        <a href="~/Portal/Community/" runat="server">BUDGET</a>
        <a href="~/Portal/Community/" runat="server">OFFICIALS</a>
    </div>
    <h2>Animated Sidenav Example</h2>
    <p>Click on the element below to open the side navigation menu.</p>
    <span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; open</span>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Healthcare.Default" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .table-sched{
            width:100%
        }
    </style>
    <asp:Calendar runat="server" ID="calSchedule" CssClass="table-sched" />
</asp:Content>

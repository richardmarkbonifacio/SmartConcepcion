<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Media.aspx.cs" Inherits="SmartConcepcion.Portal.Reports.Media" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel-group col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">Panel with panel-default class</div>
            <div class="panel-body">
                Panel Content
                <a runat="server" href="~/Portal/Media/17-0001.pdf" target="_blank" >Get PDF</a>
            </div>
        </div>
    </div>
</asp:Content>

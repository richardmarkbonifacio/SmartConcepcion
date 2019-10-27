<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SmartConcepcion.Portal.Barangay.Dashboard" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/custom/sidenav.js"></script>
    <style>
        .sidenav {
            background: #f0f0f0;
            color: white;
        }
        .menudash{
            font-size: 15px; 
            cursor: pointer;
            background:#f99827;
            padding:15px;
            width:25vh;
            border-radius:2px;
            font-weight:600;
            color:#fff;
            text-align:center;
           box-shadow: 0 1px 4px rgba(0, 0, 0, .6);
           border-width: 0;
        }
        .panel{
            text-decoration:none;
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
    
    <div class="col-md-3">
        
        
            <div class="panel panel-primary">
                <div class="panel-heading"><i class="fa fa-newspaper-o" aria-hidden="true"></i> News & Announcements</div>
                <a href="~/Portal/Announcements/News" runat="server">
                <div class="panel-body">Add, Update, Delete</div> </a>
            </div>
        
           
    </div>

    <div class="col-md-3">
    <div class="panel panel-success">
      <div class="panel-heading"><i class="fa fa-briefcase" aria-hidden="true"></i> Business</div>
               <a href="~/Portal/Business/" runat="server">
      <div class="panel-body">Add, Update, Delete</div></a>
    </div>
        </div>
    <div class="col-md-3">
    <div class="panel panel-info">
      <div class="panel-heading"><i class="fa fa-medkit" aria-hidden="true"></i> Healthcare</div>
           <a href="~/Portal/Healthcare/" runat="server">
      <div class="panel-body">Add, Update, Delete</div></a>
    </div>
        </div>
    <div class="col-md-3">
    <div class="panel panel-danger">
      <div class="panel-heading"><i class="fa fa-flag" aria-hidden="true"></i> Incident Report</div>
          <a href="~/Portal/Incidents/" runat="server">
      <div class="panel-body">Add, Update, Delete</div></a>
    </div>
        </div>

      <div class="col-md-3">
    <div class="panel panel-danger">
      <div class="panel-heading"><i class="fa fa-users" aria-hidden="true"></i> Community</div>
               <a href="~/Portal/Community/" runat="server">
      <div class="panel-body">Add, Update, Delete</div></a>
    </div>
        </div>

     <div class="col-md-3">
    <div class="panel panel-info">
      <div class="panel-heading"><i class="fa fa-money" aria-hidden="true"></i> Budget</div>
          <a href="~/Portal/Community/" runat="server">
      <div class="panel-body">Add, Update, Delete</div></a>
    </div>
        </div>

    <div class="col-md-3">
    <div class="panel panel-info">
      <div class="panel-heading"><i class="fa fa-gavel" aria-hidden="true"></i> Officials</div>
          <a href="~/Portal/Community/" runat="server">
      <div class="panel-body">Add, Update, Delete</div></a>
    </div>
        </div>

        <div class="col-md-3">
    <div class="panel panel-info">
      <div class="panel-heading"><i class="fa fa-sitemap" aria-hidden="true"></i> Projects</div>
          <a href="~/Portal/Community/" runat="server">
      <div class="panel-body">Add, Update, Delete</div></a>
    </div>
        </div>
</asp:Content>

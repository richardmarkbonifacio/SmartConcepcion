<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RptViewer.aspx.cs" 
    Inherits="SmartConcepcion.Portal.Report.RptViewer" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" 
    namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Voucher</title>    

    <script src="../../../Scripts/jquery-3.1.0.min.js"></script>

        <style type="text/css">
         
        </style> 
</head>

<body>
    <form id="form1" runat="server">
    <CR:CrystalReportViewer ID="crViewer" runat="server" AutoDataBind="true" CssClass="main-rpt" />
    </form>
</body>
</html>

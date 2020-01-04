<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SmartConcepcion.Portal.Barangay.Dashboard" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/custom/sidenav.js"></script>
    <style>
        .chart-emp {
        }

        .sidenav {
            background: #f0f0f0;
            color: white;
        }

        .menudash {
            font-size: 15px;
            cursor: pointer;
            background: #f99827;
            padding: 15px;
            width: 25vh;
            border-radius: 2px;
            font-weight: 600;
            color: #fff;
            text-align: center;
            box-shadow: 0 1px 4px rgba(0, 0, 0, .6);
            border-width: 0;
        }

        .panel {
            text-decoration: none;
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
            <div class="panel-heading"><i class="fa fa-newspaper-o" aria-hidden="true"></i>News & Announcements</div>
            <a href="~/Portal/Announcements/News" runat="server">
                <div class="panel-body">Add, Update, Delete</div>
            </a>

        </div>
    </div>

    <div class="col-md-3">
        <div class="panel panel-success">
            <div class="panel-heading"><i class="fa fa-briefcase" aria-hidden="true"></i>Business</div>
            <a href="~/Portal/Business/" runat="server">
                <div class="panel-body">Add, Update, Delete</div>
            </a>
        </div>
    </div>

    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="panel-heading"><i class="fa fa-medkit" aria-hidden="true"></i>Healthcare</div>
            <a href="~/Portal/Healthcare/" runat="server">
                <div class="panel-body">Add, Update, Delete</div>
            </a>
        </div>
    </div>

    <div class="col-md-3">
        <div class="panel panel-danger">
            <div class="panel-heading"><i class="fa fa-flag" aria-hidden="true"></i>Incident Report</div>
            <a href="~/Portal/Incidents/" runat="server">
                <div class="panel-body">Add, Update, Delete</div>
            </a>
        </div>
    </div>

    <div class="col-md-3">
        <div class="panel panel-danger">
            <div class="panel-heading"><i class="fa fa-users" aria-hidden="true"></i>Community</div>
            <a href="~/Portal/Community/" runat="server">
                <div class="panel-body">Add, Update, Delete</div>
            </a>
        </div>
    </div>

    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="panel-heading"><i class="fa fa-money" aria-hidden="true"></i>Budget</div>
            <a href="~/Portal/Community/" runat="server">
                <div class="panel-body">Add, Update, Delete</div>
            </a>
        </div>
    </div>

    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="panel-heading"><i class="fa fa-gavel" aria-hidden="true"></i>Officials</div>
            <a href="~/Portal/Community/" runat="server">
                <div class="panel-body">Add, Update, Delete</div>
            </a>
        </div>
    </div>

    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="panel-heading"><i class="fa fa-sitemap" aria-hidden="true"></i>Projects</div>
            <a href="~/Portal/Community/" runat="server">
                <div class="panel-body">Add, Update, Delete</div>
            </a>
        </div>
    </div>

    <%--    CHARRRRRRRRRT AND GRAPHSSS--%>
    <div class="container">
        <h3 class="chart-emp">TOTAL NUMBER OF REGISTERED BUSINESSES IN BALIWAG ACCORDING TO NATURE OF OPERATION</h3>
        <div class="col-md-4">

            <div id="piechart"></div>

            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

            <script type="text/javascript">
                // Load google charts
                google.charts.load('current', { 'packages': ['corechart'] });
                google.charts.setOnLoadCallback(drawChart);

                // Draw the chart and set the chart values
                function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                        ['Task', 'Hours per Day'],
                        ['Employed', 8],
                        ['Unemployed', 2],
                        ['Self-Enployed', 4],

                    ]);

                    // Optional; add a title and set the width and height of the chart
                    var options = { 'title': '', 'width': 900, 'height': 500 };

                    // Display the chart inside the <div> element with id="piechart"
                    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                    chart.draw(data, options);
                }
            </script>
        </div>
    </div>
    <%-- line grapgh--%>
    <div class="container">
        <h3 class="chart-emp">TOTAL NUMBER OF REGISTERED VOTERS</h3>
        <div id="curve_chart" style="width: 900px; height: 500px"></div>
        <div class="col-md-4 col-md-offset-4">

            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">
                google.charts.load('current', { 'packages': ['corechart'] });
                google.charts.setOnLoadCallback(drawChart);

                function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                        ['Year', 'Sales', 'Expenses'],
                        ['2004', 1000, 400],
                        ['2005', 1170, 460],
                        ['2006', 660, 1120],
                        ['2007', 1030, 540]
                    ]);

                    var options = {
                        title: 'Company Performance',
                        curveType: 'function',
                        legend: { position: 'bottom' }
                    };

                    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

                    chart.draw(data, options);
                }
            </script>
        </div>
    </div>



    <%--    -------------%>
    <div class="container">
        <h3 class="chart-emp">AGE GENDER DISTRIBUTION</h3>
        <div id="barchart_material" style="width: 900px; height: 500px;"></div>
        <div class="col-md-4 col-md-offset-4">
            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">
                google.charts.load('current', { 'packages': ['bar'] });
                google.charts.setOnLoadCallback(drawChart);

                function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                        ['Year', 'Total', 'Female', 'Male'],
                        ['Total No. of Population', 1000, 400, 200],
                        ['Seniors (Ages 50 and up', 1170, 460, 250],
                        ['Adults (Ages 25-49)', 660, 1120, 300],
                        ['Youth Ages(0-24)', 1030, 540, 350]
                    ]);

                    var options = {
                        chart: {

                        },
                        bars: 'horizontal' // Required for Material Bar Charts.
                    };

                    var chart = new google.charts.Bar(document.getElementById('barchart_material'));

                    chart.draw(data, google.charts.Bar.convertOptions(options));
                }
            </script>
        </div>
    </div>
</asp:Content>

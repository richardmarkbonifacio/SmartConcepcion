    <%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SmartConcepcion.Portal.Administrator.Dashboard" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:UpdatePanel runat="server" ID="hfContainer" UpdateMode="Conditional" >
            <ContentTemplate>
                <asp:HiddenField runat="server" ID="hfTotalPop" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="jumbotron">
          <h1 runat="server" id="brgyname">Bootstrap Tutorial</h1>
        </div>
        
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-danger">
                    <div class="panel-heading"><i class="fa fa-users" aria-hidden="true"></i> Total Number of Registered User</div>
                    <div class="panel-body text-center">
                        <asp:Label runat="server" Text="0" Font-Bold="true" ID="lblTotalUsers"/>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="panel panel-success">
                    <div class="panel-heading"><i class="fa fa-briefcase" aria-hidden="true"></i> Total Number of Registered Business</div>
                    <div class="panel-body text-center">
                        <asp:Label runat="server" Text="0" Font-Bold="true" ID="lblTotalBusiness" />
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="panel panel-danger">
                    <div class="panel-heading"><i class="fa fa-flag" aria-hidden="true"></i> Total number of incidents</div>
                    <div class="panel-body text-center">
                        <asp:Label runat="server" Text="0" Font-Bold="true" ID="lblTotalIncident" />
                    </div>
                </div>
            </div>

        </div>

        <div class="row hidden">
            <div id="employment_chart" class="chart"></div>
        </div>
        <div class="row hidden">
            <div id="voter_chart" class="chart"></div>
        </div>
        <div class="row hidden">
            <div id="age_chart" class="chart"></div>
        </div>

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            // Load google charts
            google.charts.load('current', { 'packages': ['corechart'] });
            google.charts.setOnLoadCallback(draw_employment_chart);

            // Draw the chart and set the chart values
            function draw_employment_chart() {
                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['Employed', 8],
                    ['Unemployed', 2],
                    ['Self-Enployed', 4],

                ]);

                // Optional; add a title and set the width and height of the chart
                var options = { 'title': 'TOTAL NUMBER OF REGISTERED BUSINESSES IN BALIWAG ACCORDING TO NATURE OF OPERATION' };

                // Display the chart inside the <div> element with id="piechart"
                var chart = new google.visualization.PieChart(document.getElementById('employment_chart'));
                chart.draw(data, options);
            }

            google.charts.load('current', { 'packages': ['corechart'] });
            google.charts.setOnLoadCallback(draw_voter_chart);

            function draw_voter_chart() {
                var data = google.visualization.arrayToDataTable([
                    ['Year', 'Sales', 'Expenses'],
                    ['2004', 1000, 400],
                    ['2005', 1170, 460],
                    ['2006', 660, 1120],
                    ['2007', 1030, 540]
                ]);

                var options = {
                    title: 'NUMBER OF REGISTERED VOTERS',
                    curveType: 'function',
                    legend: { position: 'bottom' }
                };

                var chart = new google.visualization.LineChart(document.getElementById('voter_chart'));

                chart.draw(data, options);
            }

            google.charts.load('current', { 'packages': ['bar'] });
            google.charts.setOnLoadCallback(draw_age_chart);
            var total_population = $("#MainContent_hfTotalPop").val();
            function draw_age_chart() {
                var data = google.visualization.arrayToDataTable([
                    ['Year', 'Total', 'Female', 'Male'],
                    ['Total No. of Population', total_population, 5, 5],
                    
                ]);

                var options = {title: 'Residents',
                    chart: {

                    },
                    bars: 'horizontal' // Required for Material Bar Charts.
                };

                var chart = new google.charts.Bar(document.getElementById('age_chart'));

                chart.draw(data, google.charts.Bar.convertOptions(options));
            }


            $(window).resize(function () {
                draw_employment_chart();
                draw_voter_chart();
                draw_age_chart();
            });
        </script>
        <script>const body = document.body;
const toggleMobileMenu = document.querySelector(".toggle-mob-menu");
 
toggleMobileMenu.addEventListener("click", function() {
  this.getAttribute("aria-expanded") == "true"
    ? this.setAttribute("aria-expanded", "false")
    : this.setAttribute("aria-expanded", "true");
  this.getAttribute("aria-label") == "open menu"
    ? this.setAttribute("aria-label", "close menu")
    : this.setAttribute("aria-label", "open menu");
  body.classList.toggle("mob-menu-opened");
});</script>
            <style>
                .page-header .toggle-mob-menu svg {
  transition: transform 0.2s;
}
 
.page-header .admin-menu {
  transition: all 0.2s;
}
 
.mob-menu-opened .toggle-mob-menu svg {
  transform: rotate(180deg);
}
 
.mob-menu-opened .page-header .admin-menu {
  transform: scale(1);
  visibility: visible;
  opacity: 1;
}
                .chart {
                    width: 100%; 
                    min-height: 300px;
                }
            </style>
    </asp:Content>

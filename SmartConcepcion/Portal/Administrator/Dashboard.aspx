    <%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SmartConcepcion.Portal.Administrator.Dashboard" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:UpdatePanel runat="server" ID="hfContainer" UpdateMode="Conditional" >
            <ContentTemplate>
                <asp:HiddenField runat="server" ID="hfTotalPop" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <section class="grid">
            <article>
                <h2>Welcome to Baranggay <span runat="server" id="brgyname"></span></h2>
            </article>
            <article>
                <div id="employment_chart" class="chart"></div>
            </article>
            <article>
                <div id="voter_chart" class="chart"></div>
            </article>
            <article>
                <div id="age_chart" class="chart"></div>
            </article>
            <article></article>
            <article></article>
            <article></article>
            <article></article>

        
        </section>
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
        
            <style>
                .chart {
                    width: 100%; 
                    min-height: 300px;
                }
            </style>
    </asp:Content>

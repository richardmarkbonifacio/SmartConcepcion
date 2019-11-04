<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Healthcare.Default" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .table-sched {
            width: 100%;
            margin-bottom: 25px;
            height: 80vh;
            background: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .day-td {
            padding: 30px;
        }

        .header-cal {
            height: 50px;
            text-align: center;
        }

        .cal-title {
            height: 50px;
            background: #228B22;
            color: white;
            font-weight: 600;
        }

        .other-month {
            background: #8FBC8F;
            height: 100px;
        }

        .day-info {
            background: white;
            height: 80vh;
        }

        .arrow-cal {
            background: #808000;
        }

            .arrow-cal > a {
                color: white !important;
                padding: 50px;
                font-size: 20px;
                text-decoration: none;
            }

        .cal-today {
            background: #32CD32;
        }

        .day-act {
            background: #006400 !important;
        }
    </style>
    
    <div class="header-banner">HEALTHCARE</div>
    
    <asp:UpdatePanel runat="server" ID="upCalendar" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="col-md-8">
                <asp:Calendar runat="server" ID="calSchedule" CssClass="table-sched" DayStyle-CssClass="day-td"
                    DayHeaderStyle-CssClass="header-cal" TitleStyle-CssClass="cal-title" OtherMonthDayStyle-CssClass="other-month"
                    NextPrevStyle-CssClass="arrow-cal" TodayDayStyle-CssClass="cal-today" SelectedDayStyle-CssClass="day-act" OnDayRender="CalendarDRender" />
            </div>

            <div class="col-md-4 day-info">
                <h5>Schedule</h5>
                <asp:GridView runat="server" ID="gvHealthSched" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <label>Patient</label>
                                <i>date time</i>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <asp:UpdatePanel runat="server" ID="upIncidentInfo" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-md-6 col-md-offset-3" style="min-height: 100vh; background: white;">
                    <div class="container-fluid">
                        <h2 runat="server" id="header">Create Incident Report</h2>
                        <asp:HiddenField runat="server" ID="hfFrom" />
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label>Incident</label>
                                <asp:TextBox ID="txtTitle" runat="server" placeholder="Incident Title" CssClass="form-control" autocomplete="off" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTitle" SetFocusOnError="true" ErrorMessage="Title must not be blank" ForeColor="Red" />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Accused</label>
                                <asp:TextBox runat="server" ID="txtAccused" CssClass="form-control" onclick="openNameSuggestion('accsd')" ReadOnly="true"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Complainant</label>
                                <asp:TextBox runat="server" ID="txtComplainant" CssClass="form-control" onclick="openNameSuggestion('cmplnnt')" ReadOnly="true"/>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label>Incident Location</label>
                                <asp:TextBox ID="txtLocation" runat="server" placeholder="Incident Location" CssClass="form-control" autocomplete="off" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLocation" SetFocusOnError="true" ErrorMessage="Location must not be blank" ForeColor="Red" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Incident Date</label>
                            <asp:TextBox ID="txtIncidentDate" runat="server" TextMode="DateTimeLocal" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtIncidentDate" SetFocusOnError="true" ErrorMessage="Incident date must not be blank" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Details</label>
                            <asp:TextBox ID="txtDetails" runat="server" TextMode="MultiLine" Rows="10" placeholder="Write the details of the incident" CssClass="form-control" autocomplete="off" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDetails" SetFocusOnError="true" ErrorMessage="Details must not be blank" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Confrontation Date</label>
                            <asp:TextBox ID="txtConfrontation" runat="server" TextMode="DateTimeLocal" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfrontation" SetFocusOnError="true" ErrorMessage="Confrontation must not be blank" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Remarks</label>
                            <asp:TextBox ID="txtRemarks" runat="server" placeholder="Remarks" CssClass="form-control" />
                        </div>
                        <div class="row text-right">
                            <asp:Button runat="server" CssClass="btn btn-warning" Text="CASE CLOSED" ID="btnCaseClose" OnClick="btnCaseClose_Click" OnClientClick="closeNav()" />
                            <asp:Button runat="server" CssClass="btn btn-danger" Text="SAVE" ID="btnPostIR" OnClick="btnPostIR_Click" OnClientClick="closeNav()"/>
                        </div>
                        
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    
</asp:Content>

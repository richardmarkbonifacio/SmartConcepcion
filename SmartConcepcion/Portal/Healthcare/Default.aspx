<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Healthcare.Default" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .table-sched{
            width:100%;
            margin-bottom: 25px;
            height:80vh;
            
    background: white;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .day-td{
            padding:30px;
        }
        .header-cal{
            height:50px;
           text-align:center;
        }
        .cal-title{
             height:50px;
            background:		#228B22;
            color:white;
            font-weight:600;
        }
        .other-month{
                  background:#8FBC8F;
                  height:100px;
        }
        .day-info{
            background:white;
                height:80vh;
            
         
        }
       .arrow-cal{
   
           background:#808000;
       }
        .arrow-cal>a {
           color:white!important;
           padding: 50px;
    font-size: 20px;
    text-decoration:none;
       }
        .cal-today{
               background:#32CD32;
        }
        .day-act{
background:#006400!important;
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
    
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartConcepcion.Portal.Healthcare.Default" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .table-sched{
            width:100%
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
        }
        .day-info{
            background:white;
            
            height:520px;
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
        .table-sched{
    width: 100%;

    background: white;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
    </style>
      <div class="header-banner">HEALTHCARE</div>
    <div class="col-md-8">
    <asp:Calendar runat="server" ID="calSchedule" CssClass="table-sched" DayStyle-CssClass="day-td" 
     DayHeaderStyle-CssClass="header-cal" TitleStyle-CssClass="cal-title" OtherMonthDayStyle-CssClass="other-month" 
        NextPrevStyle-CssClass="arrow-cal" TodayDayStyle-CssClass="cal-today" SelectedDayStyle-CssClass="day-act" OnDayRender="CalendarDRender"/>
     </div>
        <div class="col-md-4 day-info">
            <h5>hello</h5>
            </div>
</asp:Content>

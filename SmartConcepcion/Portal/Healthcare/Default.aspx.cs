using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartConcepcion.Portal.Healthcare
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CalendarDRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
             
                e.Cell.Text ="";
            }

        }
         
        protected void calSchedule_DayRender(object sender, DayRenderEventArgs e)
        {

        }
    }
}

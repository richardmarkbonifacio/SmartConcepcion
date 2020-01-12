using SmartConcepcion.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartConcepcion.Portal.Community
{
    public partial class Notifications : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack && p_UserID != null)
            {
                loadGridView( gvNotifDates, csql.getNotifSummary("SmartConcepcion", p_UserID));
            }
        }

        protected void gvNotifDates_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType & DataControlRowType.DataRow) != 0)
            {
                GridView _gv = (GridView)e.Row.FindControl("gvNotifDetails");
                LinkButton _lnk = (LinkButton)e.Row.FindControl("txtDate");

                loadGridView(_gv, csql.getNotifList("SmartConcepcion", p_UserID.Value, convert_date(_lnk.Text).Value));
            }
        }
    }
}
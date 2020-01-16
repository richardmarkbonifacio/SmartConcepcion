using SmartConcepcion.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartConcepcion.Portal.Administrator
{
    public partial class Dashboard : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected override void OnPreLoad(EventArgs e)
        {
            base.OnPreLoad(e);
            if (!(isAdmin() || isBlotterOfficer() || isHealthOfficer() || isTreasurer() || isLLN()))
                Response.Redirect("~/403");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable _dt = csql.getDashboardInfo("SmartConcepcion", p_BrgyID);
            hfTotalPop.Value = _dt.Rows[0]["total_population"].ToString();

            brgyname.InnerText = _dt.Rows[0]["brgy_name"].ToString();
            lblTotalUsers.Text = _dt.Rows[0]["total_population"].ToString();
            lblTotalBusiness.Text = _dt.Rows[0]["total_business"].ToString();
            lblTotalIncident.Text = _dt.Rows[0]["total_blotter"].ToString();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Incidents
{
    public partial class Default : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                loadIncidentReport();
        }
        void loadIncidentReport()
        {
            loadGridView(gvIncidentReport, csql.getIncidentReport("SmartConcepcion", gvIncidentReport.PageSize, 0));
        }

        protected void gvIncidentReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void lnkCreate_Click(object sender, EventArgs e)
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
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

        protected void btnPostIR_Click(object sender, EventArgs e)
        {
            csql.setIncidentReport("SmartConcepcion", null, txtTitle.Text, txtDetails.Text, "", null, null,
                Convert.ToDateTime(txtIncidentDate.Text), Convert.ToDateTime(txtConfrontation.Text),txtRemarks.Text,"ptd",p_UserID);
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            DataTable _dttemp = csql.getIncidentReport_Details("SmartConcepcion", Convert.ToInt64(_lnk.ToolTip));
            txtTitle.Text = _dttemp.Rows[0]["title"].ToString();
            txtIncidentDate.Text = Convert.ToDateTime(_dttemp.Rows[0]["incidentdate"].ToString()).ToLocalTime().ToString("yyyy-MM-ddTHH:mm:ss"); 

            upIncidentInfo.Update();
        }
    }
}
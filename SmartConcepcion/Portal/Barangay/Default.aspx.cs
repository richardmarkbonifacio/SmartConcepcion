using SmartConcepcion.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartConcepcion.Portal.Barangay
{
    public partial class Default : clsInherited
    {
        clsQuery csql = new clsQuery();
        protected override void OnPreLoad(EventArgs e)
        {
            base.OnPreLoad(e);
            if (!isAdmin())
                Response.Redirect("~/403");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable _dt = csql.getBrgyInformation("SmartConcepcion", p_BrgyID);
                txtMission.Text = _dt.Rows[0]["mission"].ToString();
                txtVision.Text = _dt.Rows[0]["vision"].ToString();
            }
            
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            csql.setBrgyInformation("SmartConcepcion", p_BrgyID, txtMission.Text, txtVision.Text);
        }
    }
}
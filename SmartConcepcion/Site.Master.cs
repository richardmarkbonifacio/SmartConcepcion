using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion
{
    public partial class SiteMaster : MasterPage
    {
        clsInherited inh = new clsInherited();
        clsQuery csql = new clsQuery();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblFullname.Text = inh.p_fullname;
            if (!IsPostBack && inh.p_UserID != null)
            {
                DataTable _dt = csql.getEmergencyDetails("SmartConcepcion", inh.p_UserID.Value);
                if (_dt.Rows.Count > 0)
                {
                    pnlEmergency.Visible = true;
                    lnk.CommandName = _dt.Rows[0]["ID"].ToString();
                    lnk.ToolTip = _dt.Rows[0]["referenceID"].ToString();
                }
                else
                {
                    pnlEmergency.Visible = false;
                }
            }
            if (inh.isAdmin())
                lnkDashboard.Visible = true;
            else
                lnkDashboard.Visible = false;
        }

        protected void btnSignOut(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();

        }

        protected void lnk_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            csql.setNotifSeen("SmartConcepcion", Convert.ToInt64(_lnk.CommandName));
            Response.Redirect("~/Portal/Announcements/View?ID=" + _lnk.ToolTip);
        }

        protected void notif_seen(object sender, EventArgs e)
        {
            
        }
    }
}
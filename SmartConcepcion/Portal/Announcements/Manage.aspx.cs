using SmartConcepcion.Class;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartConcepcion.Portal.Announcements
{
    public partial class Manage : clsInherited
    {
        clsQuery csql = new clsQuery();
        DataTable dttemp;
        #region Properties
        public long? p_UserProfileID
        {
            get
            {
                if (ViewState["UserProfileID"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["UserProfileID"].ToString());
                }
            }
            set
            {
                ViewState["UserProfileID"] = value;
            }
        }

        public long? p_ComplainantID
        {
            get
            {
                if (ViewState["ComplainantID"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["ComplainantID"].ToString());
                }
            }
            set
            {
                ViewState["ComplainantID"] = value;
            }
        }
        public long? p_AccusedID
        {
            get
            {
                if (ViewState["AccusedID"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["AccusedID"].ToString());
                }
            }
            set
            {
                ViewState["AccusedID"] = value;
            }
        }
        public int p_PageIndex
        {
            get
            {
                if (ViewState["PageIndex"] == null)
                {
                    return 0;
                }
                else
                {
                    return Convert.ToInt32(ViewState["PageIndex"].ToString());
                }
            }
            set
            {
                ViewState["PageIndex"] = value;
            }
        }
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                dttemp = csql.getAnnouncementsCategory("SmartConcepcion");
                loadDropDown(ddFilterannouncementType, dttemp, true);
                loadannouncementProfile();
            }

        }
        void loadannouncementProfile()
        {
            long? selected_announcement_type = null;

            if (ddFilterannouncementType.SelectedValue != "-1")
                selected_announcement_type = convert_long(ddFilterannouncementType.SelectedValue, false);

            dttemp = csql.getAnnouncements("SmartConcepcion", gvannouncementProfiles.PageSize, p_PageIndex, p_BrgyID, ddFilterannouncementType.SelectedValue,txtUserSearch.Text);
            gvannouncementProfiles.PageIndex = p_PageIndex;
            if (dttemp.Rows.Count > 0)
            {
                gvannouncementProfiles.VirtualItemCount = (int)dttemp.Rows[0]["reccount"];
                loadGridView(gvannouncementProfiles, dttemp);
                upannouncement.Update();
            }

        }
        void clearUserInfo()
        {
            p_UserProfileID = null;
            
        }
        protected void gvannouncementProfiles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (IsPostBack)
            {
                GridView _gvSender = (GridView)sender;
                p_PageIndex = e.NewPageIndex;
                loadannouncementProfile();
                clearUserInfo();
            }
        }

        protected void lnkCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Portal/Announcements/Create");
        }
        
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton _lnk = (LinkButton)sender;
            Response.Redirect($"~/Portal/Announcements/Create?ID={_lnk.ToolTip}");
        }

        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            p_PageIndex = 0; //Reset index in searching
            loadannouncementProfile();
        }
    }
}
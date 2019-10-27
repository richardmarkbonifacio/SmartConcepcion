using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SmartConcepcion.Class;

namespace SmartConcepcion.Portal.Announcements
{
    public partial class view : clsInherited
    {
        public long? p_AnnouncementID
        {
            get
            {
                if (ViewState["AnnouncementID"] == null)
                {
                    return null;
                }
                else
                {
                    return Convert.ToInt64(ViewState["AnnouncementID"].ToString());
                }
            }
            set
            {
                ViewState["AnnouncementID"] = value;
            }
        }
        public DataTable p_dtAnnouncementInfo
        {
            get
            {
                if (ViewState["dtAnnouncementInfo"] == null)
                {
                    return null;
                }
                else
                {
                    return (DataTable) ViewState["dtAnnouncementInfo"];
                }
            }
            set
            {
                ViewState["dtAnnouncementInfo"] = value;
            }
        }
        private DataTable p_dtTopAnnouncement
        {
            get
            {
                if (ViewState["dtTopAnnouncement"] != null)
                {
                    return ViewState["dtTopAnnouncement"] as DataTable;
                }
                else
                {
                    return null;
                }
            }
            set
            {
                ViewState["dtTopAnnouncement"] = value;
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            Page.Title = "Your Title";
            base.OnLoad(e);
        }
        clsQuery csql = new clsQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = string.Format("Master Page Tutorials :: About :: {0:d}", DateTime.Now);
                p_AnnouncementID = Convert.ToInt64(Request.QueryString["ID"]);
                p_dtAnnouncementInfo = csql.getAnnouncementsInfo("SmartConcepcion", p_AnnouncementID.Value);
                
                loadInfo();

                p_dtTopAnnouncement = csql.getTopAnnoucements("SmartConcepcion");
                loadGridView(gvTopAnnouncement, p_dtTopAnnouncement);
            }
        }
        void loadInfo()
        {
            txtTitle.InnerText = p_dtAnnouncementInfo.Rows[0]["title"].ToString();
            string _filepath = "~\\Portal\\Announcements\\Banner\\" + p_dtAnnouncementInfo.Rows[0]["ID"].ToString() + p_dtAnnouncementInfo.Rows[0]["banner_extension"].ToString();
            imgBanner.ImageUrl = _filepath;
            lblContent.Text = p_dtAnnouncementInfo.Rows[0]["body_content"].ToString();
        }
    }
}